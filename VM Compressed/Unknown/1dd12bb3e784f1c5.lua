--loadstring is here  https://pastebin.com/kAJpt0uJ
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--functions
function jhub()
loadstring(game:HttpGet("https://pastebin.com/raw/Hev2SYhf"))()
end

function jhub2()
loadstring(game:HttpGet("https://pastebin.com/raw/C3xVH1zc"))()
end

local Window = OrionLib:MakeWindow({Name = "J-HUB LOADER", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest",IntroText = "J HUB"})

local Tab = Window:MakeTab({
	Name = "J-HUB",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddButton({
	Name = "LOAD J HUB FREE VERSION",
	Callback = function()
      		jhub()
  	end    
})

Tab:AddButton({
	Name = "LOAD J HUB KEY VERSION",
	Callback = function()
      		jhub2()
  	end    
})

Tab:AddParagraph("DISCORD","join the discord for updates and suggestions")

Tab:AddTextbox({
	Name = "join the discord",
	Default = "https://discord.gg/kByAj5ED",
	TextDisappear = false,
	Callback = function(Value)
		print(O)
	end	  
})