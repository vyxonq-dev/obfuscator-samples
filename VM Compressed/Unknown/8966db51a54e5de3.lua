repeat task.wait(.12345) until game:IsLoaded()



local module = loadstring(game:HttpGet('https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/BananaHubKeyLoader.lua'))()
module:SetSavedKeyFile("BananaHub"..game.gameId..game.Players.LocalPlayer.UserId)
script_key = module:GetKeyInput("discord.gg/BananaHub", "https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/HowToFreeKey.txt", function(key)
    return key == "BananaHello"
end)
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/180154ec7abc246752b60603a7adc12d.lua"))()





--[[
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/customLua/main/SimpleUiLib.lua"))()
ui.CreateBHUBPAID("")

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
]]



--loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/180154ec7abc246752b60603a7adc12d.lua"))()
