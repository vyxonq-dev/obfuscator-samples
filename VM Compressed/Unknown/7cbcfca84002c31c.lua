local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()

local Window = OrionLib:MakeWindow({Name = "Budgie Hub | Fall in Funnel Simulator 1.4", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "PVP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
 Name = "Analysis weapons",
 Callback = function()
        local LocalPlayer = game:GetService("Players").LocalPlayer

local movableObjects = workspace:GetDescendants()
for _, object in pairs(movableObjects) do
  if object:IsA("BasePart" or "UnionOperation" or "Model") and object.Anchored == false and object:IsDescendantOf(game.Players.LocalPlayer.Character) == false and object.Name == "Torso" == false and object.Name == "Head" == false and object.Name == "Right Arm" == false and object.Name == "Left Arm" == false and object.Name == "Right Leg" == false and object.Name == "Left Leg" == false and object.Name == "HumanoidRootPart" == false then 
   
    object.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
  end
 end
   end    
})

Tab:AddButton({
 Name = "Analysis weapons with using Tool",
 Callback = function()
        local tool = Instance.new("Tool")
tool.Name = "Get weapons"
tool.RequiresHandle = false

tool.Activated:Connect(function()
local LocalPlayer = game:GetService("Players").LocalPlayer

local movableObjects = workspace:GetDescendants()
for _, object in pairs(movableObjects) do
  if object:IsA("BasePart" or "UnionOperation" or "Model") and object.Anchored == false and object:IsDescendantOf(game.Players.LocalPlayer.Character) == false and object.Name == "Torso" == false and object.Name == "Head" == false and object.Name == "Right Arm" == false and object.Name == "Left Arm" == false and object.Name == "Right Leg" == false and object.Name == "Left Leg" == false and object.Name == "HumanoidRootPart" == false then 
   
    object.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
  end
 end
end)

tool.Parent = game.Players.LocalPlayer.Backpack
   end    
})

local APT = false
local movableObjects = {}

local function hasUnattachedObjects()
    for _, object in pairs(movableObjects) do
        if object:IsA("BasePart" or "UnionOperation" or "Model") and object.Anchored == false and object:IsDescendantOf(game.Players.LocalPlayer.Character) == false and object.Name ~= "Torso" and object.Name ~= "Head" and object.Name ~= "Right Arm" and object.Name ~= "Left Arm" and object.Name ~= "Right Leg" and object.Name ~= "Left Leg" and object.Name ~= "HumanoidRootPart" then
            return true
        end
    end
    return false
end

local function addMovableObject(object)
    if object:IsA("BasePart" or "UnionOperation" or "Model") and object.Anchored == false and object:IsDescendantOf(game.Players.LocalPlayer.Character) == false and object.Name ~= "Torso" and object.Name ~= "Head" and object.Name ~= "Right Arm" and object.Name ~= "Left Arm" and object.Name ~= "Right Leg" and object.Name ~= "Left Leg" and object.Name ~= "HumanoidRootPart" then
        table.insert(movableObjects, object)
    end
end

local function activateScript()
    while APT do
        wait(0.5)
        if hasUnattachedObjects() then
            local LocalPlayer = game:GetService("Players").LocalPlayer
            for _, object in pairs(movableObjects) do
                if object:IsA("BasePart" or "UnionOperation" or "Model") and object.Anchored == false and object:IsDescendantOf(game.Players.LocalPlayer.Character) == false and object.Name ~= "Torso" and object.Name ~= "Head" and object.Name ~= "Right Arm" and object.Name ~= "Left Arm" and object.Name ~= "Right Leg" and object.Name ~= "Left Leg" and object.Name ~= "HumanoidRootPart" then
                    object.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                  object.CanCollide = false
                end
            end
        else
            task.wait()
        end
    end
end

workspace.DescendantAdded:Connect(addMovableObject)

Tab:AddToggle({
    Name = "Auto Picking Tools",
    Default = false,
    Callback = function(Value)
        APT = Value
        if APT then
            activateScript()
        end
    end
})

local aAS = false

Tab:AddToggle({
	Name = "Anti Slow",
	Default = false,
	Callback = function(Value)
	 aAS = Value
	while aAS do
wait()
		if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed <= 8 then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		end
	end
	end    
})

local AIL = false

Tab:AddToggle({
	Name = "Anti inventory lock",
	Default = false,
	Callback = function(Value)
	 AIL = Value
      while AIL do
 task.wait()
  local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)

local sgui = game:GetService("StarterGui")
sgui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
end
	end    
})

local AJB = false

Tab:AddToggle({
 Name = "Anti jump block",
 Default = false,
 Callback = function(Value)
 AJB = Value
        while AJB do
  wait()
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)

local initialJump = 50
local currentJump = Character.Humanoid.JumpPower

if currentJump >= 0 and currentJump <= 10 then
    Character.Humanoid.JumpPower = initialJump
else
    Character.Humanoid.JumpPower = currentJump
end
 end
   end    
})

Tab:AddDropdown({
	Name = "Anti Void(And Kanava And Water)",
	Default = "1",
	Options = {"On", "Off"},
	Callback = function(Value)
		if Value == "On" then
		local part = Instance.new("Part")
part.Name = "AntiFallPart"
part.Size = Vector3.new(50000, 5, 50000)
part.Transparency = 1
part.Anchored = true
part.Position = Vector3.new(0, 2045.5, 0)
part.Parent = game.Workspace
part.CanCollide = true
part.CanTouch = true
		end
		if Value == "Off" then
for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") and part.Name == "AntiFallPart" then
            part.CanCollide = false
            part.CanTouch = false
        end
    end
		end
	end    
})

Tab:AddDropdown({
	Name = "Anti Knockback",
	Default = "1",
	Options = {"On", "Off"},
	Callback = function(Value)
		if Value == "On" then
		local plr = game.Players.LocalPlayer
local char = plr.Character
  
  for _, child in pairs(char:GetChildren()) do
    if child:IsA("BasePart") then
      child.Massless = false
      child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, math.huge, math.huge) 
    end
  end
		end
		if Value == "Off" then
		local plr = game.Players.LocalPlayer
local char = plr.Character
  
  for _, child in pairs(char:GetChildren()) do
    if child:IsA("BasePart") then
      child.Massless = false
      child.CustomPhysicalProperties = PhysicalProperties.new(1, 1, 1) 
    end
  end
		end
	end    
})

local ADg = false

Tab:AddToggle({
	Name = "Always Day",
	Default = false,
	Callback = function(Value)
	 ADg = Value
		while ADg do
	task.wait()
		game.Lighting.TimeOfDay = 12
		end
	end    
})

local WnRS = false

Tab:AddToggle({
	Name = "Walk on Ragdoll State",
	Default = false,
	Callback = function(Value)
	 WnRS = Value
		while WnRS do wait()
local player = game.Players.LocalPlayer
player.Character.Humanoid.PlatformStand = false
end
	end    
})

Tab:AddButton({
 Name = "Anti Touch Water",
 Callback = function()
        for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") and part.Name == "pee" or part.Name == "pee1" then
           part.CanCollide = false
          part.CanTouch = false
          part:Destroy()
        end
    end
   end    
})

Tab:AddButton({
 Name = "Anti Touch Bonfire",
 Callback = function()
        for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") and part.Name == "FireTouch" then
           part.CanCollide = false
          part.CanTouch = false
        end
    end
   end    
})

local ATB = false

Tab:AddToggle({
	Name = "Auto Tool Beats",
        Default = false,
	Callback = function(Value)
  ATB = Value
while ATB do wait(0.3)
local replicatedStorage = game:GetService("ReplicatedStorage")
local remotes = replicatedStorage.Remotes
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    if character:FindFirstChildOfClass("Tool") then
        remotes.HitRequest:InvokeServer()
    end
end
  	end    
})

Tab:AddButton({
	Name = "Last Chance",
	Callback = function()
OrionLib:MakeNotification({
	Name = "Budgie Hub",
	Content = "When you die you go back to the place where you died, but it only works once",
	Image = "rbxassetid://4483345998",
	Time = 5
})
      		repeat wait(0.1)
if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
  LastHealth = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(0.1)
game:GetService("ReplicatedStorage").Remotes.Respawn:InvokeServer()
wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = LastHealth
end
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
  	end    
})

local GMod = false

Tab:AddToggle({
	Name = "Almost Godmode",
	Default = false,
	Callback = function(Value)
 GMod = Value
if GMod == true then
OrionLib:MakeNotification({
	Name = "Budgie Hub",
	Content = "Same as *Last Chance*, but it always works",
	Image = "rbxassetid://4483345998",
	Time = 5
})
end
local function main()
  while GMod do
    wait(0.1)
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
      local LastHealth = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
      wait(0.1)
      game:GetService("ReplicatedStorage").Remotes.Respawn:InvokeServer()
      wait(0.3)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = LastHealth
    end
  end
end

main()
	end    
})

Tab:AddButton({
 Name = "Anti collision",
 Callback = function()
local Services = setmetatable({}, {__index = function(Self, Index)
    local NewService = game:GetService(Index)
    if NewService then
        Self[Index] = NewService
    end
    return NewService
end})

local LocalPlayer = Services.Players.LocalPlayer

local function PlayerAdded(Player)
    local Character
    local PrimaryPart

    local function CharacterAdded(newCharacter)
        Character = newCharacter
        repeat
            wait()
            PrimaryPart = newCharacter:FindFirstChild("HumanoidRootPart")
        until PrimaryPart
    end

    Player.CharacterAdded:Connect(CharacterAdded)
    if Player.Character then
        CharacterAdded(Player.Character)
    end

    Services.RunService.Heartbeat:Connect(function()
        if Character and Character:IsDescendantOf(workspace) and PrimaryPart and PrimaryPart:IsDescendantOf(Character) then
            if PrimaryPart.AssemblyAngularVelocity.Magnitude > 0 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 0 then
                for _, v in ipairs(Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                        v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                    end
                end
                PrimaryPart.CanCollide = false
                PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
            end
        end
    end)
end

local function OnPlayerAdded(player)
    if player ~= LocalPlayer then
        PlayerAdded(player)
    end
end

for _, player in ipairs(Services.Players:GetPlayers()) do
    OnPlayerAdded(player)
end

Services.Players.PlayerAdded:Connect(OnPlayerAdded)
   end    
})

Tab:AddButton({
 Name = "Touch Fling",
 Callback = function()
OrionLib:MakeNotification({
	Name = "Budgie Hub",
	Content = "Turns Off After Death",
	Image = "rbxassetid://4483345998",
	Time = 5
})
        local function startFling()
local hrp, c, vel, movel = nil, nil, nil, 0.1
            local player = game.Players.LocalPlayer

            while player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and hiddenfling do
                game:GetService("RunService").Heartbeat:Wait()

                local lp = player
                while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
                    game:GetService("RunService").Heartbeat:Wait()
                    c = lp.Character
                    hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
                end

                if hiddenfling then
                    vel = hrp.Velocity
                    hrp.Velocity = vel * 10000 + Vector3.new(0, 50000, 0)
                    game:GetService("RunService").RenderStepped:Wait()

                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel
                    end

                    game:GetService("RunService").Stepped:Wait()

                    if c and c.Parent and hrp and hrp.Parent then
                        hrp.Velocity = vel + Vector3.new(0, movel, 0)
                        movel = movel * -1
                    end
                end
            end
end

        if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
            hiddenfling = true
        else
            hiddenfling = true
            local detection = Instance.new("Decal")
            detection.Name = "juisdfj0i32i0eidsuf0iok"
            detection.Parent = game:GetService("ReplicatedStorage")
        end

        startFling()
   end    
})

Tab:AddDropdown({
	Name = "Tools Grip",
	Default = "1",
	Options = {"Gyaat(Need Бита)"},
	Callback = function(Value)
		if Value == "Gyaat(Need Бита)" then
		local player = game.Players.LocalPlayer
  for _, tool in ipairs(player.Backpack:GetChildren()) do
    if tool:IsA("Tool") and tool.Name == "Бита" then
  tool.Grip = CFrame.Angles(7.9, math.rad(5), 0)
     end
end

wait()
local player = game.Players.LocalPlayer
  for _, tool in ipairs(player.Backpack:GetChildren()) do
    if tool:IsA("Tool") and tool.Name == "Бита" then
      tool.GripPos = Vector3.new(1.3, 0, 1.7) 
    end
  end
		end
	end    
})

local LPT = false

Tab:AddToggle({
	Name = "Long Punch(Test)",
	Default = false,
	Callback = function(Value)
	LPT = Value
		local player = game:GetService("Players").LocalPlayer
while LPT do task.wait()
    local parts = workspace:GetPartBoundsInRadius(player.Character:WaitForChild("HumanoidRootPart").Position, 2)
    local foundEntity = false
    for _, part in ipairs(parts) do
        if (part:IsA("BasePart") or part:IsA("UnionOperation") or part:IsA("Model")) and not part.Anchored and part:IsDescendantOf(workspace) and not part:IsDescendantOf(player.Character) then
            foundEntity = true
            break
        end
    end
    if foundEntity then
        player.Character.Humanoid.HipHeight = -1.8
    else
        player.Character.Humanoid.HipHeight = 0
    end
end
	end    
})

local PAT = false

Tab:AddToggle({
	Name = "Punch Aura(Test)",
	Default = false,
	Callback = function(Value)
	PAT = Value
		local player = game:GetService("Players").LocalPlayer
while PAT do task.wait()
    local parts = workspace:GetPartBoundsInRadius(player.Character:WaitForChild("HumanoidRootPart").Position, 1.6)
    local foundEntity = false
    for _, part in ipairs(parts) do
        if (part:IsA("BasePart") or part:IsA("UnionOperation") or part:IsA("Model")) and not part.Anchored and part:IsDescendantOf(workspace) and not part:IsDescendantOf(player.Character) then
            foundEntity = true
            break
        end
    end
    if foundEntity then
        game:GetService("ReplicatedStorage").Remotes.HitRequest:InvokeServer()
    else
        
    end
end
	end    
})

local Tab = Window:MakeTab({
	Name = "Creator",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("Creator – MEGACOCONUT")
