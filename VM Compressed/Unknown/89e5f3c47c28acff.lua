local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "1humano Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]
local Tab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
OrionLib:MakeNotification({
	Name = "Welcome",
	Content = "Welcome to 1humano Hub ",
	Image = "rbxassetid://4483345998",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]
Tab:AddParagraph("Owner","1humano")
Tab:AddParagraph("Script manager","Yallto_weak")
local Tab = Window:MakeTab({
	Name = "Auto win",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
local Section = Tab:AddSection({
	Name = "Red light green light"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "TP to Finish line",
	Callback = function()
      		local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
rootPart.CFrame = workspace.Map.RedLightGreenLight.Map.Girl.Body.HumanoidRootPart.CFrame
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Section = Tab:AddSection({
	Name = "Honey Comb"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "Auto win Honey Comb",
	Callback = function()
      		print("button pressed")
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Section = Tab:AddSection({
	Name = "Circle game"

})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "Skip Circle Game",
	Callback = function()
      		local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
rootPart.CFrame = workspace.Map.Pentathlon.School:GetChildren()[17] .CFrame
  	end    
})
local Section = Tab:AddSection({
	Name = "Door Game"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "Door Auto win",
	Callback = function()
      		print("button pressed")
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
OrionLib:Init()