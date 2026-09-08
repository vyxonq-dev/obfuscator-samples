local ok, WindUI = pcall(function()
    return loadstring(game:HttpGet(
        "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
    ))()
end)

if not ok or not WindUI then
    warn("Erro ao carregar WindUI")
    return
end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Global variables
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- Aimbot variables
local aimbotEnabled = false
local aimbotTarget = nil

-- ESP variables
local espLineEnabled = false
local espHealthEnabled = false
local espBoxEnabled = false
local espDistanceEnabled = false
local espNickEnabled = false
local espDrawings = {} -- Table to store Drawing objects

-- PVP variables
local pvpEnabled = false
local pvpTarget = nil
local pvpTargetCharacter = nil

-- Anti-Kick/Anti-Ban
local antiKickEnabled = true
local antiBanEnabled = true

----------------------------------------------------------------
-- THEME
----------------------------------------------------------------

WindUI:AddTheme({
    Name = "YellowPurple Theme",

    Background = Color3.fromRGB(255,255,0),
    WindowBackground = Color3.fromRGB(255,255,0),
    DialogBackground = Color3.fromRGB(255,255,0),
    TabBackground = Color3.fromRGB(255,255,0),
    ElementBackground = Color3.fromRGB(255,255,0),

    Accent = Color3.fromRGB(128,0,128),
    Outline = Color3.fromRGB(128,0,128),

    Text = Color3.fromRGB(0,0,0),
    Placeholder = Color3.fromRGB(40,40,40),

    Button = Color3.fromRGB(128,0,128),
    Icon = Color3.fromRGB(128,0,128),

    Hover = Color3.fromRGB(230,230,0),

    DialogButton = Color3.fromRGB(128,0,128),
    DialogButtonText = Color3.fromRGB(255,255,255),
})

WindUI:SetTheme("YellowPurple Theme")

----------------------------------------------------------------
-- AVATAR
----------------------------------------------------------------

local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size150x150

local avatar = Players:GetUserThumbnailAsync(
    LocalPlayer.UserId,
    thumbType,
    thumbSize
)

----------------------------------------------------------------
-- WINDOW
----------------------------------------------------------------

local Window = WindUI:CreateWindow({
    Title = "KASIS999 HUB ADMIN│",
    Icon = "shield",
    Author = "By Kasis999/solo",

    Folder = "KASIS999HUB",

    Size = UDim2.fromOffset(580, 460),

    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),

    Transparent = true,
    Theme = "YellowPurple Theme",

    Resizable = true,

    SideBarWidth = 200,

    BackgroundImageTransparency = 0.15,

    HideSearchBar = true,
    ScrollBarEnabled = false,

    Background = "rbxassetid://95838137826075",

    User = {
        Enabled = true,
        Anonymous = false,

        Title = LocalPlayer.Name,
        Avatar = avatar,

        Callback = function()
            Window:Dialog({
                Title = "Perfil do Usuário",

                Content =
                    "Nome: "..LocalPlayer.Name..
                    "\nID: "..LocalPlayer.UserId..
                    "\nCargo: Admin",

                Buttons = {
                    {
                        Title = "OK",

                        Callback = function()
                        end
                    }
                }
            }):Show()
        end
    }
})

----------------------------------------------------------------
-- MAIN TAB
----------------------------------------------------------------

local PrincipalTab = Window:AddTab("Principal")

PrincipalTab:AddToggle({
    Title = "Presets v2 (Aimbot)",

    Default = false,

    Callback = function(state)
        aimbotEnabled = state
        print("Aimbot (Presets v2) Ativado: ", aimbotEnabled)
    end
})

-- Aimbot Logic
RunService.RenderStepped:Connect(function()
    if aimbotEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local closestTarget = nil
        local minDistance = math.huge

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Torso") then
                local targetTorso = player.Character:FindFirstChild("Torso")
                local distance = (RootPart.Position - targetTorso.Position).Magnitude

                if distance < minDistance then
                    minDistance = distance
                    closestTarget = targetTorso
                end
            end
        end

        if closestTarget then
            aimbotTarget = closestTarget
            local targetPos = aimbotTarget.Position
            local camera = Workspace.CurrentCamera
            if camera then
                camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
            end
        else
            aimbotTarget = nil
        end
    end
end)

----------------------------------------------------------------
-- ESP TAB
----------------------------------------------------------------

local ESPTab = Window:AddTab("ESP")

ESPTab:AddToggle({
    Title = "ESP Line",

    Default = false,

    Callback = function(state)
        espLineEnabled = state
        print("ESP Line Ativado: ", espLineEnabled)
    end
})

ESPTab:AddToggle({
    Title = "ESP Health",

    Default = false,

    Callback = function(state)
        espHealthEnabled = state
        print("ESP Health Ativado: ", espHealthEnabled)
    end
})

ESPTab:AddToggle({
    Title = "ESP Box",

    Default = false,

    Callback = function(state)
        espBoxEnabled = state
        print("ESP Box Ativado: ", espBoxEnabled)
    end
})

ESPTab:AddToggle({
    Title = "ESP Distance",

    Default = false,

    Callback = function(state)
        espDistanceEnabled = state
        print("ESP Distance Ativado: ", espDistanceEnabled)
    end
})

ESPTab:AddToggle({
    Title = "ESP Nick",

    Default = false,

    Callback = function(state)
        espNickEnabled = state
        print("ESP Nick Ativado: ", espNickEnabled)
    end
})

-- ESP Logic (using Drawing objects)
RunService.RenderStepped:Connect(function()
    -- Clear previous drawings
    for _, drawing in pairs(espDrawings) do
        drawing:Remove()
    end
    espDrawings = {}

    if not (espLineEnabled or espHealthEnabled or espBoxEnabled or espDistanceEnabled or espNickEnabled) then return end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local char = player.Character
            local root = char:FindFirstChild("HumanoidRootPart")
            local head = char:FindFirstChild("Head")
            local humanoid = char:FindFirstChildOfClass("Humanoid")

            if root and head and humanoid and humanoid.Health > 0 then
                local screenPos, onScreen = Workspace.CurrentCamera:WorldToScreenPoint(root.Position)
                if onScreen then
                    local screenHeadPos, _ = Workspace.CurrentCamera:WorldToScreenPoint(head.Position)

                    -- ESP Line
                    if espLineEnabled then
                        local line = Drawing.new("Line")
                        line.From = Vector2.new(game.Players.LocalPlayer.PlayerGui.ScreenGui.AbsoluteSize.X / 2, game.Players.LocalPlayer.PlayerGui.ScreenGui.AbsoluteSize.Y)
                        line.To = Vector2.new(screenPos.X, screenPos.Y)
                        line.Color = Color3.fromRGB(255, 255, 255)
                        line.Thickness = 1
                        line.Visible = true
                        table.insert(espDrawings, line)
                    end

                    -- ESP Box
                    if espBoxEnabled then
                        local boxHeight = screenPos.Y - screenHeadPos.Y
                        local boxWidth = boxHeight / 2
                        local box = Drawing.new("Square")
                        box.Position = Vector2.new(screenHeadPos.X - boxWidth / 2, screenHeadPos.Y)
                        box.Size = Vector2.new(boxWidth, boxHeight)
                        box.Color = Color3.fromRGB(255, 0, 0)
                        box.Thickness = 1
                        box.Filled = false
                        box.Visible = true
                        table.insert(espDrawings, box)
                    end

                    -- ESP Health
                    if espHealthEnabled and humanoid then
                        local healthBarHeight = screenPos.Y - screenHeadPos.Y
                        local healthBarWidth = 5
                        local healthRatio = humanoid.Health / humanoid.MaxHealth

                        local healthBarBg = Drawing.new("Square")
                        healthBarBg.Position = Vector2.new(screenHeadPos.X - (boxWidth / 2) - healthBarWidth - 2, screenHeadPos.Y)
                        healthBarBg.Size = Vector2.new(healthBarWidth, healthBarHeight)
                        healthBarBg.Color = Color3.fromRGB(50, 50, 50)
                        healthBarBg.Filled = true
                        healthBarBg.Visible = true
                        table.insert(espDrawings, healthBarBg)

                        local healthBar = Drawing.new("Square")
                        healthBar.Position = Vector2.new(screenHeadPos.X - (boxWidth / 2) - healthBarWidth - 2, screenHeadPos.Y + (healthBarHeight * (1 - healthRatio)))
                        healthBar.Size = Vector2.new(healthBarWidth, healthBarHeight * healthRatio)
                        healthBar.Color = Color3.fromRGB(0, 255, 0)
                        healthBar.Filled = true
                        healthBar.Visible = true
                        table.insert(espDrawings, healthBar)

                        local healthText = Drawing.new("Text")
                        healthText.Text = tostring(math.floor(humanoid.Health))
                        healthText.Position = Vector2.new(screenHeadPos.X - (boxWidth / 2) - healthBarWidth - 2, screenHeadPos.Y - 15)
                        healthText.Color = Color3.fromRGB(255, 255, 255)
                        healthText.Size = 12
                        healthText.Visible = true
                        table.insert(espDrawings, healthText)
                    end

                    -- ESP Distance
                    if espDistanceEnabled then
                        local distance = math.floor((RootPart.Position - root.Position).Magnitude)
                        local distText = Drawing.new("Text")
                        distText.Text = tostring(distance) .. "m"
                        distText.Position = Vector2.new(screenPos.X, screenPos.Y + 5)
                        distText.Color = Color3.fromRGB(255, 255, 0)
                        distText.Size = 12
                        distText.Visible = true
                        table.insert(espDrawings, distText)
                    end

                    -- ESP Nick
                    if espNickEnabled then
                        local nickText = Drawing.new("Text")
                        nickText.Text = player.Name
                        nickText.Position = Vector2.new(screenHeadPos.X, screenHeadPos.Y - 20)
                        nickText.Color = Color3.fromRGB(0, 255, 255)
                        nickText.Size = 14
                        nickText.Visible = true
                        table.insert(espDrawings, nickText)
                    end
                end
            end
        end
    end
end)

----------------------------------------------------------------
-- PVP TAB
----------------------------------------------------------------

local PVPTab = Window:AddTab("PVP")

local function GetPlayersList()
    local list = {}

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(list, player.Name)
        end
    end

    return list
end

local PlayerDropdown = PVPTab:AddDropdown({
    Title = "Selecionar Jogador",

    Values = GetPlayersList(),

    Callback = function(selectedName)
        pvpTarget = Players:FindFirstChild(selectedName)
        if pvpTarget then
            print("PVP Target Selecionado: " .. pvpTarget.Name)
        end
    end
})

local function UpdateDropdown()
    PlayerDropdown:SetValues(GetPlayersList())
end

Players.PlayerAdded:Connect(UpdateDropdown)
Players.PlayerRemoving:Connect(UpdateDropdown)

PVPTab:AddToggle({
    Title = "Teleport/Grudar",

    Default = false,

    Callback = function(state)
        pvpEnabled = state
        if pvpEnabled and pvpTarget then
            pvpTargetCharacter = pvpTarget.Character or pvpTarget.CharacterAdded:Wait()
        else
            pvpTargetCharacter = nil
        end
        print("Teleport/Grudar Ativado: ", pvpEnabled)
    end
})

-- PVP Logic (Teleport/Grudar)
RunService.Heartbeat:Connect(function()
    if pvpEnabled and pvpTarget and pvpTargetCharacter and pvpTargetCharacter:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetRoot = pvpTargetCharacter:FindFirstChild("HumanoidRootPart")
        local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

        if targetRoot and myRoot then
            -- Teleport slightly behind the target
            myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 3) 
        end
    end
end)

----------------------------------------------------------------
-- CONFIG TAB (Anti-Kick/Anti-Ban)
----------------------------------------------------------------

local ConfigTab = Window:AddTab("Config")

-- Anti-Kick: Prevents the client from being kicked by common server-side checks.
-- This often involves spoofing client-side values or preventing certain events from firing.
-- Note: This is highly game-dependent and may not work in all scenarios.

-- Hooking the __namecall metamethod to intercept function calls.
-- This is a common technique in Roblox exploits to prevent certain actions.
local old_namecall = nil
old_namecall = hookmetamethod(game, "__namecall", function(...)
    local method = getnamecallmethod()
    local args = {...}

    -- Example: Prevent the 'Kick' method from being called on the LocalPlayer.
    -- This is a basic form of anti-kick. More advanced anti-kicks might involve
    -- checking the arguments of the kick to see if it's a legitimate kick or an exploit-triggered one.
    if antiKickEnabled and method == "Kick" and args[1] == LocalPlayer then
        print("Anti-Kick: Prevented a kick attempt on LocalPlayer.")
        return nil -- Prevent the original kick function from executing.
    end

    -- Example: Prevent certain remote events that might be used by anti-cheat systems
    -- to detect exploits or kick players. This requires specific knowledge of the game.
    -- if antiBanEnabled and method == "FireServer" and args[1] and args[1].Name == "SomeAntiCheatRemote" then
    --     print("Anti-Ban: Blocked 'SomeAntiCheatRemote' FireServer call.")
    --     return nil
    -- end

    -- Always call the original method if it's not something we want to block.
    return old_namecall(...)
end)

ConfigTab:AddToggle({
    Title = "Anti-Kick",
    Default = true,
    Callback = function(state)
        antiKickEnabled = state
        print("Anti-Kick Ativado: ", antiKickEnabled)
    end
})

-- Anti-Ban: More complex, often involves bypassing server-side anti-cheat systems.
-- This is generally harder to implement effectively and can be detected.
-- A robust Anti-Ban would involve analyzing network traffic and selectively blocking/modifying packets.
-- This is beyond the scope of a simple Lua script and often requires external tools or deeper understanding of the game engine.

ConfigTab:AddButton({
    Title = "Recarregar UI",

    Callback = function()
        print("UI recarregada")
        -- In a real environment, you might want to re-execute the script here.
        -- For WindUI, usually just closing and reopening the window is sufficient.
        Window:Destroy()
        -- Note: To reload completely, the script would need to be re-injected.
    end
})

ConfigTab:AddButton({
    Title = "Fechar HUB",

    Callback = function()
        Window:Destroy()
        -- Clear ESP drawings when closing
        for _, drawing in pairs(espDrawings) do
            drawing:Remove()
        end
        espDrawings = {}
        print("HUB Fechado.")
    end
})

----------------------------------------------------------------
-- FINISH
----------------------------------------------------------------

Window:Finish()

print("KASIS999 HUB carregado!")
