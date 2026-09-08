-- Chargement de Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Récupération des infos et de l'avatar du joueur
local username = LocalPlayer.Name
local displayName = LocalPlayer.DisplayName
local userId = LocalPlayer.UserId
local avatarImg, isReady = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)

-- Création de la fenêtre principale
local Window = Rayfield:CreateWindow({
   Name = "Build A Boat | Auto-Farm",
   LoadingTitle = "Chargement...",
   LoadingSubtitle = "by Assistant",
   ConfigurationSaving = { Enabled = false }
})

-- Affichage de l'utilisateur en haut du menu (sous le titre / au-dessus du premier Tab)
Window:CreateUserTab({
    Name = displayName,
    Username = '"@' .. username .. '"',
    Image = avatarImg
})

-- Variables de contrôle
local autoFarm = false
local farmSpeed = 250
local antiAfkEnabled = true

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

-- Anti-AFK
LocalPlayer.Idled:Connect(function()
    if antiAfkEnabled then
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
end)

-- Physique du perso (Zéro gravité)
local function enableAntiFall(hrp)
    if not hrp:FindFirstChild("FarmVelocity") then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Name = "FarmVelocity"
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Parent = hrp
    end
end

local function disableAntiFall(hrp)
    if hrp and hrp:FindFirstChild("FarmVelocity") then
        hrp.FarmVelocity:Destroy()
    end
end

-- Désactiver collisions
local function disableCollisions(char)
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

-- Fonction Auto-Farm
local function startAutoFarm()
    task.spawn(function()
        while autoFarm do
            pcall(function()
                local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local hrp = char:WaitForChild("HumanoidRootPart", 5)
                local humanoid = char:WaitForChild("Humanoid", 5)

                if hrp and humanoid then
                    enableAntiFall(hrp)

                    local noclipConnection = RunService.Stepped:Connect(function()
                        if autoFarm and char then
                            disableCollisions(char)
                        end
                    end)

                    local stages = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages")
                    
                    -- Parcourir les 10 caves
                    for i = 1, 10 do
                        if not autoFarm then break end
                        
                        local stage = stages:FindFirstChild("CaveStage" .. i)
                        if stage and stage:FindFirstChild("DarknessPart") then
                            local targetPos = stage.DarknessPart.Position + Vector3.new(0, 20, 0)
                            local targetCFrame = CFrame.new(targetPos)
                            
                            local distance = (hrp.Position - targetPos).Magnitude
                            local tweenInfo = TweenInfo.new(distance / farmSpeed, Enum.EasingStyle.Linear)
                            
                            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
                            tween:Play()
                            
                            while tween.PlaybackState == Enum.PlaybackState.Playing do
                                if not autoFarm then
                                    tween:Cancel()
                                    break
                                end
                                task.wait(0.05)
                            end
                        end
                    end

                    -- Coffre final
                    local theEnd = stages:FindFirstChild("TheEnd")
                    if theEnd and theEnd:FindFirstChild("GoldenChest") and autoFarm then
                        local chestTrigger = theEnd.GoldenChest:FindFirstChild("Trigger")
                        if chestTrigger then
                            local distance = (hrp.Position - chestTrigger.Position).Magnitude
                            local tween = TweenService:Create(hrp, TweenInfo.new(distance / farmSpeed, Enum.EasingStyle.Linear), {CFrame = chestTrigger.CFrame})
                            tween:Play()
                            tween.Completed:Wait()
                        end
                    end

                    noclipConnection:Disconnect()
                    disableAntiFall(hrp)
                    task.wait(4)
                end
            end)
            task.wait(1)
        end
    end)
end

-- Onglet principal
local MainTab = Window:CreateTab("Farm Gold", 4483362458)

MainTab:CreateToggle({
   Name = "Activer l'Auto-Farm",
   CurrentValue = false,
   Flag = "AutoFarmToggle",
   Callback = function(Value)
      autoFarm = Value
      if autoFarm then
         startAutoFarm()
      else
         if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
             disableAntiFall(LocalPlayer.Character.HumanoidRootPart)
         end
      end
   end,
})

MainTab:CreateToggle({
   Name = "Anti-AFK",
   CurrentValue = true,
   Flag = "AntiAFKToggle",
   Callback = function(Value)
      antiAfkEnabled = Value
   end,
})

MainTab:CreateSlider({
   Name = "Vitesse de Vol",
   Range = {100, 400},
   Increment = 10,
   Suffix = " Spd",
   CurrentValue = 250,
   Flag = "FarmSpeedSlider",
   Callback = function(Value)
      farmSpeed = Value
   end,
})