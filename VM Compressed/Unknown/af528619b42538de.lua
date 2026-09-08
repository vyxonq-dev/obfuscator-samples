-- Discord: https://discord.gg/SqpSyrZYsb

local placeId = game.PlaceId
local loadstrings = {
    [17367230431] = "https://raw.githubusercontent.com/Omicron-Luau/Omicron-Hub/refs/heads/main/BA",
    [3203685552] = "https://raw.githubusercontent.com/Omicron-Luau/Omicron-Hub/refs/heads/main/BA",
    [1450425732] = "https://raw.githubusercontent.com/Omicron-Luau/Omicron-Hub/refs/heads/main/QL",
    [127099886596040] = "https://raw.githubusercontent.com/Omicron-Luau/Omicron-Hub/refs/heads/main/KC",
    [35397735] = "https://raw.githubusercontent.com/Omicron-Luau/Omicron-Hub/refs/heads/main/QL"
}

if loadstrings[placeId] then
    loadstring(game:HttpGet(loadstrings[placeId]))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "OMICRON HUB",
        Text = "This script doesn't work here.",
        Icon = "rbxassetid://100709507402385",
        Duration = 5
    })
end
