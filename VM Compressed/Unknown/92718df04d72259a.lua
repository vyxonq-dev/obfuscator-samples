if getgenv().AlrectLoaded then return end
getgenv().AlrectLoaded = true

local URL = "https://prri-v14.vercel.app/lua/8f52fbb9e0902a389560f691"

loadstring(game:HttpGet(URL))()
