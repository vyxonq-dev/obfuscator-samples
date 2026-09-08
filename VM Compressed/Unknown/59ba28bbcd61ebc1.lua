-- X Script
-- A clean GUI library implementation

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("X Script")

local main = w:CreateFolder("free pass")

main:Label("X free gamepass",{
    TextSize = 25;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})

main:Button("free gamepass",function()
    if game.CreatorType == Enum.CreatorType.User then
        game.Players.LocalPlayer.UserId = game.CreatorId
    end
    if game.CreatorType == Enum.CreatorType.Group then
        game.Players.LocalPlayer.UserId = game:GetService("GroupService"):GetGroupInfoAsync(game.CreatorId).Owner.Id
    end
end)

main:DestroyGui()
