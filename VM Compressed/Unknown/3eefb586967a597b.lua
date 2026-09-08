local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "jjp fake sols", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://10814531078",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Auras"
})

Tab:AddButton({
	Name = "Developer or gamepass auras",
	Callback = function()
      		
local player = game.Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")


local developerAurasFrame = playerGui:WaitForChild("Main"):WaitForChild("DeveloperAuras")


developerAurasFrame.Visible = true
  	end    
})

Tab:AddButton({
	Name = "Rainbow auras",
	Callback = function()

local player = game.Players.LocalPlayer


local playerGui = player:WaitForChild("PlayerGui")


local RainbowAurasFrame = playerGui:WaitForChild("Main"):WaitForChild("RainbowAuras")


RainbowAurasFrame.Visible = true
  	end    
})



