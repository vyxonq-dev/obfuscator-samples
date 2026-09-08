-- waits the game to load before execution.
if not game:IsLoaded() then
	game.Loaded:Wait()
end

-- made by zins in scriptblox, i added this bypasser if aesthetical added adonis.
local g = getinfo or debug.getinfo
local d = false
local h = {}

local x, y

setthreadidentity(2)

for i, v in getgc(true) do
    if typeof(v) == "table" then
        local a = rawget(v, "Detected")
        local b = rawget(v, "Kill")
    
        if typeof(a) == "function" and not x then
            x = a
            
            local o; o = hookfunction(x, function(c, f, n)
                if c ~= "_" then
                    if d then
                        warn(`Adonis AntiCheat flagged\nMethod: {c}\nInfo: {f}`)
                    end
                end
                
                return true
            end)

            table.insert(h, x)
        end

        if rawget(v, "Variables") and rawget(v, "Process") and typeof(b) == "function" and not y then
            y = b
            local o; o = hookfunction(y, function(f)
                if d then
                    warn(`Adonis AntiCheat tried to kill (fallback): {f}`)
                end
            end)

            table.insert(h, y)
        end
    end
end

local o; o = hookfunction(getrenv().debug.info, newcclosure(function(...)
    local a, f = ...

    if x and a == x then
        if d then
            warn(`zins | adonis bypassed`)
        end

        return coroutine.yield(coroutine.running())
    end
    
    return o(...)
end))

setthreadidentity(7)

-- important notifications.
game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "! IMPORTANT WARNING !",
  Text = "This Script Is Alpha 4, May Contain Lot Of Bugs.",
  Duration = 15,
  Callback = nil,
  Button1 = "Understood."
})
game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "✓ HOW TO TOGGLE ✓",
  Text = "Get A Keyboard Then Click F4 To Toggle It Or Click Green Button Top Left For Mobile, Silent Aim Is Enabled Currently.",
  Duration = 12.5,
  Callback = nil,
  Button1 = "Understood."
})
game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "? HOW TO USE ?",
  Text = "Enable Shiftlock In Mobile For Auto Shoot Or Shoot By Clicking On Screen If You Are On PC, Make Sure The Enemy Is Visible In Your Screen.",
  Duration = 10,
  Callback = nil,
  Button1 = "Understood."
})

-- plsa executer.
loadstring(game:HttpGet("https://raw.githubusercontent.com/aabbaaii13/aabbaaii/refs/heads/main/PLSA.lua"))()
