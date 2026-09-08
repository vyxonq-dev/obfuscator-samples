local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Xero Hub | Climb For Brainrots",
   LoadingTitle = "Xero Hub",
   LoadingSubtitle = "by Jayyyy",
   Theme = "Dark",
})

local Player = game.Players.LocalPlayer

-- Movement Tab
local MoveTab = Window:CreateTab("Movement", 4483362458)

MoveTab:CreateSlider({
   Name = "Custom WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Flag = "WS",
   Callback = function(Value)
       if Player.Character and Player.Character:FindFirstChild("Humanoid") then
           Player.Character.Humanoid.WalkSpeed = Value
       end
   end,
})

MoveTab:CreateSlider({
   Name = "Custom JumpPower",
   Range = {50, 1000},
   Increment = 1,
   CurrentValue = 50,
   Flag = "JP",
   Callback = function(Value)
       if Player.Character and Player.Character:FindFirstChild("Humanoid") then
           local hum = Player.Character.Humanoid
           hum.UseJumpPower = true
           hum.JumpPower = Value
       end
   end,
})

MoveTab:CreateToggle({
   Name = "No Ragdoll / Anti-Fling",
   CurrentValue = false,
   Flag = "AntiRagdoll",
   Callback = function(Value)
       _G.AntiRagdoll = Value
       task.spawn(function()
           while _G.AntiRagdoll do
               local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
               if hum then
                   hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                   hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
               end
               task.wait(0.2)
           end
       end)
   end,
})

-- All Zones Tab
local ZoneTab = Window:CreateTab("All Zones", 4483362458)

local function GetSortedZones()
    local triggers = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name:find("RunSpeed") or obj.Name == "TriggerZone" or obj.Name:lower():find("zone") then
            if obj:IsA("BasePart") or obj:IsA("Model") then table.insert(triggers, obj) end
        end
    end
    table.sort(triggers, function(a, b)
        local posA = a:IsA("Model") and a:GetPivot().Position or a.Position
        local posB = b:IsA("Model") and b:GetPivot().Position or b.Position
        return posA.Magnitude < posB.Magnitude
    end)
    return triggers
end

local triggers = GetSortedZones()

ZoneTab:CreateSection("Quick Return")

ZoneTab:CreateButton({
   Name = "🏠 TP to Base",
   Callback = function()
       local char = Player.Character
       if char and char:FindFirstChild("HumanoidRootPart") then
           local baseZone = triggers[1]
           if baseZone then
               char:PivotTo(baseZone:GetPivot() * CFrame.new(0, 5, 25)) 
               Rayfield:Notify({Title = "Xero Hub", Content = "Returned to Base by Jayyyy", Duration = 2})
           end
       end
   end,
})

ZoneTab:CreateSection("Zone Teleports")

local hideZones = { [6]=true, [8]=true, [10]=true, [12]=true, [14]=true, [16]=true, [18]=true, [20]=true, [22]=true }
local customNames = {
    [1]="Speed", [2]="Carry", [3]="Sell Brainrot", [4]="Stamina",
    [5]="Common Zone", [7]="Uncommon", [9]="Rare", [11]="Epic Zone",
    [13]="Legendary", [15]="Mythic", [17]="Brainrot Gosh", [19]="Secret", [21]="Ancient"
}

for i, zone in ipairs(triggers) do
    if not hideZones[i] then
        local displayName = customNames[i] or ("Zone " .. i)
        ZoneTab:CreateButton({
            Name = "Go to: " .. displayName,
            Callback = function()
                if Player.Character then
                    Player.Character:PivotTo(zone:GetPivot() * CFrame.new(0, 5, 0))
                end
            end,
        })
    end
end

Rayfield:Notify({
   Title = "Xero Hub Loaded",
   Content = "Script by Jayyyy",
   Duration = 5,
})