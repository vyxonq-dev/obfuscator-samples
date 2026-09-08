local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "V0nder Hub",
   LoadingTitle = "Please wait....",
   LoadingSubtitle = "By djibriloulouo_alt",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "V0nderHubConfig",
      FileName = "MainConfig"
   },
   Discord = { Enabled = false },
   KeySystem = false 
})

-- ==========================================
-- VARIABLES & LOGIQUE
-- ==========================================
local Farming = false
local FarmSpeed = 440
local Player = game.Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

-- ANTI-AFK (Empêche d'être kick après 20min)
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- FONCTION DE STABILISATION (Bloque la physique et la gravité)
local function stabilize(hrp)
    if not hrp then return end
    for _, v in pairs(hrp:GetChildren()) do
        if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then v:Destroy() end
    end
    local bv = Instance.new("BodyVelocity", hrp)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    local bg = Instance.new("BodyGyro", hrp)
    bg.CFrame = hrp.CFrame
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
end

-- FONCTION DE MOUVEMENT (Tween)
local function tweenTo(targetPart)
    if not targetPart or not Player.Character then return end
    local hrp = Player.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        stabilize(hrp) -- Applique la stabilisation avant de bouger
        local duration = (hrp.Position - targetPart.Position).Magnitude / FarmSpeed
        local tween = game:GetService("TweenService"):Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = targetPart.CFrame})
        tween:Play()
        return tween
    end
end

-- ==========================================
-- INTERFACE (TABS)
-- ==========================================
local Tab = Window:CreateTab("Main", "star")
local MiscTab = Window:CreateTab("Misc", "settings")

Tab:CreateSection("Farming Status")

local StatusLabel = Tab:CreateLabel("Status: Idle")

Tab:CreateToggle({
   Name = "Enable Infinite Auto-Farm",
   CurrentValue = false,
   Callback = function(v) 
        Farming = v 
        if not v then StatusLabel:Set("Status: Stopped") end
        
        task.spawn(function()
            while Farming do
                -- Attente du respawn
                StatusLabel:Set("Status: Waiting for Character...")
                if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") or not Player.Character:FindFirstChild("Humanoid") then
                    Player.CharacterAdded:Wait()
                    task.wait(2)
                end

                StatusLabel:Set("Status: Farming Stages...")
                local stages = workspace:FindFirstChild("BoatStages")
                
                if stages then
                    -- Parcours des 10 étapes
                    for i = 1, 10 do
                        if not Farming then break end
                        local st = stages.NormalStages:FindFirstChild("CaveStage"..i)
                        if st and st:FindFirstChild("DarknessPart") then 
                            local tw = tweenTo(st.DarknessPart)
                            if tw then tw.Completed:Wait() end
                        end
                    end
                    
                    -- Coffre final
                    if Farming then 
                        StatusLabel:Set("Status: Collecting Chest...")
                        local endPart = stages.NormalStages:FindFirstChild("TheEnd")
                        if endPart and endPart:FindFirstChild("GoldenChest") then
                            local chest = endPart.GoldenChest.Trigger
                            local twEnd = tweenTo(chest)
                            if twEnd then twEnd.Completed:Wait() end
                            task.wait(8) -- Temps pour recevoir l'or
                        end
                    end
                end

                -- Reset pour recommencer instantanément
                if Farming then 
                    StatusLabel:Set("Status: Resetting...")
                    if Player.Character and Player.Character:FindFirstChild("Humanoid") then 
                        Player.Character.Humanoid.Health = 0 
                    end 
                    task.wait(1)
                end
            end
        end)
   end,
})

Tab:CreateSlider({
   Name = "Farm Speed",
   Range = {50, 1000},
   Increment = 10,
   CurrentValue = 440,
   Callback = function(v) FarmSpeed = v end,
})

-- SECTION UTILS
MiscTab:CreateSection("Utility")

MiscTab:CreateButton({
   Name = "Force Rejoin",
   Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
   end,
})

-- AUTO-REJOIN (En cas de déconnexion)
game:GetService("GuiService").ErrorMessageChanged:Connect(function()
    task.wait(2)
    game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
end)

Rayfield:Notify({
    Title = "V0nder Hub",
    Content = "Script chargé avec succès ! Auto-farm infini prêt.",
    Duration = 5
})
