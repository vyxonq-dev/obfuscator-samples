local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()

local Window = OrionLib:MakeWindow({Name = "Budgie Hub | :)", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest"})
pcall(function() game.Players.ADSKer_man222.PlayerScripts.BlockDevConsoleForNonCreator:Destroy() end)

--[[
local hook; hook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
  if self == game.StarterGui and getnamecallmethod() == "SetCore" and (({...})[1] == "DevConsoleVisible" and ({...})[2] == false) then
    print(getcallingscript():GetFullName())
 end
  return hook(self, ...)
end))
]]--

local Tab = Window:MakeTab({
 Name = "Main",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})

local Section = Tab:AddSection({
  Name = "Human"
})

Tab:AddButton({
 Name = "Give AK-47",
 Callback = function()
     firetouchinterest(game.Workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart"), game.Workspace["AK-47 Giver"].Giver.Button, 0)
   end    
})

Tab:AddToggle({
 Name = "AK-47 kill aura",
 Default = false,
 Callback = function(Value)
tyy = Value
     while tyy and task.wait() do
       local tool = game.Players.LocalPlayer.Character:FindFirstChild("AK-47")
       if tool then
         local humanoids = {}
for _, part in next, workspace:GetPartBoundsInRadius(tool.Handle.Position, 40) do
    if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and not part:IsDescendantOf(game.Players.LocalPlayer.Character) then
      if not table.find(humanoids, part.Parent:FindFirstChildOfClass("Humanoid")) then
        table.insert(humanoids, part.Parent:FindFirstChildOfClass("Humanoid"))
      end
    end
  end

         for _, humanoid in next, humanoids do
           local args = {
 humanoid,
 humanoid.RootPart,
 1e5,
 vector.create(0.09946456551551819, 0.027196276932954788, 0.9946694374084473),
 10,
 1000,
 false
}
tool:WaitForChild("GunScript_Server"):WaitForChild("InflictTarget"):FireServer(unpack(args))
         end
       end
     end
   end    
})

Tab:AddToggle({
 Name = "Loop kill all monsters",
 Default = false,
 Callback = function(Value)
     hem = Value
     while hem and task.wait(0.1) do
       local tool = game.Players.LocalPlayer.Character:FindFirstChild("AK-47")
if tool then
  for _, monster in next, game.Workspace:GetDescendants() do
    if monster:IsA("Model") and monster.Name == "Monster" or game.Players:GetPlayerFromCharacter(monster) then
     local args = {
 monster:FindFirstChildWhichIsA("Humanoid"),
 monster:FindFirstChild("HumanoidRootPart"),
 1e5,
 vector.create(0.09946456551551819, 0.027196276932954788, 0.9946694374084473),
 20,
 0,
 false
}
tool:WaitForChild("GunScript_Server"):WaitForChild("InflictTarget"):FireServer(unpack(args))
     end
  end
end
     end
   end    
})

Tab:AddButton({
 Name = "AK-47 Buff",
 Callback = function()
      for i, v in next, getgc(true) do
    if type(v) == "table" and rawget(v, "AmmoPerClip") then
        v.AmmoPerClip = math.huge
        v.FireRate = 0
        v.Spread = 0
        v.ReloadTime = 0
        v.HeadshotDamageMultiplier = math.huge
        v.CameraShakingEnabled = false
        v.FlamingBullet = true
        v.BaseDamage = math.huge
        v.BulletSpeed = math.huge
        v.BulletPerShot = math.huge
        v.Radius = math.huge
        v.FadeTime = 10
        v.Piercing = math.huge
        v.Lifesteal = math.huge
        v.Auto = true
        v.DualEnabled = true
        v.SoundVolume = 10
        v.SniperEnabled = true
        v.BulletMaterial = "Neon"
        v.Knockback = 1e5
        v.BulletSpeed = math.huge
        v.ExplosiveEnabled = true
        v.BulletColor = BrickColor.new("Really yellow")
        v.BulletSize = Vector3.new(2, 2, 100)
    end
end
   end    
})

Tab:AddButton({
 Name = "AK-47 Ultra Buff",
 Callback = function()
     for i, v in next, getgc(true) do
    if type(v) == "table" and rawget(v, "AmmoPerClip") then
        v.AmmoPerClip = math.huge
        v.FireRate = 0
        v.Spread = 0
        v.ReloadTime = 0
        v.HeadshotDamageMultiplier = math.huge
        v.CameraShakingEnabled = true
        v.FlamingBullet = true
        v.BaseDamage = math.huge
        v.BulletSpeed = math.huge
        v.BulletPerShot = math.huge
        v.Radius = math.huge
        v.FadeTime = 10
        v.Piercing = math.huge
        v.Lifesteal = math.huge
        v.Auto = true
        v.DualEnabled = true
        v.SoundVolume = 10
        v.SniperEnabled = true
        v.BulletMaterial = "Neon"
        v.Knockback = 1e7
        v.BulletSpeed = math.huge
        v.ExplosiveEnabled = true
        v.BulletSize = Vector3.new(7, 7, 100)
        v.BulletColor = BrickColor.new("Really red")
    end
end
   end    
})

Tab:AddButton({
 Name = "AK-47 Divine Buff",
 Callback = function()
for i, v in next, getgc(true) do
    if type(v) == "table" and rawget(v, "AmmoPerClip") then
        v.AmmoPerClip = math.huge
        v.FireRate = 0
        v.Spread = 0
        v.ReloadTime = 0
        v.HeadshotDamageMultiplier = math.huge
        v.CameraShakingEnabled = true
        v.FlamingBullet = true
        v.BaseDamage = math.huge
        v.BulletSpeed = math.huge
        v.BulletPerShot = math.huge
        v.Radius = math.huge
        v.FadeTime = 0.2
        v.Piercing = math.huge
        v.Lifesteal = math.huge
        v.Auto = true
        v.DualEnabled = true
        v.SoundVolume = 10
        v.SniperEnabled = true
        v.BulletMaterial = "Neon"
        v.Knockback = 1e15
        v.BulletSpeed = math.huge
        v.ExplosiveEnabled = true
        v.BulletSize = Vector3.new(15, 15, 100)
        v.BulletColor = BrickColor.new("Really red")
        task.spawn(function()
           local i = 0
 repeat game:GetService("RunService").RenderStepped:Wait()
   v.BulletColor = BrickColor.new(Color3.fromHSV(i, 1, 1))
  i = (i + game:GetService("RunService").RenderStepped:Wait() * 1) % 1
until v.Knockback ~= 1e15
        end)
    end
end
   end    
})

local Section = Tab:AddSection({
  Name = "Monster"
})

Tab:AddButton({
 Name = "Kill all",
 Callback = function()
      for _, player in next, game.Players:GetPlayers() do
         if player ~= game.Players.LocalPlayer and workspace:FindFirstChild(player.Name) then
            coroutine.wrap(function() firetouchinterest(game.Workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart"), player.Character:WaitForChild("HumanoidRootPart"), 0) end)()
         end
      end
   end    
})

local Section = Tab:AddSection({
  Name = "Other"
})

Tab:AddButton({
 Name = "Remove darkness",
 Callback = function()
      game.Lighting.TimeOfDay = "12:00:00"
      game.Lighting.FogEnd = math.huge
      game.Lighting.FogStart = math.huge
      
      for _, dark in next, game.Lighting:GetChildren() do
        if dark:IsA("Atmosphere") then
          dark:Destroy()
        end
      end
   end    
})

Tab:AddButton({
 Name = "Spawn baldi.exe",
 Callback = function()
     game:GetService("ReplicatedStorage").SpawnBaldiEXE:FireServer()
   end    
})
