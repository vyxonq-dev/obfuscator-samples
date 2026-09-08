local cachebust = tostring(math.random(0, 100000))
if game.PlaceId == 6403373529 then
    local url = "https://raw.githubusercontent.com/Ekanite-a/Scripts/refs/heads/main/Slap%20battles/mastery.lua?cachebust=" .. cachebust
    if request then
        loadstring(request({Url = url}).Body)()
    else
        loadstring(game:HttpGet(url))()
    end
end