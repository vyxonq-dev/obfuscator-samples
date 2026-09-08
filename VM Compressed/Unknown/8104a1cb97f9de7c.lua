local placeId = game.PlaceId
local GameScripts = {
    [107326628277908] = "https://hyperxgroup.vercel.app/scripts/beacar.lua", 
    [140374914197602] = "https://hyperxgroup.vercel.app/scripts/speedclicker.lua",
}

if GameScripts[placeId] then
    loadstring(game:HttpGet(GameScripts[placeId], true))()
else
    loadstring(game:HttpGet("https://hyperxgroup.vercel.app/scripts/universal.lua"))()
    local supported = {
        "- Be a Car",
        "- Speed Clicker"
    }
    local message = "❌ Unsupported game.\n\n✅ Supported Games:\n" .. table.concat(supported, "\n")
    print(message)
end
