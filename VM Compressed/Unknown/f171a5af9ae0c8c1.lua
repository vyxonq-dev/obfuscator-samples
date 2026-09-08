local a=loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local b=a:Load("🗝️","DarkTheme")
local c=a.newTab("🔑","DarkTheme")
local d,c1="mps_mission",""
local function e()loadstring(game:HttpGet("https://raw.githubusercontent.com/akramthegoat/Loader/refs/heads/main/MPs-Rework"))()end
c.newInput("Insert Your Key","",function(f)c1=f end)
c.newButton("Enter","",function()
    (c1==d and function()c.newLabel("✔")e()end or function()c.newLabel("✖")end)()
end)
c.newButton("Copy Discord Link","Key Is Inside Discord",function()
    (setclipboard and function()c.newLabel("✔")setclipboard("https://discord.gg/EjUEECeGmB")end or function()c.newLabel("✖")end)()
end)
if setclipboard then setclipboard("https://discord.gg/EjUEECeGmB") end
