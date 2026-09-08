---Ghost Gui UI Library
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/UI-Library/refs/heads/main/Ghost%20Gui'))()
game.CoreGui.GhostGui.MainFrame.Title.Text = "My Bluelock Game"
---
 
 
AddContent("TextButton", "Isagi Trap", [[
game:GetService("ReplicatedStorage").SKILLS_USE_EVENT:FireServer(table.unpack({
    [1] = "Metavision Trap",
    [2] = 3,
}))
]])

AddContent("TextButton", "Raumdeuter", [[
game:GetService("ReplicatedStorage").SKILLS_USE_EVENT:FireServer(table.unpack({
    [1] = "Raumdeuter",
    [2] = 2,
}))
]])

AddContent("TextButton", "Neo Direct Shot", [[
game:GetService("ReplicatedStorage").SKILLS_USE_EVENT:FireServer(table.unpack({
    [1] = "Neo Direct Shot",
    [2] = 1,
}))
]])

AddContent("TextButton", "Guns Rebirth", [[
game:GetService("ReplicatedStorage").SKILLS_USE_EVENT:FireServer(table.unpack({
    [1] = "Guns Rebirth",
    [2] = 4,
}))
]])
