getgenv().AutoFarmV2 = true
getgenv().FireTools = true
getgenv().KillAura = true
getgenv().Range = 1000000 -- dont edit this code frfr
getgenv().AutoSpinGift = false -- most anyoning
if game.PlaceId == 79704652105017 then
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local DeathCount = 0
local MaxDeaths = 3
local RestartDelay = 10


    --// Safe Notify
    local function notify(props)
        pcall(function()
            StarterGui:SetCore("SendNotification", props)
        end)
    end

    -- Loading notification
    task.spawn(function()
        notify({Title = "Tenery hub", Text = "Initializing…", Duration = 2})
        for p = 0, 100, 10 do
            notify({
                Title = "Tenery hub",
                Text  = ("Loading… %d%%"):format(p),
                Duration = 0.3
            })
            task.wait(0.15)
        end
    end)

    -- Load required scripts
    loadstring(game:HttpGet("https://raw.githubusercontent.com/norwaylua/Roblox/refs/heads/main/Tools.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/norwaylua/Alwi-script/refs/heads/main/Alua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/norwaylua/Alwi-script/refs/heads/main/Auto%20Reconnect.lua"))()

    --// UI Popup
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui") or game:GetService("CoreGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TeneryHubNotif"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Name = "Container"
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.new(0.5, 0, -0.2, 0)
    frame.Size = UDim2.new(0, 420, 0, 120)
    frame.BackgroundTransparency = 1
    frame.Parent = screenGui

    local panel = Instance.new("Frame")
    panel.Name = "Panel"
    panel.Size = UDim2.new(1, 0, 1, 0)
    panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    panel.BorderSizePixel = 0
    panel.Parent = frame

    local uicorner = Instance.new("UICorner", panel)
    uicorner.CornerRadius = UDim.new(0, 14)

    local outline = Instance.new("Frame")
    outline.Name = "Outline"
    outline.AnchorPoint = Vector2.new(0.5, 0.5)
    outline.Size = UDim2.new(1, 6, 1, 6)
    outline.Position = UDim2.new(0.5, 0, 0.5, 0)
    outline.BackgroundColor3 = Color3.fromRGB(255, 30, 70)
    outline.BorderSizePixel = 0
    outline.ZIndex = panel.ZIndex - 1
    outline.Parent = frame
    Instance.new("UICorner", outline).CornerRadius = UDim.new(0, 18)

    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Size = UDim2.new(0, 72, 0, 72)
    icon.Position = UDim2.new(0, 14, 0.5, -36)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://92639750101948"
    icon.Parent = panel

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(0, 220, 0, 28)
    title.Position = UDim2.new(0, 100, 0, 12)
    title.BackgroundTransparency = 1
    title.Text = "Tenery hub"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = panel

    local desc = Instance.new("TextLabel")
    desc.Name = "Description"
    desc.Size = UDim2.new(0, 220, 0, 48)
    desc.Position = UDim2.new(0, 100, 0, 40)
    desc.BackgroundTransparency = 1
    desc.Text = "This UI Made By Cici Fixed by alwi"
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 16
    desc.TextColor3 = Color3.fromRGB(220, 220, 220)
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.TextWrapped = true
    desc.Parent = panel

    local btnYes = Instance.new("TextButton")
    btnYes.Name = "BtnYes"
    btnYes.Size = UDim2.new(0, 64, 0, 40)
    btnYes.Position = UDim2.new(1, -74, 1, -50)
    btnYes.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btnYes.Font = Enum.Font.GothamBold
    btnYes.Text = "✓"
    btnYes.TextSize = 22
    btnYes.TextColor3 = Color3.fromRGB(245,245,245)
    btnYes.Parent = panel
    Instance.new("UICorner", btnYes).CornerRadius = UDim.new(0, 10)

    local btnNo = btnYes:Clone()
    btnNo.Name = "BtnNo"
    btnNo.Text = "✖"
    btnNo.Position = UDim2.new(1, -148, 1, -50)
    btnNo.Parent = panel

    -- Animations
    TweenService:Create(frame, TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.15, 0)}):Play()

    local function closeAndDestroy()
        TweenService:Create(frame, TweenInfo.new(0.35), {Position = UDim2.new(0.5, 0, -0.25, 0)}):Play()
        delay(0.35, function() pcall(function() screenGui:Destroy() end) end)
    end

    btnNo.MouseButton1Click:Connect(closeAndDestroy)
    btnYes.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/7RMa4VQyPA")
        closeAndDestroy()
    end)

    delay(100, function()
        if screenGui and screenGui.Parent then
            closeAndDestroy()
        end
    end)

    --// AutoFAutoFarm

    for _, v in pairs(workspace.WarMap.Model:GetDescendants()) do
    if v.Name == "KickParts" then
        v:Destroy()
    end
end

local function Notify(msg)
    StarterGui:SetCore("SendNotification", {
        Title = "AutoFarmV2AutoFix",
        Text = msg,
        Duration = 3
    })
end

local function Bypass()
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local teleport = workspace:FindFirstChild("Teleport1")
        if teleport then
            firetouchinterest(hrp, teleport, 0)
            task.wait(0.2)
            firetouchinterest(hrp, teleport, 1)
        end
    end)
end

local farmLoop
local function StopFarm(reason)
    if farmLoop then
        farmLoop:Disconnect()
        farmLoop = nil
    end
    getgenv().AutoFarmV2 = false
    Notify("AutoFarm stopped: " .. reason)
    task.delay(RestartDelay, function()
        DeathCount = 0
        getgenv().AutoFarmV2 = true
        Notify("restarting... running in 10sec")
        task.wait(1.5)
        Bypass()
        StartFarm()
    end)
end

function StartFarm()
    if farmLoop then
        farmLoop:Disconnect()
        farmLoop = nil
    end
    Notify("Farming Started")

    farmLoop = game:GetService("RunService").Heartbeat:Connect(function()
        local success, err = pcall(function()
            if not getgenv().AutoFarmV2 then return end
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChild("Humanoid")
            if not character or not humanoid or humanoid.Health <= 0 then
                if farmLoop then
                    farmLoop:Disconnect()
                    farmLoop = nil
                end
                return
            end

            local hrp = character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            local closestEnemy, shortestDistance = nil, math.huge
            for _, v in pairs(workspace.Enemys:GetChildren()) do
                if v:IsA("Model") then
                    local hum = v:FindFirstChild("Humanoid")
                    local enemyHRP = v:FindFirstChild("HumanoidRootPart")
                    for _, part in pairs(v:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                    if hum and enemyHRP and hum.Health > 0 then
                        local distance = (hrp.Position - enemyHRP.Position).Magnitude
                        if distance < shortestDistance then
                            closestEnemy = v
                            shortestDistance = distance
                        end
                    end
                end
            end

            if closestEnemy then
                local enemyHRP = closestEnemy:FindFirstChild("HumanoidRootPart")
                if enemyHRP then
                    hrp.CFrame = enemyHRP.CFrame + Vector3.new(0, -6.2, 0)
                    local bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                    bv.Velocity = Vector3.new(0, 0, 0)
                    bv.Parent = hrp
                    task.wait()
                    bv:Destroy()
                end
            else
                hrp.CFrame = CFrame.new(-14.7518082, -0.0393581912, -147.224426, 0.999967396, -0.00795417745, -0.00140253874, -5.14597115e-11, 0.173648492, -0.98480767, 0.00807688385, 0.984775603, 0.173642829)
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                bv.Velocity = Vector3.new(0, 0, 0)
                bv.Parent = hrp
                task.wait()
                bv:Destroy()
            end
        end)

        if not success then
            StopFarm("Error detected")
            warn("AutoFarm Error: " .. tostring(err))
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function(char)
    task.spawn(function()
        local humanoid = nil
        repeat
            humanoid = char:FindFirstChild("Humanoid")
            task.wait()
        until humanoid

        humanoid.Died:Connect(function()
            DeathCount += 1
            Notify("Death " .. DeathCount .. "/" .. MaxDeaths)
            if DeathCount >= MaxDeaths then
                StopFarm("Dead =" .. MaxDeaths .. " times")
            end
        end)

        repeat task.wait() until humanoid.Health > 0
        if getgenv().AutoFarmV2 then
            Bypass()
            task.wait(1.5)
            StartFarm()
        end
    end)
end)


    

    --// KillAura
    RunService.RenderStepped:Connect(function()
        if not getgenv().KillAura then return end
        local char = LocalPlayer.Character
        local tool = char and char:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Handle") then
            for _, v in pairs(workspace.Enemys:GetChildren()) do
                local hum, hrp = v:FindFirstChild("Humanoid"), v:FindFirstChild("HumanoidRootPart")
                if hum and hrp and hum.Health > 0 then
                    if LocalPlayer:DistanceFromCharacter(hrp.Position) <= getgenv().Range then
                        tool:Activate()
                        for _, part in ipairs(v:GetChildren()) do
                            if part:IsA("BasePart") then
                                firetouchinterest(tool.Handle, part, 0)
                                firetouchinterest(tool.Handle, part, 1)
                            end
                        end
                    end
                end
            end
        end
    end)

    
    task.spawn(function()
        while task.wait(2) do
            if not getgenv().AutoSpinGift then break end
            local spinSignal = game:GetService("ReplicatedStorage"):WaitForChild("Signals"):WaitForChild("Spin")
            pcall(function() spinSignal:InvokeServer() end)
            for gift = 1, 12 do
                pcall(function()
                    local args = { "Gift" .. gift }
                    game:GetService("ReplicatedStorage").Signals.ClaimGift:FireServer(unpack(args))
                end)
                task.wait(0.2)
            end
        end
    end)
    
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end)







Bypass()
wait(2)
StartFarm()
    
    task.delay(2, function()
        notify({Title = "Tenery hub", Text = "Loaded successfully!", Duration = 4})
    end)
end
