local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Ultimate Hub | heckman900",
   LoadingTitle = "Loading Systems...",
   LoadingSubtitle = "by heckman900",
   ConfigurationSaving = {Enabled = false},
   KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)
local HealthTab = Window:CreateTab("Health", 4483362458)
local LocalTab = Window:CreateTab("Local Player", 4483362458)
local ItemsTab = Window:CreateTab("Items", 4483362458)
local InfoTab = Window:CreateTab("Info", 4483362458)

local _G = _G or {}
_G.AutoProxy = false
_G.HealSelf = false
_G.HealNear = false
_G.NeedleAll = false
_G.TPWalkSpeed = 0
_G.Noclip = false

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local MedKitRemote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("Miscs"):WaitForChild("MedKitRemote")
local BadEyesRemote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("Miscs"):WaitForChild("BadEyesSend")
local GrowNeedleRemote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("Miscs"):WaitForChild("GrowNeedleSend")

local cachedPrompts = {}
local function updatePromptCache()
    cachedPrompts = {}
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ProximityPrompt") then table.insert(cachedPrompts, v) end
    end
end
updatePromptCache()

local function fireNearby(range)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local rootPos = char.HumanoidRootPart.Position
        for i = #cachedPrompts, 1, -1 do
            local v = cachedPrompts[i]
            if v and v.Parent then
                local parent = v.Parent
                local pos = parent:IsA("BasePart") and parent.Position or (parent:IsA("Model") and parent:GetPivot().Position)
                if pos and (rootPos - pos).Magnitude <= (range or 15) then
                    fireproximityprompt(v)
                end
            else
                table.remove(cachedPrompts, i)
            end
        end
    end
end

RunService.Stepped:Connect(function()
    if _G.Noclip and LocalPlayer.Character then
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
    if _G.TPWalkSpeed > 0 and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
        LocalPlayer.Character:TranslateBy(LocalPlayer.Character.Humanoid.MoveDirection * _G.TPWalkSpeed / 10)
    end
end)

task.spawn(function()
    while true do
        if _G.AutoProxy then fireNearby(15) end
        if _G.HealSelf and LocalPlayer.Character then pcall(function() MedKitRemote:FireServer(true, LocalPlayer.Character) end) end
        
        if _G.HealNear and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local rootPos = LocalPlayer.Character.HumanoidRootPart.Position
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    if (rootPos - p.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                        pcall(function() MedKitRemote:FireServer(true, p.Character) end)
                    end
                end
            end
        end
        
        if _G.NeedleAll and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local rootPos = LocalPlayer.Character.HumanoidRootPart.Position
            local targets = {}
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    table.insert(targets, {player = p, dist = (rootPos - p.Character.HumanoidRootPart.Position).Magnitude})
                end
            end
            table.sort(targets, function(a, b) return a.dist < b.dist end)
            
            for _, data in ipairs(targets) do
                if not _G.NeedleAll then break end
                local char = data.player.Character
                pcall(function()
                    GrowNeedleRemote:FireServer(char, "Fire")
                    GrowNeedleRemote:FireServer(char, "Grow")
                    GrowNeedleRemote:FireServer(char, "Shrink")
                    BadEyesRemote:FireServer(char)
                end)
            end
            task.wait(1)
        else
            task.wait(0.3)
        end
    end
end)

MainTab:CreateButton({
   Name = "Dogs With Guards Weapon XD",
   Callback = function()
        local MainRemote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("Miscs"):WaitForChild("JoinTeam")
        for _, ply in ipairs(Players:GetPlayers()) do
            pcall(function() MainRemote:FireServer("Dogs", ply) end)
            pcall(function() MainRemote:FireServer("Guards", ply) end)
        end
   end,
})

MainTab:CreateToggle({
   Name = "Troll, use Leash or dog arrest",
   CurrentValue = false,
   Callback = function(Value) _G.AutoProxy = Value end,
})

MainTab:CreateToggle({
   Name = "Needle All (Warning: Need Needle)",
   CurrentValue = false,
   Callback = function(Value) 
       if Value then Rayfield:Notify({Title = "Warning", Content = "You must have a needle equipped!", Duration = 5}) end
       _G.NeedleAll = Value 
   end,
})

HealthTab:CreateToggle({
   Name = "Heal Yourself",
   CurrentValue = false,
   Callback = function(Value) _G.HealSelf = Value end,
})

HealthTab:CreateToggle({
   Name = "Heal Near Players",
   CurrentValue = false,
   Callback = function(Value) _G.HealNear = Value end,
})

LocalTab:CreateSlider({
   Name = "TPWalk Speed",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 0,
   Callback = function(Value) _G.TPWalkSpeed = Value end,
})

LocalTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Callback = function(Value) _G.Noclip = Value end,
})

ItemsTab:CreateButton({
    Name = "Auto Collect Items",
    Callback = function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local root = char.HumanoidRootPart
            root.CFrame = CFrame.new(-61.264, 13.620, 158.479)
            local s1 = tick() while tick() - s1 < 2 do fireNearby(25) task.wait(0.1) end
            root.CFrame = CFrame.new(-57.490, 13.538, 124.575)
            local s2 = tick() while tick() - s2 < 2 do fireNearby(25) task.wait(0.1) end
            Rayfield:Notify({Title = "Items", Content = "Finished.", Duration = 3})
        end
    end,
})

InfoTab:CreateLabel("YouTube: heckman900")
InfoTab:CreateButton({
    Name = "Copy Channel Link",
    Callback = function() setclipboard("https://www.youtube.com/@heckman900") end,
})

Rayfield:Notify({Title = "Loaded", Content = "Script by heckman900", Duration = 5})
