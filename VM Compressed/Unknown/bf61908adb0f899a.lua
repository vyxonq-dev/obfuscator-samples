local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/SheepCounting/main/refs/heads/main/list"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/SheepCounting/main/refs/heads/main/wh.lua"))()

local matched = false
for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
        matched = true
        break
    end
end

if not matched then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SheepCounting/main/refs/heads/main/uni"))()
end
