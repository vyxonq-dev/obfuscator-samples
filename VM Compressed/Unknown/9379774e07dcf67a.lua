local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/azpzakking/wwwwhat/refs/heads/main/Ringta/GameId"))()

local URL = Games[game.PlaceId]

if URL then
  loadstring(game:HttpGet(URL))()
else
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
	Title = "Ringta Hub",
	Text = "Enter the correct game to execute it!",
	Duration = 5, -- Seconds
})

end
