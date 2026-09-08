local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Get Script", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Script",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "How To:"
})

Tab:AddLabel("https://discord.gg/skXhHGwm")

Tab:AddButton({
	Name = "Join Discord to get Script!",
	Callback = function()
	setclipboard("https://discord.gg/skXhHGwm")
      		OrionLib:MakeNotification({
	Name = "Title!",
	Content = "Copied Discrod To Clipboard!",
	Image = "rbxassetid://4483345998",
	Time = 20
})
  	end    
})
