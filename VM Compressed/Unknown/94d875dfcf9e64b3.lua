local scripts = {
    [2693023319] = "1",
    [10903978962] = "2",
    [2561448528] = "3",
    [14098633214] = "4",
    [10758955211] = "5",
    [9534337535] = "6",
    [11216791462] = "7",
    [8122612051] = "8",
    [12707995805] = "9",
    [13837271950] = "11"
}

local id = scripts[game.PlaceId]

if id then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tamachiru/AppleX/main/" .. id))()
else
    warn("❌ Jeu non supporté par AppleX.")
end
