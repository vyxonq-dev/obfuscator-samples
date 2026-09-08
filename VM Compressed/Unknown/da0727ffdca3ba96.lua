local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Bennett Scripts | Evermoon 2", "GrapeTheme")

local Bennett = Window:NewTab("Change Values")
local BennettSection = Bennett:NewSection("")

BennettSection:NewButton("Change Level Value to 100000", " ", function()

    game.Players.LocalPlayer.Leaderstats.Level.Value = 100000

end)

BennettSection:NewButton("Change Exp Value to 100000", " ", function()

    game.Players.LocalPlayer.Leaderstats.Exp.Value = 100000

end)

BennettSection:NewButton("Change Skill Points Value to 100000", " ", function()

    game.Players.LocalPlayer.Leaderstats.SkillPoints.Value = 100000

end)

local Bennett = Window:NewTab("Admin")
local BennettSection = Bennett:NewSection("")
BennettSection:NewButton("Infinite Yield", "", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Omg562/Scripts/main/INF'),true))()
end)

local Tab = Window:NewTab("Credits")
local SettingsSection = Tab:NewSection("Script is in beta")
local SettingsSection = Tab:NewSection("discord: bennettscripts")
local SettingsSection = Tab:NewSection("Toggle UI")
SettingsSection:NewKeybind("Toggle UI", "Toggle UI", Enum.KeyCode.M, function()
    Library:ToggleUI()
end)
wait(1)
game.StarterGui:SetCore("SendNotification", { 
    Title = "⛤ Bennett Scripts ⛤";
    Text = "Evermoon 2";
    Icon = "rbxthumb://type=Asset&id=14067496704&w=150&h=150";
    Duration = "2";
    Button1 = "Close";
})