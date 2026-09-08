local hubgames = {
    ["GrowaGarden"] = {126884695634066},
    ["SpellingBee"] = {17590362521, 83091000527113, 17707569217, 91692552632068, 133419989757748, 70718852079605, 115840692772844, 135159688166294},
    ["SpellingBeeNerdZone"] = {74779072921656},
    ["MathMurder"] = {127707120843339},
}

for url, ids in pairs(hubgames) do
    for _, id in ipairs(ids) do
        if game.PlaceId == id then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/PreppyHub/PreppyHub/refs/heads/main/Scripts/" .. url))()
            break
        end
    end
end
