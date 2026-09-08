getgenv().JERK_OFF_SPEED = 4
 --// self explainatory, the speed of jerking off
getgenv().KEEP_ON_DEATH = true --// if true, gives you the jerk off tool when you respawn

loadstring(game:HttpGet("https://raw.githubusercontent.com/Sakupenny/Universal-Jerk-Off/refs/heads/main/Main.lua"))()
local encoded = game:HttpGet("https://files.catbox.moe/cpfi5v.mp3")
writefile("goon.mp3", encoded)
local asset_id = getcustomasset("goon.mp3")
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.SoundId = asset_id
sound.Volume = 1
sound.Looped = true
sound:Play()