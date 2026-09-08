local currentPlaceId = game.PlaceId
local placeScripts = {
    [105241313130846] = "https://api.jnkie.com/api/v1/luascripts/public/5480d17e9691d8b77b2269da5eca6dde97360c40004b110e8abc661aab5a1554/download",
    [301549746] = "https://api.jnkie.com/api/v1/luascripts/public/9a9b6fde8596f5f9108daee2f0dcf4ebc003cf4b63bf87523443fe5dcf518d4f/download",
    [109397169461300] = "https://api.jnkie.com/api/v1/luascripts/public/936e30bf79fb077eab37f33d406980a657c2399ec68129ed03096718f44d3cf2/download"
}

local scriptUrl = placeScripts[currentPlaceId]

if scriptUrl then
    pcall(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
end
