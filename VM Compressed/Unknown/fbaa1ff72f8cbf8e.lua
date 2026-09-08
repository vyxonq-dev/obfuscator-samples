local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Load DrRay
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("Pablo Hub", "Default")

local tab = DrRayLibrary.newTab("Main Stuff", "rbxassetid://7734053424")

-- === ESP ===
local espEnabled = false
local ESP_DISTANCE = 50 -- only show fruits within 50 studs

local function getFruitName(obj)
    if obj.Parent and obj.Parent:IsA("Model") and obj.Parent.Name:lower():find("fruit") then
        return obj.Parent.Name
    elseif obj.Name:lower():find("fruit") then
        return obj.Name
    end
    return nil
end

local function createESP(part, name)
    if part and not part:FindFirstChild("PabloESP") then
        local billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(0, 60, 0, 15)
        billboard.Adornee = part
        billboard.AlwaysOnTop = true
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.Name = "PabloESP"

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.TextColor3 = Color3.fromRGB(200, 150, 255)
        label.TextStrokeTransparency = 0.2
        label.Font = Enum.Font.GothamBold
        label.TextScaled = true
        label.Parent = billboard

        billboard.Parent = part
    end
end

RunService.Heartbeat:Connect(function()
    if espEnabled then
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                local fName = getFruitName(obj)
                if fName then
                    local dist = (obj.Position - hrp.Position).Magnitude
                    if dist <= ESP_DISTANCE then
                        createESP(obj, fName)
                    else
                        if obj:FindFirstChild("PabloESP") then
                            obj.PabloESP:Destroy()
                        end
                    end
                end
            end
        end
    end
end)

tab.newButton("Fruit ESP", "Shows ESP for nearby fruits", function()
    espEnabled = true
end)

-- === Noclip ===
tab.newButton("Noclip", "Walk through walls", function()
    RunService.Stepped:Connect(function()
        if LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

-- === Speed Boost ===
tab.newButton("Speed Boost", "Permanently boost speed", function()
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 60
    end
end)

-- === Teleport to Nearest Fruit Anywhere in Workspace ===
tab.newButton("TP Nearest Fruit", "Teleport to nearest fruit in workspace", function()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local nearestFruit = nil
    local shortestDist = math.huge

    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local fName = getFruitName(obj)
            if fName then
                local dist = (obj.Position - hrp.Position).Magnitude
                if dist < shortestDist then
                    nearestFruit = obj
                    shortestDist = dist
                end
            end
        end
    end

    if nearestFruit then
        LocalPlayer.Character:MoveTo(nearestFruit.Position + Vector3.new(0, 3, 0))
    end
end)