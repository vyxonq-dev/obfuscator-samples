-- Load the Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the main window
local Window = Rayfield:CreateWindow({
    Name = "Granny Multiplayer Hub | 30+ Features",
    LoadingTitle = "Initializing Hub...",
    LoadingSubtitle = "by Skid_Gaming",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "GrannyMultiplayerHub",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
})

-- Create Tabs
local MainTab = Window:CreateTab("Main / Movement", 4483362458)
local VisualsTab = Window:CreateTab("Visuals & ESP", 4483362458)
local WorldTab = Window:CreateTab("World & Utility", 4483362458)
local TeleportsTab = Window:CreateTab("Teleports", 4483362458)
local FunTab = Window:CreateTab("Fun & Misc", 4483362458)

--- 1. MAIN / MOVEMENT TAB ---
MainTab:CreateSection("Character Modifications")

-- 1. WalkSpeed Slider
MainTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 150},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(Value)
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end)
    end,
})

-- 2. JumpPower Slider
MainTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 300},
    Increment = 5,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpSlider",
    Callback = function(Value)
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value end)
    end,
})

-- 3. Gravity Modifier
MainTab:CreateSlider({
    Name = "World Gravity",
    Range = {0, 196.2},
    Increment = 5,
    Suffix = "Gravity",
    CurrentValue = 196.2,
    Flag = "GravitySlider",
    Callback = function(Value)
        workspace.Gravity = Value
    end,
})

-- 4. Infinite Jump Toggle
local InfJumpEnabled = false
MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(Value) InfJumpEnabled = Value end,
})
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJumpEnabled then
        pcall(function() game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
    end
end)

-- 5. Noclip Toggle
local NoclipEnabled = false
MainTab:CreateToggle({
    Name = "Noclip (Walk Through Walls)",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value) NoclipEnabled = Value end,
})
game:GetService("RunService").Stepped:Connect(function()
    if NoclipEnabled then
        pcall(function()
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end)
    end
end)

-- 6. Fly Toggle (Fixed & Functional)
local Flying = false
local FlySpeed = 50
MainTab:CreateToggle({
    Name = "Fly Mode",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        Flying = Value
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        if not root or not hum then return end
        
        if Flying then
            hum.PlatformStand = true
            local bg = Instance.new("BodyGyro", root)
            bg.Name = "FlyGyro"
            bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bg.CFrame = root.CFrame
            
            local bv = Instance.new("BodyVelocity", root)
            bv.Name = "FlyVelocity"
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 0, 0)
            
            task.spawn(function()
                while Flying do
                    local cam = workspace.CurrentCamera
                    local moveDir = Vector3.new(0, 0, 0)
                    local uis = game:GetService("UserInputService")
                    
                    if uis:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
                    if uis:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
                    if uis:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
                    if uis:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
                    
                    bv.Velocity = moveDir * FlySpeed
                    bg.CFrame = cam.CFrame
                    task.wait()
                end
                if root:FindFirstChild("FlyVelocity") then root.FlyVelocity:Destroy() end
                if root:FindFirstChild("FlyGyro") then root.FlyGyro:Destroy() end
                hum.PlatformStand = false
            end)
        else
            hum.PlatformStand = false
            if root:FindFirstChild("FlyVelocity") then root.FlyVelocity:Destroy() end
            if root:FindFirstChild("FlyGyro") then root.FlyGyro:Destroy() end
        end
    end,
})

-- 7. Bunny Hop Toggle
local BHopEnabled = false
MainTab:CreateToggle({
    Name = "Auto Bunny Hop",
    CurrentValue = false,
    Flag = "BHop",
    Callback = function(Value) BHopEnabled = Value end,
})
game:GetService("RunService").RenderStepped:Connect(function()
    if BHopEnabled then
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end
end)

-- 8. Sit Anywhere Button
MainTab:CreateButton({
    Name = "Force Sit Character",
    Callback = function()
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.Sit = true end)
    end,
})

-- 9. Platform Stand Toggle
MainTab:CreateToggle({
    Name = "Platform Stand (Float/Freeze State)",
    CurrentValue = false,
    Flag = "PlatformStand",
    Callback = function(Value)
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.PlatformStand = Value end)
    end,
})

-- 10. Reset Character Button
MainTab:CreateButton({
    Name = "Instant Suicide / Reset",
    Callback = function()
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.Health = 0 end)
    end,
})


--- 2. VISUALS & ESP TAB ---
VisualsTab:CreateSection("Lighting & Environment")

-- 11. Fullbright Toggle
VisualsTab:CreateToggle({
    Name = "Fullbright (No Darkness)",
    CurrentValue = false,
    Flag = "Fullbright",
    Callback = function(Value)
        local Lighting = game:GetService("Lighting")
        if Value then
            Lighting.ClockTime = 14
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
        else
            Lighting.ClockTime = 0
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
        end
    end,
})

-- 12. Remove Fog Toggle
VisualsTab:CreateToggle({
    Name = "Remove Atmosphere/Fog",
    CurrentValue = false,
    Flag = "NoFog",
    Callback = function(Value)
        local Lighting = game:GetService("Lighting")
        if Value then
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("Atmosphere") or v:IsA("PostEffect") then v.Enabled = false end
            end
        else
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("Atmosphere") or v:IsA("PostEffect") then v.Enabled = true end
            end
        end
    end,
})

-- 13. Camera FOV Slider
VisualsTab:CreateSlider({
    Name = "Custom Camera FOV",
    Range = {70, 120},
    Increment = 1,
    Suffix = "FOV",
    CurrentValue = 70,
    Flag = "FOVSlider",
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end,
})

-- 14. Granny ESP Highlight Toggle
VisualsTab:CreateToggle({
    Name = "Granny ESP (Highlight Model)",
    CurrentValue = false,
    Flag = "GrannyESP",
    Callback = function(Value)
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("granny") and obj:IsA("Model") then
                if Value then
                    if not obj:FindFirstChild("HighlightBox") then
                        local hl = Instance.new("Highlight", obj)
                        hl.Name = "HighlightBox"
                        hl.FillColor = Color3.fromRGB(255, 0, 0)
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    end
                else
                    if obj:FindFirstChild("HighlightBox") then obj.HighlightBox:Destroy() end
                end
            end
        end
    end,
})

-- 15. Item ESP Highlights
VisualsTab:CreateToggle({
    Name = "Item ESP (Keys, Weapons, Tools)",
    CurrentValue = false,
    Flag = "ItemESP",
    Callback = function(Value)
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Tool") or obj.Name:lower():find("key") or obj.Name:lower():find("padlock") or obj.Name:lower():find("hammer") then
                if Value and (obj:IsA("Model") or obj:IsA("BasePart")) then
                    if not obj:FindFirstChild("ItemHighlight") then
                        local hl = Instance.new("Highlight", obj)
                        hl.Name = "ItemHighlight"
                        hl.FillColor = Color3.fromRGB(0, 255, 0)
                    end
                else
                    if obj:FindFirstChild("ItemHighlight") then obj.ItemHighlight:Destroy() end
                end
            end
        end
    end,
})

-- 16. Player ESP Names Toggle
VisualsTab:CreateToggle({
    Name = "Player NameTags ESP",
    CurrentValue = false,
    Flag = "PlayerESP",
    Callback = function(Value)
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                if Value then
                    if not plr.Character.Head:FindFirstChild("EspTag") then
                        local bg = Instance.new("BillboardGui", plr.Character.Head)
                        bg.Name = "EspTag"
                        bg.Size = UDim2.new(0, 100, 0, 50)
                        bg.AlwaysOnTop = true
                        bg.StudsOffset = Vector3.new(0, 2, 0)
                        local txt = Instance.new("TextLabel", bg)
                        txt.Size = UDim2.new(1, 0, 1, 0)
                        txt.BackgroundTransparency = 1
                        txt.Text = plr.Name
                        txt.TextColor3 = Color3.fromRGB(255, 255, 0)
                        txt.TextScaled = true
                    end
                else
                    if plr.Character.Head:FindFirstChild("EspTag") then plr.Character.Head.EspTag:Destroy() end
                end
            end
        end
    end,
})

-- 17. Freecam Toggle (Basic Client View)
VisualsTab:CreateButton({
    Name = "Toggle Freecam View",
    Callback = function()
        local cam = workspace.CurrentCamera
        if cam.CameraType == Enum.CameraType.Custom then
            cam.CameraType = Enum.CameraType.Scriptable
            Rayfield:Notify({Title = "Freecam", Content = "Camera is now scriptable.", Duration = 2})
        else
            cam.CameraType = Enum.CameraType.Custom
            Rayfield:Notify({Title = "Freecam", Content = "Camera reset to normal.", Duration = 2})
        end
    end,
})

-- 18. Chameleon Skin / Transparency Modifier
VisualsTab:CreateSlider({
    Name = "Local Character Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "Alpha",
    CurrentValue = 0,
    Flag = "CharTrans",
    Callback = function(Value)
        pcall(function()
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = Value
                end
            end
        end)
    end,
})


--- 3. WORLD & UTILITY TAB ---
WorldTab:CreateSection("Server & Environment Control")

-- 19. Print Workspace Map Parts Count
WorldTab:CreateButton({
    Name = "Count Workspace Instances",
    Callback = function()
        local count = #workspace:GetDescendants()
        Rayfield:Notify({Title = "Instance Count", Content = "Total items in workspace: " .. count, Duration = 4})
    end,
})

-- 20. Anti-AFK Script Injector
WorldTab:CreateButton({
    Name = "Enable Anti-AFK (Prevent Kicks)",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        Rayfield:Notify({Title = "Anti-AFK", Content = "Successfully activated!", Duration = 3})
    end,
})

-- 21. Console Item Scanner
WorldTab:CreateButton({
    Name = "Print Interactive Items to F9",
    Callback = function()
        print("--- GRANNY MULTIPLAYER ITEM SCANNER ---")
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Tool") or obj.Name:lower():find("key") or obj.Name:lower():find("item") then
                print("Item Found: " .. obj.Name .. " | Parent: " .. tostring(obj.Parent))
            end
        end
        Rayfield:Notify({Title = "Scan Complete", Content = "Check F9 Developer Console.", Duration = 4})
    end,
})

-- 22. Server Time Changer (Day/Night)
WorldTab:CreateSlider({
    Name = "Server Clock Time",
    Range = {0, 24},
    Increment = 1,
    Suffix = "Hours",
    CurrentValue = 12,
    Flag = "ClockTimeSlider",
    Callback = function(Value)
        game:GetService("Lighting").ClockTime = Value
    end,
})

-- 23. Remove Sound / Mute Environment Audio
WorldTab:CreateToggle({
    Name = "Mute Ambient Sounds",
    CurrentValue = false,
    Flag = "MuteAudio",
    Callback = function(Value)
        for _, sound in pairs(workspace:GetDescendants()) do
            if sound:IsA("Sound") then
                sound.Volume = Value and 0 or 1
            end
        end
    end,
})


--- 4. TELEPORTS TAB ---
TeleportsTab:CreateSection("Map Quick Teleports")

-- 24. Teleport to Spawn Point
TeleportsTab:CreateButton({
    Name = "Teleport to Spawn / Lobby",
    Callback = function()
        pcall(function()
            for _, spawn in pairs(workspace:GetDescendants()) do
                if spawn:IsA("SpawnLocation") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spawn.CFrame + Vector3.new(0, 3, 0)
                    break
                end
            end
        end)
    end,
})

-- 25. Teleport Upwards (Escape Trap)
TeleportsTab:CreateButton({
    Name = "Quick Vertical Up (+15 Studs)",
    Callback = function()
        pcall(function()
            local root = game.Players.LocalPlayer.Character.HumanoidRootPart
            root.CFrame = root.CFrame + Vector3.new(0, 15, 0)
        end)
    end,
})

-- 26. Safe Spot Teleport (High Up)
TeleportsTab:CreateButton({
    Name = "Teleport to Safe Sky Box",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 300, 0)
        end)
    end,
})

-- 27. Teleport to Nearest Player
TeleportsTab:CreateButton({
    Name = "Teleport to Random Teammate",
    Callback = function()
        pcall(function()
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                    break
                end
            end
        end)
    end,
})


--- 5. FUN & MISC TAB ---
FunTab:CreateSection("Miscellaneous Tweaks")

-- 28. Spinbot Toggle
local Spinning = false
FunTab:CreateToggle({
    Name = "Spinbot Character",
    CurrentValue = false,
    Flag = "Spinbot",
    Callback = function(Value)
        Spinning = Value
        task.spawn(function()
            while Spinning do
                pcall(function()
                    local root = game.Players.LocalPlayer.Character.HumanoidRootPart
                    root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(25), 0)
                end)
                task.wait()
            end
        end)
    end,
})

-- 29. Change Player Name Display (Visual Only)
FunTab:CreateButton({
    Name = "Give Custom Tag Header",
    Callback = function()
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Head") then
                if not char.Head:FindFirstChild("CustomTitle") then
                    local bg = Instance.new("BillboardGui", char.Head)
                    bg.Name = "CustomTitle"
                    bg.Size = UDim2.new(0, 200, 0, 50)
                    bg.AlwaysOnTop = true
                    bg.StudsOffset = Vector3.new(0, 3.5, 0)
                    local txt = Instance.new("TextLabel", bg)
                    txt.Size = UDim2.new(1, 0, 1, 0)
                    txt.BackgroundTransparency = 1
                    txt.Text = "[SURVIVOR]"
                    txt.TextColor3 = Color3.fromRGB(0, 255, 255)
                    txt.TextScaled = true
                end
            end
        end)
    end,
})

-- 30. Rejoin Server Button
FunTab:CreateButton({
    Name = "Rejoin Current Server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end,
})

-- 31. Server Hop Button
FunTab:CreateButton({
    Name = "Hop to Different Server",
    Callback = function()
        local ts = game:GetService("TeleportService")
        ts:Teleport(game.PlaceId, game.Players.LocalPlayer)
    end,
})

-- Initial load notification
Rayfield:Notify({
    Title = "Granny Hub Loaded!",
    Content = "All 31+ options loaded successfully.",
    Duration = 5,
    Image = 4483362458,
})