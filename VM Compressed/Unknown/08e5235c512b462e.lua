local StarterGui = game:GetService("StarterGui")
local LOADSTRING = [[loadstring(game:HttpGet("https://velocityloader.vercel.app/"))()]]
local NOTIF_TEXT = "you are using the old loadstring of velocity x, new loadstring is copied"
local function try_copy(s)
    if type(setclipboard) == "function" then setclipboard(s) return true end
    if type(syn) == "table" and type(syn.set_clipboard) == "function" then syn.set_clipboard(s) return true end
    if type(write_clipboard) == "function" then write_clipboard(s) return true end
    if type(Clipboard) == "table" and type(Clipboard.set) == "function" then Clipboard.set(s) return true end
    return false
end
local ok, copied = pcall(function() return try_copy(LOADSTRING) end)
if ok and copied then
    StarterGui:SetCore("SendNotification", {Title = "Velocity X", Text = NOTIF_TEXT, Duration = 5})
else
    StarterGui:SetCore("SendNotification", {Title = "Velocity X", Text = NOTIF_TEXT .. " (couldn't auto-copy — printed to console)", Duration = 6})
    print("Velocity X new loadstring (copy this):\n" .. LOADSTRING)
end
