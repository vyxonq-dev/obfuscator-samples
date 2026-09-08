-- ======= AntiExploitLoaded Attribute =======
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
char:SetAttribute("AntiExploitLoaded", false)

-- ======= Loading GUI =======
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoadingGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 200)
Frame.Position = UDim2.new(0.5, -200, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
Frame.BorderSizePixel = 0
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0.3,0)
Title.Position = UDim2.new(0,0,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SABHack"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 36
Title.TextColor3 = Color3.fromRGB(200,200,255)
Title.TextTransparency = 1
Title.Parent = Frame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1,0,0.2,0)
Subtitle.Position = UDim2.new(0,0,0.3,0)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Loading..."
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 20
Subtitle.TextColor3 = Color3.fromRGB(180,180,255)
Subtitle.TextTransparency = 1
Subtitle.Parent = Frame

local ProgressFrame = Instance.new("Frame")
ProgressFrame.Size = UDim2.new(0.8,0,0.1,0)
ProgressFrame.Position = UDim2.new(0.1,0,0.7,0)
ProgressFrame.BackgroundColor3 = Color3.fromRGB(50,50,80)
ProgressFrame.BorderSizePixel = 0
ProgressFrame.Parent = Frame

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0,0,1,0)
ProgressFill.Position = UDim2.new(0,0,0,0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(100,100,255)
ProgressFill.BorderSizePixel = 0
ProgressFill.Parent = ProgressFrame

-- Fade-in animation
local TweenService = game:GetService("TweenService")
TweenService:Create(Frame, TweenInfo.new(1), {BackgroundTransparency=0.2}):Play()
TweenService:Create(Title, TweenInfo.new(1), {TextTransparency=0}):Play()
TweenService:Create(Subtitle, TweenInfo.new(1), {TextTransparency=0}):Play()

-- Animated dots and progress bar
local loading = true
spawn(function()
    local dots = 0
    local progress = 0
    while loading do
        dots = (dots % 3) + 1
        Subtitle.Text = "Loading" .. string.rep(".", dots)
        progress = math.clamp(progress + 0.02,0,1)
        ProgressFill.Size = UDim2.new(progress,0,1,0)
        task.wait(0.05)
    end
end)

task.wait(2.5) -- loading time

-- ======= Load Rayfield =======
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
loading = false
ScreenGui:Destroy()

-- ======= Rayfield Window =======
local Window = Rayfield:CreateWindow({
    Name = "SABHack",
    LoadingTitle = "loads cutley",
    LoadingSubtitle = "Private Server",
    ConfigurationSaving = {Enabled = true, FileName = "MyGameTools"},
    KeySystem = false
})

local Tab = Window:CreateTab("Main")
local Section = Tab:CreateSection("Toggles")

-- ======= Fly Toggle =======
local flying = false
local flyConnection
Section:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(state)
        flying = state
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if flying and hrp then
            flyConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local cam = workspace.CurrentCamera
                local moveDir = Vector3.new()
                local uis = game:GetService("UserInputService")
                if uis:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
                if uis:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
                hrp.Velocity = moveDir.Unit * 50
            end)
        else
            if flyConnection then flyConnection:Disconnect() end
            if hrp then hrp.Velocity = Vector3.zero end
        end
    end
})

-- ======= Noclip Toggle =======
local noclip = false
local noclipConnection
Section:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(state)
        noclip = state
        if noclip then
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                local char = player.Character
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then noclipConnection:Disconnect() end
        end
    end
})

-- ======= Infinite Jump Toggle =======
local infJump = false
local jumpConnection
Section:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJumpToggle",
    Callback = function(state)
        infJump = state
        if infJump then
            jumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                local char = player.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid:ChangeState("Jumping")
                end
            end)
        else
            if jumpConnection then jumpConnection:Disconnect() end
        end
    end
})

-- ======= Plot Selector Dropdown =======
local selectedPlots = {}
local plotNames = {}
for _, plot in ipairs(workspace.Plots:GetChildren()) do
    if plot:IsA("Model") then
        table.insert(plotNames, plot.Name)
    end
end

Section:CreateDropdown({
    Name = "Select Plots",
    Options = plotNames,
    CurrentOption = {},
    MultiSelect = true,
    Flag = "PlotSelector",
    Callback = function(selected)
        selectedPlots = selected
    end
})

-- ======= Auto Steal Toggle =======
local autoSteal = false
local stealLoop
Section:CreateToggle({
    Name = "Auto Steal Sweep",
    CurrentValue = false,
    Flag = "AutoStealToggle",
    Callback = function(state)
        autoSteal = state
        if autoSteal then
            stealLoop = task.spawn(function()
                local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
                local ts = game:GetService("TweenService")
                while autoSteal and hrp do
                    for _, plotName in ipairs(selectedPlots) do
                        if not autoSteal then break end
                        local plot = workspace.Plots:FindFirstChild(plotName)
                        if plot and plot:IsA("Model") and plot.PrimaryPart then
                            local origin = plot.PrimaryPart.Position
                            local offsets = {Vector3.new(-10,3,0), Vector3.new(0,3,10)}
                            for _, offset in ipairs(offsets) do
                                if not autoSteal then break end
                                local goal = {CFrame = CFrame.new(origin + offset)}
                                local tween = ts:Create(hrp, TweenInfo.new(1), goal)
                                tween:Play()
                                tween.Completed:Wait()
                                for _, obj in ipairs(plot:GetDescendants()) do
                                    if obj:IsA("ProximityPrompt") and obj.Parent:IsA("BasePart") then
                                        if (hrp.Position - obj.Parent.Position).Magnitude < 10 then
                                            fireproximityprompt(obj)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    local base = workspace:FindFirstChild("Base")
                    if base and base:IsA("BasePart") then
                        local backGoal = {CFrame = base.CFrame + Vector3.new(0,3,0)}
                        local backTween = ts:Create(hrp, TweenInfo.new(2), backGoal)
                        backTween:Play()
                        backTween.Completed:Wait()
                    end
                    task.wait(2)
                end
            end)
        else
            autoSteal = false
        end
    end
})
