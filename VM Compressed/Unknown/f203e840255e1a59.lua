loadstring(game:HttpGet("https://rawscripts.net/raw/KJ-The-Strongest-Battlegrounds-Tsb-RUN-TOOL-27856"))()

-- Creating a Core Notification
local CoreGui = game:GetService("CoreGui")
local NotificationService = game:GetService("StarterGui")

-- Create the notification
NotificationService:SetCore("SendNotification", {
    Title = "RUN TOOL",   -- Title of the notification
    Text = "Made by: SHUTTHISDOWNORZLSE",    -- Text for the notification
    Duration = 5       -- Duration in seconds (you can change this as needed)
})
