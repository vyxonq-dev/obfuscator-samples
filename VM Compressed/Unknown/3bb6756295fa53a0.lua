local Scripts = {
    -- Restaurant Tycoon 3
    [119048529960596] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/RT3.lua",
    [99889627739043]  = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/RT3.lua",

    -- Break your Bones
    [123821081589134] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/ByB.lua",

    -- Expedition Antarctica
    [2693023319] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/Expedition-Antarctica.lua",

    -- Raft Tycoon
    [76137189788863] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/RT.lua",

    -- The Dropper
    [166731267]  = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/TD.lua",
    [5187473975] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/TD.lua",
    [5187824911] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/TD.lua",

    -- Humanlife 3: Civilization
    [133115820245903] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/Humanlife3-Civilization.lua",

    -- No Jumping Obby
    [17321628486] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/No-Jumping-Obby.lua",

    -- Secure the Airport
    [102054284786904] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/STA.lua",
    [110371745562456] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/STA.lua",
    [138145699008779] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/STA.lua",

    -- Elemental Powers Tycoon
    [10253248401] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/EPT.lua",
}
local Scripturl = Scripts[game.PlaceId]
if Scripturl then
    loadstring(game:HttpGet(Scripturl))()
else
    setclipboard('https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/Supported-Games')
    game.Players.LocalPlayer:Kick("Samuraa1 Hub | This game is not supported. Copied to clipboard link with supported games")
end
