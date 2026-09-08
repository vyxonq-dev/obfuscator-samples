local url = "https://raw.githubusercontent.com/ljashub/bloxstrike-beta/main/EzyCheatRivals.lua"
if queue_on_teleport then
    queue_on_teleport("loadstring(game:HttpGet('" .. url .. "'))()")
end
loadstring(game:HttpGet(url))()
