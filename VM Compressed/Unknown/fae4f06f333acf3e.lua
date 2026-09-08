
print("🔥 Carbon Loader executed!")

local placeId = game.PlaceId
local creatorType = game.CreatorType
local groupId = (creatorType == Enum.CreatorType.Group) and game.CreatorId or nil

print("📍 Place ID:", placeId)
print("👥 Creator Type:", creatorType)
print("🆔 Creator/Group ID:", game.CreatorId)

-- ============================================
-- GAME DETECTION (CHECKS BOTH GROUP ID & PLACE ID)
-- ============================================

-- Murder Mystery 2
if groupId == 142823291 or placeId == 142823291 or placeId == 335132309 then
    print("✅ Loading MM2 script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CStudios-Dev/csLoader.lua/main/mm2.lua"))()
    
-- 99 Nights
elseif groupId == 6042520 or placeId == 6042520 then
    print("✅ Loading 99 Nights script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CStudios-Dev/csLoader.lua/main/99nights.lua"))()
    
-- Forge
elseif groupId == 35489258 or placeId == 35489258 then
    print("✅ Loading Forge script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CStudios-Dev/csLoader.lua/main/forge.lua"))()
    
-- Blox Fruits
elseif groupId == 4372130 or placeId == 4372130 or placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
    print("✅ Loading Blox Fruits script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CStudios-Dev/csLoader.lua/main/bloxfruits.lua"))()
    
-- Forsaken
elseif groupId == 33548380 or placeId == 33548380 then
    print("✅ Loading Forsaken script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CStudios-Dev/csLoader.lua/main/forsaken.lua"))()
    
else
    print("❌ Game not supported!")
    print("📍 Place ID:", placeId)
    print("🆔 Group ID:", groupId or "None")
    
    -- Get game name
    local gameName = "Unknown"
    pcall(function()
        gameName = game:GetService("MarketplaceService"):GetProductInfo(placeId).Name
    end)
    print("🎮 Game:", gameName)
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "Not Supported";
        Text = "This game is not supported!\nPlace: " .. placeId .. "\nGroup: " .. tostring(groupId or "None");
        Duration = 5;
    })
end
