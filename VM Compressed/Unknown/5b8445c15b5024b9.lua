local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "JANI HUB",
   LoadingTitle = "👑JANI HUB👑",
   LoadingSubtitle = "by Unknown and Larky",
   ConfigurationSaving = { Enabled = false },
   KeySystem = true,
   KeySettings = {
      Title = "JANI HUB | Key System",
      Subtitle = "Key System",
      Note = "The Key is: FLICKHACK",
      FileName = "JaniHubKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"FLICKHACK"}
   }
})

-- Variables
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local AimbotEnabled = false
local EspEnabled = false
local TeamCheck = false
local FOVRadius = 150

-- Create FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Transparency = 1
FOVCircle.Filled = false
FOVCircle.Visible = false

-- Checks if there is a wall between you and the target
local function IsVisible(TargetPart)
    local Character = LocalPlayer.Character
    if not Character then return false end

    local Params = RaycastParams.new()
    Params.FilterType = Enum.RaycastFilterType.Exclude
    Params.FilterDescendantsInstances = {Character, TargetPart.Parent}

    local Direction = (TargetPart.Position - Camera.CFrame.Position)
    local RaycastResult = workspace:Raycast(Camera.CFrame.Position, Direction, Params)

    return RaycastResult == nil
end

local function GetClosestPlayer()
    local MaxDistance = FOVRadius
    local Target = nil
    local ScreenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer
        and v.Character
        and v.Character:FindFirstChild("Head")
        and v.Character:FindFirstChild("Humanoid")
        and v.Character.Humanoid.Health > 0 then

            if TeamCheck and v.Team == LocalPlayer.Team then continue end

            local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(v.Character.Head.Position)
            if OnScreen then
                local Distance = (ScreenCenter - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                if Distance < MaxDistance and IsVisible(v.Character.Head) then
                    MaxDistance = Distance
                    Target = v
                end
            end
        end
    end
    return Target
end

-- Aimbot + FOV
RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOVCircle.Radius = FOVRadius
    FOVCircle.Visible = AimbotEnabled

    if AimbotEnabled then
        local Target = GetClosestPlayer()
        if Target and Target.Character and Target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, Target.Character.Head.Position)
        end
    end
end)

-- ===== FULL ESP (HIGHLIGHT + NAME) =====
local function UpdateESP()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            local Char = v.Character
            local Head = Char and Char:FindFirstChild("Head")

            if Char and Char:FindFirstChild("HumanoidRootPart") and EspEnabled then

                if TeamCheck and v.Team == LocalPlayer.Team then
                    if Char:FindFirstChild("JaniHighlight") then Char.JaniHighlight:Destroy() end
                    if Head and Head:FindFirstChild("JaniNameESP") then Head.JaniNameESP:Destroy() end
                    continue
                end

                -- Highlight
                local Highlight = Char:FindFirstChild("JaniHighlight")
                if not Highlight then
                    Highlight = Instance.new("Highlight")
                    Highlight.Name = "JaniHighlight"
                    Highlight.Parent = Char
                end

                Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                Highlight.FillColor = Color3.fromRGB(255, 0, 0)
                Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                Highlight.FillTransparency = 1

                -- Name Billboard
                if Head and not Head:FindFirstChild("JaniNameESP") then
                    local Billboard = Instance.new("BillboardGui")
                    Billboard.Name = "JaniNameESP"
                    Billboard.Adornee = Head
                    Billboard.Size = UDim2.new(0, 200, 0, 40)
                    Billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                    Billboard.AlwaysOnTop = true
                    Billboard.LightInfluence = 0
                    Billboard.MaxDistance = 10000
                    Billboard.Parent = Head

                    local Text = Instance.new("TextLabel")
                    Text.Size = UDim2.new(1, 0, 1, 0)
                    Text.BackgroundTransparency = 1
                    Text.BorderSizePixel = 0
                    Text.Text = v.Name
                    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    Text.TextStrokeTransparency = 0
                    Text.Font = Enum.Font.GothamBold
                    Text.Parent = Billboard
                end

            else
                if Char then
                    if Char:FindFirstChild("JaniHighlight") then Char.JaniHighlight:Destroy() end
                    if Head and Head:FindFirstChild("JaniNameESP") then Head.JaniNameESP:Destroy() end
                end
            end
        end
    end
end

task.spawn(function()
    while task.wait(0.1) do
        UpdateESP()
    end
end)

-- UI
local MainTab = Window:CreateTab("Main Hub", 4483362458)

MainTab:CreateToggle({
   Name = "Enable Aimbot",
   CurrentValue = false,
   Callback = function(v) AimbotEnabled = v end,
})

MainTab:CreateSlider({
   Name = "FOV Size",
   Range = {0, 800},
   Increment = 5,
   CurrentValue = 150,
   Callback = function(v) FOVRadius = v end,
})

MainTab:CreateToggle({
   Name = "ESP (Always On)",
   CurrentValue = false,
   Callback = function(v)
      EspEnabled = v
      UpdateESP()
   end,
})

MainTab:CreateToggle({
   Name = "Team Check / Wall Check",
   CurrentValue = false,
   Callback = function(v) TeamCheck = v end,
})
