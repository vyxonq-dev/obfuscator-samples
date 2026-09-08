repeat task.wait() until game:isLoaded()

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()
local RunService = game:GetService("RunService")

local window = Rayfield:CreateWindow({
    name = "Youtube Simulator Z",
    subtitle = "Made by Geonix",
})

local tab = window:CreateTab({ name = "Main", icon = 93364949241311 })

local autoPressConnection

tab:CreateToggle({
    name = "Auto Press E",
    callback = function(value)
        if value then
            autoPressConnection = RunService.Heartbeat:Connect(function()
                keytap(0x45)
            end)
        else
            if autoPressConnection then
                autoPressConnection:Disconnect()
                autoPressConnection = nil
            end
        end
    end,
})

tab:CreateButton({
    name = "Inf SD",
    description = "Use Internet Stick if you want to upload videos, otherwise it's visual",
    callback = function()
        while true do
            if wait() then
                game.Players.LocalPlayer.MaxSD.Value = 1E+40
                game.Players.LocalPlayer.SD.Value = 1E+40
                wait()
                game.Players.LocalPlayer.MaxSD2.Value = 1E+40
                game.Players.LocalPlayer.SD2.Value = 1E+40
                wait()
                game.Players.LocalPlayer.MaxSD3.Value = 1E+40
                game.Players.LocalPlayer.SD3.Value = 1E+40
                wait()
                game.Players.LocalPlayer.MaxSD4.Value = 1E+40
                game.Players.LocalPlayer.SD4.Value = 1E+40
                wait()
                game.Players.LocalPlayer.MaxSD5.Value = 1E+40
                game.Players.LocalPlayer.SD5.Value = 1E+40
                wait()
            end
        end
    end,
})

window:Notify({
    title = "Script Loaded",
    content = "YTZ Script Loaded (dead game ik)",
    duration = 5,
})
