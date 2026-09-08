local gameScripts = {
    [3956818381] = "https://raw.githubusercontent.com/qdftt/DMONRBX/refs/heads/main/Games/ninja%20legends.lua",
    [3101667897] = "https://raw.githubusercontent.com/qdftt/DMONRBX/refs/heads/main/Games/legends%20of%20speed.lua",
    [286090429] = "https://raw.githubusercontent.com/qdftt/DMONRBX/refs/heads/main/Games/arsenal.lua",
    [108368760436337] = "https://raw.githubusercontent.com/qdftt/DMONRBX/refs/heads/main/Games/red%20vs%20blue.lua",
}

local scriptUrl = gameScripts[game.PlaceId] or "https://raw.githubusercontent.com/qdftt/DMONRBX/refs/heads/main/Games/universal.lua"
loadstring(game:HttpGet(scriptUrl))()
