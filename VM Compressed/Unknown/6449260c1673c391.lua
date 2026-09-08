if not game:IsLoaded() then
    game.Loaded:Wait()
end
local universeid = game.GameId
local supportedgames = {
    [8795154789] = "https://ads.luasec.cc/init?script=Jf1ZZcmlcp0bC8IBGkeb",
    [4348829796] = "https://ads.luasec.cc/init?script=9bFKZ5gawjUxk7EPkTJP",
    [7058980030] = "https://ads.luasec.cc/init?script=SG8IhgGVwkH32pdUXBJo",
    [7436755782] = "https://ads.luasec.cc/init?script=eHw6e2r7gWPZ4DhNENgK",
    [7671049560] = "https://ads.luasec.cc/init?script=w6VhSHJEFfYhx3LW7cA4",
    [9269396402] = "https://ads.luasec.cc/init?script=OFQ4ZfzSGBYWZnGbI0Be"
}

if supportedgames[universeid] then
    loadstring(game:HttpGet(supportedgames[universeid]))()
else
    game.Players.LocalPlayer:Kick("Unsupported Game!")
end
