local cloneref = cloneref or function(x) return x end
local uis = cloneref(game:GetService("UserInputService"))
local cantuse 
if not isfolder("JumperV2") then
cloneref(game:GetService("StarterGui")):SetCore("SendNotification", {
        Title = "Takes a sec to load when using for the first time", 
        Text = "👽",
        Duration = 5 
    })


end

if identifyexecutor() == "Xeno" or identifyexecutor() == "Solara" then
cantuse = true
cloneref(game:GetService("StarterGui")):SetCore("SendNotification", {
        Title = identifyexecutor() .. " not supported",
        Text = "Use a better executor",
        Duration = 5 
    })


end
if uis.TouchEnabled and not cantuse then
 loadstring(game:HttpGet("https://raw.githubusercontent.com/solarastuff/sorryjimpee/refs/heads/main/JumperMobile.lua"))()
end
if not uis.TouchEnabled and not cantuse then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/solarastuff/sorryjimpee/refs/heads/main/JumperPC.lua"))()

end
