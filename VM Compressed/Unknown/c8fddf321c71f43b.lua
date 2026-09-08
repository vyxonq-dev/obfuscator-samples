local h = loadstring(game:HttpGet("https://raw.githubusercontent.com/imnotnowy/obsireworked/refs/heads/main/Library.lua"))()
if game.PlaceId == 71895508397153 then
    h:Notify({Title = "Loading.", Description = "game: die of death", Time = 5})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/imnotnowy/Lumina/refs/heads/main/Main/Scripts/DieOfDeath.lua"))()
else
    h:Notify({Title = "Error.", Description = "game not supported!", Time = 5})
end
