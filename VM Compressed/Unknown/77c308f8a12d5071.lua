local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
 
local Window = Library.CreateLib("free gamepass characters script", "DarkTheme")
 
local Tab = Window:NewTab("free gamepass characters script")
local Section = Tab:NewSection("free characters script")
 
Section:NewButton("Unlock gamepass all characters", "ButtonInfo", function()
   if game.CreatorType == Enum.CreatorType.User then
game.Players.LocalPlayer.UserId = game.CreatorId
end
if game.CreatorType == Enum.CreatorType.Group then
game.Players.LocalPlayer.UserId = game:GetService("GroupService"):GetGroupInfoAsync(game.CreatorId).Owner.Id
end
end)


Section:NewButton("Spawn as TitanCameraman", "ButtonInfo", function()
local args = {
    [1] = game:GetService("ReplicatedStorage").CameramenTeam:FindFirstChild("Cameraman Titan"),
    [2] = 193789416
}

game:GetService("ReplicatedStorage").Remote.Morph:FireServer(unpack(args))

end)



Section:NewButton("Spawn as TitanSpeakerman", "ButtonInfo", function()
local args = {
    [1] = game:GetService("ReplicatedStorage").CameramenTeam:FindFirstChild("Speakerman Titan"),
    [2] = 193789416
}

game:GetService("ReplicatedStorage").Remote.Morph:FireServer(unpack(args))

end)


Section:NewButton("Spawn as Titan TVMan", "ButtonInfo", function()
local args = {
    [1] = game:GetService("ReplicatedStorage").CameramenTeam:FindFirstChild("TVman Titan"),
    [2] = 193789416
}

game:GetService("ReplicatedStorage").Remote.Morph:FireServer(unpack(args))

end)

Section:NewButton("Infected Speakerman Titan", "ButtonInfo", function()
    local A_1 = game:GetService("ReplicatedStorage")["Infected Speakerman Titan"]
    local Event = game:GetService("ReplicatedStorage").Remote.CharacterValueChange
    Event:FireServer(A_1)
end)
