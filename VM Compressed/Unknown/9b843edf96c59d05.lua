local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ilovechubbyorangecat/script/refs/heads/main/notification.lua",true))()

NotificationLibrary.Info("Make sure to join Indriprisxtenxx's Discord!", "Info")
NotificationLibrary.Warn("Version 10 Will Possibly Be The Final Version, So It's Going To Take A While For The (possibley) Final Version", "Warn")

local win = DiscordLib:Window("Indriprisxtenxx Ultimate Admin Gui V9.3")

local a = win:Server("UNIVERSAL", "http://www.roblox.com/asset/?id=15963248948")

local btns = a:Channel("ADMIN SCRIPTS")

btns:Button("Nameless Admin Version 2.4.1", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source"))()
DiscordLib:Notification("The Script Has Loaded!", "Nameless Admin Version 2.2", "Okay!")
end)




btns:Button("Nameless Admin Version 1.3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))();
DiscordLib:Notification("The Script Has Loaded!", "Nameless Admin Version 2.2", "Okay!")
end)

btns:Seperator()

btns:Button("Infinite Yeild Version 6.3.1", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
DiscordLib:Notification("The Script Has Loaded!", "Infinite Yeild Version 6.3", "Okay!")
end)

btns:Button("Better IY", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Malrous/betteriy/refs/heads/main/biy"))()
DiscordLib:Notification("The Script Has Loaded!", "Infinite Yeild Version 6.3", "Okay!")
end)

btns:Button("Infinite Yeild Reborn", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/mxsynry/infiniteyield-reborn/refs/heads/scriptblox/source' or 'https://mxsynry.github.io/storage/iyrbackup/legacy/scriptblox/source')))()
DiscordLib:Notification("The Script Has Loaded!", "Infinite Yeild Version 6.3", "Okay!")
end)

btns:Seperator()

btns:Button("Cmd Admin", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/cmd/main/main.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Cmd Admin", "Okay!")
end)

btns:Seperator()

btns:Button("Reviz Admin", function()
loadstring(game:HttpGet("https://pastebin.com/raw/A2R7TdJV", true))()
DiscordLib:Notification("The Script Has Loaded!", "Reviz Admin", "Okay!")
end)

btns:Seperator()

btns:Button("Shattervast Admin", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/%5BFE%5D%20Shattervast.lua'))();
DiscordLib:Notification("The Script Has Loaded!", "Shattervast Admin", "Okay!")
end)


btns:Seperator()


btns:Button("Prison Life Admin", function()
loadstring(game: HttpGet('https://pastebin.com/raw/VUzUCJGf'))();
DiscordLib:Notification("The Script Has Loaded!", "Prison Life Admin", "Okay!")
end)


btns:Seperator()

btns:Button("Ultimate Trolling GUI Version 3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()
DiscordLib:Notification("The Script Has Loaded!", "Ultimate Trolling GUI Version 3", "Okay!")
end)


btns:Seperator()


btns:Button("Chaos Script", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1111-ssss/Chaos_Script/main/Chaos_script.txt'))()
DiscordLib:Notification("The Script Has Loaded!", "Chaos Script", "Okay!")
end)

btns:Seperator()

local mmm = a:Channel("CERTAIN ADMIN GUIS")


mmm:Button("FLY GUI V3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
DiscordLib:Notification("The Script Has Loaded!", "FLY GUI V3", "Okay!")
end)

mmm:Seperator()

mmm:Button("Zero Gravity Gui", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/zerogravity"))()
DiscordLib:Notification("The Script Has Loaded!", "Zero Gravity Gui", "Okay!")
end)

mmm:Seperator()

mmm:Button("Server List Viewer", function()
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Syr0nix/RedFoxServerBowser/refs/heads/main/Mainlua"))();
DiscordLib:Notification("The Script Has Loaded!", "Server List Viewer", "Okay!")
end)

mmm:Seperator()

mmm:Button("Cords Checker", function()
loadstring(game:HttpGet("https://pastefy.app/5i0dxiYd/raw"))()
DiscordLib:Notification("The Script Has Loaded!", "Cords Checker", "Okay!")
end)

mmm:Seperator()

mmm:Button("Fps Checker", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ArrasHub/-/refs/heads/main/Stats&Coordinates"))() 
DiscordLib:Notification("The Script Has Loaded!", "Fps Checker", "Okay!")
end)

mmm:Seperator()

mmm:Button("Wall Hop V3", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V3%20script'))()
DiscordLib:Notification("The Script Has Loaded!", "Wall Hop", "Okay!")
end)

mmm:Seperator()

local z = a:Channel("GUI HUB SCRIPTS")


z:Button("7yd7 Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/Terms-of-Service.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "7yd7 Hub", "Okay!")
end)

z:Seperator()

z:Button("Arceus Hub V3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
DiscordLib:Notification("The Script Has Loaded!", "Arceus Hub V3", "Okay!")
end)

z:Seperator()


z:Button("BlueRed Hub V20 (key is UCrvd63k)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Alexcirer/Alexcirer/refs/heads/main/V20"))()
DiscordLib:Notification("The Script Has Loaded!", "BlueRed Hub V20", "Okay!")
end)

z:Seperator()

z:Button("CoreHub V2.O", function()
loadstring(game:HttpGet('https://pastebin.com/raw/pLNRr7jn'))()
DiscordLib:Notification("The Script Has Loaded!", "CoreHub V2.O", "Okay!")
end)

z:Seperator()

z:Button("Draught Hub V5", function()
loadstring(game:HttpGet('https://pastebin.com/raw/pLNRr7jn'))()
DiscordLib:Notification("The Script Has Loaded!", "Draught Hub V5", "Okay!")
end)

z:Seperator()

z:Button("EZ Hub", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
DiscordLib:Notification("The Script Has Loaded!", "EZ Hub", "Okay!")
end)


z:Seperator()

z:Button("Era Hub", function()
loadstring(game:HttpGet('https://pastebin.com/raw/zRWQnNjS'))()
DiscordLib:Notification("The Script Has Loaded!", "Era Hub", "Okay!")
end)

z:Seperator()

z:Button("FE Trolling Gui", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
DiscordLib:Notification("The Script Has Loaded!", "FE Trolling Gui", "Okay!")
end)

z:Seperator()

z:Button("Frixon Hub", function()
loadstring(game:HttpGet('https://gist.githubusercontent.com/RedoGaming/459eb467f3df927b07ca398a68f3b053/raw/6d1f7a2c8fefd072dc53ebbbec38c6f93c7de1ad/Frixon%2520Hub!%2520New%2520OP%2520Exploit%2520Hub%2520for%2520Roblox!'))()
DiscordLib:Notification("The Script Has Loaded!", "Frixon Hub", "Okay!")
end)

z:Seperator()

z:Button("GelatekHub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/Main.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "GelatekHub", "Okay!")
end)

z:Seperator()

z:Button("GameHub V5", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-V5-Selector-Fixed/main/Games"))()
DiscordLib:Notification("The Script Has Loaded!", "GameHub V5", "Okay!")
end)

z:Seperator()

z:Button("Holf Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))()
DiscordLib:Notification("The Script Has Loaded!", "Holf Hub", "Okay!")
end)

z:Seperator()

z:Button("Heart Ui V1.1", function()
loadstring(game:GetObjects("rbxassetid://1313915586")[1].Source)()
DiscordLib:Notification("The Script Has Loaded!", "Heart Ui V1.1", "Okay!")
end)

z:Seperator()

z:Button("Jkrouuzt Hub", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Jkrouz1/Jkrouzt-Hub-BETA-/refs/heads/main/499f0210-f2f6-4ff2-bfc1-41828b1344b3.luau'))()
DiscordLib:Notification("The Script Has Loaded!", "Jkrouuzt Hub", "Okay!")
end)

z:Seperator()

z:Button("KZS Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KZSHUB/KZS-HUB/main/KZSHUBV1.5", true))()
DiscordLib:Notification("The Script Has Loaded!", "KZS Hub", "Okay!")
end)

z:Seperator()

z:Button("Legon Hub", function()
loadstring(game:HttpGet('https://pastebin.com/raw/B1cUSJsv'))()
DiscordLib:Notification("The Script Has Loaded!", "Legon Hub", "Okay!")
end)

z:Seperator()

z:Button("MoonUI V10", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/IlikeyocutgHAH12/MoonUI-v10-/main/MoonUI%20v10'))()
DiscordLib:Notification("The Script Has Loaded!", "MoonUI", "Okay!")
end)

z:Seperator()

z:Button("Orca Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/richie0866/orca/master/public/snapshot.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Orca Hub", "Okay!")
end)

z:Seperator()

z:Button("Pendulum Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Pendulum Hub", "Okay!")
end)

z:Seperator()

z:Button("Rwackz Hub V2.O.2", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/b-scripts/Rwackz/refs/heads/main/Lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Rwackz Hub", "Okay!")
end)

z:Seperator()

z:Button("Skbidi hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/aemos2/Skibidihub/refs/heads/main/SkibidiHUB.txt"))()
DiscordLib:Notification("The Script Has Loaded!", "Skbidi hub", "Okay!")
end)

z:Seperator()

z:Button("SCRIPTHUBV3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()
DiscordLib:Notification("The Script Has Loaded!", "SCRIPTHUB", "Okay!")
end)

z:Seperator()

z:Button("SPEEDHUBX", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
DiscordLib:Notification("The Script Has Loaded!", "SPEEDHUBX", "Okay!")
end)

z:Seperator()

z:Button("KZS Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KZSHUB/KZS-HUB/main/KZSHUBV1.5", true))()
DiscordLib:Notification("The Script Has Loaded!", "KZS Hub", "Okay!")
end)

z:Seperator()

z:Button("Solara hub V2.1", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/Solara%20Hub.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Solara hub", "Okay!")
end)

z:Seperator()

z:Button("Vertex Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/realVertexHub/Vertex-Hub/refs/heads/main/Vertex%20Hub"))()
DiscordLib:Notification("The Script Has Loaded!", "Vertex Hub", "Okay!")
end)

z:Seperator()

z:Button("Wis'l Universal Project V1.47", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/main/Wisl'i%20Universal%20Project.lua", true))()
DiscordLib:Notification("The Script Has Loaded!", "Wis'l Universal Project", "Okay!")
end)

z:Seperator()

z:Button("YARHM", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
DiscordLib:Notification("The Script Has Loaded!", "YARHM", "Okay!")
end)

z:Seperator()

z:Button("Zen Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/KaiZen/main/GameHub", true))()
DiscordLib:Notification("The Script Has Loaded!", "Zen Hub", "Okay!")
end)

z:Seperator()

local lol = a:Channel("PLAYER CHANGER")

local sldr = lol:Slider("WalkSpeed", 0, 1000, 16, function(s)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

lol:Seperator()

local lo = a:Channel("ANIMATION SCRIPTS")

lo:Button("R15 Animations Script", function()
loadstring(game:HttpGet("https://gitlab.com/Tsuniox/lua-stuff/-/raw/master/R15GUI.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "R15 Animations Script", "Okay!")
end)

lo:Seperator()

lo:Button("Aqua Matrix FE Animation hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
DiscordLib:Notification("The Script Has Loaded!", "Aqua Matrix FE Animation hub", "Okay!")
end)

lo:Seperator()

lo:Button("Large Animation Hub", function()
loadstring(game:HttpGet("https://pastebin.com/raw/GWBDGcQ6"))()
DiscordLib:Notification("The Script Has Loaded!", "Large Animation Hub", "Okay!")
end)

lo:Seperator()

lo:Button("Emote Hub", function()
loadstring(game:HttpGet("https://pastebin.com/raw/1UDzWD9L"))()
DiscordLib:Notification("The Script Has Loaded!", "Emote Hub", "Okay!")
end)

lo:Seperator()

lo:Button("Animatrix", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/aqua-hub-is-a-skid-lol/refs/heads/main/animatrix"))()
DiscordLib:Notification("The Script Has Loaded!", "Animatrix", "Okay!")
end)

lo:Seperator()

lo:Button("Emote Gui", function()
loadstring(game:HttpGet('https://pastebin.com/raw/fitjHU5J'))()
DiscordLib:Notification("The Script Has Loaded!", "Emote Gui", "Okay!")
end)

lo:Seperator()

local l = a:Channel("FLING SCRIPTS")

l:Button("Chinese FE Touch Fling", function()
loadstring(game:HttpGet("https://github.com/Nickyangtpe/Roblox-scripts/raw/refs/heads/main/FE%20Fling%20Script", true))()
DiscordLib:Notification("The Script Has Loaded!", "Chinese FE Touch Fling", "Okay!")
end)

l:Seperator()

l:Button("Touch Fling Gui", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Touch-Fling-Script-19645"))()
DiscordLib:Notification("The Script Has Loaded!", "Touch Fling Gui", "Okay!")
end)

l:Seperator()

l:Button("Nothing X Hub", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/XNOTHING0X/NOTHING-HUB/refs/heads/HUB/script2.lua'))()
DiscordLib:Notification("The Script Has Loaded!", "Nothing X Hub", "Okay!")
end)

l:Seperator()

a:Channel("by dawid#7205")


local help = win:Server("GAME SCRIPTS", "http://www.roblox.com/asset/?id=88404963068261")

local lam = help:Channel("AUTO RAP BATTLES")

lam:Button("Auto rap battle Gui", function()
loadstring(game:HttpGet('https://pastebin.com/raw/3dh0d3ya'))()
DiscordLib:Notification("The Script Has Loaded!", "Auto rap battle Gui", "Okay!")
end)

lam:Seperator()

lam:Button("Copy And Paste Raps", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20rap%20battle%20script'))()
DiscordLib:Notification("The Script Has Loaded!", "Copy And Paste Raps", "Okay!")
end)

lam:Seperator()

local la = help:Channel("BLADE BALL SCRIPTS")

la:Button("AUTO PARRY", function()
loadstring(game:HttpGet("https://pastebin.com/raw/2wtHrGxv", true))()
DiscordLib:Notification("The Script Has Loaded!", "AUTO PARRY", "Okay!")
end)

la:Seperator()

la:Button("Zephyr Hub v3.6", function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/438e15470ef08d45017e8094075f3f40.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Zephyr Hub", "Okay!")
end)

la:Seperator()

local la = help:Channel("BUILD A BOAT GUIS")

la:Button("INFINITE SAVE SLOTS", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Build-A-Boat-For-Treasure-INFINITE-SAVE-SLOTS-39627"))()
DiscordLib:Notification("The Script Has Loaded!", "A Build A Boat Gui", "Okay!")
end)

la:Seperator()

la:Button("Asu's Build a Boat Sctipt", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Jan25_Source.lua'))()
DiscordLib:Notification("The Script Has Loaded!", "A Build A Boat Gui", "Okay!")
end)

la:Seperator()

la:Button("Auto Builder", function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/catblox1346/StensUIReMake/main/Script/StensUIRemakev2.0.0"),true))()
DiscordLib:Notification("The Script Has Loaded!", "Auto Builder", "Okay!")
end)

la:Seperator()

la:Button("A Old Build A Boat Gui", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Source.lua'))()
DiscordLib:Notification("The Script Has Loaded!", "A Old Build A Boat Gui", "Okay!")
end)

la:Seperator()

la:Button("LexusHub", function()
loadstring(game:HttpGet("https://pastebin.com/raw/2NjKRALJ", true))()
DiscordLib:Notification("The Script Has Loaded!", "LexusHub", "Okay!")
end)

la:Seperator()

la:Button("Ather Hubs Build A Boat Gui", function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2529a5f9dfddd5523ca4e22f21cceffa.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Ather Hubs Build A Boat Gui", "Okay!")
end)

la:Seperator()

la:Label("FARMING")

la:Button("Candy Farm", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/babft-candy-farm"))("t.me/arceusxscripts")
DiscordLib:Notification("The Script Has Loaded!", "Candy Farm", "Okay!")
end)

la:Seperator()



la:Button("Build A Boat Tween Auto Farm", function()
loadstring(game:HttpGet("https://pastebin.com/raw/6PVYC3G2"))();
DiscordLib:Notification("The Script Has Loaded!", "Build A Boat Auto Farm", "Okay!")
end)

la:Seperator()

la:Button("Build A Boat Auto Farm", function()
loadstring(game:HttpGet("https://orbitsc.net/babft"))();
DiscordLib:Notification("The Script Has Loaded!", "Build A Boat Auto Farm", "Okay!")
end)

la:Seperator()

la:Button("ExecutorX Build A Boat Auto Farm", function()
loadstring(game:HttpGet("https://pastebin.com/raw/R4qGZaQk", true))()
DiscordLib:Notification("The Script Has Loaded!", "Build A Boat Auto Farm", "Okay!")
end)

la:Seperator()

la:Button("AutoPlay V7", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TheMugenKing/Build-A-Boat-For-Treasure/refs/heads/main/new",true))()
DiscordLib:Notification("The Script Has Loaded!", "Build A Boat Auto Farm", "Okay!")
end)

la:Seperator()

local lade = help:Channel("BUBBLEGUM SIM")

lade:Button("Noodle Hub", function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ccdad1ca682e93c37c06f5d84e65fecb.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Noodlehub", "Okay!")
end)

lade:Seperator()

lade:Button("XVC HUB", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EnesXVC/Bubble-Gum-Simulator-INFINITY/main/XVC-Hub"))()
DiscordLib:Notification("The Script Has Loaded!", "XVC HUB", "Okay!")
end)

lade:Seperator()

lade:Button("Connect Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/xxqLgnd/Utilities/main/BubbleGum.lua",true))()
DiscordLib:Notification("The Script Has Loaded!", "Connect Hub", "Okay!")
end)

lade:Seperator()

lade:Button("Lunor Script", function()
loadstring(game:HttpGet('https://lunor.dev/loader'))()
DiscordLib:Notification("The Script Has Loaded!", "Lunor Script", "Okay!")
end)

lade:Seperator()

lade:Button("VINQ BUBBLE", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/vinqDevelops/erwwefqweqewqwe/refs/heads/main/lol.txt'))()
DiscordLib:Notification("The Script Has Loaded!", "Lunor Script", "Okay!")
end)

lade:Seperator()

local lad = help:Channel("BUILD ISLAND GUIS")

lad:Button("Build island V1 Cheat Version", function()
loadstring(game:HttpGet("https://pastebin.com/raw/P1tjpaau"))();
DiscordLib:Notification("The Script Has Loaded!", "Build island Cheat Version", "Okay!")
end)

lad:Button("Build island V5 Cheat Version", function()
loadstring(game:HttpGet("https://pastebin.com/raw/KujNrZq7"))();
DiscordLib:Notification("The Script Has Loaded!", "Build island Cheat Version", "Okay!")
end)

lad:Seperator()

lad:Button("Build island X", function()
loadstring(game:HttpGet("https://pastebin.com/raw/MkNMbsbJ"))()
DiscordLib:Notification("The Script Has Loaded!", "Build island X", "Okay!")
end)

lad:Seperator()

lad:Button("Build island Faltz Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/64kjoey107/Fatalz.dev/refs/heads/main/Build_Island.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Build island Faltz Hub", "Okay!")
end)

lad:Seperator()

lad:Button("Build island Echo Hub Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/epicguy123456/Eco-Hub-Keyy/main/EcoHub%20Build%20Island%20Key%20Version.txt"))()
DiscordLib:Notification("The Script Has Loaded!", "Build island Echo Hub Script", "Okay!")
end)

lad:Seperator()

local chicken = help:Channel("DEAD RAILS GUIS")

chicken:Button("KIKCHAHOOKS DEAD RAILS HUB", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "KIKCHAHOOKS DEAD RAILS HUB", "Okay!")
end)

chicken:Seperator()

chicken:Button("TORA ISME HUB", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/DeadRails"))()
DiscordLib:Notification("The Script Has Loaded!", "TP HUB", "Okay!")
end)

chicken:Seperator()

chicken:Button("HUNG HUB V2.0", function()
getgenv().AutoExecute = true
(loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHub/main/loader.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "TP HUB", "Okay!")
end)

chicken:Seperator()

chicken:Button("AUTO WIN SCRIPT", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/m00ndiety/Auto-win-Keyless-/refs/heads/main/obf_Dead_Rails_Auto_Win_Farm_GUI.lua.txt'))()
DiscordLib:Notification("The Script Has Loaded!", "TP HUB", "Okay!")
end)

chicken:Seperator()

chicken:Button("Another tp hub", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/m00ndiety/dead-rails-teleport-everywhere/refs/heads/main/teleport%20all%20locations'))() 

DiscordLib:Notification("The Script Has Loaded!", "TP HUB", "Okay!")
end)

chicken:Seperator()

chicken:Button("TP HUB", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AmareScripts/DeadRails/refs/heads/main/OPDR%25Teleporter.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "TP HUB", "Okay!")
end)

chicken:Seperator()

chicken:Button("BYPASS ANTI CHEAT", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AmareScripts/DeadRails/refs/heads/main/Bypass%25AntiCheat.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "TP HUB", "Okay!")
end)

chicken:Seperator()

chicken:Button("auto farm bonds", function()
local code = [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/AmareScripts/DeadRails/refs/heads/main/Auto%25BondFarm.lua"))()
]]

queue_on_teleport(code)
loadstring(code)()
DiscordLib:Notification("The Script Has Loaded!", "auto farm bonds", "Okay!")
end)

chicken:Seperator()

chicken:Button("TBAO DEALRAILS HUB", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
DiscordLib:Notification("The Script Has Loaded!", "TBAO DEALRAILS HUB", "Okay!")
end)

chicken:Seperator()

chicken:Button("Supra Hub Dead Rails", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Super-XXX-Source/DEAD-RAILS-/refs/heads/main/DEAD%20RAILS%20SUPRA%20HUB"))()
DiscordLib:Notification("The Script Has Loaded!", "Supra Hub Dead Rails", "Okay!")
end)

chicken:Seperator()

chicken:Button("Null Fire Dead Rails Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()
DiscordLib:Notification("The Script Has Loaded!", "Null Fire Dead Rails Script", "Okay!")
end)

chicken:Seperator()

chicken:Button("Streliza Script Hub", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/0vma/Strelizia/refs/heads/main/Standalone/DeadRails.lua', true))()
DiscordLib:Notification("The Script Has Loaded!", "Streliza Script Hub", "Okay!")
end)

chicken:Seperator()

chicken:Button("SpineWare Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/SpineWare/UniversalLoader/refs/heads/main/Load"))()
DiscordLib:Notification("The Script Has Loaded!", "SpineWare Script", "Okay!")
end)

chicken:Seperator()

local cboom = help:Channel("DOORS SCRIPT")

cboom:Button("BlackKings Doors Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
DiscordLib:Notification("The Script Has Loaded!", "BlackKings Doors Script", "Okay!")
end)

cboom:Seperator()

cboom:Button("Sensation Hub V2", function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/730854e5b6499ee91deb1080e8e12ae3.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Sensation Hub", "Okay!")
end)

cboom:Seperator()

cboom:Button("Null Fire Hub V2", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
DiscordLib:Notification("The Script Has Loaded!", "Null Fire Hub", "Okay!")
end)

cboom:Seperator()

cboom:Button("DOORS HUB V6", function()
loadstring(game:HttpGet("https://pastebin.com/raw/pEAxKqrL"))()
DiscordLib:Notification("The Script Has Loaded!", "TBAO DEALRAILS HUB", "Okay!")
end)

cboom:Seperator()

local chickesn = help:Channel("FISCH SCRIPTS")

chickesn:Button("Vixie Hub", function()
loadstring(game:HttpGet("https://pastebin.com/raw/1c6k9zsm"))()
DiscordLib:Notification("The Script Has Loaded!", "Vixie Hub", "Okay!")
end)

chickesn:Seperator()

chickesn:Button("BlackHub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Skibidiking123/Fisch1/refs/heads/main/FischMain"))();
DiscordLib:Notification("The Script Has Loaded!", "BlackHub", "Okay!")
end)

chickesn:Seperator()

local gacha = help:Channel("GACHA ONLINE SCRIPTS")

gacha:Button("GACHA ONLINE GUI", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GitHubTestei/GACHA-ONLINE-GUI/main/Gacha%20Online%20Troll%20GUI%20v1.0.0"))()
DiscordLib:Notification("The Script Has Loaded!", "GACHA ONLINE GUI", "Okay!")
end)

gacha:Seperator()

gacha:Button("GACHA ONLINE GUI TROLL GUI V3", function()
loadstring(game:HttpGet("https://pastebin.com/raw/vKQBB49Q"))()
DiscordLib:Notification("The Script Has Loaded!", "GACHA ONLINE GUI TROLL GUI", "Okay!")
end)

gacha:Seperator()

local gachad = help:Channel("THERAPY SCRIPTS")

gachad:Button("THERAPY SCRIPT", function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/therapy-gui/main/therapy-gui.lua", true))()
end)
DiscordLib:Notification("The Script Has Loaded!", "THERAPY SCRIPT", "Okay!")
end)

gachad:Seperator()

local tycoon = help:Channel("TYCOONS/SIMULATORS")

tycoon:Button("MEGA PRINCESS TYCOON INF CASH", function()
loadstring(game:HttpGet("https://exploitfin.netlify.app/Nexus/Loader"))()
DiscordLib:Notification("The Script Has Loaded!", "MEGA PRINCESS TYCOON INF CASH", "Okay!")
end)

gachad:Seperator()

tycoon:Button("Destruction Simualtor Infintite Money", function()
game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 999, 99999999)
DiscordLib:Notification("The Script Has Loaded!", "Destruction Simualtor Infintite Money", "Okay!")
end)

tycoon:Button("Muscle Simulator Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaitofyp/-NEW-Muscle-Simulator/refs/heads/main/Op%20script"))()
DiscordLib:Notification("The Script Has Loaded!", "Muscle Simulator Script", "Okay!")
end)

local piggy = help:Channel("PIGGY")

piggy:Button("Mobile Items Gui", function()
loadstring(game:HttpGet("https://pastefy.app/xAg5EOgF/raw",true))()
DiscordLib:Notification("The Script Has Loaded!", "Items Gui", "Okay!")
end)

piggy:Seperator()

piggy:Button("Totallynothimplayz's Items Gui", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Uhhhhhhid1/Lmaoiud/refs/heads/main/Tools"))()
DiscordLib:Notification("The Script Has Loaded!", "Items Gui", "Okay!")
end)

piggy:Seperator()

piggy:Button("Pig Hub", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Piggy-open-source-15390"))()
DiscordLib:Notification("The Script Has Loaded!", "Pig Hub", "Okay!")
end)

piggy:Seperator()

piggy:Button("Deepstar Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/StarHackScripts/StarHack-Hub-Deepstar-Hub/refs/heads/main/StarHack%20Hub%20-%20Piggy%20Pro%20Hub.txt"))()
DiscordLib:Notification("The Script Has Loaded!", "Deepstar Hub", "Okay!")
end)

piggy:Seperator()

piggy:Button("Veno Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Uhhhhhhid1/Lmaoiud/refs/heads/main/Piggy2.txt"))()
DiscordLib:Notification("The Script Has Loaded!", "Veno Hub", "Okay!")
end)

piggy:Seperator()


piggy:Label("DECAY")

piggy:Button("PIGGY REVAMPED SCRIPT", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Uhhhhhhid1/Lmaoiud/refs/heads/main/Yeh"))()
DiscordLib:Notification("The Script Has Loaded!", "PIGGY REVAMPED SCRIPT", "Okay!")
end)

piggy:Seperator()

piggy:Button("Auto Complete Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/-/refs/heads/main/a"))()
DiscordLib:Notification("The Script Has Loaded!", "Auto Complete Script", "Okay!")
end)

piggy:Seperator()

local gachawd = help:Channel("GEF SCRIPTS")

gachawd:Button("GEF Nahh Hub Remake", function()
loadstring(game:HttpGet("https://pastebin.com/raw/ELBvHJbi"))()
DiscordLib:Notification("The Script Has Loaded!", "GEF Nahh Hub", "Okay!")
end)

gachawd:Button("GEF Nahh Hub Script", function()
loadstring(game:HttpGet("https://pastebin.com/raw/mqUJAL3r"))()
DiscordLib:Notification("The Script Has Loaded!", "GEF Nahh Hub", "Okay!")
end)

gachawd:Seperator()

gachawd:Button("Madbuk Scripts OP GUI", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MadbukScripts/Scripts/main/Obfuscated%20Gef.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Madbuk Scripts OP GUI", "Okay!")
end)

gachawd:Seperator()

gachawd:Button("Random GEF Script", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/nAlwspa/arrayfield/refs/heads/main/fef'))()
DiscordLib:Notification("The Script Has Loaded!", "Random GEF Script", "Okay!")
end)

gachawd:Seperator()

gachawd:Button("GUFFHP GEF HUB", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Juanko-Scripts/Roblox-scripts/refs/heads/main/GUFFHP%20%7C%20GEFF%20%7C%20BETA"))()
DiscordLib:Notification("The Script Has Loaded!", "GUFFHP GEF HUB", "Okay!")
end)

gachawd:Seperator()

gachawd:Button("jannnab GEF Script", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/jannnerb/jannnabscript/refs/heads/main/jannnabscript'))()
DiscordLib:Notification("The Script Has Loaded!", "jannnab GEF Script", "Okay!")
end)

gachawd:Seperator()

local geff = help:Channel("GROW A GARDEN")

geff:Button("Kenniels Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Grow-a-garden/refs/heads/main/Grow%20A%20Garden"))()
DiscordLib:Notification("The Script Has Loaded!", "Kenniels Script", "Okay!")
end)

geff:Seperator()

geff:Button("ameicaa1 gui hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ameicaa1/Grow-a-Garden/main/Grow_A_Garden.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "ameicaa1 gui hub", "Okay!")
end)

geff:Seperator()

geff:Button("Grow A Garden Script V1.01", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RecryDv/sh0velprod/refs/heads/main/Loader.bf"))()
DiscordLib:Notification("The Script Has Loaded!", "Grow A Garden Script", "Okay!")
end)

geff:Seperator()

local gedd = help:Channel("FINDTHEADMINGUNS")

gedd:Button("GET ALL GUNS", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Admin-guns!-(35)-Get-All-Guns-(Even-not-released-guns)-2440"))()
DiscordLib:Notification("The Script Has Loaded!", "GET ALL GUNS", "Okay!")
end)

gedd:Seperator()

local g = help:Channel("MM2 SCRIPTS")

g:Button("VynixuMM2 Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Neon-Fox/roblox-scripts/main/VynixuMM2"))()
DiscordLib:Notification("The Script Has Loaded!", "VynixuMM2 Script", "Okay!")
end)

g:Seperator()

g:Button("Xhub MM2 Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XhubPrem/Universal/refs/heads/main/script.lua"))() 
DiscordLib:Notification("The Script Has Loaded!", "Xhub MM2 Script", "Okay!")
end)

g:Seperator()

g:Button("MM2 Admin Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MarsQQ/ScriptHubScripts/master/MM2%20Admin%20Panel"))(); 
DiscordLib:Notification("The Script Has Loaded!", "MM2 Admin Script", "Okay!")
end)

g:Seperator()

g:Button("Foggy Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/mm2-piano-reborn/refs/heads/main/scr"))()
DiscordLib:Notification("The Script Has Loaded!", "Foggy Hub", "Okay!")
end)

g:Seperator()

g:Button("Yhub MM2 Gui", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Luarmor123/YHUB-Community/refs/heads/main/Murder-Mystery2"))()
DiscordLib:Notification("The Script Has Loaded!", "Yhub MM2 Gui", "Okay!")
end)

g:Seperator()

g:Button("MM2 Auto farm", function()
loadstring(game:HttpGet("https://pastebin.com/raw/dB3kQmYm"))()
DiscordLib:Notification("The Script Has Loaded!", "MM2 Auto farm", "Okay!")
end)

g:Seperator()

g:Button("MM2 Mars Hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/1andonlymars/MarsHub/main/MM2"))()
DiscordLib:Notification("The Script Has Loaded!", "MM2 Mars Hub", "Okay!")
end)

g:Seperator()

local ad = win:Server("WORKPACE SCRIPTS", "http://www.roblox.com/asset/?id=9732720284")

local galpd = ad:Channel("EXECUTOR SCRIPTS")

galpd:Button("Psy Hub", function()
loadstring(game:GetObjects("rbxassetid://3014051754")[1].Source)()
DiscordLib:Notification("The Script Has Loaded!", "Psy Hub", "Okay!")
end)

galpd:Seperator()

galpd:Button("Internal UI", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Other-Stuff/main/ExecutorInternal.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Internal UI", "Okay!")
end)

galpd:Seperator()

galpd:Button("Pilin Executor", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/moedlol/PilinExecutor/refs/heads/main/Backdoor%20Executor"))()
DiscordLib:Notification("The Script Has Loaded!", "Pilin Executor", "Okay!")
end)

galpd:Seperator()

local galpde = ad:Channel("PART EDITOR GUIS")

galpde:Button("Dex Explorer", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "Dex Explorer", "Okay!")
end)

galpde:Seperator()

galpde:Button("Child Viewer", function()
loadstring(game:HttpGet("https://pastebin.com/raw/74B47GwK"))()
DiscordLib:Notification("The Script Has Loaded!", "Child Viewer", "Okay!")
end)

galpde:Seperator()

local gdalpde = ad:Channel("REMOTESPYS")

gdalpde:Button("Octo Spy", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Octo-Spy/refs/heads/main/Main.lua", true))()
DiscordLib:Notification("The Script Has Loaded!", "Octo Spy", "Okay!")
end)

gdalpde:Seperator()

gdalpde:Button("A RemoteSpy", function()
loadstring(game:HttpGet("https://pastebin.com/raw/qyf0wnB8"))()
DiscordLib:Notification("The Script Has Loaded!", "RemoteSpy", "Okay!")
end)

gdalpde:Seperator()

gdalpde:Button("RemoteSpy", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/nuIIism/scripts/main/rspy.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "RemoteSpy", "Okay!")
end)

gdalpde:Seperator()

gdalpde:Button("Remote Finder V2", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/mxx3x/Remote-Finder-v2/refs/heads/main/Remote%20Finder%20v2"))()
DiscordLib:Notification("The Script Has Loaded!", "Remote Finder V2", "Okay!")
end)

gdalpde:Seperator()

gdalpde:Button("Turtle Spy", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/main/Turtle%20Spy.lua"))()
DiscordLib:Notification("The Script Has Loaded!", "RemoteSpy", "Okay!")
end)

gdalpde:Seperator()

gdalpde:Button("Remote Explorer", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/CoolExploit/TestLua/refs/heads/main/RemoteExplorer', true))()
DiscordLib:Notification("The Script Has Loaded!", "Remote Explorer", "Okay!")
end)

gdalpde:Seperator()

local no = ad:Channel("STEAL STUFF SCRIPTS")

no:Button("Steal Games Script (normal)", function()
saveinstance()
DiscordLib:Notification("The Script Has Loaded!", "Steal Games Script", "Okay!")
end)

no:Button("Steal Games Script (advanced)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/24rr/tmpignore/refs/heads/main/32423sadf133"))()
DiscordLib:Notification("The Script Has Loaded!", "Steal Games Script", "Okay!")
end)

no:Seperator()

no:Button("Audio Logger", function()
saveinstance()
DiscordLib:Notification("The Script Has Loaded!", "Audio Logger", "Okay!")
end)

no:Button("Image Logger V0.3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/frzfrsy/decallogger/main/source"))()
DiscordLib:Notification("The Script Has Loaded!", "Image Logger", "Okay!")
end)

no:Seperator()

local nod = ad:Channel("BACKDOOR SCRIPTS")

nod:Button("BackDoor.exe", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua'))()
DiscordLib:Notification("The Script Has Loaded!", "BackDoor.exe", "Okay!")
end)

nod:Seperator()

nod:Button("BackDoor Scanner", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script"))();
DiscordLib:Notification("The Script Has Loaded!", "BackDoor Scanner", "Okay!")
end)

nod:Seperator()

nod:Button("Epic Backdoor", function()
loadstring(game:HttpGet("https://pastebin.com/raw/WcSnAeD8"))();
DiscordLib:Notification("The Script Has Loaded!", "Epic Backdoor", "Okay!")
end)

nod:Seperator()

nod:Button("V7X Backdoor", function()
loadstring(game:HttpGet("https://tinyurl.com/msfhyx4r"))()
DiscordLib:Notification("The Script Has Loaded!", "V7X Backdoor", "Okay!")
end)

nod:Seperator()

local b = win:Server("MISC", "http://www.roblox.com/asset/?id=120993786542418")

local galp = b:Channel("KEYBOARD SCRIPTS")

galp:Button("DELTA MOBILE KEYBOARD (for mobile)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt",true))()
DiscordLib:Notification("The Script Has Loaded!", "DELTA MOBILE KEYBOARD", "Okay!")
end)

galp:Seperator()

galp:Button("Keyboard Script", function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Fr"))();
DiscordLib:Notification("The Script Has Loaded!", "Keyboard Script", "Okay!")
end)

galp:Seperator()

local galp = b:Channel("SHADERS")

galp:Button("PSHADE ULTIMATE", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua'))()
DiscordLib:Notification("The Script Has Loaded!", "PSHADE ULTIMATE", "Okay!")
end)

galp:Seperator()

galp:Button("SHADERS", function()
loadstring(game:HttpGet("https://pastebin.com/raw/uqD7VqQU"))()
DiscordLib:Notification("The Script Has Loaded!", "SHADERS", "Okay!")
end)

galp:Seperator()

local nigw = b:Channel("BYPASS ROBLOX TAGS")

nigw:Button("AnnaBypasser", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnnaRoblox/AnnaBypasser/refs/heads/main/AnnaBypasser.lua",true))()
DiscordLib:Notification("The Script Has Loaded!", "AnnaBypasser", "Okay!")
end)

nigw:Seperator()

nigw:Button("My_ci Chat Spam Script", function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/mert134/8acefba3dc5d4b9e10cf88b5c6cc681b/raw/46e0e90a831d790488607270c51bb3018930b1c5/gistfile1.txt"))()
DiscordLib:Notification("The Script Has Loaded!", "My_ci Chat Spam Script", "Okay!")
end)

nigw:Seperator()

nigw:Button("Error Bypasser", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XE3Exploits/Errorbypasser/ad914c9572280d9a9aabd231539e59d802fe0288/Error%20Bypasser%20Main%20Chat%20Bypasser",true))()
DiscordLib:Notification("The Script Has Loaded!", "Error Bypasser", "Okay!")
end)

nigw:Seperator()

nigw:Button("Arya Bypasser", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/twig76/ayra/refs/heads/main/ayras",true))()
DiscordLib:Notification("The Script Has Loaded!", "Arya Bypasser", "Okay!")
end)

nigw:Seperator()

nigw:Button("AK chat Bypasser", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AKadminlol/AKBYPASSER/refs/heads/main/creditsbyAK"))()
DiscordLib:Notification("The Script Has Loaded!", "AK chat Bypasser", "Okay!")
end)

nigw:Seperator()

nigw:Button("Fake verified V2", function()
loadstring(game:HttpGet("https://pastebin.com/9PJCpDic"))();
DiscordLib:Notification("The Script Has Loaded!", "Fake verified V2", "Okay!")
end)

nigw:Seperator()

local unanchor = b:Channel("UNANCHORED PARTS SCRIPTS")

unanchor:Button("KAWII AURA Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-AURA/main/kawaii_aura.lua", true))()
DiscordLib:Notification("The Script Has Loaded!", "KAWII AURA Script", "Okay!")
end)

unanchor:Seperator()

unanchor:Button("Super Ring Parts V6", function()
loadstring(game:HttpGet("https://pastebin.com/raw/cKHhzkNr"))();
DiscordLib:Notification("The Script Has Loaded!", "Super Ring Parts V6", "Okay!")
end)

unanchor:Seperator()

unanchor:Button("UNANCHORED PARTS TO PLAYER", function()
loadstring(game:HttpGet("https://pastebin.com/raw/hFCpimSm"))()
DiscordLib:Notification("The Script Has Loaded!", "UNANCHORED PARTS TO PLAYER", "Okay!")
end)


unanchor:Button("FE BLACK HOLE", function()
loadstring(game:HttpGet("https://pastebin.com/raw/cKHhzkNr"))();
DiscordLib:Notification("The Script Has Loaded!", "FE BLACK HOLE", "Okay!")
end)

unanchor:Seperator()

local demon = win:Server("PREMIUM VERSION", "http://www.roblox.com/asset/?id=12838239791")

local loldc = demon:Channel("(coming in version 10)")

local dad = win:Server("▓▓▓����▓▓▓������║▌║▌║▌│█�����▓▓▓⣿��║▌║▌║▌│█�▓▓▓������║▌║▌║▌│█�����▓▓▓⣿����▓▓▓⣿", "http://www.roblox.com/asset/?id=8299125107")

local btnse = dad:Channel("����������������������������������������������������������������������������������������������������������v���")

btnse:Button("▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnse:Seperator()

btnse:Button("▁▂▁▂▃▄▅▆▇▉▃▄▃▄▅▆▇▉▅▆▇▉▁▂▁▂▃▄▅▆▇▉▃▄▃▄▅▆▇▉▅▆▇▉▁▂▁▂▃▄▅▆▇▉▃▄▃▄▅▆▇▉▅▆▇▉▁▂▁▂▃▄▅▆▇▉▃▄▃▄▅▆▇▉▅▆▇▉▁▂▁▁▂▁▂▃▄▅▆▇▉▃▄▃▄▅▆▇▉▅▆▇▉▂▃▄▅▆▇▉▃▄▃▄▅▆▇▉▅▆▇▉▁▂▁▂▃▄▅▆▇▉▃▄▃▄▅▆▇▉▅▆▇▉", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌│█║▌║▌║▌│█║▌║║▌│█│█║▌║▌║▌│█║▌║║▌║▌║▌│█║│█║▌│█║▌║▌║▌│█║▌║║▌║▌│█║▌║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnse:Seperator()

btnse:Button("⢻⣿⡇⣿⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⠁", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌│║▌║▌║▌│║▌│║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌║▌║▌│█║▌│█║▌║║▌│█│█║▌║▌║▌│█║▌║║▌║▌║▌│█║│█║▌│█║▌║▌║▌│█║▌║║▌║▌│█║▌║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnse:Seperator()

btnse:Button("http://www.roblox.com/asset/?id=78679778󠀰󠀰󠀰󠀰󠀰󠀰󠀰󠀰󠀰⠀ ⠀ ⠀ ⠀ ⠀⠀ ⠀ ⠀ ⠀ ║▌║▌│█⠀ ⠀ █║▌║⠀ ⠀ ⠀", function()
while true do end
DiscordLib:Notification("The Script Has Loaded", "▌│█║▌║▌│║▌║▌║▌│██║▌║▌║▌│█║▌█║▌║▌█████│█║▌║▌║▌║▌║▌│█║▌│█║▌║║▌│█│█║▌║▌║▌│█║▌║║▌║▌║▌│█║│█║▌│█║▌║▌║▌│█║▌║║▌║▌│█║▌║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnse:Seperator()

btnse:Button("⣿║▌███▌│║▌║▌███│⡇⣿⠁", function()
while true do end
DiscordLib:Notification("The Script Has Loaded", "▌│█║▌│█║▌║▌║▌│║▌║▌║▌│██║▌║▌║▌│█║▌█║▌║▌█████│█║▌║▌║▌║▌║▌│█║▌│█║▌║║▌│█│█║▌║▌║▌│█║▌║║▌║▌║▌│█║│█║▌│█║▌║▌║▌│█║▌║║▌║▌│█║▌║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnse:Seperator()


btnse:Seperator()

btnse:Button("▇▁▌║▌║▌│������������█║▌▉", function()
while true do end
DiscordLib:Notification("The Script Has Loaded", "▌│║▌║▌║▌│██║▌║▌║▌│█║▌█║▌║▌█████│█║▌║▌║▌║▌║▌│█║▌│█║▌║║▌│█│█║▌║▌║▌│█║▌║║▌║▌║▌│█║│█║▌│█║▌║▌║▌│█║▌║║▌║▌│█║▌║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnse:Seperator()

btnse:Button("▇🏻‎▌║▌🏼▂║▌║▌│█▃▄‎🏽║▌║▌‎🏾🏿", function()
while true do end
DiscordLib:Notification("The Script Has Loaded", "▌│║▌║▌║▌│██║▌║▌║▌│█║▌█║▌║▌█████│█║▌║▌║▌║▌║▌│█║▌│█║▌║║▌│█│█║▌║▌║▌│█║▌║║▌║▌║▌│█║│█║▌│█║▌║▌║▌│█║▌║║▌║▌│█║▌║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnse:Seperator()

btnse:Button("⢻⣿⡇⣿⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⢻⣿⡇⣿⠁⠁", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌│║▌║▌│║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌║▌║▌│█║▌│█║▌║║▌│█│█║▌║▌║▌│█║▌║║▌║▌║▌│█║│█║▌│█║▌║▌║▌│█║▌║║▌║▌│█║▌║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnse:Seperator()

btnse:Button("⡇║▌║▇🏻‎▌║▌│█‎‎║▌║▌║▌║‎‎‎▌‎🏾│█║▌║▌║▌│█║▌▇‎▌║║������▌⣿⠁⠁", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌│║▌║▌│║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌║▌║▌│█║▌│█║▌║║▌│█│█║▌║▌║▌│█║▌║║▌║▌║▌│█║│█║▌│█║▌║▌║▌│█║▌║║▌║▌│█║▌║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnse:Seperator()

local btnsee = dad:Channel("▌║▌║▌│█║▌�▓▓▓▓▓▓▓▓▓▓▓▓▓���⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�����������������������������������������������������������������������������������v���")

btnsee:Button("▓▓▓▓▓▓▓�▓▓▓▓▓▓▓▓�����������▓▓▓⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnsee:Seperator()


btnsee:Button("▓▓▓▓▓▓▓�▓▓▓▓▓▓▓▓������║▌║▌║▌│█�����▓▓▓⣿⣿⣿║▌║▌║▌│█⣿⣿⣿⣿⣿⣿⣿loadstring(whiledo)⣿is ⣿⣿⣿⣿⣿⣿⣿⣿⣿false▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnsee:Seperator()

btnsee:Button("▓║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║▓▓▓▓▓▓�▓▓▓▓▓▓▓▓������║▌║▌║▌│█�����▓▓▓⣿⣿⣿║▌║▌║▌│█⣿⣿⣿⣿⣿⣿⣿loadstring(whiledo)⣿is ⣿⣿⣿⣿⣿⣿⣿⣿⣿false▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnsee:Seperator()

btnsee:Button("▓║▌║║▌│█║▌║║▌║▌║▌│█║▌║║▌║if▌║▌│█║▌║║true▌║▌║▌│█║▌║▓▓▓▓▓▓�▓▓▓▓▓▓▓▓��and����║▌║▌║▌│█�����▓▓▓⣿⣿⣿║▌║▌║▌║▌│█║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║▓▓▓▓▓▓�▓▓▓▓▓▓▓▓������║▌║▌║▌│█�����▓▓▓⣿⣿⣿║▌║▌║║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║▓▓▓▓▓▓�▓▓▓▓▓▓▓▓������║▌║▌║▌│█�����▓▓▓⣿⣿⣿║▌║▌║▌│█⣿⣿⣿⣿⣿⣿⣿loadstring(whiledo)⣿is ⣿⣿⣿⣿⣿⣿⣿⣿⣿false▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnsee:Seperator()

btnsee:Button("▓║▌║║▌│█║▌║║▌║▌║▌│█║▌║║▌║if▌║▌│█║▌║║true▌║▌║▌│█║▌║▓▓▓▓▓▓�▓▓▓▓▓▓▓▓��and����║▌║▌║▌│█�����▓▓▓⣿⣿⣿║▌║▌║▌║▌│█║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║▓▓▓▓▓▓�▓▓▓▓▓▓▓▓������║▌║▌║▌│█�����▓▓▓⣿⣿⣿║▌║▌║║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║║▌║▌║▌│█║▌║▓▓▓▓▓▓�▓▓▓▓▓▓▓▓������║▌║▌║▌│█�����▓▓▓⣿⣿⣿║▌║▌║▌│█⣿⣿⣿⣿⣿⣿⣿loadstring(whiledo)⣿is ⣿⣿⣿⣿⣿⣿⣿⣿⣿false▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓", function()
while true do end
DiscordLib:Notification("The Script Has Loaded!", "▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║▌│█║▌║▌║", "Okay!")
end)


btnsee:Seperator()

