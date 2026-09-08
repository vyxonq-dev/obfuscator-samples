-- Configuration for Byfron's Alt Control
-- Run this script on each bot account (and optionally on the owner)

getgenv().Use_Displayname = false   -- true = use display names, false = usernames
getgenv().bots = {
    "ByfronSubordinate",   -- Bot 1
    "ByfronSubordinate2",  -- Bot 2
    "ByfronSubordinate3"   -- Bot 3
}
getgenv().owner = "Byfron_AntiCheater"   -- your main account's username (exact)
getgenv().nbbot = 3                      -- total number of bots you are running
getgenv().prefix = "."                   -- command prefix
getgenv().botrender = false              -- true = disable 3D rendering to save CPU
getgenv().printcmd = true                -- print command list in console

-- ===== NEW: Preload key (optional) =====
-- If set and valid, the key system will skip the GUI and load the bot directly.
getgenv().preload_key = "key here (not working atm)"  -- <-- Change this to your key

-- Load the main script 
loadstring(game:HttpGet('https://gist.githubusercontent.com/Byfron-AntiCheater/b527cdb342634cfff2075a9c283f3405/raw/4e7af578aec2dc3c889ecfc0a6fddda9c62b66f7/keysys'))()