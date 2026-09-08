Rayfield = loadstring(game:HttpGet(
     "https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"
))()

local Player = game.Players.LocalPlayer

-- Made By Angelo!👍
local Window = Rayfield:CreateWindow({
    Name = "🏝️Lua Land Hub | Ultimate🏝️",
    LoadingTitle = "Lua Land Hub Ultimate Loading...",
    LoadingSubtitle = "By: ❣️Angelo's Scripts (YOUTUBE)❣️",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})
local MainTab = Window:CreateTab("SCRIPT GAMES", 4483362458)

-- 🧩 Safe Loader Function
local function loadScript(url)
    local ok, err = pcall(function()
        local src = game:HttpGet(url)
        local fn = assert(loadstring(src), "loadstring failed")
        fn()
    end)
    if not ok then
        Rayfield:Notify({
            Title = "Script Error",
            Content = tostring(err),
            Duration = 6
        })
    end
end
MainTab:CreateButton({
    Name = "Bloxburg 🏘️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/JonnyCheeser/rbw4/main/JonnyCheeseHub")
    end
})

MainTab:CreateButton({
    Name = "Murderer Vs Sheriff Duels 🔫",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/alan11ago/Hub/main/ImpHub.lua")
    end
})

MainTab:CreateButton({
    Name = "Toilet Tower Defense 🚽",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/LOLking123456/Toilet6/main/Tower5")
    end
})

MainTab:CreateButton({
    Name = "Arise CrossOver 🌐",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/perfectusmim1/script/main/crossover")
    end
})
MainTab:CreateButton({
    Name = "Trench War ⚔️",
    Callback = function()
        loadScript("https://exploitingis.fun/loader")
    end
})

MainTab:CreateButton({
    Name = "Climb & Jump Tower 🗼",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/gumanba/Scripts/main/ClimbandJump")
    end
})

MainTab:CreateButton({
    Name = "Tower of Jump (FREE HALOS) 🌈",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/insanedude59/TowerOfJump/main/OpenSource")
    end
})

MainTab:CreateButton({
    Name = "Tower of Hell 🔥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua")
    end
})

MainTab:CreateButton({
    Name = "Build a Boat for Treasure 🚤",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/102KIRA/Best-Babft-script/main/Actually%20Best%20babft%20script")
    end
})

MainTab:CreateButton({
    Name = "Mega Hide & Seek 👥",
    Callback = function()
        loadScript("https://pastebin.com/raw/F4xYCF5v")
    end
})

MainTab:CreateButton({
    Name = "Hide & Seek Supreme 👑",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/ghostapustaja/legionhub/main/hideandseekscript.lua")
    end
})

MainTab:CreateButton({
    Name = "Cheese Escape 🧀",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Nikita365/Cheese-Escape/main/Nikita")
    end
})

MainTab:CreateButton({
    Name = "Gacha Online RP 🌟",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/GitHubTestei/GACHA-ONLINE-GUI/main/Gacha%20Online%20Troll%20GUI%20v1.0.0")
    end
})

MainTab:CreateButton({
    Name = "Secret Killer 🔪",
    Callback = function()
        loadScript("https://pastebin.com/raw/m6MqN4ay")
    end
})

MainTab:CreateButton({
    Name = "Natural Disaster Survival (WORKS IN THIS GAME)🌪️",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Seven7-lua/Roblox/refs/heads/main/Scripts/Games/Natural-Disaster-Survival.lua"))()

    end
})

MainTab:CreateButton({
    Name = "Dig It ⛏️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/main/loader")
    end
})

MainTab:CreateButton({
    Name = "Be NPC or Die 👥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/checkurasshole/Script/main/IQ")
    end
})

MainTab:CreateButton({
    Name = "Spelling Bee 🐝",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/PreppyHub/PreppyHub/main/PreppyHub")
    end
})
MainTab:CreateButton({
    Name = "Brookhaven RP 🏡",
    Callback = function()
        loadScript("https://glot.io/snippets/gzrux646yj/raw/main.ts")
    end
})

MainTab:CreateButton({
    Name = "Blade Ball ⚔️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/SoyAdriYT/AstroX/main/Loader.lua")
    end
})

MainTab:CreateButton({
    Name = "Work At Pizza Place 🍕",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/welomenchaina/Loader/main/ScriptLoader")
    end
})

MainTab:CreateButton({
    Name = "Build a Brainrot🧠",
    Callback = function()

loadScript("https://raw.githubusercontent.com/1-16AM/xena/refs/heads/main/main.lua")
    end
})

MainTab:CreateButton({
    Name = "My Singing Brainrot Free Gamepass🎤",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/gim/refs/heads/main/fas"))()

   end
})

MainTab:CreateButton({
    Name = "Anime Boss Raid😈",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/red/refs/heads/main/bus"))()

    end
})

MainTab:CreateButton({
    Name = "Grimoires Legacy 🔥",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/more/refs/heads/main/fin"))()

    end
})

MainTab:CreateButton({
    Name = "Anime Storm Simulator⛈️",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/sto/refs/heads/main/rm"))()

   end
})

MainTab:CreateButton({
    Name = "Anime Troll Tower🗿",
    Callback = function()

loadstring(game:HttpGet("https://github.com/contateste8/FEGojoSkill/raw/refs/heads/main/Protected_7021198198640480.lua.txt"))()

   end
})

MainTab:CreateButton({
    Name = "IQ Test🧠",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/GuyOnPhilippines/Roblox/refs/heads/Scripts/IQ%20Test%20%F0%9F%A7%A0%20Gui.txt",true))()

   end
})

MainTab:CreateButton({
    Name = "Try to Die⚰️",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/GuyOnPhilippines/Roblox/refs/heads/Scripts/Try%20To%20Die%20Gui.txt"))()

    end
})

MainTab:CreateButton({
    Name = "Blue Heater 2🥵",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/hea/refs/heads/main/t"))()

   end
})

MainTab:CreateButton({
    Name = "Anime Rising 📌",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/rise/refs/heads/main/a"))()

    end
})

MainTab:CreateButton({
    Name = "Anime Eternal✅",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/et/refs/heads/main/er"))()

   end
})


MainTab:CreateButton({
    Name = "Sonic Speed Simulator 🌀",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/alan11ago/Hub/refs/heads/main/ImpHub.lua")
    end
})

MainTab:CreateButton({
    Name = "Anime Shadow 2 👥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Shad/refs/heads/main/2")
    end
})

MainTab:CreateButton({
    Name = "Kaizen 🧘",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Kai/refs/heads/main/zen")
    end
})

MainTab:CreateButton({
    Name = "Universal Piece 🏴‍☠️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Piec/refs/heads/main/e")
    end
})

MainTab:CreateButton({
    Name = "Anime Saga 📖",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/ga/refs/heads/main/ga")
    end
})

MainTab:CreateButton({
    Name = "FireForce Reignition 🔥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/fi/refs/heads/main/re")
    end
})

MainTab:CreateButton({
    Name = "Dungeon Heroes 🏰",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Roes/refs/heads/main/her")
    end
})

MainTab:CreateButton({
    Name = "Bgsi (Xeno & Others) 🎯",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/tist/refs/heads/main/no")
    end
})

MainTab:CreateButton({
    Name = "Anime Rangers X ⚔️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/yu/refs/heads/main/tu")
    end
})

MainTab:CreateButton({
    Name = "Hunters 🕵️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/ter/refs/heads/main/hint")
    end
})

MainTab:CreateButton({
    Name = "Anime Kingdom Simulator 👑",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/pil/refs/heads/main/ty")
    end
})

MainTab:CreateButton({
    Name = "Anime Card Clash 🃏",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/cas/refs/heads/main/h")
    end
})

MainTab:CreateButton({
    Name = "Cavern Quest 🪨",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/cav/refs/heads/main/s")
    end
})

MainTab:CreateButton({
    Name = "Anime Power 💥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/pow/refs/heads/main/er")
    end
})

MainTab:CreateButton({
    Name = "Anime Spirits Journey 🌌",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/lo/refs/heads/main/so")
    end
})

MainTab:CreateButton({
    Name = "Hollow Era ⚫",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/t/refs/heads/main/ips")
    end
})

MainTab:CreateButton({
    Name = "Anime Geek 🤓",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/pa/refs/heads/main/pi")
    end
})

MainTab:CreateButton({
    Name = "Ninja Time 🥷",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/ni/refs/heads/main/ni")
    end
})

MainTab:CreateButton({
    Name = "Steal Ice cream from Kids 🍦",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/L0stVeil/LocalScripts/refs/heads/main/1stL0st")
    end
})

MainTab:CreateButton({
    Name = "Anime Wrestle Simulator 🤼",
    Callback = function()
        loadScript("https://api.luarmor.net/files/v3/loaders/49f02b0d8c1f60207c84ae76e12abc1e.lua")
    end
})

MainTab:CreateButton({
    Name = "Pinoy Tower 🇵🇭",
    Callback = function()
        loadScript("https://scriptblox.com/raw/Pinoy-Tower-Slap-And-More-42881")
    end
})

MainTab:CreateButton({
    Name = "Super Soccer League ⚽",
    Callback = function()
        loadScript("https://scriptblox.com/raw/Universal-Script-FreezeHub-18843")
    end
})

MainTab:CreateButton({
    Name = "UGC Steal Points 💎",
    Callback = function()
        loadScript("https://scriptblox.com/raw/UGC-Steal-Points-Kilaura-twister-game-free-ugc-41018")
    end
})

MainTab:CreateButton({
    Name = "Aura Craft 🔮",
    Callback = function()
        loadScript("https://scriptblox.com/raw/Aura-Craft-RealHub-35051")
    end
})

MainTab:CreateButton({
    Name = "BloxFruit🍋",
    Callback = function()

loadstring(game:HttpGet("https://scriptblox.com/raw/Blox-Fruits-The-Best-Bloxfruits-Autofarm-GUI-42920"))()

    end
})

MainTab:CreateButton({
    Name = "Steal a Baddie 💃",
    Callback = function()
        loadScript("https://scriptblox.com/raw/Steal-a-Baddie-UNBANNED-BEST-GUI-43356")
    end
})

MainTab:CreateButton({
    Name = "Mad City 🚓",
    Callback = function()
        loadScript("https://scriptblox.com/raw/Mad-City-Mad-City-Auto-Rob-Airport-4581")
    end
})

MainTab:CreateButton({
    Name = "Bleeding Blades ⚔️",
    Callback = function()
        loadScript("https://scriptblox.com/raw/Bleeding-Blades-ALPHA-really-epic-script-6485")
    end
})

MainTab:CreateButton({
    Name = "Grow A Garden (KEYLESS)👨‍🌾",
    Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/shvl00/shvled/refs/heads/main/l04d3r.bf"))()

   end
})

MainTab:CreateButton({
    Name = "Grow A Garden (KEY SYSTEM)👨‍🌾",
    Callback = function()

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d5ed1fbd4301b1d18d75153c5b47181d.lua"))()

   end
})

MainTab:CreateButton({
    Name = "Arcane Conquest 🧙‍♂️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/arc/refs/heads/main/ane")
    end
})

MainTab:CreateButton({
    Name = "Fruit Reborn 🍍",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Fru/refs/heads/main/it")
    end
})

MainTab:CreateButton({
    Name = "Haikyuu Legends 🏐",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/vol/refs/heads/main/ball")
    end
})

MainTab:CreateButton({
    Name = "Jujutsu Infinite ♾️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Infinite/refs/heads/main/All")
    end
})

MainTab:CreateButton({
    Name = "Elemental Dungeon 🔥🌊⚡",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/typo/main/ye")
    end
})

MainTab:CreateButton({
    Name = "Anime Venture 🌟",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Ven/refs/heads/main/ture")
    end
})

MainTab:CreateButton({
    Name = "Anime Rush 💨",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Ru/refs/heads/main/sh")
    end
})

MainTab:CreateButton({
    Name = "Lootify 💼",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Loo/refs/heads/main/t")
    end
})

MainTab:CreateButton({
    Name = "Anime MultiVerse 🌀",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Mul/refs/heads/main/ver")
    end
})

MainTab:CreateButton({
    Name = "Go Fishing 🎣",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/go/refs/heads/main/is")
    end
})

MainTab:CreateButton({
    Name = "Anime Realms 🌍",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/rea/refs/heads/main/lms")
    end
})

MainTab:CreateButton({
    Name = "Avatar Fighting Simulator 🌬️🔥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/av/refs/heads/main/tar")
    end
})

MainTab:CreateButton({
    Name = "Bullet Dungeon 🔫",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/bul/refs/heads/main/g")
    end
})

MainTab:CreateButton({
    Name = "Slayer Online ⚔️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/sla/refs/heads/main/yer")
    end
})

MainTab:CreateButton({
    Name = "WanderLands Dungeon RPG 🗺️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/wan/refs/heads/main/der")
    end
})

MainTab:CreateButton({
    Name = "Dungeon Quest 🛡️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Sol/refs/heads/main/DQ")
    end
})

MainTab:CreateButton({
    Name = "Anime Shadow 🌒",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/sha/refs/heads/main/dow")
    end
})

MainTab:CreateButton({
    Name = "One Punch Fighters X 👊",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/at/refs/heads/main/yt")
    end
})

MainTab:CreateButton({
    Name = "Anime Revolution X ⚡",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Rev/refs/heads/main/X")
    end
})

MainTab:CreateButton({
    Name = "Pets Go 🐾",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/rel/refs/heads/main/el")
    end
})

MainTab:CreateButton({
    Name = "Anime Chaos Simulator 🔥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/AC/refs/heads/main/Mob")
    end
})

MainTab:CreateButton({
    Name = "Lost Souls 🕯️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/LSM/refs/heads/main/MSL")
    end
})

MainTab:CreateButton({
    Name = "Crawl 🐾",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Crw/refs/heads/main/Mobz")
    end
})

MainTab:CreateButton({
    Name = "Jujutsu Piece ⚔️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Mob/main/JJP")
    end
})

MainTab:CreateButton({
    Name = "Anime Blast Simulator 💥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Blast/main/ns")
    end
})

MainTab:CreateButton({
    Name = "Demon Warriors 👹",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/DWM/main/et")
    end
})

MainTab:CreateButton({
    Name = "Realm Rampage 🏔️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/RRM/main/Mob")
    end
})

MainTab:CreateButton({
    Name = "Anime Power Evolution ⚡",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/AE/main/Same")
    end
})

MainTab:CreateButton({
    Name = "[QUEST] Slime Slaying Online RPG 🐌",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/SL/main/Both")
    end
})

MainTab:CreateButton({
    Name = "Anime Ascensions Simulator ⛩️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/AS3/main/Ex")
    end
})

MainTab:CreateButton({
    Name = "Weak Legacy 2 🪶",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/W2/main/SW")
    end
})

MainTab:CreateButton({
    Name = "Anime Switch 🎮",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/dswa/main/1")
    end
})

MainTab:CreateButton({
    Name = "Fabled Legacy 📜",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/FLM/main/Mob")
    end
})

MainTab:CreateButton({
    Name = "Anime Destiny Simulator 🎯",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/TY/main/Mob")
    end
})

MainTab:CreateButton({
    Name = "Hunters Era 🧭",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/HE/main/SolaraMobile")
    end
})

MainTab:CreateButton({
    Name = "[NEW] Anime Heroes Tycoon 🏰",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/892/main/AH")
    end
})

MainTab:CreateButton({
    Name = "Eat The World 🌍",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/ETW/main/was")
    end
})

MainTab:CreateButton({
    Name = "Spin For Free Robux 💸",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/Spin-For-Free/main/b")
    end
})

MainTab:CreateButton({
    Name = "Cursed Area 🕳️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/sdawd6/main/90")
    end
})

MainTab:CreateButton({
    Name = "AllBlox Battles 🧃",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/ABB/main/Solara/Mobile")
    end
})

MainTab:CreateButton({
    Name = "Anime Punching Simulator 2 👊",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/89/main/24")
    end
})

MainTab:CreateButton({
    Name = "+1 Blade Slayer 🗡️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/dsaw2/main/asdwa")
    end
})

MainTab:CreateButton({
    Name = "Anime Speed Race 🏁",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/09op/main/kop2")
    end
})

MainTab:CreateButton({
    Name = "Egg Empire 🥚",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/yup/main/pire")
    end
})

MainTab:CreateButton({
    Name = "Horror RNG 😱",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/90po/main/kop90")
    end
})

MainTab:CreateButton({
    Name = "Roller Skate Racing 🛼",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/sdwa56/main/jilo")
    end
})

MainTab:CreateButton({
    Name = "Jujutsu Shenanigans 🌀",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/657/main/kilo")
    end
})

MainTab:CreateButton({
    Name = "Magic RNG ✨",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/jk2/main/dsa")
    end
})

MainTab:CreateButton({
    Name = "Reborn As SwordsMan 🔁⚔️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/sdaw/main/sdsa")
    end
})

MainTab:CreateButton({
    Name = "Fruit Seas 🌊",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/dsaw/main/asdwa")
    end
})

MainTab:CreateButton({
    Name = "Attack on Titan Revolution 💥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/ewq/main/sdw")
    end
})

MainTab:CreateButton({
    Name = "Anime Max 🚀",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/23s/main/sda")
    end
})

MainTab:CreateButton({
    Name = "Extalia Simulator 🧙",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/sadw/main/sda")
    end
})

MainTab:CreateButton({
    Name = "Unlimited BattleGrounds ♾️⚔️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/sdwaads/main/123")
    end
})

MainTab:CreateButton({
    Name = "Ultimate BattleGrounds 🏆",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/jki/main/sdsaw")
    end
})

MainTab:CreateButton({
    Name = "Sword Legends Simulator 🔪",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/gdfhj/main/dsaty")
    end
})

MainTab:CreateButton({
    Name = "Rich RNG 💎",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OhhMyGehlee/hgi/main/uiy")
    end
})

local Main2Tab = Window:CreateTab("UNIVERSAL SCRIPTS", 4483362458)

local function loadScript(url)
    local success, response = pcall(function()
        local src = game:HttpGet(url)
        assert(loadstring(src))()
    end)
    if not success then
        Rayfield:Notify({
            Title = "Script Error",
            Content = tostring(response),
            Duration = 6
        })
    end
end

Main2Tab:CreateButton({
    Name = "100+ Animation Hub 💃",
    Callback = function()
        loadScript("https://gist.githubusercontent.com/Angelo-Gitland/47a075d24e008e76c9e7c0725f784504/raw/612f1193fa9ff29a8a8e7527c0a6aa79ae09b301/Eazvy%2520Hub%2520100+%2520Animation%2520Hub")
    end
})

Main2Tab:CreateButton({
    Name = "FE Fling Gui 🌀",
    Callback = function()
        loadScript("https://rawscripts.net/raw/Universal-Script-Fe-yeet-gui-7351")
    end
})

Main2Tab:CreateButton({
    Name = "FE Touch Fling Gui ✋",
    Callback = function()
        loadScript("https://pastebin.com/raw/LgZwZ7ZB")
    end
})

Main2Tab:CreateButton({
    Name = "FE Invisibility Keybind 🫥",
    Callback = function()
        loadScript("https://gist.githubusercontent.com/Angelo-Gitland/ec9fdd3e0c5daddd3fab4c979b036cd2/raw/c238c716b55b100b775ba26388c4a6e0b52e2e1e/Fe%2520Invisibility%2520Gui%2520Keybind")
    end
})

Main2Tab:CreateButton({
    Name = "Fly Gui V3 ✈️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
    end
})

Main2Tab:CreateButton({
    Name = "Noclip Gui 🚪",
    Callback = function()
        loadScript("https://gist.githubusercontent.com/Angelo-Gitland/f87a23b93d5b935b89c781ce9cea68b0/raw/8d7d5411a1669bdd72e4af414be682ec1b91d66d/Noclip%2520Gui")
    end
})

Main2Tab:CreateButton({
    Name = "Tp Tool 🧭",
    Callback = function()
        loadScript("https://gist.githubusercontent.com/Angelo-Gitland/7ba3620ffa80073decb67f8a7cdd8a17/raw/1c73c87e28a6d91df35d83e98ace27d094c6309b/Tp%2520Tools%2520Script")
    end
})

Main2Tab:CreateButton({
    Name = "AutoClicker Gui 🖱️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Hosvile/The-telligence/main/MC%20KSystem%202")
    end
})

Main2Tab:CreateButton({
    Name = "Server Hop 🌍",
    Callback = function()
        loadScript("https://gist.githubusercontent.com/5f76e62e22b285e966ef0c4a80a78ee7/raw/cbcfca3a0a895b6769b204c0397c5564e870b373/Server%2520Hop%2520Script")
    end
})

Main2Tab:CreateButton({
    Name = "Rejoin 🔄",
    Callback = function()
        loadScript("https://gist.githubusercontent.com/Angelo-Gitland/f586ef696195d1ea0fd84ef061e0a1ec/raw/61936073bf083b1238282d990ae374d27995df98/Rejoin%2520Script")
    end
})

Main2Tab:CreateButton({
    Name = "Btools 🔧",
    Callback = function()
        loadScript("https://pastebin.com/raw/FBKJTUyw")
    end
})

Main2Tab:CreateButton({
    Name = "Dark Dex 🔍",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua")
    end
})

Main2Tab:CreateButton({
    Name = "Infinite Jump ⚡",
    Callback = function()
        loadScript("https://gist.githubusercontent.com/Angelo-Gitland/45bd8a7a3f4c1428ae9df90c011b29a6/raw/9ca0b8f09904dedb51a316a98800b25415d548b2/%25E2%259A%25A1%2520Infinite%2520Jump%2520Gui%2520%25E2%259A%25A1")
    end
})

local Main3Tab = Window:CreateTab("ADMIN SCRIPTS", 4483362458)

local function loadScript(url)
    local success, response = pcall(function()
        local src = game:HttpGet(url)
        assert(loadstring(src))()
    end)
    if not success then
        Rayfield:Notify({
            Title = "Script Error",
            Content = tostring(response),
            Duration = 6
        })
    end
end

Main3Tab:CreateButton({
    Name = "Infinite Yield ⚡",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    end
})

Main3Tab:CreateButton({
    Name = "Nameless Admin 👻",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source")
    end
})

Main3Tab:CreateButton({
    Name = "Reviz Admin 🎮",
    Callback = function()
        loadScript("https://pastebin.com/raw/ibFPdiF7")
    end
})

Main3Tab:CreateButton({
    Name = "Cmd-X 🧠",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source")
    end
})

Main3Tab:CreateButton({
    Name = "Legs Admin 🦵",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/leg1337/legadmv2/main/legadminv2.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Kohls Admin 🏡",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Games/Kohls%20Admin%20House/DarkKohls/GUI.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Brick Admin 🧱",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/un_AdminGUI")
    end
})

Main3Tab:CreateButton({
    Name = "Quirky Cmds (Some Games) 🎉",
    Callback = function()
        loadScript("https://rawscripts.net/raw/Universal-Script-QuirkyCMD-FE-admin-8667")
    end
})

Main3Tab:CreateButton({
    Name = "Gaze Admin (Free Admin) 👁️",
    Callback = function()
        loadScript("https://rawscripts.net/raw/FREE-ADMIN-Gaze-Admin-Abuser-V2-38651")
    end
})

Main3Tab:CreateButton({
    Name = "Fates Admin 🔮",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Console Line Admin 📟",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/NotAtomz/Atom-Scripts/refs/heads/main/ConsoleLine")
    end
})

Main3Tab:CreateButton({
    Name = "Dhelirium Admin (Use ; ) 🪄",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Dhelann/Dhelirium/refs/heads/main/source.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Ak Admin 🔫",
    Callback = function()
        loadScript("https://angelical.me/ak.lua")
    end
})

local Main3Tab = Window:CreateTab("OP HUBS SCRIPTS", 4483362458)

local function loadScript(url)
    local success, response = pcall(function()
        local src = game:HttpGet(url)
        assert(loadstring(src))()
    end)
    if not success then
        Rayfield:Notify({
            Title = "Script Error",
            Content = tostring(response),
            Duration = 6
        })
    end
end

Main3Tab:CreateButton({
    Name = "Ghost Hub 👻",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub")
    end
})

Main3Tab:CreateButton({
    Name = "Script Hub 📜",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3")
    end
})

Main3Tab:CreateButton({
    Name = "Pendulum Hub 🕰️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Cat Hub V2 🐱",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Senpaigmx/CatHubV2/main/CatHubVisual.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Frozen Hub ❄️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/SyrTop/FroZenHub/main/V1/FroZenV1_LOADER.lua.txt")
    end
})

Main3Tab:CreateButton({
    Name = "Redz Hub (Bloxfruit) 🍓",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999")
    end
})

Main3Tab:CreateButton({
    Name = "DomainX Hub 🧪",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/drakker33/rblx-decaying-winter/main/DecayingWinter.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Bido Skins Hub V1.8 🎨",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.8")
    end
})

Main3Tab:CreateButton({
    Name = "Bido Skins Hub V2 🧥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/refs/heads/main/Bido%20Skins%20V2")
    end
})

Main3Tab:CreateButton({
    Name = "Bido Skins Hub V3 👕",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.3")
    end
})

Main3Tab:CreateButton({
    Name = "Bido Skins Hub V5 👖",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20SkinsV1.5")
    end
})

Main3Tab:CreateButton({
    Name = "Bido Skins Hub V6 🧢",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.6")
    end
})

Main3Tab:CreateButton({
    Name = "Bido Skins Hub V7 🎽",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.7")
    end
})

Main3Tab:CreateButton({
    Name = "Bido Skins Hub V8 🎒",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.8")
    end
})

Main3Tab:CreateButton({
    Name = "Bido Skins Hub V9 🧶",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.9")
    end
})

Main3Tab:CreateButton({
    Name = "Sky Hub 🌤️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt")
    end
})

Main3Tab:CreateButton({
    Name = "Simple Hub 🛠️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/GearV4/Simple-Hub-X-Gear-SSX.lua/main/Gear%20SSX%20X%20Simple%20Hub")
    end
})

Main3Tab:CreateButton({
    Name = "Nyx0Ls Hub V1 🕵️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Nyx0L/Spy-Hub-roblox-/refs/heads/main/source")
    end
})

Main3Tab:CreateButton({
    Name = "Nyx0Ls Hub V2 🗝️",
    Callback = function()
        setclipboard("https://discord.gg/aNvv3UnGKA")
        Rayfield:Notify({
            Title = "Nyx0Ls Hub V2",
            Content = "🏝️KEY COPIED TO CLIPBOARD JOIN TO GET!🏝️",
            Duration = 6
        })
        -- Insert fixed script link once available
    end
})

Main3Tab:CreateButton({
    Name = "Void Hub 🌌",
    Callback = function()
        loadScript("https://voidhubwin.xyz/Script")
    end
})

Main3Tab:CreateButton({
    Name = "Void Hub V3 🚪",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Efe0626/VoidHub/main/Script")
    end
})

Main3Tab:CreateButton({
    Name = "X Hub (Break In Game) 💣",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Bebo-Mods/XHub/main/HubLoader.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Dark Hub 🌑",
    Callback = function()
        loadScript("https://paste.ee/r/6nF...")
    end
})

Main3Tab:CreateButton({
    Name = "Ez Hub ✨",
    Callback = function()
        loadScript("https://gist.githubusercontent.com/Angelo-Gitland/2299b2823dd564a30807ddaa1875b311/raw/704fbe40e4ccc671e5dbc72cb9dab9b556f3c045/Ez%2520Hub%2520Script")
    end
})

Main3Tab:CreateButton({
    Name = "Skibidi Hub 🎥",
    Callback = function()
        loadScript("https://scriptblox.com/raw/Universal-Script-Skibidi-Hub-Keyless-plus-100-games-39992")
    end
})

Main3Tab:CreateButton({
    Name = "V Hub 🌀",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/V31nc/2642/Created/VHub")
    end
})

Main3Tab:CreateButton({
    Name = "V.G Hub 🎮",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub")
    end
})

Main3Tab:CreateButton({
    Name = "Moon Hub 🌕",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Jadelly261/BloxFruits/main/MoonHub")
    end
})

Main3Tab:CreateButton({
    Name = "Owl Hub 🦉",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt")
    end
})

Main3Tab:CreateButton({
    Name = "PurbleXploit Hub 🟣",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/PurbleDev/PurbExploit-Hub/refs/heads/main/Main")
    end
})

Main3Tab:CreateButton({
    Name = "000 Hub 💻",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/swanhtetm/797-Hub/refs/heads/main/000Hub%20Beta%20Fix.lua.txt")
    end
})

Main3Tab:CreateButton({
    Name = "System Hub V2 ⚙️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/AHMEDPLPL/System-hub/main/System%20hub")
    end
})

Main3Tab:CreateButton({
    Name = "System Hub V3 ⚙️",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/AHMEDPLPL/System-hub-V3/refs/heads/main/System%20Hub%20V3")
    end
})

Main3Tab:CreateButton({
    Name = "Multi Scripter X V3 🧬",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/GamerScripter/Multi-Scripter-X/main/loader")
    end
})

Main3Tab:CreateButton({
    Name = "Common Hub V1 🔧",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Niviana1/Personal-exploit-/main/Gui.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Game Hub V3 🎮",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader")
    end
})

Main3Tab:CreateButton({
    Name = "Game Hub V4 🎮",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader")
    end
})

Main3Tab:CreateButton({
    Name = "Game Hub V6 🎮",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader")
    end
})

Main3Tab:CreateButton({
    Name = "Gigachad Hub V3 🧠",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OWJBWKQLAISH/GigaChad-Hub/main/Gigachad%20Hub%20V3")
    end
})

Main3Tab:CreateButton({
    Name = "Gigachad Hub V4 💪",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OWJBWKQLAISH/GigaChad-Hub/main/Gigachad%20Hub%20V4")
    end
})

Main3Tab:CreateButton({
    Name = "Gigachad Hub V5 🔥",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/OWJBWKQLAISH/GigaChad-Hub/main/Protected_3038811338432694.lua.txt")
    end
})

Main3Tab:CreateButton({
    Name = "Gigachad Hub V6 🔰",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/LolPrivate/Side/main/Moonsec%20V3")
    end
})

Main3Tab:CreateButton({
    Name = "Gigachad Hub V7 🚀",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/LolPrivate/Side/main/Gigachad%20Hub%20V7.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Shakars Hub V1 🪓",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/shakar60/moonsecV3/main/bido.ty")
    end
})

Main3Tab:CreateButton({
    Name = "Shakars Hub V2 🌀",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/shakar60/Universal-Shakars/main/Hub%20Protected!")
    end
})

Main3Tab:CreateButton({
    Name = "Shakars Hub V3 🧩",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/shakar60/USH.P/main/rotected")
    end
})

Main3Tab:CreateButton({
    Name = "Many Hub 🌐",
    Callback = function()
        loadScript("https://paste.myconan.net/498978.txt")
    end
})

Main3Tab:CreateButton({
    Name = "Multi Hub V2 🔁",
    Callback = function()
        loadScript("https://pastebin.com/raw/EZ8CxDGr")
    end
})

Main3Tab:CreateButton({
    Name = "Multi Hub V3 🔗",
    Callback = function()
        local src = game:GetObjects("rbxassetid://1468845733")[1].Source
        assert(loadstring(src))()
    end
})

Main3Tab:CreateButton({
    Name = "Multi Hub V4 📦",
    Callback = function()
        loadScript("https://pastebin.com/raw/YVE4njap")
    end
})

Main3Tab:CreateButton({
    Name = "Express Hub 🚄",
    Callback = function()
        loadScript("https://raw.githubusercontent.com/Theyfwdan/Theyfwdan/refs/heads/main/ExpressHubPaidVersion")
    end
})

Main3Tab:CreateButton({
    Name = "Express Hub V5 🧭",
    Callback = function()
        loadScript("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua")
    end
})

Main3Tab:CreateButton({
    Name = "Angel Hub 👼",
    Callback = function()
       
loadstring(game:HttpGet('https://raw.githubusercontent.com/Fentdealer47/angelshub/refs/heads/main/main.lua'))()

    end
})

local Main4Tab = Window:CreateTab("TOOLS/GEARS SCRIPT", 4483362458)

local function loadScript(url)
    local success, response = pcall(function()
        local src = game:HttpGet(url)
        assert(loadstring(src))()
    end)
    if not success then
        Rayfield:Notify({
            Title = "Script Error",
            Content = tostring(response),
            Duration = 6
        })
    end
end

Main4Tab:CreateButton({
    Name = "Sword 🗡️",
    Callback = function()
        loadScript("https://pastebin.com/raw/r7TP8eqw")
    end
})

Main4Tab:CreateButton({
    Name = "Grab Knife 🔪",
    Callback = function()
        loadScript("https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753")
        loadScript("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt")
    end
})

Main4Tab:CreateButton({
    Name = "Tool Giver 🧰",
    Callback = function()
        loadScript("https://pastefy.app/qpbQo0lr/raw")
    end
})

Main4Tab:CreateButton({
    Name = "Gear Giver 🎮",
    Callback = function()
        loadScript("https://pastebin.com/raw/Dhgnt7hi")
    end
})

Main4Tab:CreateButton({
    Name = "Get All Gears 🧲",
    Callback = function()
        loadScript("https://pastefy.app/VYIAk3o1/raw")
    end
})

Main4Tab:CreateButton({
    Name = "Gear Giver 2 ⚙️",
    Callback = function()
        loadScript("https://pastebin.com/raw/AZVi2tuK")
    end
})

local CreditsTab = Window:CreateTab("❣️ CREDITS ❣️", 4483362458)

local CreditsParagraph = CreditsTab:CreateParagraph({
    Title = "❣️ Credits & Appreciation ❣️",
    Content = [[
Script Made By: ❣️ Angelo's Scripts (YOUTUBE) ❣️
Tester: ❣️ Eric_3337 (YOUTUBE) ❣️
Helper: ❣️ Bromzekie ❣️
Raw By: ❣️ Angelo's Scripts (YOUTUBE) ❣️

❣️ Big Thanks ❣️
@Eric_3337 (YOUTUBE) 🏝️
@Bromzekie 🏝️
@CrazyChessScript (YOUTUBE) 🏝️

🏝️ Join Our Community 🏝️  
Click the button below to copy the server link and connect with us!

🔗 Discord Link: [https://discord.gg/33YmRmNfe9]
]]
})

CreditsTab:CreateButton({
    Name = "🏝️ COPY DISCORD LINK 🏝️",
    Callback = function()
        setclipboard("https://discord.gg/33YmRmNfe9")
        Rayfield:Notify({
            Title = "📋 Copied!",
            Content = "🏝️COPIED TO CLIPBOARD!🏝️",
            Duration = 6
        })
    end
})