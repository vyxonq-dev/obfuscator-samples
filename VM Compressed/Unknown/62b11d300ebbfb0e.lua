local z0x81dddf = game.PlaceId

local Puska = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()

if z0x81dddf == 13800223141 then -- lone survival
    loadstring(game:HttpGet('https://gitea.com/ronjam/someone.else/raw/branch/main/lonesurvival/script.lua'))()

elseif z0x81dddf == 13559584718 then -- lone menu
    Puska:SendNotification("Error", "The script doesn't work in the selection menu. Go to the server", 15)

elseif z0x81dddf == 12599615395 then -- roams official
    loadstring(game:HttpGet('https://gitea.com/ronjam/someone.else/raw/branch/main/roams/script.lua'))()

elseif z0x81dddf == 16582133881 then -- infected lands
    loadstring(game:HttpGet('https://gitea.com/ronjam/someone.else/raw/branch/main/infectedlands/script.lua'))()

elseif z0x81dddf == 0 then -- recoil
    loadstring(game:HttpGet('https://gitea.com/ronjam/someone.else/raw/branch/main/recoil/script.lua'))()

else
    warn("No specific script found for this game!")
    setclipboard(tostring(z0x81dddf))
    Puska:SendNotification("Error", "The script does not support this game. Please inform the developer about your game if you want to support it!\n(PlaceId copied to clipboard)", 15)
end