--[[
    🌟 CARSONN HUB - UNIVERSAL LOADER
    Auto Detect Game & Load Script
]]

local PlaceId = game.PlaceId
local MarketService = game:GetService("MarketplaceService")

-- Fungsi untuk notifikasi
local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 5;
    })
end

Notify("Carsonn Hub", "Checking Game ID...")

----------------------------------------------------------------
-- 1. KONFIGURASI GAME ID & SCRIPT LINK
----------------------------------------------------------------

local Games = {
    [76558904092080] = { -- The Forge
        Name = "The Forge (Island 1)",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/iabsolveCarsonn/CarsonnHub/refs/heads/main/The%20Forge.lua"))()' 
    },

    [129009554587176] = { -- The Forge
        Name = "The Forge (Island 2)",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/iabsolveCarsonn/CarsonnHub/refs/heads/main/The%20Forge.lua"))()' 
    },

    [131884594917121] = { -- The Forge
        Name = "The Forge (Island 3)",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/iabsolveCarsonn/CarsonnHub/refs/heads/main/The%20Forge.lua"))()' 
    },
    
    [121864768012064] = { -- Fish It
        Name = "Fish It",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/iabsolveCarsonn/CarsonnHub/refs/heads/main/Fishit.lua"))()'
    }
}

----------------------------------------------------------------
-- 2. LOGIKA DETEKSI
----------------------------------------------------------------
local Detected = Games[PlaceId]

if Detected then
    Notify("Game Detected!", "Loading " .. Detected.Name .. " Script...")
    print("[Carsonn Hub] Game Found: " .. Detected.Name)
    
    -- Eksekusi Script
    local success, err = pcall(function()
        loadstring(Detected.Script)()
    end)

    if not success then
        warn("[Carsonn Hub] Error Loading Script: " .. err)
        Notify("Error!", "Failed to load script. Check Console (F9).")
    end
else
    -- Jika game tidak terdaftar
    local success, info = pcall(function() return MarketService:GetProductInfo(PlaceId) end)
    local GameName = success and info.Name or "Unknown Game"
    
    Notify("Unsupported Game", GameName .. " is not supported yet.")
    print("[Carsonn Hub] Unsupported Place ID: " .. PlaceId)
    
    -- Opsional: Copy ID
    if setclipboard then
        setclipboard(tostring(PlaceId))
        Notify("Copied ID", "Place ID copied to clipboard for developer report.")
    end
end



