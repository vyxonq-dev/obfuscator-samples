local g = game.PlaceId
local n = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()
local a = function(a)
   n:SendNotification("Warn Hub",a,10)
end
local b = function(a)
    loadstring(game:HttpGet(a))()
end
if g == 16732694052 then
    a("Loading Fisch Script!")
    b("https://WarnHub.github.io/fisch")
else
    a("This Game isn't Supported!")   
end
