 -- NUH HUB Full Script

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NUH HUB",
    LoadingTitle = "Initializing NUH HUB...",
    LoadingSubtitle = "by HAMSTER",
    Theme = "AmberGlow",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "NUH_HUB_Config"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- WALK & JUMP TAB
local WalkTab = Window:CreateTab("Walk & Jump")

WalkTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 150},
    Increment = 1,
    CurrentValue = 16,
    Suffix = "Speed",
    Callback = function(v)
        local plr = game.Players.LocalPlayer
        local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
})
WalkTab:CreateButton({
    Name = "Reset WalkSpeed",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 end
    end
})
WalkTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 200},
    Increment = 5,
    CurrentValue = 50,
    Suffix = "Power",
    Callback = function(v)
        local plr = game.Players.LocalPlayer
        local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = v end
    end
})
WalkTab:CreateButton({
    Name = "Reset JumpPower",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = 50 end
    end
})

-- FLY TAB
local FlyTab = Window:CreateTab("Fly")
local flying, flyVel, flyConn

FlyTab:CreateButton({
    Name = "Toggle Fly (E Key)",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local UIS = game:GetService("UserInputService")

        flying = not flying
        if flying then
            flyVel = Instance.new("BodyVelocity", hrp)
            flyVel.MaxForce = Vector3.new(1e6,1e6,1e6)
            flyConn = game:GetService("RunService").Heartbeat:Connect(function()
                flyVel.Velocity = plr:GetMouse().Hit.LookVector * 50
            end)
            UIS.InputBegan:Connect(function(i)
                if i.KeyCode == Enum.KeyCode.E and flying then
                    flying = false
                    flyVel:Destroy()
                    flyConn:Disconnect()
                    Rayfield:Notify({Title="Fly", Content="Fly disabled", Duration=3})
                end
            end)
            Rayfield:Notify({Title="Fly", Content="Fly enabled; press E to disable", Duration=3})
        end
    end
})
FlyTab:CreateButton({
    Name = "Stop Fly",
    Callback = function()
        flying = false
        if flyVel then flyVel:Destroy() end
        if flyConn then flyConn:Disconnect() end
        Rayfield:Notify({Title="Fly", Content="Fly stopped", Duration=3})
    end
})

-- VISUALS TAB
local VisualTab = Window:CreateTab("Visuals")
local noclip, noclipConn = false, nil
local esp, espBoxes = false, {}

VisualTab:CreateButton({
    Name = "Toggle Noclip",
    Callback = function()
        noclip = not noclip
        local plr = game.Players.LocalPlayer
        if noclip then
            noclipConn = game:GetService("RunService").Stepped:Connect(function()
                if plr.Character then
                    for _, part in ipairs(plr.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            Rayfield:Notify({Title="Noclip", Content="Enabled", Duration=3})
        else
            if noclipConn then noclipConn:Disconnect() end
            Rayfield:Notify({Title="Noclip", Content="Disabled", Duration=3})
        end
    end
})
VisualTab:CreateButton({
    Name = "Toggle ESP (Players)",
    Callback = function()
        esp = not esp
        local plr = game.Players.LocalPlayer
        if esp then
            for _, p in ipairs(game.Players:GetPlayers()) do
                if p ~= plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local box = Instance.new("BoxHandleAdornment", p.Character)
                    box.Adornee = p.Character
                    box.AlwaysOnTop = true
                    box.ZIndex = 5
                    box.Size = Vector3.new(4,6,2)
                    box.Color3 = Color3.fromRGB(255,0,0)
                    box.Transparency = 0.5
                    table.insert(espBoxes, box)
                end
            end
            Rayfield:Notify({Title="ESP", Content="Enabled", Duration=3})
        else
            for _, b in ipairs(espBoxes) do if b.Parent then b:Destroy() end end
            espBoxes = {}
            Rayfield:Notify({Title="ESP", Content="Disabled", Duration=3})
        end
    end
})

-- SIMULATOR TAB
local SimTab = Window:CreateTab("Simulator")

SimTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Callback = function(on)
        if on then
            local conn = game.Players.LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            end)
            SimTab:SetValue("Anti AFK", conn)
        else
            local conn = SimTab:GetValue("Anti AFK")
            if conn then conn:Disconnect() end
        end
    end
})

SimTab:CreateToggle({
    Name = "Invisible",
    CurrentValue = false,
    Callback = function(on)
        local plr = game.Players.LocalPlayer
        if plr.Character then
            for _, part in ipairs(plr.Character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = on and 1 or 0
                    if part:IsA("BasePart") then
                        part.CanCollide = not on
                    end
                end
            end
        end
    end
})

SimTab:CreateSlider({
    Name = "Spin Speed",
    Range = {0, 50},
    Increment = 1,
    CurrentValue = 0,
    Callback = function(v)
        local rs = game:GetService("RunService")
        if v > 0 then
            rs:BindToRenderStep("Spin", Enum.RenderPriority.Camera.Value, function()
                local plr = game.Players.LocalPlayer
                local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(v), 0) end
            end)
        else
            rs:UnbindFromRenderStep("Spin")
        end
    end
})

SimTab:CreateButton({
    Name = "Teleport to Mouse",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0,5,0))
        end
    end
})

SimTab:CreateButton({
    Name = "Kill All NPCs",
    Callback = function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            local h = obj:FindFirstChildOfClass("Humanoid")
            if h and not game.Players:GetPlayerFromCharacter(obj.Parent) then
                h.Health = 0
            end
        end
    end
})

SimTab:CreateTextBox({
    Name = "Target Player",
    PlaceholderText = "Enter player name",
    Callback = function(text)
        SimTab:SetValue("Target", text)
    end
})
SimTab:CreateButton({
    Name = "Freeze Target",
    Callback = function()
        local name = SimTab:GetValue("Target")
        local plr = game.Players:FindFirstChild(name)
        if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local bp = Instance.new("BodyPosition", plr.Character.HumanoidRootPart)
            bp.Position = plr.Character.HumanoidRootPart.Position
            bp.MaxForce = Vector3.new(1e6,1e6,1e6)
        end
    end
})

-- Final Notification
Rayfield:Notify({
    Title = "NUH HUB",
    Content = "All features loaded successfully!",
    Duration = 4
})