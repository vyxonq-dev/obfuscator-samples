_Hawk = "ohhahtuhthttouttpwuttuaunbotwo"
local Hawk = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHanki/HawkHUB/main/LibSources/HawkLib.lua", true))()
local Window = Hawk:Window({
	ScriptName = "[FREE✨] Open For Free!🤑‘ {Yin Hub}",
	DestroyIfExists = true, --if false, gui wont disappear
	Theme = "Dark" --Themes: Pink, White, Dark
})
Window:Close({
	visibility = true, --if false, close button will disappear
	Callback = function()
		Window:Destroy() --Destroying Gui Function
	end,
})
Window:Minimize({
	visibility = true, --if false, close button will disappear
	OpenButton = true, -- Visible = false etc, open button.
	Callback = function()
	end,
})

local tab1 = Window:Tab("Spins🎡")
local newsec1 = tab1:Section("INF SPIN")
local button = newsec1:Button("+100K Spins","Click +100K Spin!",function()
local args = {
    [1] = "Spins",
    [2] = 100000
}
 
game:GetService("ReplicatedStorage").Events.PlayTimeGifts:FireServer(unpack(args))
end)

local button = newsec1:Button("+100M Spins","Click +100M Spin!",function()
local args = {
    [1] = "Spins",
    [2] = 100000000
}
 
game:GetService("ReplicatedStorage").Events.PlayTimeGifts:FireServer(unpack(args))
end)

local button = newsec1:Button("+100B Spins","Click +100B Spin!",function()
local args = {
    [1] = "Spins",
    [2] = 100000000000
}
 
game:GetService("ReplicatedStorage").Events.PlayTimeGifts:FireServer(unpack(args))
end)

local button = newsec1:Button("+100T Spins","Click +100T Spin!",function()
local args = {
    [1] = "Spins",
    [2] = 100000000000000
}
 
game:GetService("ReplicatedStorage").Events.PlayTimeGifts:FireServer(unpack(args))
end)

local tab2 = Window:Tab("Credits💳")
local newsec2 = tab2:Section("INF CREDIT")
local button = newsec2:Button("+100K Credits","Click +100K Credit!",function()
local args = {
    [1] = "100000",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").Events.Spin:FireServer(unpack(args))
end)
local button = newsec2:Button("+100M Credits","Click +100M Credit!",function()
local args = {
    [1] = "100000000",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").Events.Spin:FireServer(unpack(args))
end)

local button = newsec2:Button("+100B Credits","Click +100B Credit!",function()
local args = {
    [1] = "100000000000",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").Events.Spin:FireServer(unpack(args))
end)

local button = newsec2:Button("+100T Credits","Click +100T Credit!",function()
local args = {
    [1] = "100000000000000",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").Events.Spin:FireServer(unpack(args))
end)