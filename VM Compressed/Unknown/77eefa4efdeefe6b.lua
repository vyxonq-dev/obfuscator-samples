getgenv().Discord = "discord.gg/Q8uR3xJs7S"

local User, Repo, Folder = "uzu01", "public", "games"
local ScriptFormat = "https://raw.githubusercontent.com/%s/%s/main/%s/%s/script.lua"

local GameTable = {
    [10723695195] = "aes",
    [10364927844] = "efs",
    [9625096419] = "ts",
    [10404327868] = "tc",
    [10631384212] = "thi",
    [1659645941] = "i",
    [11040063484] = "sfs",
    [11827760850] = "pcs",
}

local IsSupported = GameTable[game.PlaceId] or GameTable[game.GameId]

if not IsSupported then return end
if not game.Loaded then game.Loaded:Wait() end

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:ClickButton2(Vector2.new(0,0))
end)

loadstring(game:HttpGet(ScriptFormat:format(User, Repo, Folder, IsSupported)))()
