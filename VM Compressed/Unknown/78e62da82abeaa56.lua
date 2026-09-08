local hum = game.Players.LocalPlayer.Character.Humanoid

local function immortal()
local args = {
    [1] = "Ayanokoji Kiyotaka"
}

game:GetService("ReplicatedStorage"):WaitForChild("Picked"):FireServer(unpack(args))
   wait(1)
repeat
   task.wait()
   local LP = game.Players.LocalPlayer
repeat wait() until LP.Character
for i,v in pairs(LP.Backpack:GetChildren()) do
   if v.Name == "Dodge" then
       v.Parent = LP.Character
   end
end
game:GetService("Players").LocalPlayer.Character.Dodge.Skill.Event:FireServer()
until game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
end

local function defense()
 repeat 
   game:GetService("RunService").RenderStepped:Wait()
 hum = game.Players.LocalPlayer.Character.Humanoid
  if hum.PlatformStand == true then
  hum.PlatformStand = false
  elseif hum.WalkSpeed <= 16 then
  hum.WalkSpeed = 16
  elseif not game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true) then
  game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
  elseif hum.JumpPower <= 50 then
  hum.JumpPower = 50
  elseif not hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true) then
  hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
  elseif hum.AutoRotate == false then
  hum.AutoRotate = true
  elseif hum.RequiresNeck == true then
  hum.RequiresNeck = false
  elseif hum and (hum:GetState() == Enum.HumanoidStateType.Ragdoll or hum:GetState() == Enum.HumanoidStateType.FallingDown) then
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
  end
 until game.Players.LocalPlayer.Character.Humanoid.Health <= 0
end

local function defense2()
local plr = game.Players.LocalPlayer
local char = plr.Character
  for _, child in pairs(char:GetChildren()) do
    if child:IsA("BasePart") then
      child.Massless = false
      child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, math.huge, math.huge) 
    end
  end
  
  repeat wait()
  for i, v in pairs(game:GetService("Players"):GetPlayers()) do
   task.spawn(function()
 if v == game.Players.LocalPlayer then
    for i, x in next, v.Character:GetDescendants() do
     if x.Name ~= floatName and x:IsA("BasePart") and x.Anchored then
      x.Anchored = false
     end
    end
   end
   end)
end
  until hum.Health <= 0
end

local function regen()
local player = game.Players.LocalPlayer
local args = { "Gojo Young" }
            game:GetService("ReplicatedStorage").Picked:FireServer(unpack(args))
   wait(1)
     if player.Backpack:FindFirstChild("The Honored One") then
 game:GetService("Players").LocalPlayer.Backpack["The Honored One"].Script.Event:FireServer()
         wait(0.1)
        player.Backpack["The Honored One"]:Destroy()
     end
end

local function tools()
local tool = Instance.new("Tool")
tool.Name = "DEATH SLASH"
tool.RequiresHandle = false
tool.ToolTip = "Bruhhhh"

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 1 then
                lastPressTime = currentTime 
for i = 1, 4 do
game:GetService("Players").LocalPlayer.Backpack["Yamamoto Slash"].LocalScript.Event:FireServer()
game:GetService("Players").LocalPlayer.Backpack["North Tenchi Kaijin"].LocalScript.Event:FireServer()
end
            end
end)

tool.Parent = game.Players.LocalPlayer.Backpack

local tool = Instance.new("Tool")
tool.Name = "Kill Everything"
tool.RequiresHandle = false
tool.ToolTip = "RIP All Player"

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 7 then
                lastPressTime = currentTime 
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/Yhwach%20all"))()
               end
end)

tool.Parent = game.Players.LocalPlayer.Backpack

local tool = Instance.new("Tool")
tool.Name = "Hacker Domain"
tool.RequiresHandle = false
tool.ToolTip = "Welcome to my Domain"

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 3 then
                lastPressTime = currentTime 
for i = 1, 2 do
game:GetService("Players").LocalPlayer.Backpack["Ausw\195\164hlen"].LocalScript.Event:FireServer()
end
            end
end)

tool.Parent = game.Players.LocalPlayer.Backpack

local tool = Instance.new("Tool")
tool.Name = "True Hacker Aura"
tool.RequiresHandle = false
tool.ToolTip = "BRO"

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 3 then
                lastPressTime = currentTime 
for i = 1, 2 do
game:GetService("Players").LocalPlayer.Backpack["Splash Almighty"].LocalScript.Event:FireServer()
end
            end
end)

tool.Parent = game.Players.LocalPlayer.Backpack

local tool = Instance.new("Tool")
tool.Name = "Flame Aura"
tool.RequiresHandle = false
tool.ToolTip = "I will burn your Soul!"

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 5 then
                lastPressTime = currentTime 
           for i = 1, 2 do
game:GetService("Players").LocalPlayer.Backpack["West Zanjitsu Gokui"].LocalScript.Event:FireServer()
end
            end
end)

tool.Parent = game.Players.LocalPlayer.Backpack

local tool = Instance.new("Tool")
tool.Name = "Mini Nuke"
tool.RequiresHandle = false
tool.ToolTip = "Am I aToMiC?"

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 3 then
                lastPressTime = currentTime 
           for i = 1, 10 do
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Red"):FireServer()
end
            end
end)

tool.Parent = game.Players.LocalPlayer.Backpack

local tool = Instance.new("Tool")
tool.Name = "Strongest Kick"
tool.RequiresHandle = false
tool.ToolTip = "I gave My Soul to demon..."

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 3 then
                lastPressTime = currentTime 
           for i = 1, 2 do
            local ohTable1 = {
                ["Function"] = "Fire",
                ["Name"] = "OmniDirectionalPunch",
                ["rootpos"] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            }

            game:GetService("ReplicatedStorage").Server:InvokeServer(ohTable1)
end
            end
end)

tool.Parent = game.Players.LocalPlayer.Backpack

local tool = Instance.new("Tool")
tool.Name = "Dark Monster"
tool.RequiresHandle = false
tool.ToolTip = "My heart is filled with Dark"

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 9999999 then
                lastPressTime = currentTime 
game:GetService("ReplicatedStorage").Remotes.sonido:FireServer()
end
end)

tool.Parent = game.Players.LocalPlayer.Backpack

local tool = Instance.new("Tool")
tool.Name = "Mini Nuke 2"
tool.RequiresHandle = false
tool.ToolTip = "I'm not Atomic"

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 1 then
                lastPressTime = currentTime 
           for i = 1, 7 do
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Blue2"):FireServer()
end
            end
end)

tool.Parent = game.Players.LocalPlayer.Backpack

local tool = Instance.new("Tool")
tool.Name = "Rebirth"
tool.RequiresHandle = false
tool.ToolTip = "New Soul is here"

local lastPressTime = 0
tool.Activated:Connect(function()
  local currentTime = tick()
            if currentTime - lastPressTime >= 9999999 then
                lastPressTime = currentTime 
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/Revive"))()
end
end)

tool.Parent = game.Players.LocalPlayer.Backpack
end

local function god32()
local lool = {
    [1] = "Yhwach"
}

game:GetService("ReplicatedStorage"):WaitForChild("Picked"):FireServer(unpack(lool))
wait(1)
game:GetService("Players").LocalPlayer.Backpack["The Almighty"].LocalScript.Event:FireServer()
wait(7.5)
        for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
     if tool:IsA("Tool") then
          tool.Parent = game:GetService("Players").LocalPlayer.Character
     end
 end
wait(1)
local ollo = {
    [1] = "Yamamoto Genryusai"
}

game:GetService("ReplicatedStorage"):WaitForChild("Picked"):FireServer(unpack(ollo))
wait(1)
game:GetService("Players").LocalPlayer.Backpack.Bankai.LocalScript.Event:FireServer()
end

local function bubmes()
function CreateChatBubble(instance, message)
 game.Chat:Chat(instance, message, Enum.ChatColor.White)
end
 wait(12)
CreateChatBubble(game.Players.LocalPlayer.Character.Head, "I AM TRUE HACKER")
end

local function meow2()
local args = {
    [1] = "Megumi Fushiguro"
}

game:GetService("ReplicatedStorage"):WaitForChild("Picked"):FireServer(unpack(args))
wait(1)
game:GetService("Players").LocalPlayer.Backpack.Mahoraga.Mahoraga.RemoteEvent:FireServer()
end

 coroutine.wrap(meow2)()
 wait(23)
 coroutine.wrap(immortal)()
 coroutine.wrap(defense)()
 coroutine.wrap(defense2)()
 coroutine.wrap(bubmes)()
   task.wait(2)
 coroutine.wrap(regen)()
  game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "rbxassetid://14737197004"
  task.wait(2)
local Player = game:GetService("Players").LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character

for _,v in pairs(Backpack:GetChildren()) do
   if v:IsA("Tool") or v:IsA("HopperBin") then
       v:Destroy()
   end
end

for _,v in pairs(Character:GetChildren()) do
   if v:IsA("Tool") or v:IsA("HopperBin") then
       v:Destroy()
   end 
end

  coroutine.wrap(tools)()
  wait(0.7)
  coroutine.wrap(god32)()
