repeat
    task.wait(0.25)
until game:IsLoaded()

local PlaceId = game.PlaceId

-- +1 Speed Monkey Escape
if PlaceId == 114697347887839 then
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/ZaRdoOx/Speed-monkey/main/%2B1_Speed_Monkey-Escape-obfuscated.lua"
    ))()

-- next Game
elseif PlaceId == 123456789 then
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/ZaRdoOx/"
    ))()

else
    warn("Fazium.xyz | Unsupported game.")
end
