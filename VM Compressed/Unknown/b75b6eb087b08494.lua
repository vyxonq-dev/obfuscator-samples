local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local HRP, Character, Humanoid

local function refreshCharacter()

    Character = LP.Character or LP.CharacterAdded:Wait()

    HRP = Character:WaitForChild("HumanoidRootPart")

    Humanoid = Character:WaitForChild("Humanoid")

end

refreshCharacter()

LP.CharacterAdded:Connect(refreshCharacter)

local AutoKill = false

local InstantAmmo = false

local TPAllPlayers = false

local StopTP = false

local InfJump = false

local Noclip = false

local ESPSkeleton = false

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()

local UI = ReGui:TabsWindow({Title = "🏆Jogo De tiro l Made by Mjcontegazxc", Size = UDim2.fromOffset(300, 200)})

local TabMain = UI:CreateTab({Name = "Main"})

local mainHeader = TabMain:CollapsingHeader({Title = "Features"})

mainHeader:Checkbox({Label = "Auto Kill", Value = false, Callback = function(_, v) AutoKill = v end})

mainHeader:Checkbox({Label = "Instant Ammo", Value = false, Callback = function(_, v) InstantAmmo = v end})

mainHeader:Checkbox({Label = "TP All Players", Value = false, Callback = function(_, v) TPAllPlayers = v end})

mainHeader:Checkbox({Label = "Stop TP", Value = false, Callback = function(_, v) StopTP = v end})

mainHeader:Checkbox({Label = "Inf Jump", Value = false, Callback = function(_, v) InfJump = v end})

mainHeader:Checkbox({Label = "Noclip", Value = false, Callback = function(_, v) Noclip = v end})

mainHeader:Checkbox({Label = "ESP Skeleton", Value = false, Callback = function(_, v) ESPSkeleton = v end})

local WeaponFired = ReplicatedStorage:WaitForChild("WeaponsSystem"):WaitForChild("Network"):WaitForChild("WeaponFired")

local WeaponHit = ReplicatedStorage:WaitForChild("WeaponsSystem"):WaitForChild("Network"):WaitForChild("WeaponHit")

local LETHAL_DAMAGE = 100

local HEADSHOT_MULTIPLIER = 3

local FIRE_RATE = 0.1

local lastShot = 0

local shotId = 0

local highlightedPlayers = {}

RunService.Heartbeat:Connect(function()

    if AutoKill and Character and tick() - lastShot >= FIRE_RATE then

        local camera = Workspace.CurrentCamera

        local origin = camera.CFrame.Position

        local targetsHit = 0

        local maxTargetsPerFrame = 2

        for _, player in pairs(Players:GetPlayers()) do

            if player ~= LP and player.Character then

                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

                if humanoid and humanoid.Health > 0 then

                    local head = player.Character:FindFirstChild("Head")

                    local torso = player.Character:FindFirstChild("UpperTorso") or player.Character:FindFirstChild("HumanoidRootPart")

                    local target = head or torso

                    if target then

                        local direction = (target.Position - origin)

                        local currentShotId = shotId + 1

                        pcall(function()

                            WeaponFired:FireServer(LP.Character:FindFirstChild("AR") or LP.Character:FindFirstChildOfClass("Tool"), {id = currentShotId, charge = 1, origin = origin, dir = direction.Unit})

                            WeaponHit:FireServer(LP.Character:FindFirstChild("AR") or LP.Character:FindFirstChildOfClass("Tool"), {p = target.Position, pid = 1, part = target, d = target.Name == "Head" and LETHAL_DAMAGE * HEADSHOT_MULTIPLIER or LETHAL_DAMAGE, maxDist = 0.1, h = target, m = target.Material, n = Vector3.new(0, 1, 0), t = tick(), sid = currentShotId})

                        end)

                        lastShot = tick() + math.random(0, 50) / 100

                        shotId = currentShotId

                        targetsHit = targetsHit + 1

                        if targetsHit >= maxTargetsPerFrame then break end

                    end

                end

            end

        end

    end

    if InstantAmmo and Character then

        local backpack = LP.Backpack

        for _, tool in pairs(backpack:GetChildren()) do

            if tool:FindFirstChild("Configuration") and tool:FindFirstChild("Configuration"):FindFirstChild("AmmoCapacity") then

                tool.Configuration.AmmoCapacity.Value = math.huge

            end

        end

    end

    if TPAllPlayers and Character and not StopTP then

        local offset = HRP.CFrame.LookVector * 5 + Vector3.new(0, 2, 0)

        for _, player in pairs(Players:GetPlayers()) do

            if player ~= LP and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

                player.Character.HumanoidRootPart.CFrame = HRP.CFrame + offset

                offset = offset + Vector3.new(0, 0, 5)

            end

        end

    end

    if Noclip and Character then

        for _, part in pairs(Character:GetDescendants()) do

            if part:IsA("BasePart") then

                part.CanCollide = false

            end

        end

    end

    if InfJump and Humanoid and UserInputService:IsKeyDown(Enum.KeyCode.Space) then

        if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then

            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

            task.wait(0.05)

        elseif Humanoid:GetState() == Enum.HumanoidStateType.Running or Humanoid:GetState() == Enum.HumanoidStateType.RunningNoPhysics then

            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

        end

    end

    if ESPSkeleton and Character then

        for _, player in pairs(Players:GetPlayers()) do

            if player ~= LP and player.Character and not highlightedPlayers[player] then

                for _, part in pairs(player.Character:GetDescendants()) do

                    if part:IsA("BasePart") then

                        local highlight = Instance.new("Highlight")

                        highlight.Parent = part

                        highlight.FillColor = Color3.new(0, 1, 0)

                        highlight.FillTransparency = 0.5

                        highlight.OutlineColor = Color3.new(0, 1, 0)

                        highlight.OutlineTransparency = 0

                    end

                end

                highlightedPlayers[player] = true

            end

        end

    end

end)

UserInputService.JumpRequest:Connect(function()

    if InfJump and Humanoid then

        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

    end

end)

LP.CharacterAdded:Connect(function(character)

    character:WaitForChild("Humanoid").Died:Connect(function()

        AutoKill = false

    end)

end)

game.StarterGui:SetCore("SendNotification", {

    Title = "🏆Jogo De tiro Script l Made by Mjcontegazxc",

    Text = "Loaded!",

    Duration = 5

})