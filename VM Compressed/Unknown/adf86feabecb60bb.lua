local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "J HUB (KEY SYSTEM)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "J HUB"})


local Player = game.Players.LocalPlayer

OrionLib:MakeNotification({
    Name = "my broke ahh",
    Content = "dont bypass i need money🤑",
    Image = "",
    Time = 10
})

--Values
_G.Key = "key_lol89857139OBhgAlyzYdaevxjctGp"
_G.KeyInput = "string"


local function Destroy()
    game.GetService("CoreGui").OrionLib:Destroy()
end

local function MainScript()
loadstring(game:HttpGet("https://pastebin.com/raw/cu8kCG0a"))()
end

local Tab = Window:MakeTab({
    Name = "Home",
    Icon = "null",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "Enter Key Here",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        _G.KeyInput = Value
    end
})

Tab:AddButton({
    Name = "Check Key",
    Callback = function()
        if _G.KeyInput == _G.Key then
            MainScript()
            Destroy()
        end
    end
})

Tab:AddTextbox({
	Name = "DISCORD(key)",
	Default = "https://discord.gg/kByAj5ED",
	TextDisappear = true,
	Callback = function(Value)
		print("JOIN")
	end	  
})
