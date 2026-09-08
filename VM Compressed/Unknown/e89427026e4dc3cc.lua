local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Kronos"))()

local window = library:Window({
    Title = "nighttide.cc",
    Accent = Color3.fromRGB(69, 69, 207),
    Logo = 3610245066,
    ToggleKey = Enum.KeyCode.LeftAlt
})

local tab = window:NewTab({ Logo = 4483345998 })
local tabsection = tab:TabSection({ Title = "ESP & Aimbot" })
local column = tabsection:AddColumn({ Title = "Features" })
local section = column:Section({ Title = "ESP & Aimbot Settings" })

local esp_enabled = false
local fov_enabled = false
local aimbot_enabled = false
local aim_part = "Head"
local fov_circle = Drawing.new("Circle")
local esp_table = {}

local esp_color_enemy = Color3.fromRGB(255, 0, 0)
local esp_color_teammate = Color3.fromRGB(0, 255, 0)
local esp_thickness = 2
local esp_transparency = 0.75

fov_circle.Radius = 100
fov_circle.Color = Color3.fromRGB(255, 255, 255)
fov_circle.Thickness = 2
fov_circle.Filled = false
fov_circle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
fov_circle.Visible = fov_enabled

section:Toggle({
    Text = "Enable ESP",
    State = false,
    Callback = function(state)
        esp_enabled = state
        if not state then
            for _, box in pairs(esp_table) do
                if box.updateBox then
                    box.updateBox = nil
                end
                if box.cleanupBox then
                    box.cleanupBox()
                end
            end
            esp_table = {}
        end
    end
})

section:Toggle({
    Text = "Show FOV",
    State = false,
    Callback = function(state)
        fov_enabled = state
        fov_circle.Visible = fov_enabled
    end
})

section:Slider({
    Text = "FOV",
    Min = 0,
    Max = 500,
    Def = 100,
    Callback = function(value)
        fov_circle.Radius = value
    end
})

section:Toggle({
    Text = "Enable Aimbot",
    State = false,
    Callback = function(state)
        aimbot_enabled = state
    end
})

-- Takım kontrolü için fonksiyon
local function isEnemy(player)
    local localPlayer = game.Players.LocalPlayer
    if player.Team and localPlayer.Team then
        return player.Team ~= localPlayer.Team
    else
        return true
    end
end

-- ESP kutusu oluşturma fonksiyonu
local function createESPBox(character, isEnemy)
    local box = Drawing.new("Square")
    local healthBar = Drawing.new("Line")
    local distanceLabel = Drawing.new("Text")
    local nameLabel = Drawing.new("Text")

    box.Visible = false
    box.Color = isEnemy and esp_color_enemy or esp_color_teammate
    box.Thickness = esp_thickness
    box.Transparency = esp_transparency

    healthBar.Visible = false
    healthBar.Color = Color3.fromRGB(0, 255, 0)
    healthBar.Thickness = 3

    distanceLabel.Visible = false
    distanceLabel.Color = Color3.fromRGB(255, 255, 255)
    distanceLabel.Size = 14
    distanceLabel.Center = true
    distanceLabel.Outline = true
    distanceLabel.Font = Drawing.Fonts.UI

    nameLabel.Visible = false
    nameLabel.Color = Color3.fromRGB(255, 255, 255)
    nameLabel.Size = 14
    nameLabel.Center = true
    nameLabel.Outline = true
    nameLabel.Font = Drawing.Fonts.UI

    local function updateBox()
        if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid").Health > 0 then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChild("Humanoid")
            local playerName = game.Players:GetPlayerFromCharacter(character).Name
            local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)

            if onScreen and esp_enabled then
                local distance = (workspace.CurrentCamera.CFrame.Position - hrp.Position).Magnitude
                local size = Vector3.new(2, 3, 0) * (workspace.CurrentCamera.ViewportSize.Y / distance)
                box.Size = size
                box.Position = Vector2.new(pos.X - size.X / 2, pos.Y - size.Y / 2)
                box.Visible = true

                local healthPercentage = humanoid and (humanoid.Health / humanoid.MaxHealth) or 0
                healthBar.From = Vector2.new(box.Position.X - 6, box.Position.Y + box.Size.Y)
                healthBar.To = Vector2.new(healthBar.From.X, healthBar.From.Y - (box.Size.Y * healthPercentage))
                healthBar.Visible = true

                distanceLabel.Position = Vector2.new(pos.X, pos.Y + box.Size.Y / 2 + 10)
                distanceLabel.Text = string.format("%d Studs", math.floor(distance))
                distanceLabel.Visible = true

                nameLabel.Position = Vector2.new(pos.X, pos.Y - box.Size.Y / 2 - 10)
                nameLabel.Text = playerName
                nameLabel.Visible = true
            else
                box.Visible = false
                healthBar.Visible = false
                distanceLabel.Visible = false
                nameLabel.Visible = false
            end
        else
            box.Visible = false
            healthBar.Visible = false
            distanceLabel.Visible = false
            nameLabel.Visible = false
        end
    end

    local function cleanupBox()
        box:Remove()
        healthBar:Remove()
        distanceLabel:Remove()
        nameLabel:Remove()
        esp_table[character] = nil
    end

    return updateBox, cleanupBox
end

-- Yalnızca düşmanlara kitlenen aimbot hedef belirleme
local function getClosestPlayerToFOV()
    local closestPlayer = nil
    local shortestDistance = fov_circle.Radius

    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game.Players.LocalPlayer and isEnemy(player) then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid").Health > 0 then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)

                if onScreen then
                    local distance = (Vector2.new(pos.X, pos.Y) - fov_circle.Position).Magnitude
                    if distance < shortestDistance then
                        closestPlayer = character
                        shortestDistance = distance
                    end
                end
            end
        end
    end

    return closestPlayer
end

local aimbot_target = nil

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbot_enabled = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbot_enabled = false
        aimbot_target = nil
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        local character = player.Character

        if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid").Health > 0 then
            if not esp_table[character] then
                local updateBox, cleanupBox = createESPBox(character, isEnemy(player))
                esp_table[character] = { updateBox = updateBox, cleanupBox = cleanupBox }
            end
            esp_table[character].updateBox()
        else
            if esp_table[character] then
                esp_table[character].cleanupBox()
            end
        end
    end

    if aimbot_enabled then
        aimbot_target = getClosestPlayerToFOV()
    end

    if aimbot_target then
        local aimPartPosition = aimbot_target:FindFirstChild(aim_part) and aimbot_target[aim_part].Position
        if aimPartPosition then
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, aimPartPosition)
        end
    end
end)
