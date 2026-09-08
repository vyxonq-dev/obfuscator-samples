local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Shadow Hub | V1", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
--Tabs

local Tab = Window:MakeTab({
	Name = "Brookhaven RP",
	Icon = "rbxassetid://10723407389",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Blox Fruits",
	Icon = "rbxassetid://10734922497",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Blade Ball",
	Icon = "rbxassetid://10709775448",
	PremiumOnly = false
})

local Tab4 = Window:MakeTab({
	Name = "Pet Simulator 99",
	Icon = "rbxassetid://10723345518",
	PremiumOnly = false
})

local Tab5 = Window:MakeTab({
	Name = "Prison Life",
	Icon = "rbxassetid://10709762327",
	PremiumOnly = false
})

local Tab6 = Window:MakeTab({
	Name = "Natural Disaster",
	Icon = "rbxassetid://10723407389",
	PremiumOnly = false
})

--Sections

local Section = Tab:AddSection({
	Name = "Brookhaven RP | Scripts"
})

local Section = Tab2:AddSection({
	Name = "Blox Fruits | Scripts"
})

local Section = Tab3:AddSection({
	Name = "Blade Ball | Scripts"
})

local Section = Tab4:AddSection({
	Name = "Pet Simulator | Scripts"
})

local Section = Tab5:AddSection({
	Name = "Prison Life | Scripts"
})

local Section = Tab6:AddSection({
	Name = "Natural Disaster | Scripts"
})

--Buttons

Tab:AddButton({
	Name = "Brookhaven Script 1",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMae17/NewIceHub/main/Brookhaven"))()
      		print("button pressed")
  	end    
})

Tab:AddButton({
	Name = "Brookhaven Script 2",
	Callback = function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/rbIxscriptsnet/unfair/main/rblxhub.lua'),true))()
      		print("button pressed")
  	end    
})

Tab:AddButton({
	Name = "Brookhaven Script 3",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mikeexc/Mikeexc-Chathax/main/ChatHax", true))()
      		print("button pressed")
  	end    
})

Tab:AddButton({
	Name = "Brookhaven Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/kH7s56KG"))()
      		print("button pressed")
  	end    
})

--Buttons Blox Fruits

Tab2:AddButton({
	Name = "Blox Fruits Script 1",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptsExploit/Blox-Fruits/main/Ripper%20Hub"))()
      		print("button pressed")
  	end    
})

Tab2:AddButton({
	Name = "Blox Fruits Script 2",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/123coconut123/BloxFruits/main/Script"))()
      		print("button pressed")
  	end    
})

Tab2:AddButton({
	Name = "Blox Fruits Script 3",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptsExploit/Blox-Fruits/main/Protected_8721220216274667.lua.txt"))()
      		print("button pressed")
  	end    
})

Tab2:AddButton({
	Name = "Blox Fruits Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptsExploit/Blox-Fruits/main/Royx"))()
      		print("button pressed")
  	end    
})

Tab2:AddButton({
	Name = "Blox Fruits Script 5",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Dragon-Hub/main/Script-Execute.lua"))()
      		print("button pressed")
  	end    
})

--Buttons blade ball

Tab3:AddButton({
	Name = "Blade Ball Script 1",
	Callback = function()
	loadstring(game:HttpGet('https://pastebin.com/raw/2s02Gstm'))()
      		print("button pressed")
  	end    
})

Tab3:AddButton({
	Name = "Blade Ball Script 2",
	Callback = function()
	
      		print("button pressed")
  	end    
})

Tab3:AddButton({
	Name = "Blade Ball Script 3",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/luaDeveloper1007/robloxScripts/main/hyperHub-Obfuscated"))()
      		print("button pressed")
  	end    
})

Tab3:AddButton({
	Name = "Blade Ball Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/dakiiuem/BladeBall/main/DakiiBladeBall", true))()
      		print("button pressed")
  	end    
})

--Pet Simulator

Tab4:AddButton({
	Name = "Pet Simulator Script 1",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BludnyHolandan/DaveHub/main/PetSim99/Hub.lua"))()
      		print("button pressed")
  	end    
})

--Prison Life

Tab5:AddButton({
	Name = "Prison Life Script 1",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaohubPrisonLife"))()
      		print("button pressed")
  	end    
})

Tab5:AddButton({
	Name = "Prison Life Script 2",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/Tigeradmin"))()
      		print("button pressed")
  	end    
})

--Natural Disaster Scripts

Tab6:AddButton({
	Name = "Natural Disaster Script 1",
	Callback = function()
	loadstring(game:HttpGet"https://raw.githubusercontent.com/ySixxNz/Natural-Desastre/SIX-MENU/SIX-HUB-NATURAL-DESASTRE")()
      		print("button pressed")
  	end    
})

Tab6:AddButton({
	Name = "Natural Disaster Script 2",
	Callback = function()
	local c = "K3Ep6gX2/raw"
loadstring(game:HttpGet(('https://pastefy.app/'..c),true))()
      		print("button pressed")
  	end    
})

Tab6:AddButton({
	Name = "Natural Disaster Script 2",
	Callback = function()
	loadstring(game:HttpGet('https://weinzspace.com/cata/hub.lua'))()
      		print("button pressed")
  	end    
})

Tab6:AddButton({
	Name = "Natural Disaster Script 2",
	Callback = function()
	
      		print("button pressed")
  	end    
})

Tab6:AddButton({
	Name = "Natural Disaster Script 2",
	Callback = function()
	
      		print("button pressed")
  	end    
})
