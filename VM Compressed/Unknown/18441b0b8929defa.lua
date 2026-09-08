print("____________________________________________________________________________________________________")
print("")
print("██      ██ ████████ ██   ██ ██ ██    ██ ███    ███ ")
print("██      ██    ██    ██   ██ ██ ██    ██ ████  ████ ")
print("██      ██    ██    ███████ ██ ██    ██ ██ ████ ██ ")
print("██      ██    ██    ██   ██ ██ ██    ██ ██  ██  ██ ")
print("███████ ██    ██    ██   ██ ██  ██████  ██      ██ ")

game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Lithium",
        Text = "Name credit goes to lithium.1on on discord.",
        Duration = 5
    })
                                                   
                                                   
local placeId = game.PlaceId

if placeId == 286090429 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Sempiller/Lithium/refs/heads/main/Arsenal.lua"))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Lithium",
        Text = "This game isn't supported yet.",
        Duration = 5
    })
end
