local games = {
    [126244816328678] = "https://raw.githubusercontent.com/MajestySkie/DIG/refs/heads/main/DigDigDig.lua",
    [129827112113663] = "https://raw.githubusercontent.com/MajestySkie/Prospecting/refs/heads/main/Prscting.lua",
    [123921593837160] = "https://raw.githubusercontent.com/MajestySkie/Climb-And-Jump/refs/heads/main/Main.lua",
    [102499196000712] = "https://raw.githubusercontent.com/MajestySkie/Climb-And-Jump/refs/heads/main/Main.lua",
    [121864768012064] = "https://raw.githubusercontent.com/MajestySkie/Fish-It/refs/heads/main/Memancing.lua",
    [97777561575736] = "https://raw.githubusercontent.com/MajestySkie/KayakRacing/refs/heads/main/Sigma.lua",
    [86076978383613] = "https://raw.githubusercontent.com/MajestySkie/Zombie-Killer/refs/heads/main/Chx.lua",
    [103754275310547] = "https://raw.githubusercontent.com/MajestySkie/Zombie-Killer/refs/heads/main/Chx.lua",
    [134236244017051] = "https://raw.githubusercontent.com/MajestySkie/ClimbSlider/refs/heads/main/cas.lua",

}

local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else
    game.Players.LocalPlayer:Kick("Yo! This game ain't on the list.\nCheck the Discord for whitelisted games, homie.")
end

