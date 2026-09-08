local KeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/OopssSorry/LuaU-Free-Key-System-UI/main/source.lua"))()
local KeyValid = false

local response = KeySystem:Init({
    Debug=false,
    Title="Kuromi Loader | Key System",
    Description=nil,
    Link="https://link-target.net/1426306/PkdMi3ScOQgJ",
    Discord="https://discord.gg/cK2eJPY7QS",
    SaveKey=false,
    Verify=function(key)
        if key=="X7F2K9LQW3PAM8ZTFTT" then
            KeyValid=true
            return true
        else
            return false
        end
    end,
    GuiParent = game.CoreGui,
})

if response and KeyValid then
    -- Eğer key doğrulandıysa, ikinci script'i yükle
    loadstring(game:HttpGet("https://raw.githubusercontent.com/oszn31454567567652384832482348/3432/refs/heads/main/1"))()
else
    warn("WRONG KEY BRONIDE!")
end
