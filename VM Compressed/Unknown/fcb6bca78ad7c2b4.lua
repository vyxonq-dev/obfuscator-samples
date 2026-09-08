local Modal = loadstring(game:HttpGet("https://github.com/lxte/Modal/releases/latest/download/main.lua"))()

local Window = Modal:CreateWindow({
    Title = "Ruòxi | Beta",
    SubTitle = "by dugxyux7kd_",
    Size = UDim2.fromOffset(400, 300),
    MinimumSize = Vector2.new(250, 200),
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local ProximityPromptService = game:GetService("ProximityPromptService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local AutoBuy2 = false
local AutoBuy10 = false
local InstantInteract = false
local PromptConnection
local SpeedEnabled = false
local WalkSpeedAmount = 16
local JumpEnabled = false
local JumpAmount = 50

local Main = Window:AddTab("Main")
local Player = Window:AddTab("Player")

Main:New("Title")({
    Title = "Auto buy Jump Power"
})

Main:New("Toggle")({
    Title = "Instant Click",
    Description = "Instant carry",
    DefaultValue = false,
    Callback = function(Value)
        InstantInteract = Value

        if InstantInteract then
            PromptConnection = ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
                if InstantInteract and prompt then
                    fireproximityprompt(prompt)
                end
            end)
        else
            if PromptConnection then
                PromptConnection:Disconnect()
                PromptConnection = nil
            end
        end
    end,
})

Main:New("Toggle")({
    Title = "Auto Buy x2",
    Description = "Auto Upgrade x2Jump",
    DefaultValue = false,
    Callback = function(Value)
        AutoBuy2 = Value
        while AutoBuy2 do
            Remotes:WaitForChild("UpgradeJump"):FireServer()
            task.wait(0.2)
        end
    end,
})

Main:New("Toggle")({
    Title = "Auto Buy x10",
    Description = "Auto Upgrade Jump x10",
    DefaultValue = false,
    Callback = function(Value)
        AutoBuy10 = Value
        while AutoBuy10 do
            Remotes:WaitForChild("UpgradeJump2"):FireServer()
            task.wait(0.2)
        end
    end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function TeleportTo(cf)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = cf
    end
end

local TeleportLocations = {
    ["Celestial"] = CFrame.new(-26.3641796, 714.539917, 430.733154, 0.999508321, -2.73615863e-09, 0.0313548371, 2.02506794e-13, 1, 8.72578667e-08, -0.0313548371, -8.7214957e-08, 0.999508321),
    ["Secret"] = CFrame.new(-24.1002693, 511.773712, 360.029785, 0.998220384, -3.05938097e-09, -0.0596326999, -2.34561285e-12, 1, -5.13430116e-08, 0.0596326999, 5.12517815e-08, 0.998220384),
    ["Mythic"] = CFrame.new(-26.0214405, 349.236603, 291.766876, 0.297665924, 1.82191631e-08, 0.954670072, -8.47059312e-08, 1, 7.32704164e-09, -0.954670072, -8.30472331e-08, 0.297665924),
    ["safe"] = CFrame.new(-47.7460518, 3.30880499, -150.68367, -0.984896958, -4.8526168e-08, -0.173141643, -3.95187634e-08, 1, -5.54705331e-08, 0.173141643, -4.77904152e-08, -0.984896958),
}

Main:New("Title")({
    Title = "Teleport Menu"
})

Main:New("Dropdown")({
    Title = "Select Zone",
    Description = "Choose location to teleport",
    Options = { "Celestial", "Secret", "Mythic", "safe" },
    Default = "safe",
    Callback = function(Value)
        local cf = TeleportLocations[Value]
        if cf then
            TeleportTo(cf)
        end
    end,
})

Player:New("Slider")({
    Title = "WalkSpeed",
    Description = "Adjust movement speed",
    Default = 16,
    Minimum = 16,
    Maximum = 400,
    DecimalCount = 0,
    Callback = function(Value)
        WalkSpeedAmount = Value
        if SpeedEnabled then
            local Character = LocalPlayer.Character
            if Character and Character:FindFirstChild("Humanoid") then
                Character.Humanoid.WalkSpeed = WalkSpeedAmount
            end
        end
    end,
})

Player:New("Toggle")({
    Title = "Enable Speed",
    Description = "Toggle WalkSpeed",
    DefaultValue = false,
    Callback = function(Value)
        SpeedEnabled = Value

        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")

        if SpeedEnabled then
            Humanoid.WalkSpeed = WalkSpeedAmount
        else
            Humanoid.WalkSpeed = 16
        end
    end,
})

Player:New("Slider")({
    Title = "JumpPower",
    Description = "Adjust jump power",
    Default = 50,
    Minimum = 50,
    Maximum = 500,
    DecimalCount = 0,
    Callback = function(Value)
        JumpAmount = Value
        if JumpEnabled then
            local Character = LocalPlayer.Character
            if Character and Character:FindFirstChild("Humanoid") then
                Character.Humanoid.UseJumpPower = true
                Character.Humanoid.JumpPower = JumpAmount
            end
        end
    end,
})

Player:New("Toggle")({
    Title = "Enable JumpPower",
    Description = "Toggle jump power",
    DefaultValue = false,
    Callback = function(Value)
        JumpEnabled = Value

        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")

        Humanoid.UseJumpPower = true

        if JumpEnabled then
            Humanoid.JumpPower = JumpAmount
        else
            Humanoid.JumpPower = 50
        end
    end,
})

Window:SetTab("Main")
Window:SetTheme("Rose")
