local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("IShowSpeed", "BloodTheme")
 
--Main
local Title2 = Window:NewTab("Sound")
local Title3 = Window:NewTab("LocalPlayer")
local Title4 = Window:NewTab("Setting")
local Title5 = Window:NewTab("Credit")
local Sounds = Title2:NewSection("Sounds")
local LocalPlayer = Title3:NewSection("LocalPlayer")
local Settings = Title4:NewSection("Settings")
local Credits = Title5:NewSection("Credits")

Credits:NewButton("Made by 505", ";)", function()
end)

Sounds:NewButton("Do you love GOD!", "Sound Player", function()
    local args = {[1] = 5}
    game:GetService("ReplicatedStorage").Talk:FireServer(unpack(args))
end)

Sounds:NewButton("EAT!", "Sound Player", function()
    local args = {[1] = 6}
    game:GetService("ReplicatedStorage").Talk:FireServer(unpack(args))
end)

Sounds:NewButton("Bark", "Sound Player", function()
    local args = {[1] = 4}
    game:GetService("ReplicatedStorage").Talk:FireServer(unpack(args))
end)

Sounds:NewButton("You need to DIE!", "Sound Player", function()
    local args = {[1] = 7}
    game:GetService("ReplicatedStorage").Talk:FireServer(unpack(args))
end)

Sounds:NewButton("My name is the EMO!", "Sound Player", function()
    local args = {[1] = 2}
    game:GetService("ReplicatedStorage").Talk:FireServer(unpack(args))
end)

Sounds:NewButton("Crying", "Sound Player", function()
    local args = {[1] = 1}
    game:GetService("ReplicatedStorage").Talk:FireServer(unpack(args))
end)

Sounds:NewButton("GIVE IT TO ME!", "Sound Player", function()
    local args = {[1] = 3}
    game:GetService("ReplicatedStorage").Talk:FireServer(unpack(args))
end)

Sounds:NewButton("Sewyy", "Sound Player", function()
    local args = {[1] = 8}
    game:GetService("ReplicatedStorage").Talk:FireServer(unpack(args))
end)

Sounds:NewButton("Cristiano Ronaldo", "Sound Player", function()
    local args = {[1] = 9}
    game:GetService("ReplicatedStorage").Talk:FireServer(unpack(args))
end)

LocalPlayer:NewSlider("WalkSpeed", "Change WS", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

LocalPlayer:NewButton("AntiFling", "Once turned on you cannot turn it off.", function()
    _G.AntiFlingConfig = {
    -- this will remove your rotational velocity every frame
    disable_rotation = true;
   
    -- this slows you down if you're moving too fast, works well but can give you a low gravity effect
    limit_velocity = true;
    limit_velocity_sensitivity = 150; -- how fast you have to be moving before you get slowed down
    limit_velocity_slow = 0; -- the amount of velocity you keep; a lower number increases how much you slow down by
   
    -- stops you from ragdolling or falling over and losing control
    anti_ragdoll = true;
   
    -- completely freezes you if someone gets too close to you  
    anchor = false;
    smart_anchor = true; -- only anchors if someone is considered flinging, this likely won't detect many flings
    anchor_dist = 30; -- how close someone has to be to trigger anchor
   
    -- teleport away if someone gets too close
    teleport = false;
    smart_teleport = true; -- only teleports if someone is considered flinging, this likely won't detect many flings
    teleport_dist = 30; -- how close someone has to be to teleport you
    }
    -- run _G.disable() to disable the script completely
    loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/rblx/main/extra/better_antifling.lua'))()
end)

LocalPlayer:NewButton("AntiAfk --Made by Proxy#4553", "Bypasses 20Min Idle", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/Proxylol/OtherScripts/main/AntiAfk.lua'),true))()
end)

LocalPlayer:NewButton("FPS Booster --Made by Gore", "Removes a lot of Textures, Apply at your own risk.", function()
    local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
end)

Settings:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.RightControl, function()
	Library:ToggleUI()
end)
