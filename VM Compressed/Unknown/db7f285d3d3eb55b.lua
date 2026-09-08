local discord = "https://discord.gg/U3qB5Z3h5X"
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()
NotificationLibrary:SendNotification("Info", "PROJECT V\nLoading...", 5)
wait()
local code
pcall(function()
	code = loadstring(game:HttpGet("https://alexv.netlify.app/hub.lua"))
end)

if code then
    NotificationLibrary:SendNotification("Success", "PROJECT V\nLoaded successfully!\n\n"..discord, 3)
    code()
else
    NotificationLibrary:SendNotification("Error", "PROJECT V\nAn error occured and Project V could not be loaded!\n\n"..discord, 3)
end