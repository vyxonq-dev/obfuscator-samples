getgenv()._logs = {}
game:GetService("LogService").MessageOut:Connect(function(msg, messageType)
    table.insert(getgenv()._logs, "[" .. tostring(messageType) .. "] " .. msg)
end)
local s= loadstring(game:HttpGet("https://raw.githubusercontent.com/TeamUBHub/UBLoader/refs/heads/main/index/Games.lua"))()[game.GameId] or "https://raw.githubusercontent.com/TeamUBHub/Script-Roblox/refs/heads/main/UniversalScript.lua"
loadstring(game:HttpGet(s))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/Library/JoinUI.lua"))()
