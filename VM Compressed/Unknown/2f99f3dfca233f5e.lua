game.StarterGui:SetCore("SendNotification", {
    Title = "M.T.C ESP Loaded",
    Text = "WARNING: Feature in development!\nBugs and issues present.",
    Button1 = "OK",
})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("M.T.C ESP", "DarkTheme")

local PlayerTab = Window:NewTab("Player ESP")
local VehicleTab = Window:NewTab("Vehicle ESP")

local PlayerSection = PlayerTab:NewSection("Player Settings")
local VehicleSection = VehicleTab:NewSection("Vehicle Settings")

getgenv().PlayerESP = false
getgenv().VehicleESP = false
getgenv().PlayerTransparency = 0
getgenv().VehicleTransparency = 0.5
getgenv().PlayerLabels = true
getgenv().VehicleLabels = true

PlayerSection:NewToggle("Enable Player ESP", "Toggle player ESP", function(state)
    getgenv().PlayerESP = state
    if not state then
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            if v.Character then
                if v.Character:FindFirstChild("PlayerInfo") then
                    v.Character.PlayerInfo:Destroy()
                end
                if v.Character:FindFirstChild("PlayerHighlight") then
                    v.Character.PlayerHighlight:Destroy()
                end
            end
        end
    end
end)

PlayerSection:NewSlider("Player Transparency", "Adjust player ESP transparency", 100, 50, function(s)
    getgenv().PlayerTransparency = s / 100
end)

PlayerSection:NewToggle("Show Player Labels", "Toggle player name labels", function(state)
    getgenv().PlayerLabels = state
    if not state then
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            if v.Character and v.Character:FindFirstChild("PlayerInfo") then
                v.Character.PlayerInfo:Destroy()
            end
        end
    end
end)

VehicleSection:NewToggle("Enable Vehicle ESP", "Toggle vehicle ESP", function(state)
    getgenv().VehicleESP = state
    if not state then
        local spawnedVehicles = workspace:FindFirstChild("SpawnedVehicles")
        if spawnedVehicles then
            for _, vehicle in pairs(spawnedVehicles:GetChildren()) do
                if vehicle:FindFirstChild("VehicleInfo") then
                    vehicle.VehicleInfo:Destroy()
                end
                if vehicle:FindFirstChild("VehicleHighlight") then
                    vehicle.VehicleHighlight:Destroy()
                end
            end
        end
    end
end)

VehicleSection:NewSlider("Vehicle Transparency", "Adjust vehicle ESP transparency", 100, 50, function(s)
    getgenv().VehicleTransparency = s / 100
end)

VehicleSection:NewToggle("Show Vehicle Labels", "Toggle vehicle name labels", function(state)
    getgenv().VehicleLabels = state
    if not state then
        local spawnedVehicles = workspace:FindFirstChild("SpawnedVehicles")
        if spawnedVehicles then
            for _, vehicle in pairs(spawnedVehicles:GetChildren()) do
                if vehicle:FindFirstChild("VehicleInfo") then
                    vehicle.VehicleInfo:Destroy()
                end
            end
        end
    end
end)



local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function getVehicleColor(name)
    if name:find("Mi%-") then return Color3.fromRGB(0, 255, 0)
    elseif name:find("2S") or name:find("BM%-21") then return Color3.fromRGB(255, 128, 0)
    elseif name:find("T%-") then return Color3.fromRGB(255, 0, 0)
    else return Color3.fromRGB(128, 128, 255) end
end

local function getDistance(pos1, pos2)
    return math.floor((pos1 - pos2).Magnitude)
end

spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().PlayerESP then
                for i,v in pairs(Players:GetChildren()) do
                    if v:IsA("Player") and v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        -- Создаем Highlight для игрока
                        if not v.Character:FindFirstChild("PlayerHighlight") then
                            pcall(function()
                                local ESP = Instance.new("Highlight", v.Character)
                                ESP.Name = "PlayerHighlight"
                                ESP.Adornee = v.Character
                                ESP.FillColor = v.TeamColor.Color
                                ESP.FillTransparency = getgenv().PlayerTransparency
                                ESP.OutlineColor = Color3.fromRGB(255, 255, 255)
                                ESP.OutlineTransparency = 0
                            end)
                        else
                            v.Character.PlayerHighlight.FillTransparency = getgenv().PlayerTransparency
                            v.Character.PlayerHighlight.FillColor = v.TeamColor.Color
                        end
                        
                        -- Создаем текстовую метку если включены лейблы
                        if getgenv().PlayerLabels then
                            if not v.Character:FindFirstChild("PlayerInfo") then
                                local Icon = Instance.new("BillboardGui", v.Character)
                                Icon.Name = "PlayerInfo"
                                Icon.AlwaysOnTop = true
                                Icon.Size = UDim2.new(0, 200, 0, 30)
                                Icon.StudsOffset = Vector3.new(0, 3, 0)
                                
                                local ESPText = Instance.new("TextLabel", Icon)
                                ESPText.Size = UDim2.new(1, 0, 1, 0)
                                ESPText.BackgroundTransparency = 1
                                ESPText.Font = Enum.Font.SciFi
                                ESPText.Text = v.Name
                                ESPText.TextColor3 = v.TeamColor.Color
                                ESPText.TextSize = 14
                                ESPText.TextStrokeTransparency = 0
                                ESPText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                            else
                                local info = v.Character.PlayerInfo
                                if info:FindFirstChild("TextLabel") then
                                    info.TextLabel.TextColor3 = v.TeamColor.Color
                                end
                            end
                        end
                    end
                end
            end
            
            if getgenv().VehicleESP then
                local spawnedVehicles = workspace:FindFirstChild("SpawnedVehicles")
                if spawnedVehicles then
                    for _, vehicle in pairs(spawnedVehicles:GetChildren()) do
                        if vehicle and vehicle:IsA("Model") then
                            local color = getVehicleColor(vehicle.Name)
                            local distance = 0
                            
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                distance = getDistance(LocalPlayer.Character.HumanoidRootPart.Position, vehicle:GetPivot().Position)
                            end
                            
                            
                            if not vehicle:FindFirstChild("VehicleHighlight") then
                                pcall(function()
                                    local ESP = Instance.new("Highlight", vehicle)
                                    ESP.Name = "VehicleHighlight"
                                    ESP.Adornee = vehicle
                                    ESP.FillColor = color
                                    ESP.FillTransparency = getgenv().VehicleTransparency
                                    ESP.OutlineColor = Color3.fromRGB(255, 255, 255)
                                    ESP.OutlineTransparency = 0
                                end)
                            else
                                vehicle.VehicleHighlight.FillTransparency = getgenv().VehicleTransparency
                            end
                            
                            if getgenv().VehicleLabels then
                                if not vehicle:FindFirstChild("VehicleInfo") then
                                    local Icon = Instance.new("BillboardGui", vehicle)
                                    Icon.Name = "VehicleInfo"
                                    Icon.AlwaysOnTop = true
                                    Icon.Size = UDim2.new(0, 250, 0, 30)
                                    Icon.StudsOffset = Vector3.new(0, 5, 0)
                                    
                                    local ESPText = Instance.new("TextLabel", Icon)
                                    ESPText.Size = UDim2.new(1, 0, 1, 0)
                                    ESPText.BackgroundTransparency = 1
                                    ESPText.Font = Enum.Font.SciFi
                                    ESPText.Text = vehicle.Name .. " | " .. distance
                                    ESPText.TextColor3 = color
                                    ESPText.TextSize = 12
                                    ESPText.TextStrokeTransparency = 0
                                    ESPText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                else
                                    local info = vehicle.VehicleInfo
                                    if info:FindFirstChild("TextLabel") then
                                        info.TextLabel.Text = vehicle.Name .. " | " .. distance
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
