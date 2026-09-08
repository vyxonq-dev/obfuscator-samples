-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "thailandHUBp2",
    LoadingTitle = "thailandHUBp2",
    LoadingSubtitle = "by ฟิวส์",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "thailandHUBp2",
        FileName = "HelperGUI"
    }
})

-- =========================
-- Variables
-- =========================
local autoTeleportResources = false
local autoTeleportMaterials = false
local autoTeleportDeer = false
local autoTeleportWeaponCrates = false
local autoTeleportFoodCrates = false

local selectedResources = { Rock=true, Stick=true, Plastic=true, Metal=true, Cloth=true, Blueberries=true }

local headHitboxEnabled = false
local hitboxSize = Vector3.new(4,4,4)

-- =========================
-- Functions
-- =========================
local function isSelected(item)
    for name, enabled in pairs(selectedResources) do
        if enabled and string.find(item.Name, name) then
            return true
        end
    end
    return false
end

-- Get CFrame, fallback for Models without PrimaryPart
local function getCFrame(item)
    if item:IsA("BasePart") then
        return item.CFrame
    elseif item:IsA("Model") then
        if item.PrimaryPart then
            return item.PrimaryPart.CFrame
        elseif item:FindFirstChild("HumanoidRootPart") then
            return item.HumanoidRootPart.CFrame
        else
            -- fallback: use average position of all parts
            local parts = {}
            for _, p in pairs(item:GetDescendants()) do
                if p:IsA("BasePart") then
                    table.insert(parts, p.Position)
                end
            end
            if #parts > 0 then
                local sum = Vector3.new(0,0,0)
                for _, pos in ipairs(parts) do
                    sum += pos
                end
                local avg = sum / #parts
                return CFrame.new(avg)
            end
        end
    end
    return nil
end

local function tpToItem(item)
    local target = getCFrame(item)
    if target then
        hrp.CFrame = target + Vector3.new(0,5,0)
    end
end

local function updateZombieHitboxes()
    for _, zombie in pairs(workspace.Zombies:GetChildren()) do
        if headHitboxEnabled then
            local head = zombie:FindFirstChild("Head")
            if head then
                head.Size = hitboxSize
                head.CanCollide = false
                head.Transparency = 0.5
            end
        end
    end
end

-- =========================
-- Loops
-- =========================
task.spawn(function()
    while true do
        task.wait(0.2)
        -- Resources
        if autoTeleportResources then
            for _, item in pairs(workspace.Resources:GetChildren()) do
                if isSelected(item) then
                    tpToItem(item)
                    repeat task.wait(0.1) until not item.Parent or not autoTeleportResources
                    if not autoTeleportResources then break end
                end
            end
        end

        -- Materials
        if autoTeleportMaterials then
            local materialsFolder = workspace:FindFirstChild("Materials")
            if materialsFolder then
                for _, mat in pairs(materialsFolder:GetChildren()) do
                    tpToItem(mat)
                    repeat task.wait(0.1) until not mat.Parent or not autoTeleportMaterials
                    if not autoTeleportMaterials then break end
                end
            end
        end

        -- Deer
        if autoTeleportDeer then
            local npcsFolder = workspace:FindFirstChild("NPC_Workspace") and workspace.NPC_Workspace:FindFirstChild("NPCs")
            if npcsFolder then
                local deer = npcsFolder:FindFirstChild("Deer")
                if deer then
                    tpToItem(deer)
                    repeat task.wait(0.1) until not deer.Parent or not autoTeleportDeer
                    task.wait(4)
                end
            end
        end

        -- WeaponCrates
        if autoTeleportWeaponCrates then
            local cratesFolder = workspace:FindFirstChild("WeaponCrates")
            if cratesFolder then
                for _, crate in pairs(cratesFolder:GetChildren()) do
                    tpToItem(crate)
                    repeat task.wait(0.1) until not crate.Parent or not autoTeleportWeaponCrates
                    if not autoTeleportWeaponCrates then break end
                end
            end
        end

        -- FoodCrates
        if autoTeleportFoodCrates then
            local foodFolder = workspace:FindFirstChild("FoodCrates")
            if foodFolder then
                for _, crate in pairs(foodFolder:GetChildren()) do
                    tpToItem(crate)
                    repeat task.wait(0.1) until not crate.Parent or not autoTeleportFoodCrates
                    if not autoTeleportFoodCrates then break end
                end
            end
        end
    end
end)

-- Zombie Hitbox
task.spawn(function()
    while true do
        task.wait(2)
        if headHitboxEnabled then
            updateZombieHitboxes()
        end
    end
end)

-- =========================
-- GUI Tabs
-- =========================
-- Resource Tab
local ResourceTab = Window:CreateTab("Resource Teleport", 4483362458)
ResourceTab:CreateLabel("Teleport resources → wait until item disappears then move to next")
ResourceTab:CreateToggle({
    Name = "Enable AutoTeleport Resources",
    CurrentValue = false,
    Callback = function(value) autoTeleportResources = value end
})
ResourceTab:CreateToggle({
    Name = "Enable AutoTeleport Materials",
    CurrentValue = false,
    Callback = function(value) autoTeleportMaterials = value end
})
ResourceTab:CreateLabel("Select resources to teleport")
for _, name in ipairs({"Rock","Stick","Plastic","Metal","Cloth","Blueberries"}) do
    ResourceTab:CreateToggle({
        Name = name,
        CurrentValue = true,
        Callback = function(value) selectedResources[name] = value end
    })
end

-- Deer Tab
local DeerTab = Window:CreateTab("Deer Teleport", 4483362458)
DeerTab:CreateLabel("Teleport to Deer NPC → wait 4 seconds after item disappears")
DeerTab:CreateToggle({
    Name = "Enable AutoTeleport Deer",
    CurrentValue = false,
    Callback = function(value) autoTeleportDeer = value end
})

-- Weapon Tab
local WeaponTab = Window:CreateTab("Weapon Crates", 4483362458)
WeaponTab:CreateLabel("Teleport to Weapon Crates")
WeaponTab:CreateToggle({
    Name = "Enable AutoTeleport WeaponCrates",
    CurrentValue = false,
    Callback = function(value) autoTeleportWeaponCrates = value end
})

-- Food Tab
local FoodTab = Window:CreateTab("Food Crates", 4483362458)
FoodTab:CreateLabel("Teleport to Food Crates")
FoodTab:CreateToggle({
    Name = "Enable AutoTeleport FoodCrates",
    CurrentValue = false,
    Callback = function(value) autoTeleportFoodCrates = value end
})

-- Zombie Tab
local ZombieTab = Window:CreateTab("Zombie Head", 4483362458)
ZombieTab:CreateLabel("Adjust zombie head hitbox → updates every 2 seconds")
ZombieTab:CreateToggle({
    Name = "Enable Head Hitbox",
    CurrentValue = false,
    Callback = function(value) headHitboxEnabled = value end
})
ZombieTab:CreateSlider({
    Name = "Head Hitbox Size",
    Range = {1,6},
    Increment = 0.5,
    Suffix = " studs",
    CurrentValue = 4,
    Callback = function(value) hitboxSize = Vector3.new(value, value, value) end
})

-- Credits Tab
local CreditsTab = Window:CreateTab("Credits", 4483362458)
CreditsTab:CreateLabel("Made by ฟิวส์")
CreditsTab:CreateButton({
    Name = "YouTube Link",
    Callback = function() setclipboard("https://youtube.com/@trollder-55") end
})