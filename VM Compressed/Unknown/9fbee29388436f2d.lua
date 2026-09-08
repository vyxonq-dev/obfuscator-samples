---Ghost Gui UI Library
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/UI-Library/refs/heads/main/Ghost%20Gui'))()
game.CoreGui.GhostGui.MainFrame.Title.Text = "WinX HUB"
---

AddContent("Toogle", "Farm money inf", [[
local args = {
    game:GetService("Workspace").Chest.Claim.ProximityPrompt
}
game:GetService("ReplicatedStorage").Remotes.ClaimMoney:FireServer(unpack(args))
]])

TextLabel = AddContent("TextLabel")
TextLabel.Text = "WinX HUB"
