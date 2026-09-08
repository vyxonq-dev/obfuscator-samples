repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.PlayerGui
local Url = "https://raw.githubusercontent.com/Yummy-1z/Yum-Hub/refs/heads/main/Charts/"
local Charts = {
    -- [ Speed Piece ] --
    [74193535211122] = "Speed-Piece.lua",
    [77167260540689] = "Speed-Piece.lua", -- [ Dungeon ]
    -- [ Lucky Blocks Battlegrounds ] --
    [662417684] = "LUCKY-BLOCKS.lua",
}

for PlaceId, Chart in pairs(Charts) do
    if PlaceId == game.PlaceId or PlaceId == game.GameId then
        loadstring(game:HttpGet(Url .. Chart))()
    end
end

game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
