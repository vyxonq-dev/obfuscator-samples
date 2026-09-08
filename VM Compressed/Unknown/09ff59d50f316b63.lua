-- KEY SYSTEM V2 UI LIBRARY:
-- UI by mr.xrer | Code by mstudio45

local KeySystemUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/ui/xrer_mstudio45.lua"))()
KeySystemUI.New({
    ApplicationName = "PhonkScripts", -- Your Key System Application Name
    Name = "Phonk Scripts", -- Your Script name
    Info = "", -- Info text in the GUI, keep empty for default text.
    DiscordInvite = "" -- Optional.
})
repeat task.wait() until KeySystemUI.Finished() or KeySystemUI.Closed
if KeySystemUI.Finished() and KeySystemUI.Closed == false then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/phonkScripts/PhonkScripts/main/game%20protect"))()
else
    print("Player closed the GUI.")
end
