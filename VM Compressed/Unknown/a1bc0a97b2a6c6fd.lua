--[[
    hi! keep in mind that this script has almost no support for mobile devices.
    the script may also overlap with other gui's (because it was designed to have NO other gui's in its path)
    level 3+ is required (because the script tries to access CoreGui),
    but can be changed in the script (more chance of detection),
    the script is made by mehhovcki. have fun :D
]]

_G.safeChatVersion = "2016" -- 2007/2009/2016
_G.keyToDestroy = Enum.KeyCode.LeftControl -- https://create.roblox.com/docs/reference/engine/enums/KeyCode
if _G.safeChatVersion ~= "2007" and _G.safeChatVersion ~= "2009" and _G.safeChatVersion ~= "2016" then
    return print("[!] safeChatVersion isn't 2007, 2009 or 2016. pls fix :c")
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/mehh0vcki/scripts/refs/heads/main/safechat.lua"))()