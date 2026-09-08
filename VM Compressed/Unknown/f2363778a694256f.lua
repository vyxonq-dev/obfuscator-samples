local Games = {
    [3082002798] = { -- T-Titans Battlegrounds
        Name = "T-Titans Battlegrounds",
        Script = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/zerolamar/ObfucatedPancakes/refs/heads/main/T-Titans%20battlegrounds"))()
        end
    },

    [9876543210] = { -- Example: Creatures of Sonaria
        Name = "Creatures of Sonaria",
        Script = function()
            loadstring(game:HttpGet("https://yourcdn.com/cos.lua"))()
        end
    },

    [1111111111] = { -- Example: Pokémon Brick Bronze
        Name = "Pokémon Brick Bronze",
        Script = function()
            loadstring(game:HttpGet("https://yourcdn.com/pbb.lua"))()
        end
    }
}

local gameId = game.PlaceId
local data = Games[gameId]

if data then
    print("🌍 Loading script for:", data.Name)
    data.Script()
else
    warn("⚠️ No script found for PlaceId:", gameId)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Game Loader",
        Text = "No script available for this game!",
        Duration = 5
    })
end
