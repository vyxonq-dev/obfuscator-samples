local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local function notify(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

notify("Hello, "..LocalPlayer.Name.."!", "Made by LOLGETREKT", 5)
task.wait(1)
notify("By the way:", "If your executor dont suport this reanimation try other Server Admin.", 7)

task.wait(2)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Reanimate.lua"))()
task.wait(6.25)

local general = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
if general then
    general:SendAsync("-rs")
end

task.wait(1)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Reanimate.lua"))()
task.wait(6.25)

if general then
    general:SendAsync("-net")
end

REANIMATION = false
task.wait(1)

loadstring(game:HttpGet("https://pastebin.com/raw/vVdWpnvU"))()