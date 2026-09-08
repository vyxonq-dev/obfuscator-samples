if game.PlaceId == 3431407618 then
    return loadstring(request({Url="https://lunar-rest-api.vercel.app/script/Isle10",Method="GET"}).Body)()
else
   getgenv().SCRIPT_KEY = ""
   return loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/441457bbbb948e52667ad5bbc45b77324023cf493ef13aa448b758022e06d480/download"))()
end
