getgenv().Trustlua = {
    ["CameraLock"] = {
        ["Enabled"] = true,
     },

        ["Camlock Settings"] = {
            ["Smoothness"] = 0.927, -- Unchangable :p
            ["Lock Method"] = "Mouse", -- Mouse Camera
            ["AimPart"] = "UpperTorso", 
            ["Prediction Method"] = {
                ["Prediction"] = 0.273, 
                ["Prediction X"] = 0.1,
                ["Prediction Y"] = 0.1,
                ["AutoPrediction"] = false,
                ["AntiGround"] = false,
            },
        },

        ["Silent"] = {
            ["Enabled"] = true,
        },

        ["Silent Settings"] = {
            ["Prediction"] = 0.1355, 
            ["Hitchance"] = 100, 
            ["AirHitchance"] = 100,   
            ["AutoPrediction"] = true,
            ["AntiGroundShots"] = true,
            ["AimPart"] = "HumanoidRootPart", 
        },

        ["Auto Air Gun"] = {
            ["Enabled"] = false, 
            ["Gun Whitelist"] = {
                ["Double-Barrel SG"] = true,
                ["TacticalShotgun"] = true,
                ["Revolver"] = false,
            },
    },

    ["360"] = {
        ["RotationSpeed"] = 1000000,
    },

    ["AutoAir"] = {
        ["AirType"] = Freefall,
        ["AimPart"] = "LowerTorso",
        ["Air Prediction"] = 0.1,
        ["Air Smoothness"] = 0.1,
    },
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/glokdraco/Loaders/d2c4e27a5e159b8226b21f6d0287bb21220b0ef8/OFFMUD2GRETTOLIB"))()
local Window = Library:CreateWindow("trust.lua | v0.0.1 [BETA]", Vector2.new(300, 300), Enum.KeyCode.V)

local AimingTab = Window:CreateTab("AimBots")
local trust = AimingTab:CreateSector("MAIN", "left")

trust:AddButton(
    "trust.lua",
    function()
        loadstring(game:HttpGet("https://pastefy.app/hzQNHH36/raw"))()
    end
)

trust:AddButton(
    "new camlock (new version of trust.lua)",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/glokdraco/ghekko/refs/heads/main/loader"))()
    end
)

local Settings = AimingTab:CreateSector("Settings", "left")

Settings:AddTextbox(
    "Prediction",
    0.273,
    function(State)
        local Prediction = State
    end
)

Settings:AddTextbox(
    "X Prediction",
    0.1,
    function(State)
        getgenv().PredictionX = State
    end
)

Settings:AddTextbox(
    "Y Prediction",
    0.1,
    function(State)
        getgenv().PredictionY = State
    end
)

Settings:AddTextbox(
    "Smoothness (not done)",
    0.4,
    function(State)
        local Smoothness = State
    end
)

Settings:AddToggle(
    "Auto Air",
    false,
    function(first)
        local Locked = first
    end
)

Settings:AddToggle(
    "Auto Pred",
    false,
    function(first)
        getgenv().AutoPred = first
    end
)

Settings:AddToggle(
    "AntiGround Shot",
    false,
    function(first)
        getgenv().AntiGround = first
    end
)

local trust2 = AimingTab:CreateSector("MAIN 2", "right")

trust2:AddButton(
    "trust.lua auto air",
    function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = game.Players.LocalPlayer:GetMouse()
local Airshot = false
local AirPrediction = 0.13241123311111111
local AirSmoothness = 0.2
local AirSmoothEnabled = true
local AutoAir = true
local EnemyAir = true
local AirshotMaterial = Part -- Move, Around, Jumps, Nothing
local JumpCheck = true
local Jump = -0.92
local Fall = -1.91
local AutoAirType = Enum.HumanoidStateType.Freefall

-- Function to remove ESP chams
local function removeCham(cham)
    if cham then
        cham:Destroy()
    end
end

local currentCham

function FindNearestEnemy()
    local ClosestDistance, ClosestPlayer = math.huge, nil
    local CenterPosition = Vector2.new(game:GetService("GuiService"):GetScreenResolution().X / 2, game:GetService("GuiService"):GetScreenResolution().Y / 2)

    for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
        if Player ~= LocalPlayer then
            local Character = Player.Character
            if Character and Character:FindFirstChild("HumanoidRootPart") and Character.Humanoid.Health > 0 then
                local Position, IsVisibleOnViewport = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Position)

                if IsVisibleOnViewport then
                    local Distance = (CenterPosition - Vector2.new(Position.X, Position.Y)).Magnitude
                    if Distance < ClosestDistance then
                        ClosestPlayer = Character.HumanoidRootPart
                        ClosestDistance = Distance
                    end
                end
            end
        end
    end

    return ClosestPlayer
end

local enemy = nil

-- Function to aim the camera at the nearest enemy's HumanoidRootPart
RunService.Heartbeat:Connect(function()
    if CamlockState == true then
        if enemy then
            local camera = workspace.CurrentCamera
            local targetCFrame = CFrame.new(camera.CFrame.p, enemy.Position + enemy.Velocity * Prediction)
            if SmoothEnabled then
                camera.CFrame = camera.CFrame:Lerp(targetCFrame, Smoothness)
            else
                camera.CFrame = targetCFrame
            end
        end
    end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "Dukeshadow"
gui.Parent = game.CoreGui

local TextButton = Instance.new("TextButton")
TextButton.Text = "Auto Air"
TextButton.TextSize = 25
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Dark shade of black
TextButton.BorderColor3 = Color3.new(0, 0, 0) -- Slightly lighter shade of black
TextButton.BorderSizePixel = 4
TextButton.BackgroundTransparency = 1
TextButton.Font = Enum.Font.Code
TextButton.Size = UDim2.new(0.2, 0, 0.2, 0)
TextButton.Position = UDim2.new(0, 0.9, 0.4, 1)
local state = true

TextButton.MouseButton1Click:Connect(function()
    state = not state
    if not state then
        TextButton.Text = "Auto Air"
TextButton.TextColor3 = Color3.new(0, 255, 255)
        if AutoAir then
            Air.Parent = true
            enabledairshot = true
            AutoAir = Freefall
            Plr = AirToPlayer()
            AirMaterial(Material.Auto.Air)
            Airshot = true
            enemyair = true
        end
    else
        TextButton.Text = "Auto Air"
TextButton.TextColor3 = Color3.new(1, 1, 1)
        if AutoAir then
            AirMaterial(Material.Auto.Air)
            Airshot = nil
            enemyair = nil
        end
        enemy = nil
    end
end)
TextButton.Parent = gui
TextButton.Draggable = true

local cornerUI = Instance.new("UICorner")
cornerUI.CornerRadius = UDim.new(0, 10)
cornerUI.Parent = TextButton
    end
)

local pekpek = AimingTab:CreateSector("Settings", "right")

pekpek:AddTextbox(
    "Air Prediction",
    0.1,
    function(State)
        local AirPrediction = State
    end
)

pekpek:AddTextbox(
    "Air Smoothness",
    0.1,
    function(State)
        local AirSmoothness = State
    end
)

local gay = AimingTab:CreateSector("MAIN 3", "right")

gay:AddButton(
    "trust.lua 360",
    function()
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/cat"))()
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CameraRotationGui"
screenGui.ResetOnSpawn = false  -- Ensures the GUI doesn't reset on player respawn
screenGui.Enabled = true  -- Start hidden
screenGui.Parent = playerGui

local outerSize = 150  -- Adjust this value to change the size of the outer frame (width only)
local outerHeight = 60  -- Adjust this value for the height of the outer frame
local halfOuterSize = outerSize / 2

local outerFrame = Instance.new("Frame")
outerFrame.Name = "OuterFrame"
outerFrame.Size = UDim2.new(0, outerSize, 0, outerHeight)  -- Size of the outer frame
outerFrame.Position = UDim2.new(0.5, -halfOuterSize, 0, 0)  -- Centered position of the frame
outerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black color
outerFrame.BorderSizePixel = 2
outerFrame.BackgroundTransparency = 1
outerFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)  -- White border color
outerFrame.Parent = screenGui

local frame = Instance.new("Frame")
frame.Name = "ControlFrame"
frame.Size = UDim2.new(0, 102, 0, 66)  -- Reduced width of the frame
frame.Position = UDim2.new(0.6, -300, 0, 1)  -- Centered position within the outer frame
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Background color
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 1
frame.Parent = outerFrame

local button = Instance.new("TextButton")
button.Name = "360"
button.Size = UDim2.new(1, 0, 1, 0)
button.Position = UDim2.new(0, 0, 0, 0)
button.TextSize = 18
button.Text = "360"
button.Parent = frame
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text color
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black background color

local Toggle = false
local RotationSpeed = 10000 -- Degrees per second
local Keybind = Enum.KeyCode.R -- Change this to your desired keybind

local LastRenderTime = 0
local FullCircleRotation = 2 * math.pi
local TotalRotation = 0
local InitialCFrame

local function OnButtonClick()
    Toggle = not Toggle
    if Toggle then
        InitialCFrame = Camera.CFrame
    else
        Camera.CFrame = InitialCFrame
        TotalRotation = 0
    end
    button.Text = Toggle and "360" or "360"
end

button.MouseButton1Click:Connect(OnButtonClick)

local function OnKeyPress(Input, GameProcessedEvent)
    if Input.KeyCode == Keybind and not GameProcessedEvent then 
        Toggle = not Toggle
        if Toggle then
            InitialCFrame = Camera.CFrame
        else
            Camera.CFrame = InitialCFrame
            TotalRotation = 0
        end
        button.Text = Toggle and "360" or "360"
    end
end

UserInputService.InputBegan:Connect(OnKeyPress)

local function RotateCamera()
    if Toggle then
        local CurrentTime = tick()
        local TimeDelta = math.min(CurrentTime - LastRenderTime, 0.01)
        LastRenderTime = CurrentTime

        local Rotation = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(RotationSpeed * TimeDelta))
        Camera.CFrame = Camera.CFrame * Rotation

        TotalRotation = TotalRotation + math.rad(RotationSpeed * TimeDelta)
        if TotalRotation >= FullCircleRotation then
            Toggle = false
            Camera.CFrame = InitialCFrame
            TotalRotation = 0
            button.Text = "360"
        end
    end
end

RunService.RenderStepped:Connect(RotateCamera)

local function enableDrag(frame)
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
            update(dragInput)
        end
    end)
end

enableDrag(outerFrame)
    end
)

local Settings100 = AimingTab:CreateSector("Settings", "right")

Settings100:AddTextbox(
    "Rotate Speed",
    10000,
    function(State)
        local RotationSpeed = State
    end
)

-- { Function } --

    if getgenv().AutoPred == true then
        pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        split = string.split(pingvalue, "(")
        ping = tonumber(split[1])
        if ping < 225 then
            getgenv().Prediction = 1.4
        elseif ping < 215 then
            getgenv().Prediction = 0.24
        elseif ping < 205 then
            getgenv().Prediction = 0.209
        elseif ping < 190 then
            getgenv().Prediction = 0.18474
        elseif ping < 180 then
            getgenv().Prediction = 0.177
        elseif ping < 170 then
            getgenv().Prediction = 0.174
        elseif ping < 160 then
            getgenv().Prediction = 0.17
        elseif ping < 150 then
            getgenv().Prediction = 0.165
        elseif ping < 140 then
            getgenv().Prediction = 0.165
        elseif ping < 130 then
            getgenv().Prediction = 0.165
        elseif ping < 120 then
            getgenv().Prediction = 0.155
        elseif ping < 110 then
            getgenv().Prediction = 0.155
        elseif ping < 105 then
            getgenv().Prediction = 0.149533
        elseif ping < 90 then
            getgenv().Prediction = 0.146373
        elseif ping < 80 then
            getgenv().Prediction = 0.14211
        elseif ping < 70 then
            getgenv().Prediction = 0.136354
        elseif ping < 60 then
            getgenv().Prediction = 0.1343
        elseif ping < 50 then
            getgenv().Prediction = 0.12846
        elseif ping < 40 then
            getgenv().Prediction = 0.126
        elseif ping < 30 then
            getgenv().Prediction = 0.12
        elseif ping < 20 then
            getgenv().Prediction = 0.11
        end
    end

    if getgenv().AntiGround == true then
        local currentvelocity = player.Character.HumanoidRootPart.Velocity
        player.Character.HumanoidRootPart.Velocity =
            Vector3.new(currentvelocity.X, currentvelocity.Y / 0.5, currentvelocity.Z)
    end

if Trustlua.AutoAir.AirType == true then
    if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        Trustlua.AutoAir.AimPart = "RightFoot"
    else
        Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
            if new == Enum.HumanoidStateType.Freefall then
                settings.main.Part = "RightFoot"
            else
                Trustlua.AutoAir.AimPart = "LowerTorso"
            end
        end)
    end
end
