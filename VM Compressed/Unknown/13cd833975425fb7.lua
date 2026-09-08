local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer

-- Using the absolute GitHub raw link to prevent loadstring failures
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "AxoEZ Hub",
    LoadingTitle = "AxoEZ Hub",
    LoadingSubtitle = "Please wait...",
    Icon = 0,
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = true,

    ConfigurationSaving = {
        Enabled = false,
        FolderName = "GudockHubConfigs",
        FileName = "MainConfig"
    },

    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = false
    },

    KeySystem = false
})

local Main = Window:CreateTab("Main", 4483362458)
local TeleportTab = Window:CreateTab("Teleport", 4483362458)
local Credits = Window:CreateTab("Credits", 4483362458)

--------------------------------------------------
-- Main Tab Information Section
--------------------------------------------------

Main:CreateSection("Hub Information")

Main:CreateParagraph({
    Title = "AxoEZ Hub",
    Content = "Welcome to AxoEZ Hub! This is our latest hub, and we hope you enjoy using it. Please don't abuse it, as doing so could get you banned depending on the game or its moderators. 100% Free • No Key Required! :)"
})

--------------------------------------------------
-- Teleport Tab Content
--------------------------------------------------

TeleportTab:CreateSection("Location Teleports")

TeleportTab:CreateButton({
    Name = "Teleport Winner Place",
    Callback = function()
        local Character = Player.Character
        if Character then
            local HRP = Character:FindFirstChild("HumanoidRootPart")
            if HRP then
                HRP.CFrame = CFrame.new(
                    274.781708, 347.146271, -33.9083443, 
                    0.0361696742, 0, 0.99934566, 
                    0, 1, 0, 
                    -0.99934566, 0, 0.0361696742
                )
            end
        end
    end,
})

TeleportTab:CreateButton({
    Name = "Teleport Troll Area 1",
    Callback = function()
        local Character = Player.Character
        if Character then
            local HRP = Character:FindFirstChild("HumanoidRootPart")
            if HRP then
                HRP.CFrame = CFrame.new(
                    -73.9552841, 147.146271, -75.9713364,
                    0.00790866744, 8.91219187e-08, -0.999968708,
                    6.97647025e-08, 1, 8.96764689e-08,
                    0.999968708, -7.04700035e-08, 0.00790866744
                )
            end
        end
    end,
})

TeleportTab:CreateButton({
    Name = "Teleport Troll Area 2",
    Callback = function()
        local Character = Player.Character
        if Character then
            local HRP = Character:FindFirstChild("HumanoidRootPart")
            if HRP then
                HRP.CFrame = CFrame.new(
                    -74.0114059, 248.146171, 1.55643821,
                    0.999587595, -9.47094403e-09, 0.02871157204,
                    9.74169634e-09, 1, -9.28881327e-09,
                    -0.02871157204, 9.56475736e-09, 0.999587595
                )
            end
        end
    end,
})

--------------------------------------------------
-- Credits Tab Content
--------------------------------------------------

Credits:CreateSection("Script Information")

Credits:CreateParagraph({
    Title = "Credits",
    Content = "This script was created by BonkChen (Owner) in collaboration with ACTINGLIKESTUDING. A huge thanks to Rayfield for providing the awesome UI library that made this project possible. Thank you for using EZTROLL Hub! "
})

Credits:CreateParagraph({
    Title = "Script Version",
    Content = "Current Build: v2.75 Very Safe, Keyless, No Malicious FREE TO TRY THIS!"
})

--------------------------------------------------
-- Map Cleansing Section (Killparts & Groups)
--------------------------------------------------

Main:CreateSection("Map Cleansing")

Main:CreateButton({
    Name = "Destroy All Damage Parts",
    Callback = function()
        local count = 0
        -- Recursively searches everything inside Workspace
        for _, object in ipairs(workspace:GetDescendants()) do
            if object:IsA("BasePart") and string.match(object.Name, "^KILLPART%-%d+$") then
                object:Destroy()
                count = count + 1
            end
        end
        
        Rayfield:Notify({
            Title = "Damage Parts Destroyed",
            Content = "Successfully destroyed " .. tostring(count) .. " Damage Parts!",
            Duration = 3,
            Image = 4483362458,
        })
    end,
})

Main:CreateButton({
    Name = "Destroy Group Barrier",
    Callback = function()
        local count = 0
        -- Recursively searches for any instance named "Group"
        for _, object in ipairs(workspace:GetDescendants()) do
            if object.Name == "Group" then
                object:Destroy()
                count = count + 1
            end
        end
        
        Rayfield:Notify({
            Title = "Group Barrier Destroyed",
            Content = "Successfully destroyed " .. tostring(count) .. " 'Group Barrier' instances!",
            Duration = 3,
            Image = 4483362458,
        })
    end,
})

--------------------------------------------------
-- Auto Gudock
--------------------------------------------------

Main:CreateSection("Automation Controls")

local Enabled = false
local Tween

Main:CreateToggle({
    Name = "Auto Press Button",
    CurrentValue = false,
    Flag = "AutoGudock",

    Callback = function(Value)
        Enabled = Value

        if Enabled then
            task.spawn(function()
                while Enabled do
                    local Character = Player.Character or Player.CharacterAdded:Wait()
                    local Humanoid = Character:WaitForChild("Humanoid")
                    local HRP = Character:WaitForChild("HumanoidRootPart")

                    local Target = workspace:FindFirstChild("Gudock")

                    if Target then
                        if Target:IsA("BasePart") then
                            Tween = TweenService:Create(
                                HRP,
                                TweenInfo.new(
                                    (HRP.Position - Target.Position).Magnitude / 60,
                                    Enum.EasingStyle.Linear
                                ),
                                {
                                    CFrame = Target.CFrame
                                }
                            )
                        elseif Target:IsA("Model") then
                            Tween = TweenService:Create(
                                HRP,
                                TweenInfo.new(
                                    (HRP.Position - Target:GetPivot().Position).Magnitude / 60,
                                    Enum.EasingStyle.Linear
                                ),
                                {
                                    CFrame = Target:GetPivot()
                                }
                            )
                        end

                        if Tween then
                            Tween:Play()

                            while Enabled and Tween.PlaybackState == Enum.PlaybackState.Playing do
                                Humanoid.Jump = true
                                task.wait(0.1)
                            end
                        end
                    end

                    task.wait()
                end
            end)
        else
            if Tween then
                Tween:Cancel()
            end
        end
    end
})

--------------------------------------------------
-- Auto Troll Parts (Sorted Sequence + Min 7x7 Size & Pyong Filters)
--------------------------------------------------

local TrollEnabled = false
local TrollTween

Main:CreateToggle({
    Name = "Auto Troll 3 Parts",
    CurrentValue = false,
    Flag = "AutoTrollParts",

    Callback = function(Value)
        TrollEnabled = Value

        if TrollEnabled then
            task.spawn(function()
                while TrollEnabled do
                    local Character = Player.Character or Player.CharacterAdded:Wait()
                    local HRP = Character:WaitForChild("HumanoidRootPart", 5)
                    
                    if not HRP then 
                        task.wait(0.5)
                        continue 
                    end

                    HRP.Anchored = true 

                    local Folder = workspace:FindFirstChild("TrollPart1")
                    local Pyong = workspace:FindFirstChild("Pyong")
                    
                    if not Folder or not Pyong then
                        task.wait(0.5)
                        continue 
                    end

                    -- Collect and validate matching parts
                    local ValidParts = {}
                    for _, child in ipairs(Folder:GetChildren()) do
                        if child:IsA("BasePart") and string.find(child.Name, "사라지는 파트") and child.Transparency < 1 then
                            
                            -- Minimum size filter check (at least 7 studs horizontal bounds)
                            local sizeX = child.Size.X
                            local sizeZ = child.Size.Z
                            
                            if sizeX < 7 or sizeZ < 7 then
                                continue
                            end

                            -- Distance verification (must be within 50 studs of Pyong)
                            local distanceToPyong = (child.Position - Pyong.Position).Magnitude
                            if distanceToPyong <= 50 then
                                table.insert(ValidParts, child)
                            end
                        end
                    end

                    -- Sort elements dynamically to maintain correct sequential order (1, 2, 3...)
                    table.sort(ValidParts, function(a, b)
                        local numA = tonumber(string.match(a.Name, "%d+")) or 1
                        local numB = tonumber(string.match(b.Name, "%d+")) or 1
                        return numA < numB
                    end)

                    -- Take a breather if no matched targets are visible right now
                    if #ValidParts == 0 then
                        task.wait(0.1)
                        continue
                    end

                    -- Run the structured path cycle
                    for _, Part in ipairs(ValidParts) do
                        if not TrollEnabled then break end
                        
                        if not Part or not Part:IsDescendantOf(workspace) or Part.Transparency >= 1 then
                            continue
                        end

                        HRP.Anchored = false 

                        TrollTween = TweenService:Create(
                            HRP,
                            TweenInfo.new(
                                (HRP.Position - Part.Position).Magnitude / 60,
                                Enum.EasingStyle.Linear
                            ),
                            {
                                CFrame = Part.CFrame
                            }
                        )

                        TrollTween:Play()
                        
                        while TrollTween.PlaybackState == Enum.PlaybackState.Playing and TrollEnabled do
                            if not Part or not Part:IsDescendantOf(workspace) or Part.Transparency >= 1 then
                                TrollTween:Cancel()
                                break
                            end
                            task.wait(0.05)
                        end

                        HRP.Anchored = true 

                        if not TrollEnabled then break end

                        local delayCounter = 1.25
                        while delayCounter > 0 and TrollEnabled do
                            task.wait(0.1)
                            delayCounter = delayCounter - 0.1
                        end
                    end
                    
                    task.wait(0.05) 
                end

                -- Structural clean up
                local Character = Player.Character
                if Character then
                    local HRP = Character:FindFirstChild("HumanoidRootPart")
                    if HRP then HRP.Anchored = false end
                end
            end)
        else
            if TrollTween then
                TrollTween:Cancel()
            end
            local Character = Player.Character
            if Character then
                local HRP = Character:FindFirstChild("HumanoidRootPart")
                if HRP then HRP.Anchored = false end
            end
        end
    end
})
