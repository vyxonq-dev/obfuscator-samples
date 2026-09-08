-- orion lib main
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Title

local Window = OrionLib:MakeWindow({Name = "Universal Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest"})

local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://4835664238"
            Sound.Parent = workspace
            Sound:Play()
            Sound.Volume = 5

-- Info tab
local Tab = Window
:MakeTab({
	Name = "Info",
	Icon = "",
	PremiumOnly = false
})

Tab:AddParagraph("Welcome to Universal Hub!","Hello I am Andro (Andro#4527), I am the creator of Universal Hub which is support many games. I take script from people who made them and input them here with their credits and discord. If any issues please report it in the discord.")

Tab:AddParagraph("How To Use","To use this script join a game which Universal Hub supports, then click on the game in the script, it will execute a community script. After executing it you will copy the script's discord if found you will get a notification saying (Copied Discord Invite), if not you will get a notification saying (Discord Not Found)")


Tab:AddButton({
	Name = "Universal Hub Discord Invite!",
	Callback = function()
	    
	    setclipboard("https://discord.gg/4RY4qEyX3k")
	    
      	OrionLib:MakeNotification({
	    Name = "Universal Hub",
	    Content = "Copied Discord Invite!",
	    Image = "",
	    Time = 5
})
  	end    
})

-- Updates

local Tab = Window:MakeTab({
	Name = "Updates",
	Icon = "",
	PremiumOnly = false
})

Tab:AddParagraph("Updates"," [+] Added - Titan Warfare (10/3/2022)")

-- Universal script tab


local Tab = Window:MakeTab({
	Name = "Main Scripts",
	Icon = "",
	PremiumOnly = false
})

-- Info

Tab:AddParagraph("Main Scripts Section -","These scripts are widely used in many games and have multiple features.")

-- Infinite Yield

Tab:AddButton({
	Name = "Infinite Yield",
	Callback = function()
	   
	     loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Infinite Yield Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
	     setclipboard("https://discord.gg/Abqv2yJUFV")
	end 
})

-- CMD-X

Tab:AddButton({
	Name = "CMD-X",
	Callback = function()
	    
	     loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "CMD-X Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/A3RFj47jbX")
	end   
})

-- Fates Admin

Tab:AddButton({
	Name = "Fates Admin",
	Callback = function()
	    
	     loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Fates Admin Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/3sQXUb5P2y")
	end    
})

-- Shed Chat Bypasser

Tab:AddButton({
	Name = "Shed Chat Bypasser",
	Callback = function()
	    
	     loadstring(game:HttpGet("https://the-shed.xyz/roblox/scripts/ChatBypass", true))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Shed Softworks Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
	    setclipboard("https://discord.gg/GZm35P2PSe")
	end 
})

-- Unamed Esp

Tab:AddButton({
	Name = "Unnamed Esp",
	Callback = function()
	    
	    
        	    
	     loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Unnamed esp Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
	end
})

-- Anti Afk

Tab:AddButton({
	Name = "Anti Afk",
	Callback = function()
	  
	     loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringypVvhJBq4QNz", true))()
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Anti Afk Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
	end
})

-- Fates Aimbot / Esp

Tab:AddButton({
	Name = "Fates Aimbot / Esp",
	Callback = function()
	    
	     loadstring(game:HttpGet('https://raw.githubusercontent.com/fatesc/fates-esp/main/main.lua'))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Fates Aimbot Has Been Executed!",
	    Image = "",
	    Time = 5
        })
	end
})

-- Anime Games Tab

local Tab = Window:MakeTab({
	Name = "Anime Games",
	Icon = "",
	PremiumOnly = false
})

-- Info

Tab:AddParagraph("Anime Games Section -","This section consists of Anime games on roblox. Taken from various scripts and hubs which might have linkvertise or have keys in their discord.")

Tab:AddParagraph("How to bypass linkvertise -","To bypass linkvertise to get the key use bypass.vip, This website works very efficiently.")

-- Features

Tab:AddParagraph("Features -","1. Anime Battle Arena, 2. Blox Fruits, 3. Anime Fighters Simulator, 4. A one piece game, 5. Ro Ghoul, 6. King Legacy, 7. Dragon Ball Z FS, 8. Anime Dimensions, 9. Shindo Life, 10. DemonFall, 11. Stand Upright : Rebooted, 12. Your Bizarre Adventure, 13. Project Baki 2, 14. Reaper 2, 15. Grand Pirates, 16. Titan Warfare")

-- Anime Battle Arena

Tab:AddButton({
	Name = "1. Anime Battle Arena",
	Callback = function()
	   
         OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "This script uses a key system!! Use bypass.vip to skip linkvertise!",
	    Image = "rbxassetid://4483345998",
	    Time = 10
        })	   
	  wait(1)
	     loadstring(game:HttpGet('https://kyouko.se/55o4m9a2bwqg.lua'))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Mose Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
	    setclipboard("https://discord.gg/T6kpUsDsFW")
	end 
})

-- Blox Fruits

Tab:AddButton({
	Name = "2. Blox Fruits",
	Callback = function()
      	
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/xDepressionx/Free-Script/main/BloxFruit.lua"))()
      	
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "MUKURO Hub Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
      	setclipboard("https://discord.gg/tgDeYtEm")
  	end    
})

-- Anime Fighters Simulator

Tab:AddButton({
	Name = "3. Anime Fighters Simulator",
	Callback = function()
      	
      	loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/KiJinGaming/FreeScript/main/KJHub.lua"))();
      	
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "KJ Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
      	setclipboard("https://discord.gg/Q7nWB5JjMB")
  	end    
})

-- A one piece game
    Tab:AddButton({
	Name = "4. A one piece game",
	Callback = function()
      	
      	loadstring(game:HttpGet("https://rawscripts.net/raw/Testing-A-0ne-Piece-Game-LeadMarkerAOPG-1595"))()
      	
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "LeadMarker's Script Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/64N6a3sQjt")
  	end    
})

-- Ro Ghoul 

Tab:AddButton({
	Name = "5. Ro Ghoul ",
	Callback = function()
      	
        loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/z4gs/scripts/master/Ro-Ghoul%20Auto%20Farm.lua")))()
      	
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Ro-Ghoul GUI Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/64N6a3sQjt")
  	end    
})

-- King Legacy

Tab:AddButton({
	Name = "6. King Legacy",
	Callback = function()
      	
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      	
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "MasterHub V4 Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/CCVsKQ79sQ")
      	
  	end
})

-- Dragon Ball Z FS

    Tab:AddButton({
	Name = "7. Dragon Ball Z FS",
	Callback = function()
      	loadstring(game:HttpGet('https://kyouko.se/55o4m9a2bwqg.lua'))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Mose Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
	    setclipboard("https://discord.gg/T6kpUsDsFW")
  	end    
})

-- Anime Dimensions

Tab:AddButton({
	Name = "8. Anime Dimensions",
	Callback = function()
	    
      	pcall(function()
        loadstring(game:HttpGet("http://riverhub.xyz/" .. tostring(game.PlaceId) .. ".lua"))()
        end)
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "River Hub Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
  	end    
})

-- Shindo Life 

Tab:AddButton({
	Name = "9. Shindo Life",
	Callback = function()
      	 
      	 loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "V.G Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
      	setclipboard("https://discord.gg/JkrYsJXSJd") 
  	end    
})


-- DemonFall 

Tab:AddButton({
	Name = "10. DemonFall",
	Callback = function()
      		
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/StepBroFurious/Script/main/FuriousFall.lua"))()
      		
      	       OrionLib:MakeNotification({
               Name = "Universal Hub",
	       Content = "Furious Fall Has Been Executed! (Copied Discord Invite)",
	       Image = "",
	       Time = 5
        })
      	setclipboard("https://discord.gg/CQnytxYUxA") 
      		
  	end    
})

-- Stand Upright : Rebooted 

Tab:AddButton({
	Name = "11. Stand Upright : Rebooted",
	Callback = function()
      		
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaiden00/Scripts/main/thingy"))()
      		
      		OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Noob Upright Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
  	end    
})

-- Your Bizarre Adventure

Tab:AddButton({
	Name = "12. Your Bizarre Adventure",
	Callback = function()
      		
  	   loadstring(game:HttpGet("https://raw.githubusercontent.com/kolgie/YBA-GUI/main/yba-gui-obfuscated.lua"))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Kolgie Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/Wa9752fEXy") 
  end
})

-- Project Baki 2 

Tab:AddButton({
	Name = "13. Project Baki 2",
	Callback = function()
      		
  	    loadstring(game:HttpGet("https://raw.githubusercontent.com/LioK251/Scripts/main/somehub.lua"))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Lazy Hub Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
  end
})

-- Reaper 2 

Tab:AddButton({
	Name = "14. Reaper 2",
	Callback = function()
      		
  	    loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/Reaper2'),true))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Reaper 2 GUI Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
  end
})

-- Grand Pirates

Tab:AddButton({
	Name = "15. Grand Pirates",
	Callback = function()
      		
  	    loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/GrandPirates'),true))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Grand Pirates GUI Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
  end
})

-- Titan Warfare

Tab:AddButton({
	Name = "16. Titan Warfare",
	Callback = function()
      		
  	    loadstring(game:HttpGet("https://raw.githubusercontent.com/SealboyDiscord/Ro-Flux/main/TW.lua"))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Ro-Flux Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/WwpgxcgjbE")
  end
})

-- Black people games Tab

local Tab = Window:MakeTab({
	Name = "Hood Games",
	Icon = "",
	PremiumOnly = false
})

-- Info
Tab:AddParagraph("Hood Games Section -","This section consist of hood genre games. Taken from various script and hubs which might have linkvertise or have keys in their discord.")

Tab:AddParagraph("How to bypass linkvertise -","To bypass linkvertise to get the key use bypass.vip, This website works very efficiently.")

-- Features

Tab:AddParagraph("Features -","1. Da Hood, 2. Criminality, 3. Da Hood Modded, 4. The Streets")

-- Da hood

Tab:AddButton({
	Name = "1. Da Hood",
	Callback = function()
	    
	    OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "This script uses a key system!! Join their discord to get the key! ",
	    Image = "rbxassetid://4483345998",
	    Time = 10
        })
	    wait(1)
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/cjdjmj/new-ui-godmode/main/README.md", true))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Lanxility V2  Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
	    setclipboard("https://discord.gg/Cxu2jCCqTa")
  	end    
})

-- Criminality

Tab:AddButton({
	Name = "2. Criminality",
	Callback = function()
	    
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/DOXSASHW/poop-123/main/ok'))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Elite Hub  Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
	    setclipboard("https://discord.gg/PRF2h4KdgD")
  	end    
})

-- Da Hood Modded 

Tab:AddButton({
	Name = "3. Da Hood Modded",
	Callback = function()
	    
	    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Rippeed/DaHoodinary/main/chariotsware"))()
	    
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Chariot Sware Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
	    setclipboard("https://discord.gg/chariotsware")
  	end    
})

-- The Streets 

Tab:AddButton({
	Name = "4. The Streets",
	Callback = function()
	    
      	loadstring(game:GetObjects("rbxassetid://02565551523")[1].Source)()
	    
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Zetrox V7 Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
        setclipboard("Discord Not Found")
  	end    
})

-- FPS GAMES Tab

local Tab = Window:MakeTab({
	Name = "Fps Games",
	Icon = "",
	PremiumOnly = false
})

-- Info

Tab:AddParagraph("Hood Games Section -","This section consists of First Person Shooter games. Taken from various script and hubs which might have linkvertise or have keys in their discord.")

Tab:AddParagraph("How to bypass linkvertise -","To bypass linkvertise to get the key use bypass.vip, This website works very efficiently.")

-- Features

Tab:AddParagraph("Features -","1. Arsenal, 2. Phantom Forces, 3. Bad Business, 4. Counter Blox, 5. Big Paintball, 6. Strucid, 7. Energy Assault")

-- Arsenal

Tab:AddButton({
	Name = "1. Arsenal",
	Callback = function()
      		
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
	    
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Owl Hub Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
        
  	end    
})

-- Phantom Forces

Tab:AddButton({
	Name = "2. Phantom Forces",
	Callback = function()
	    
      		loadstring(game:HttpGet("https://ehub.fun/raw/script.lua"))()
	    
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Ethub.Fun Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/p65tYTN3J6")
  	end    
})

-- Bad Business

Tab:AddButton({
	Name = "3. Bad Business",
	Callback = function()
	    
	    loadstring(game:HttpGet("https://projectevo.xyz/script/loader.lua"))()
	    
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "EvoV2 Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/uvJmbXmr4F")
  	end    
})

-- Counter Blox 

Tab:AddButton({
	Name = "4. Counter Blox",
	Callback = function()
      		
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/Pawel12d/hexagon/main/scripts/CounterBlox.lua', true))()
      		OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Hexagon Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
  	end    
})

-- Big Paintball

Tab:AddButton({
	Name = "5. Big Paintball",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
	    
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Owl Hub Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
  	end    
})

-- Strucid

Tab:AddButton({
	Name = "6. Strucid",
	Callback = function()
      		
      		loadstring(game:HttpGet("https://projectevo.xyz/script/loader.lua"))()
	    
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "EvoV2 Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/uvJmbXmr4F")
     end
})

-- Energy Assault

Tab:AddButton({
	Name = "7. Energy Assault",
	Callback = function()
      		
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Averiias/Universal-SilentAim/main/main.lua"))()
	    
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Universal Silent Aim Has Been Executed! Press RightControl to open GUI!! USE FindPartOnRayWithIgnoreList IN OPTIONS (Discord Not Found)",
	    Image = "",
	    Time = 15
        })
     end
})


-- Random Games Tab

local Tab = Window:MakeTab({
	Name = "Random Games",
	Icon = "",
	PremiumOnly = false
})

-- Info

Tab:AddParagraph("Random Games Section -","This section consists of Popular / lore / unknown games. Taken from various script and hubs which might have linkvertise or have keys in their discord. ")

Tab:AddParagraph("How to bypass linkvertise -","To bypass linkvertise to get the key use bypass.vip, This website works very efficiently.")

-- Features

Tab:AddParagraph("Features -","1. Bedwars, 2. Dungeon Quest, 3. Murder Mystery 2, 4. Jailbreak, 5. MadCity, 6. Adopt Me, 7. Pet Simulator X, 8. WestBound, 9. Wild West, 10. The Lift, 11. Youtube Life")

-- Bed Wars

Tab:AddButton({
	Name = "1. Bedwars",
	Callback = function()
	    
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
      		
      		OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Vape V4 Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5    
        })
        setclipboard("https://discord.gg/vxpe")
      		
	end    
})

-- Dungeon Quest

Tab:AddButton({
	Name = "2. Dungeon Quest",
	Callback = function()
      		
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()

      		OrionLib:MakeNotification({
	        Name = "Universal Hub",
	        Content = "V.G Hub Has Been Executed! (Copied Discord Invite)",
	        Image = "",
	        Time = 5
      		})
	        setclipboard("https://discord.gg/JkrYsJXSJd")
	end
})

-- Murder Mystery 2

Tab:AddButton({
	Name = "3. Murder Mystery 2",
	Callback = function()
      		
      		getgenv().mainKey = "nil"

            local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https://api.eclipsehub.xyz/auth"c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
            
            
      	OrionLib:MakeNotification({
    	Name = "Universal Hub",
     	Content = "Eclipse Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
      	})
      	setclipboard("https://discord.gg/vfeZ5Ze")
  	end    
})

-- Jailbreak

Tab:AddButton({
	Name = "4. Jailbreak",
	Callback = function()
      		
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/wawsdasdacx/ohascriptnrrewading/main/jbsaxcriptidk1"))()
      		
      		OrionLib:MakeNotification({
	        Name = "Universal Hub",
        	Content = "Jailbreak GUI Has Been Executed! (Copied Discord Invite)",
	        Image = "",
        	Time = 5
      		})
      		setclipboard("https://discord.gg/Z5c44s7nq4")
  	end    
})

-- Mad City

Tab:AddButton({
	Name = "5. MadCity",
	Callback = function()
      	
      	pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ECLIPSEXHUB/ECLIPSE-X/main/ECLIPSE%20X.txt", true))()
        end)
      	
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "ZEPHYR X Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/85kAvMGkXM")
      	
  	end
})

-- Adopt Me

Tab:AddButton({
	Name = "6. Adopt Me",
	Callback = function()
      		
      		getgenv().mainKey = "nil"

            local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https://api.eclipsehub.xyz/auth"c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
            
            
      	OrionLib:MakeNotification({
    	Name = "Universal Hub",
     	Content = "Eclipse Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
      	})
      	setclipboard("https://discord.gg/vfeZ5Ze")
  	end    
})

-- Pet Simulator X

Tab:AddButton({
	Name = "7. Pet Simulator X",
	Callback = function()
      	
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/destylol/masterhubv311/itachi/Main.lua"))()
      	
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "MasterHub V4 Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
        setclipboard("https://discord.gg/CCVsKQ79sQ")
      	
  	end
})

-- Westbound 

Tab:AddButton({
	Name = "8. Westbound",
	Callback = function()
      		
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/fatesc/fates-esp/main/main.lua'))()
	   
      	OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Fates Aimbot Has Been Executed!",
	    Image = "",
	    Time = 5
        })	
      		
  	end    
})

-- Wild West

Tab:AddButton({
	Name = "9. Wild West",
	Callback = function()
      		
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "V.G Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
      	setclipboard("https://discord.gg/JkrYsJXSJd") 
      		
  	end    
})

-- The lift

Tab:AddButton({
	Name = "10. The Lift",
	Callback = function()
      		
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/timkaMLG1/TheLiftFucker/main/main.lua",true))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "V.G Hub Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
      	setclipboard("https://discord.gg/kQUhG7Qbub")	
  	end    
})

-- Youtube life

Tab:AddButton({
	Name = "11. Youtube Life",
	Callback = function()
      		
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Scripts/main/YouTube%20Life/Auto%20Farm.lua"))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Vynixius GUI Has Been Executed! (Discord Not Found)",
	    Image = "",
	    Time = 5
        })
  	end    
})

-- Basketball Games Tab

local Tab = Window:MakeTab({
	Name = "Balling",
	Icon = "",
	PremiumOnly = false
})

-- Info

Tab:AddParagraph("Basketball Games Section -","This section consists of Basketball games. Taken from various script and hubs which might have linkvertise or have keys in their discord.")

Tab:AddParagraph("How to bypass linkvertise -","To bypass linkvertise to get the key use bypass.vip, This website works very efficiently.")

-- Features

Tab:AddParagraph("Features -","1. Hoopz, 2. Phenom, 3. HoopVerse")

-- Hoopz

Tab:AddButton({
	Name = "1. Hoopz",
	Callback = function()
      		
      	loadstring(game:HttpGet("https://paste.ee/r/GWYx2", true))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Loompic Aimbot Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
       setclipboard("https://discord.gg/szhwa9G5hx")
  	end    
})

-- Phenom

Tab:AddButton({
	Name = "2. Phenom",
	Callback = function()
      		
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Loompic/Phenom-Aimbot/main/Bot"))()
      
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Loompic Aimbot Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
       setclipboard("https://discord.gg/szhwa9G5hx")
  	end    
})

-- HoopVerse

Tab:AddButton({
	Name = "3. HoopVerse",
	Callback = function()
      		
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/Loompic/HoopVerse/main/Aimbot"))()
      	 
      	 OrionLib:MakeNotification({
        Name = "Universal Hub",
	    Content = "Loompic Aimbot Has Been Executed! (Copied Discord Invite)",
	    Image = "",
	    Time = 5
        })
       setclipboard("https://discord.gg/szhwa9G5hx")
  	end    
})

-- Thanks

OrionLib:MakeNotification({
	Name = "Universal Hub",
	Content = "Universal Hub has finished loading!",
	Image = "",
	Time = 5
})
wait(1)
OrionLib:MakeNotification({
	Name = "Universal Hub",
	Content = "Thanks for using our script and supporting us!!",
	Image = "",
	Time = 6
})

OrionLib:Init()
