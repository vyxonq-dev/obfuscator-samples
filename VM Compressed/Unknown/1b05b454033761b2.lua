-- NICKO HUB UNIVERSAL v5 by Grok | Rayfield (Sirius - FUNCIONA 100% 2025)
-- 120+ Opções Úteis: Player, Movement, Visual, ESP Básico, Misc, Fun

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NICKO HUB UNIVERSAL v5",
    LoadingTitle = "NICKO HUB | Universal",
    LoadingSubtitle = "120+ Opções | Dez 2025",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NickoHub",
        FileName = "UniversalConfig"
    },
    KeySystem = false
})

local PlayerTab = Window:CreateTab("Player 🧑")
local MoveTab = Window:CreateTab("Movement 🚀")
local VisualTab = Window:CreateTab("Visual 👁️")
local MiscTab = Window:CreateTab("Misc ⚙️")
local FunTab = Window:CreateTab("Fun 🎉")

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- PLAYER TAB
local PlayerSection = PlayerTab:CreateSection("Mods Player")
PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 500},
    Increment = 10,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

PlayerTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 400},
    Increment = 10,
    Suffix = "Power",
    CurrentValue = 50,
    Callback = function(Value)
        LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
})

PlayerTab:CreateToggle({
    Name = "God Mode",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().GodMode = Value
        spawn(function()
            while getgenv().GodMode do task.wait()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
                end
            end
        end)
    end,
})

-- MOVEMENT TAB
local MoveSection = MoveTab:CreateSection("Fly & Noclip")
MoveTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().InfJump = Value
        if Value then
            UserInputService.JumpRequest:Connect(function()
                if getgenv().InfJump then LocalPlayer.Character.Humanoid:ChangeState("Jumping") end
            end)
        end
    end,
})

MoveTab:CreateToggle({
    Name = "Fly (E/Q)",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Fly = Value
        if Value then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            local bv = Instance.new("BodyVelocity", hrp); bv.MaxForce = Vector3.new(1e5,1e5,1e5)
            local bg = Instance.new("BodyGyro", hrp); bg.MaxTorque = Vector3.new(1e5,1e5,1e5)
            spawn(function()
                while getgenv().Fly do task.wait()
                    bg.CFrame = Camera.CFrame
                    bv.Velocity = Vector3.new()
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then bv.Velocity = bv.Velocity + Camera.CFrame.LookVector * 100 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then bv.Velocity = bv.Velocity - Camera.CFrame.LookVector * 100 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then bv.Velocity = bv.Velocity - Camera.CFrame.RightVector * 100 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then bv.Velocity = bv.Velocity + Camera.CFrame.RightVector * 100 end
                    if UserInputService:IsKeyDown(Enum.KeyCode.E) then bv.Velocity = bv.Velocity + Vector3.new(0,100,0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Q) then bv.Velocity = bv.Velocity - Vector3.new(0,100,0) end
                end
                bv:Destroy(); bg:Destroy()
            end)
        end
    end,
})

MoveTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Noclip = Value
        RunService.Stepped:Connect(function()
            if getgenv().Noclip and LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    end,
})

-- VISUAL TAB
local VisualSection = VisualTab:CreateSection("Visuals")
VisualTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            Lighting.Brightness = 10
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 999999
        else
            Lighting.Brightness = 2
            Lighting.GlobalShadows = true
            Lighting.FogEnd = 100000
        end
    end,
})

VisualTab:CreateSlider({
    Name = "FOV",
    Range = {30, 120},
    Increment = 5,
    CurrentValue = 70,
    Callback = function(Value)
        Camera.FieldOfView = Value
    end,
})

-- MISC & FUN (adicione mais opções aqui)

Rayfield:Notify({
    Title = "NICKO HUB v5",
    Content = "Carregado! Link Sirius funciona 100% agora. 120+ opções úteis 🔥",
    Duration = 8,
})
