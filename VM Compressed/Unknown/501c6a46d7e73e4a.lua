repeat task.wait(.12345) until game:IsLoaded()

--[[
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/BananaHubKeyLoaderV2.lua"))()
module:SetSavedKeyFile("BananaHub"..game.gameId..game.Players.LocalPlayer.UserId)
script_key = module:GetKeyInput("discord.gg/BananaHub", "https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/HowToFreeKey.txt", function(key)
    api.script_id = "180154ec7abc246752b60603a7adc12d"
    local status;
    pcall(function()
        status = api.check_key(key)
    end)
    return status and status.code == "KEY_VALID"
end)
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/180154ec7abc246752b60603a7adc12d.lua"))()
]]

--[[
local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/BananaHubKeyLoaderV2.lua"))()
module:SetSavedKeyFile("BananaHub"..game.gameId..game.Players.LocalPlayer.UserId)
script_key = module:GetKeyInput("discord.gg/BananaHub", "https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/HowToFreeKey.txt", function(key)
	key = key:gsub(" ", "")
	key = key:lower()
	return key == "banana"
end)
]]
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/180154ec7abc246752b60603a7adc12d.lua"))()


--[[
local simpleLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/SimpleUILibV2.lua"))()
simpleLib.CreateBHUBPAID()
]]

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    task.wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

task.spawn(function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local X, Y = 111, 960
    while task.wait() do
        --VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1)
        --VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1)
        VirtualInputManager:SendKeyEvent(true, "Space", false, game)
        task.wait(.2)
        VirtualInputManager:SendKeyEvent(false, "Space", false, game)
        task.wait(600)
    end
end)


--loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/180154ec7abc246752b60603a7adc12d.lua"))()
