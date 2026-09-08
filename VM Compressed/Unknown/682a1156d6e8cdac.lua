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

    -- Maze Simulator
    [109644231059364] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/Maze-Simulator.lua",

    -- IQ Test
    [11782774748]     = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/IQ-Test.lua",
    [14692578554]     = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/IQ-Test.lua",
    [102032333476768] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/IQ-Test.lua",

    -- No Jumping Obby
    [17321628486] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/No-Jumping-Obby.lua",

    -- The $1,000,000 Glass Bridge
    [87854376962069] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/The1000000GlassBridge.lua",

    -- Mega Princess Tycoon
    [14448027693] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/MPT.lua",
    [15247657190] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/MPT.lua",
    [18281211268] = "https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/MPT.lua",
}

local ScriptURL = Scripts[game.PlaceId]
if ScriptURL then
    loadstring(game:HttpGet(ScriptURL))()
else
    setclipboard('https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/Supported-Games')
    game.Players.LocalPlayer:Kick("Samuraa1 Hub | This game is not supported. Copied to clipboard link with supported games")
end
