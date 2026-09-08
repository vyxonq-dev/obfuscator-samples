-- 1. Load the SDK
local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()

if not Junkie or type(Junkie.check_key) ~= "function" then
    warn("Junkie SDK not available. Check your executor.")
    return
end

-- 2. Configuration (Ensure these match your Dashboard exactly)
Junkie.service = "bite by night upd"
Junkie.identifier = "1066500"

-- 3. Define the Key (Step 3 of your tutorial)
-- This tells both the loader and the PROTECTED script to use keyless mode.
getgenv().SCRIPT_KEY = "KEYLESS"

-- 4. Check the Key (Step 4 of your tutorial)
local res = Junkie.check_key(getgenv().SCRIPT_KEY)

-- Validation logic
if res and res.valid then
    print("Keyless Auth Success: " .. tostring(res.message))
    
    -- Load the protected script
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/8f1b7a1bbaf5eff40000a1f8d191210b41a75d7556697aa6dcf051d2f1fcfc72/download"))()
    end)
    
    if not success then
        warn("Loader Error: " .. tostring(err))
    end
else
    -- If it still says "Key Invalid", check Step 1 & 2 of your tutorial (Dashboard settings)
    warn("Auth Failed. Response: " .. (res and res.message or "No Response"))
end
