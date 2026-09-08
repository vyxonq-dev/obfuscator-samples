local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Mj Contega's Hax",
    SubTitle = "Fluent "..Fluent.Version,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark"
})

local Tabs = {
    Main = Window:AddTab({Title = "Player", Icon = "user"}),
    Teleport = Window:AddTab({Title = "Teleport", Icon = "map-pin"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})
}

local PlayerSection = Tabs.Main:AddSection("Movement")

local WalkSpeedSlider = Tabs.Main:AddSlider("WalkSpeed", {
    Title = "Walk Speed",
    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
        end
    end
})

local JumpPowerSlider = Tabs.Main:AddSlider("JumpPower", {
    Title = "Jump Power",
    Default = 50,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Callback = function(Value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = Value
        end
    end
})

local NoClipToggle = Tabs.Main:AddToggle("NoClip", {
    Title = "No Clip",
    Default = false,
    Callback = function(Value)
        if Value then
            Noclipping = game:GetService('RunService').Stepped:Connect(function()
                if game.Players.LocalPlayer.Character then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        else
            if Noclipping then
                Noclipping:Disconnect()
            end
        end
    end
})

local TeleportSection = Tabs.Teleport:AddSection("Checkpoints")

local AutoCheckpointToggle = Tabs.Teleport:AddToggle("AutoCheckpoint", {
    Title = "Auto Checkpoint",
    Default = false,
    Callback = function(Value)
        if Value then
            AutoCheckpoint = game:GetService('RunService').Heartbeat:Connect(function()
                local stage = game:GetService("Players").LocalPlayer.leaderstats.Stage.Value
                local nextCheckpoint = workspace.Checkpoints[tostring(stage + 1)]
                if nextCheckpoint then
                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = nextCheckpoint.CFrame
                end
            end)
        else
            if AutoCheckpoint then
                AutoCheckpoint:Disconnect()
            end
        end
    end
})

local ManualCheckpointButton = Tabs.Teleport:AddButton({
    Title = "Next Checkpoint",
    Callback = function()
        local stage = game:GetService("Players").LocalPlayer.leaderstats.Stage.Value
        local nextCheckpoint = workspace.Checkpoints[tostring(stage + 1)]
        if nextCheckpoint then
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = nextCheckpoint.CFrame
        end
    end
})

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Fluent:Notify({
    Title = "Mj Contega Hax",
    Content = "Script loaded successfully!",
    Duration = 5
})