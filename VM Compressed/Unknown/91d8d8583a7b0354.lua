if getgenv().SCRIPT_KEY == nil or getgenv().SCRIPT_KEY == "" then
    getgenv().SCRIPT_KEY = "KEYLESS"
end

loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/52d7bb3829a25a2f9b476d1eb84c8d1d4271fda532b61574b926dd7cd2e9d3e9/download"))()
