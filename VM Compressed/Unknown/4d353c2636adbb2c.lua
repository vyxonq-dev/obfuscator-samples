local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LP = Players.LocalPlayer

local AutoWin = false
local AutoEquipBestPet = false
local AutoHatch = false
local InfJump = false
local WalkSpeed50 = false
local orgCF = nil
local selectedEgg = ""

local function getHRP()
    local char = LP.Character or LP.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart")
end

local function getHumanoid()
    local char = LP.Character or LP.CharacterAdded:Wait()
    return char:WaitForChild("Humanoid")
end

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()
local UI = ReGui:TabsWindow({Title = "Game Automation", Size = UDim2.fromOffset(350, 220)})

local TabMain = UI:CreateTab({Name = "Main"})
local TabMovement = UI:CreateTab({Name = "Movement"})

local Main = TabMain:CollapsingHeader({Title = "Features"})
Main:Checkbox({
    Label = "Auto Win (TP)",
    Value = false,
    Callback = function(_, v)
        AutoWin = v
        if v then
            orgCF = getHRP().CFrame
        end
    end
})

Main:Checkbox({
    Label = "Auto Equip Best Pet",
    Value = false,
    Callback = function(_, v)
        AutoEquipBestPet = v
    end
})

local eggs = {}
for _, egg in pairs(Workspace.Map.Lobby.Pets.Eggs:GetChildren()) do
    table.insert(eggs, egg.Name)
end
Main:Combo({
    Label = "Select Egg to Hatch",
    Selected = "",
    Items = eggs,
    Callback = function(_, v)
        selectedEgg = v
    end
})
Main:Checkbox({
    Label = "Auto Hatch",
    Value = false,
    Callback = function(_, v)
        AutoHatch = v
    end
})

local Movement = TabMovement:CollapsingHeader({Title = "Movement"})
Movement:Checkbox({
    Label = "Inf Jump",
    Value = false,
    Callback = function(_, v)
        InfJump = v
    end
})

Movement:Checkbox({
    Label = "WalkSpeed 50",
    Value = false,
    Callback = function(_, v)
        WalkSpeed50 = v
        if getHumanoid() then
            getHumanoid().WalkSpeed = v and 50 or 16
        end
    end
})

task.spawn(function()
    while task.wait(1) do
        if AutoWin then
            local hrp = getHRP()
            local winPart = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Game") and Workspace.Map.Game:FindFirstChild("Win")
            if hrp and winPart and winPart:IsA("Model") then
                local primaryPart = winPart:FindFirstChild("PrimaryPart") or winPart:FindFirstChildWhichIsA("BasePart")
                if primaryPart then
                    hrp.CFrame = primaryPart.CFrame + Vector3.new(0, 3, 0)
                    task.wait(0.5)
                    if orgCF then
                        hrp.CFrame = orgCF
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
        if AutoEquipBestPet then
            pcall(function()
                ReplicatedStorage.Debris.Remotes["{446b1fa8-ec4b-4d13-91d2-f0255d4ee717}"]:InvokeServer("EquipBest")
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if AutoHatch and selectedEgg and selectedEgg ~= "" then
            pcall(function()
                ReplicatedStorage.Debris.Remotes["{e07fe450-fb42-4902-b9eb-2f276ad4aa4c}"]:InvokeServer("Hatch", selectedEgg)
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if WalkSpeed50 and getHumanoid() then
            getHumanoid().WalkSpeed = 50
        elseif getHumanoid() then
            getHumanoid().WalkSpeed = 16
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if InfJump and getHumanoid() then
        getHumanoid():ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Game Automation",
    Text = "Script loaded successfully!",
    Duration = 5
})