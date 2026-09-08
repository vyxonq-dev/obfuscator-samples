-- Junkie External Loader

local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()

-- Make sure to replace these with your actual Junkie Dashboard details
Junkie.service = "https://api.jnkie.com/api/v1/luascripts/public/8f1b7a1bbaf5eff40000a1f8d191210b41a75d7556697aa6dcf051d2f1fcfc72/download"        -- Replace with your service slug/name
Junkie.identifier = "1066500"  -- Replace with your dashboard user ID (e.g., "12345")
Junkie.provider = "YourProviderName"   -- Optional: replace or remove

local key = getgenv().SCRIPT_KEY or "PASTE_KEY_HERE"
local res = Junkie.check_key(key)

if res and res.valid then
  getgenv().SCRIPT_KEY = key
  pcall(function()
    -- Your specific published loadstring URL is loaded here
    loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/8f1b7a1bbaf5eff40000a1f8d191210b41a75d7556697aa6dcf051d2f1fcfc72/download"))()
  end)
else
  warn("Key invalid:", (res and res.error) or "no response")
end
