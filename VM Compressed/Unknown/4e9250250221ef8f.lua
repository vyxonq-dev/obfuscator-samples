local player = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "FreezeHub", HidePremium = false, IntroText = "V1.05", SaveConfig = true, ConfigFolder = "OrionTest"})

local LLLLLLLLTab = Window:MakeTab({ Name = "Description", Icon = "rbxassetid://4483345998", PremiumOnly = false })

LLLLLLLLTab:AddParagraph("FreezeStudios","hey i was busy :p. anyways W means i tested X not tested.")

LLLLLLLLTab:AddParagraph("V1.05","Added Super league soccer, Rainbow friends, Tower of hell, Arsenal will be added and other games when I'll get my delta.")

local AATab = Window:MakeTab({ Name = "W.Cool Scripts", Icon = "rbxassetid://4483345998", PremiumOnly = false })

AATab:AddButton({ Name = "Infinite Yield", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))() end }) 

AATab:AddButton({ Name = "fling gui", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fling-gui-troll-17597"))() end })

AATab:AddButton({ Name = "chat spy", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Chat-spy-3000"))() end })

AATab:AddButton({ Name = "walk on walls", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-patience-obby-Universal-Walk-on-walls-18129"))() end }) 

AATab:AddButton({ Name = "R6 Animation", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))() end }) 

AATab:AddButton({ Name = "SystemBroken", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Ragdoll-Engine-BEST-SCRIPT-WORKING-SystemBroken-7544"))() end }) 

local Tab = Window:MakeTab({
	Name = "W.MM2 Hubs",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "yarhm is the best keyless sadly"
})

OrionLib:MakeNotification({
	Name = "FreezeMan",
	Content = "my internet got buff,i can check doors scripts now.",
	Image = "rbxassetid://4483345998",
	Time = 20
})

OrionLib:MakeNotification({
	Name = "FreezeStudio",
	Content = "current version is 1.04",
	Image = "rbxassetid://4483345998",
	Time = 20
})

Tab:AddButton({
	Name = "YARHM",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
  	end    
})
	
Tab:AddButton({
	Name = "EzHub",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Ez-Hub_168"))()
  	end    
})
	
Tab:AddButton({
	Name = "Nexus",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/nojon353/InfiniteCoinsandGems/main/NEXUS-MM2-infinite-coins-and-gems"))()
  	end    
})
	
Tab:AddButton({
	Name = "MarsHub",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/1andonlymars/MarsHub/main/MM2"))()
  	end    
})
	
local ATab = Window:MakeTab({
	Name = "W.Hide gui",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

ATab:AddButton({
	Name = "Keyboard for RightShift",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})
	
local BTab = Window:MakeTab({
	Name = "W.The rake remastered",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

BTab:AddButton({
	Name = "Unfairhub(dont move it cuz buggy)",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-unfair-Hub-3936"))()
  	end    
})
	
local Section = BTab:AddSection({
	Name = "Recommended to use Lynx And Project"
})

local CTab = Window:MakeTab({
	Name = "W.Trench War",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

CTab:AddButton({
	Name = "Script by exploitsn",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Trench-War-OP-15571"))()
  	end    
})
	
	CTab:AddButton({
	Name = "Trench War V2 white theme",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Trench-War-tw-script-13916"))()
  	end    
})
	
	CTab:AddButton({
	Name = "Hitbox script",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Trench-War-Hittoboxxo-7153"))()
  	end    
})

local DTab = Window:MakeTab({ Name = "W.Flee Facility", Icon = "rbxassetid://4483345998", PremiumOnly = false })

DTab:AddButton({ Name = "UnfairHub", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-unfair-Hub-3936"))() end })

DTab:AddButton({ Name = "Yahrm", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua"))()
  end }) 

DTab:AddButton({ Name = "Script Hub (OP)", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))() end })

local ETab = Window:MakeTab({ Name = "W.NaturalDisaster", Icon = "rbxassetid://4483345998", PremiumOnly = false })

ETab:AddButton({ Name = "Tbao Hub", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Tbao-Hub-16822"))() end }) 

ETab:AddButton({ Name = "Chips", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-NDS-best-script-16862"))() end }) 

local FTab = Window:MakeTab({ Name = "W.UnnamedShooter", Icon = "rbxassetid://4483345998", PremiumOnly = false })

FTab:AddButton({ Name = "RinnsHub", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Unnamed-Shooter-Rinns-Hub-14175"))() end }) 

FTab:AddButton({ Name = "unnamed gui", Callback = function()  loadstring(game:HttpGet("https://rawscripts.net/raw/Unnamed-Shooter-GUI-15366"))()  end })

FTab:AddButton({ Name = "CanCantHub (OP)", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Unnamed-Shooter-CanCantHUB-15738"))() end }) 

local GTab = Window:MakeTab({ Name = "W.Spider", Icon = "rbxassetid://4483345998", PremiumOnly = false })

GTab:AddButton({ Name = "G.Red", Callback = function() _G.RedGUI = true
_G.Theme = "Dark" loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/Spider.lua"))() end }) 

GTab:AddButton({ Name = "unnamed gui", Callback = function() loadstring(game:HttpGet("https://abre.ai/spider-lua"))() end })

GTab:AddButton({ Name = "unnamed gui 2", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/eDzjAAbK"))() end }) 

local HTab = Window:MakeTab({ Name = "W.(banned)Area 51", Icon = "rbxassetid://4483345998", PremiumOnly = false })

HTab:AddButton({ Name = "darkrai", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Survive-and-Kill-the-Killers-in-Area-51-!!!-darkrai-x-11001"))() end })

HTab:AddButton({ Name = "CasperFlyModz", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/SurviveandKilltheKillersinArea51.lua"))() end }) 

HTab:AddButton({ Name = "Unnamed gui", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/a49VdC7u"))()  end }) 

local ITab = Window:MakeTab({ Name = "W.TSB", Icon = "rbxassetid://4483345998", PremiumOnly = false })

ITab:AddButton({ Name = "Sukuna MVS", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Tsb-sukuna-moveset-17529"))() end }) 

ITab:AddButton({ Name = "BetlessHub", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Betless-Hub-TSB-16756"))() end }) 

ITab:AddButton({ Name = "TSB Script", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Script-TSB-17312"))() end })

local JTab = Window:MakeTab({ Name = "W.The chosen one", Icon = "rbxassetid://4483345998", PremiumOnly = false })

JTab:AddButton({ Name = "Laziest", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-laziest-V2-7696"))() end }) 

JTab:AddButton({ Name = "when muted bypass", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-OP-SCRIPT-18120"))() end })

local VQPQTab = Window:MakeTab({ Name = "W.BrookhavenRP", Icon = "rbxassetid://4483345998", PremiumOnly = false })

VQPQTab:AddButton({ Name = "SkyHub", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Sky-Hub-18710"))() end }) 

local ASTab = Window:MakeTab({ Name = "W.blox fruits", Icon = "rbxassetid://4483345998", PremiumOnly = false })

ASTab:AddButton({ Name = "MinGaming", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-MInGamingHub-15620"))() end }) 

ASTab:AddButton({ Name = "ScriptHub", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ScriptHub-V3-Best-Mobile-ScriptHub-Keyless-16115"))() end })

local BATab = Window:MakeTab({ Name = "X.blade ma balls", Icon = "rbxassetid://4483345998", PremiumOnly = false })

BATab:AddButton({ Name = "ScriptHub again lol", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ScriptHub-V3-Best-Mobile-ScriptHub-Keyless-16115"))() end })

local CATab = Window:MakeTab({ Name = "X.Doors👄", Icon = "rbxassetid://4483345998", PremiumOnly = false })

CATab:AddButton({ Name = "JJS hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))() end })
	
CATab:AddButton({ Name = "Esp Script", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/OminousVibes-Exploit/Scripts/main/doors/main.lua"))() end }) 

CATab:AddButton({ Name = "Blacking X bob", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))() end }) 

local Section = CATab:AddSection({
	Name = "Doors scripts was not tested cuz my device sux :("
})

local DATab = Window:MakeTab({ Name = "W.PetSim 99", Icon = "rbxassetid://4483345998", PremiumOnly = false })

DATab:AddButton({ Name = "Cheat MENu", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Pet-Simulator-99!-Cheat-Menu-17428"))() end }) 

DATab:AddButton({ Name = "ScriptHub", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ScriptHub-V3-Best-Mobile-ScriptHub-Keyless-16115"))() end }) 

local Section = DATab:AddSection({
	Name = "UWU — wise commentator"
})

local EATab = Window:MakeTab({ Name = "W.RakOOF", Icon = "rbxassetid://4483345998", PremiumOnly = false })

EATab:AddButton({ Name = "inf stamina", Callback = function() local setreadonly = setreadonly or make_writeable
local pussymode = game.workspace[game.Players.LocalPlayer.Name].CharValues.StaminaPercentValue
local mt = getrawmetatable(game)
local old = mt.__index
setreadonly(mt, false)
mt.__index = newcclosure(function(tbl, idx)
    if idx == "Value" and tbl == pussymode then
        return 100
    end

    return old(tbl, idx)
end)
setreadonly(mt, true) end }) 

local Section = EATab:AddSection({
	Name = "it actually helps alot"
})

local FATab = Window:MakeTab({ Name = "X.Prison Life", Icon = "rbxassetid://4483345998", PremiumOnly = false })

FATab:AddButton({ Name = "Tbao Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaohubPrisonLife"))() end }) 

FATab:AddButton({ Name = "Bypass Gui", Callback = function() loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\48\48\108\88\112\108\111\105\116\101\114\47\103\48\48\108\88\112\108\111\105\116\101\114\47\109\97\105\110\47\70\101\37\50\48\98\121\112\97\115\115\34\44\32\116\114\117\101\41\41\40\41\10")()  end }) 

local Section = FATab:AddSection({
	Name = "bypass gui got random numbers script,not tested cuz exploiters crashing servers"
})

local GATab = Window:MakeTab({ Name = "W.Breaking Point", Icon = "rbxassetid://4483345998", PremiumOnly = false })

GATab:AddButton({ Name = "Naiko Scripts", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Script"))() end }) 

GATab:AddButton({ Name = "H4R7NHacks", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/H4R7NHacks/Obfuscated/master/Breaking%20Point%20H4R7N%20Hack.lua"))()  end }) 

local ERTab = Window:MakeTab({ Name = "W.Babft", Icon = "rbxassetid://4483345998", PremiumOnly = false })

ERTab:AddButton({ Name = "autofarm", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Build-A-Boat-For-Treasure-utoFrm-Gold-13684"))() end }) 

local ROTab = Window:MakeTab({ Name = "W.Underwater Company", Icon = "rbxassetid://4483345998", PremiumOnly = false })

ROTab:AddButton({ Name = "autofarm", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Underwater-Company-bootleg-autofarm-9912"))() end }) 

local RRTab = Window:MakeTab({ Name = "W.The Maze", Icon = "rbxassetid://4483345998", PremiumOnly = false })

RRTab:AddButton({ Name = "inf axes", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Maze-infinite-axe-12407"))() end }) 

RRTab:AddButton({ Name = "Zephyr", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Maze-Zephyr-V3-10777"))() end }) 

local KATab = Window:MakeTab({ Name = "W.Cheese Escape", Icon = "rbxassetid://4483345998", PremiumOnly = false })

KATab:AddButton({ Name = "get all cheese", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Cheese-Escape-Horror-Get-All-14180"))() end }) 

KATab:AddButton({ Name = "dupe cheeze", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Beat-the-game_759"))() end }) 

KATab:AddButton({ Name = "Hub from Minions", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Cheese-Escape-Horror-Scripts-from-Minion-11883"))() end }) 

local LATab = Window:MakeTab({ Name = "W.Zombie Attack", Icon = "rbxassetid://4483345998", PremiumOnly = false })

LATab:AddButton({ Name = "Zombie Attack Remake", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/dqtixz/Zombie-Attack-Remake/main/Projeto%20LKA"))(); end }) 

local MATab = Window:MakeTab({ Name = "W.Legends Of Speed", Icon = "rbxassetid://4483345998", PremiumOnly = false })

MATab:AddButton({ Name = "Gui 1", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Legends-Of-Speed-Speeeeed-Farm-Open-Source-old-code-lel-1785"))() end }) 

MATab:AddButton({ Name = "Gui 2", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Legends-Of-Speed-OP-Fast-AutoSteps-and-Gems-Farm-Auto-Race-Teleports-(and-more)-1820"))() end }) 

local NATab = Window:MakeTab({ Name = "X.Super League soccer", Icon = "rbxassetid://4483345998", PremiumOnly = false })

NATab:AddButton({ Name = "Click Da Pick Idk", Callback = function() print("button pressed") end }) 

NATab:AddParagraph("FreezeStudio","Hey i need new version of Delta to see which script i need to put in tabs so i just made Test Gui with all scripts i found.")

local OATab = Window:MakeTab({ Name = "Test", Icon = "rbxassetid://4483345998", PremiumOnly = false })

OATab:AddButton({ Name = "Button!", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/0743J0UA"))() end }) 

OrionLib:Init() 