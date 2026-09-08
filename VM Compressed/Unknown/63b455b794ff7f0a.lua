-- https://luaegis.net
local api = loadstring(game:HttpGet("https://sdk.luaegis.net/sdk/library.lua"))()


api.script_id = "id"


local status = api.check_key(script_key)

if status.code == "KEY_VALID" then

    local hours_left = status.data.auth_expire == 0
        and "permanent"
        or  math.floor((status.data.auth_expire - os.time()) / 3600) .. "h"

    print("[Lua Aegis] Key valid. Plan: " .. (status.data.note or "default") .. ". Expires: " .. hours_left)


    api.load_script()

elseif status.code == "KEY_HWID_LOCKED" then

    warn("[Lua Aegis] This key is bound to a different device. Reset it from the Discord panel.")

elseif status.code == "KEY_EXPIRED" then

    warn("[Lua Aegis] Your key expired. Renew or purchase a new one.")

elseif status.code == "KEY_BANNED" then

    warn("[Lua Aegis] " .. status.message)

elseif status.code == "KEY_INCORRECT" then

    warn("[Lua Aegis] Key is invalid. Double-check the key you entered.")

else

    warn("[Lua Aegis] Could not reach the auth server. Try again in a moment.")
end