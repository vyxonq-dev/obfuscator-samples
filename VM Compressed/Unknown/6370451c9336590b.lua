-- This is very pro loader

local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

local Found = false
local Url = ""

local Games = {
    [83312952548612] = "https://pastebin.com/raw/DzfHZyQ7",
    [155615604] = "https://pastebin.com/raw/vhYX1cDq",
    [189707] = "https://pastebin.com/raw/UzMHfnkt"
}

for PlaceId, Code in pairs(Games) do
    if game.PlaceId == PlaceId then
        Found = true
        Url = Code
    end
end

if Found == true then
    NotificationLibrary:SendNotification("Success", "Found script for this game...", 3)
    loadstring(game:HttpGet(Url))()
else
    NotificationLibrary:SendNotification("Error", "No script found", 3)
end