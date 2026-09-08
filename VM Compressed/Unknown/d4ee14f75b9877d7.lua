if script_key then
	writefile("PillowKey.txt", script_key)
end
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
if not isfile("PillowKey.txt") then
	writefile("PillowKey.txt", "")
end
key = readfile("PillowKey.txt")
local isSupport = nil
local GameList = {
	[7094518649] = "0b6b763631ff4ac3f6e91e3187766673" ---Restaurant Tycoon 3
}
for id, scriptid in pairs(GameList) do
	if id == game.GameId then
		isSupport = scriptid
	end
end
api.script_id = isSupport
getgenv().script_key = key
status = api.check_key(key)
print(status.code)
if status.code == "KEY_VALID" then
	api.load_script()
else
    if not getgenv().HubEnabled then
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/Sleep-Pillow/Hub/refs/heads/main/library"))()
    end
    Notification(1, status.code, "Please contact the Admin.", 10)
end
