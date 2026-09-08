local SUPPORTED_PLACE_IDS = {
    12886143095,
    12900046592,
    12920470286,
    12982304554,
    14368918515,
    16270257509,
    16552796883,
    18583778121
}

local currentPlaceId = game.PlaceId

for _, placeId in ipairs(SUPPORTED_PLACE_IDS) do
    if currentPlaceId == placeId then
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        while not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Humanoid") do
            task.wait(0.5)
        end
        
        loadstring(game:HttpGet("https://byorlofficial.live/als"))()
        
        local retryDelay = 10
        
        while true do
            local exists = pcall(function()
                return game:GetService("CoreGui").RaGCZy.ScreenGui.Base.Sidebar.Information.InformationHolder.TitleFrame.Title
            end)
            
            if exists then
                break
            end
            
            task.wait(retryDelay)
        end
        
        return
    end
end
