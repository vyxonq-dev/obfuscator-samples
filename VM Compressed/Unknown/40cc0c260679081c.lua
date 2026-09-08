--setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)) --หา x y z

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Roblox Innovation Awards Voting Hub", "Midnight")

local Tab = Window:NewTab("Free event items")
local Section = Tab:NewSection("Free items")
Section:NewButton("Valk", "Teleport to valk", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(96, 168, -152)
end)
Section:NewButton("Auto vote", "vote", function()
    local args = {
    [1] = {
        ["Best Content Update"] = "Tower Defense Simulator - Live Update Events",
        ["People's Choice"] = "Pet Sim X",
        ["Best Use of Avatar Fashion"] = "World // Zero",
        ["Video Star of the Year"] = "Flamingo"
    },
    [2] = workspace.VotingScreen
}

game:GetService("ReplicatedStorage").Events.RemoteEvents.Vote:FireServer(unpack(args))
end)
Section:NewButton("Top hat", "free top hat", function()
    local playerPart = game.Players.LocalPlayer.Character.Head

while wait() do
for i, v in pairs(game:GetService("Workspace").CubePieces:GetDescendants()) do
    if v.Name == "TouchInterest" and v.Parent then
        firetouchinterest(playerPart, v.Parent, 0)
        wait(0.1)
        firetouchinterest(playerPart, v.Parent, 1)
        end
end
end
end)
Section:NewButton("Tp to stand", "tp", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(22, 23, -131)
end)
Section:NewButton("rejoin to get item", "rejoin", function()
    game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService'Players'.LocalPlayer)
end)
Section:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.F, function()
    Library:ToggleUI()
end)
