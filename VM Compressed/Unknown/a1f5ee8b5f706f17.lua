local function sendNotification(title, text)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Icon = "rbxassetid://106526100453456",
        Duration = 5
    })
end

local replicatedStorage = game:FindFirstChild("ReplicatedStorage")
local gameRemotes = replicatedStorage:WaitForChild("GameRemotes", 5)

    if gameRemotes and gameRemotes:FindFirstChild("Demo") then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yijtfjyfjtd/KetHubMinecrafft/refs/heads/main/KetHubMinecrafft", true))() -- Minerscave
        sendNotification("KetHub", "Minerscave supported")
    elseif game.PlaceId == 6953291455 then
        -- loadstring(game:HttpGet("https://raw.githubusercontent.com/yijtfjyfjtd/KetHub/refs/heads/main/EatingSimulator"))() -- EatingSimulator
        sendNotification("KetHub", "EatingSimulator Down")
    elseif game.PlaceId == 15506010437 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yijtfjyfjtd/KetHub/refs/heads/main/FunSquidGameGlassBridge2.lua"))() -- FunSquidGameGlassBridge2
        sendNotification("KetHub", "FunSquidGameGlassBridge2 supported")
    elseif game.PlaceId == 7920018625 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yijtfjyfjtd/KetHub/refs/heads/main/NukeTycoonsNuclear.lua"))() -- NukeTycoonNuclear
        sendNotification("KetHub", "NukeTycoonNuclear supported")
    else
        sendNotification("KetHub", "This game is not supported")
    end
