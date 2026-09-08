local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Custom Smooth Intro GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FlingIntro"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999999

if gethui then
    ScreenGui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game:GetService("CoreGui")
else
    ScreenGui.Parent = game:GetService("CoreGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 280)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 1
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 16)
Corner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(70, 130, 255)
Stroke.Thickness = 2
Stroke.Transparency = 1
Stroke.Parent = MainFrame

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0, -20, 0, -20)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 1
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 50)
Title.Position = UDim2.new(0, 20, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Touch Glitch Fling"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 32
Title.TextTransparency = 1
Title.Parent = MainFrame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -60, 0, 60)
Subtitle.Position = UDim2.new(0, 30, 0, 90)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Warning: When you enable the Touch Fling,\nyour character may fling out of the map.\n\nThis is a known bug — you can try to fix it yourself\nor just continue and use the other features."
Subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 18
Subtitle.TextYAlignment = Enum.TextYAlignment.Top
Subtitle.TextTransparency = 1
Subtitle.TextWrapped = true
Subtitle.Parent = MainFrame

local ContinueButton = Instance.new("TextButton")
ContinueButton.Size = UDim2.new(0, 200, 0, 50)
ContinueButton.Position = UDim2.new(0.5, -100, 1, -80)
ContinueButton.BackgroundColor3 = Color3.fromRGB(40, 100, 255)
ContinueButton.BorderSizePixel = 0
ContinueButton.Text = "Continue & Load Script"
ContinueButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ContinueButton.Font = Enum.Font.GothamBold
ContinueButton.TextSize = 20
ContinueButton.BackgroundTransparency = 1
ContinueButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 12)
ButtonCorner.Parent = ContinueButton

local ButtonStroke = Instance.new("UIStroke")
ButtonStroke.Color = Color3.fromRGB(80, 150, 255)
ButtonStroke.Thickness = 2
ButtonStroke.Transparency = 1
ButtonStroke.Parent = ContinueButton

-- Smooth Intro Animation
local TweenService = game:GetService("TweenService")

TweenService:Create(MainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
TweenService:Create(Stroke, TweenInfo.new(1, Enum.EasingStyle.Quart), {Transparency = 0}):Play()
TweenService:Create(Shadow, TweenInfo.new(1, Enum.EasingStyle.Quart), {ImageTransparency = 0.6}):Play()
task.wait(0.3)
TweenService:Create(Title, TweenInfo.new(0.7, Enum.EasingStyle.Back), {TextTransparency = 0}):Play()
task.wait(0.4)
TweenService:Create(Subtitle, TweenInfo.new(0.8, Enum.EasingStyle.Quart), {TextTransparency = 0}):Play()
task.wait(0.3)
TweenService:Create(ContinueButton, TweenInfo.new(0.6, Enum.EasingStyle.Back), {BackgroundTransparency = 0}):Play()
TweenService:Create(ButtonStroke, TweenInfo.new(0.8, Enum.EasingStyle.Quart), {Transparency = 0}):Play()

-- Button Hover Effect
ContinueButton.MouseEnter:Connect(function()
    TweenService:Create(ContinueButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 140, 255)}):Play()
end)
ContinueButton.MouseLeave:Connect(function()
    TweenService:Create(ContinueButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(40, 100, 255)}):Play()
end)

-- Continue to Load Main Script
ContinueButton.MouseButton1Click:Connect(function()
    -- Fade out intro
    TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Stroke, TweenInfo.new(0.6), {Transparency = 1}):Play()
    TweenService:Create(Shadow, TweenInfo.new(0.6), {ImageTransparency = 1}):Play()
    TweenService:Create(Title, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(Subtitle, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(ContinueButton, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    TweenService:Create(ButtonStroke, TweenInfo.new(0.4), {Transparency = 1}):Play()

    task.wait(0.7)
    ScreenGui:Destroy()

    -- NOW LOAD THE MAIN SCRIPT
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local lp = Players.LocalPlayer

    pcall(function()
       settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    end)

    local Window = Rayfield:CreateWindow({
       Name = "Touch Glitch Fling",
       LoadingTitle = "Touch Fling Glitch",
       LoadingSubtitle = "by Grok - Mobile Friendly",
       ConfigurationSaving = {
          Enabled = true,
          FolderName = "TouchFling",
          FileName = "Config"
       },
       KeySystem = false
    })

    local Tab = Window:CreateTab("Main", 4483362458)

    local flingEnabled = false
    local movel = 0.1
    local flingCoroutine = nil

    local function stopFling()
       flingEnabled = false
       if flingCoroutine then
          coroutine.close(flingCoroutine)
          flingCoroutine = nil
       end
    end

    Tab:CreateToggle({
       Name = "Touch Glitch Fling (Glitches up/down on others, normal locally)",
       CurrentValue = false,
       Flag = "TouchGlitchFling",
       Callback = function(Value)
          if Value then
             stopFling()
             flingEnabled = true
             flingCoroutine = coroutine.create(function()
                while flingEnabled do
                   local char = lp.Character
                   local hrp = char and char:FindFirstChild("HumanoidRootPart")
                   if hrp then
                      local vel = hrp.AssemblyLinearVelocity
                      hrp.AssemblyLinearVelocity = vel * 10000 + Vector3.new(0, 10000, 0)
                      RunService.RenderStepped:Wait()
                      hrp.AssemblyLinearVelocity = vel
                      RunService.Stepped:Wait()
                      hrp.AssemblyLinearVelocity = vel + Vector3.new(0, movel, 0)
                      movel = -movel
                   end
                   RunService.Heartbeat:Wait()
                end
             end)
             coroutine.resume(flingCoroutine)
             Rayfield:Notify({
                Title = "Fling Activated",
                Content = "Walk into players to fling them! (Note: May fling yourself out — known bug)",
                Duration = 5,
                Image = 4483362458
             })
          else
             stopFling()
             Rayfield:Notify({
                Title = "Fling Deactivated",
                Content = "Touch fling disabled.",
                Duration = 3,
                Image = 4483362458
             })
          end
       end,
    })

    -- Anti-Fling
    local antiFlingEnabled = false
    local antiFlingCoroutine = nil

    Tab:CreateToggle({
       Name = "Anti-Fling (Prevents others from flinging you)",
       CurrentValue = false,
       Flag = "AntiFling",
       Callback = function(Value)
          if Value then
             antiFlingEnabled = true
             antiFlingCoroutine = coroutine.create(function()
                while antiFlingEnabled do
                   local char = lp.Character
                   local hrp = char and char:FindFirstChild("HumanoidRootPart")
                   local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                   if hrp and humanoid then
                      local moveDir = humanoid.MoveDirection
                      local walkSpeed = humanoid.WalkSpeed
                      local currentVel = hrp.AssemblyLinearVelocity
                      hrp.AssemblyLinearVelocity = Vector3.new(moveDir.X * walkSpeed, currentVel.Y, moveDir.Z * walkSpeed)
                      hrp.AssemblyAngularVelocity = Vector3.zero
                   end
                   RunService.Heartbeat:Wait()
                end
             end)
             coroutine.resume(antiFlingCoroutine)
             Rayfield:Notify({Title = "Anti-Fling ON", Content = "Protected from other flingers!", Duration = 4, Image = 4483362458})
          else
             antiFlingEnabled = false
             if antiFlingCoroutine then coroutine.close(antiFlingCoroutine) end
             Rayfield:Notify({Title = "Anti-Fling OFF", Duration = 3, Image = 4483362458})
          end
       end,
    })

    -- Player List Function
    local function getPlayerNames()
       local names = {}
       for _, plr in ipairs(Players:GetPlayers()) do
          if plr ~= lp and plr.Character then
             table.insert(names, plr.Name)
          end
       end
       table.sort(names)
       return names
    end

    local tpDropdown = Tab:CreateDropdown({
       Name = "Tween Teleport to Player (Click Name)",
       Options = getPlayerNames(),
       CurrentOption = {},
       Flag = "TPPlayer",
       Callback = function(Options)
          local targetName = Options[1]
          local targetPlayer = Players:FindFirstChild(targetName)
          if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
             local myChar = lp.Character
             if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                local myHRP = myChar.HumanoidRootPart
                local targetHRP = targetPlayer.Character.HumanoidRootPart
                local targetCFrame = targetHRP.CFrame * CFrame.new(0, 0, -4)
                TweenService:Create(myHRP, TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
                Rayfield:Notify({Title = "Tween TP", Content = "Teleporting to " .. targetName .. "!", Duration = 3, Image = 4483362458})
             end
          end
       end,
    })

    Tab:CreateButton({
       Name = "🔄 Refresh Player List",
       Callback = function()
          tpDropdown:Refresh(getPlayerNames(), {})
          Rayfield:Notify({Title = "Refreshed", Content = "Player list updated!", Duration = 3, Image = 4483362458})
       end,
    })

    Tab:CreateButton({
       Name = "Teleport to Safe Spot (-7.89, -5.17, 5.06)",
       Callback = function()
          local char = lp.Character
          local hrp = char and char:FindFirstChild("HumanoidRootPart")
          if hrp then
             hrp.CFrame = CFrame.new(-7.891768932342529, -5.1728668212890625, 5.057697772979736)
             Rayfield:Notify({Title = "Teleported!", Content = "Moved to safe spot.", Duration = 3, Image = 4483362458})
          end
       end,
    })

    Tab:CreateParagraph({
       Title = "Info",
       Content = "• Touch Fling may fling you out of map (bug)\n• Use Anti-Fling + Safe Spot TP to recover\n• Tween TP to players works smoothly"
    })

    Rayfield:Notify({
       Title = "Script Loaded!",
       Content = "Touch Glitch Fling ready — use carefully!",
       Duration = 6,
       Image = 4483362458
    })
end)