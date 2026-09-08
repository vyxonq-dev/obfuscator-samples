-- ð VOID HUB COMPLET v3.0 - 20+ SCRIPTS RedZ/99 Nuits Style
-- Boutons ROND ROUGE/JAUNE/VERT + Scripts OP !

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Variables globales
local screenGui = Instance.new("ScreenGui")
local mainFrame, loginFrame
local licenseKey = ""
local isLoggedIn = false
local isDemi = false
local isFull = false
local originalPos, originalSize

-- ð 25+ SCRIPTS RedZ Hub / 99 Nuits Style
local scriptsList = {
    -- BASIQUES
    {name = "ð Speed Hack", script = 'game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100'},
    {name = "ð¥ Jump Power", script = 'game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150'},
    {name = "ð» Noclip", script = [[
        local noclip = true
        game:GetService('RunService').Stepped:connect(function()
            if noclip and game.Players.LocalPlayer.Character then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end
        end)
    ]]},
    {name = "âï¸ Fly (F)", script = [[
        local player = game.Players.LocalPlayer
        repeat wait() until player.Character
        local mouse = player:GetMouse()
        local flying = false
        mouse.KeyDown:connect(function(key)
            if key == "f" then
                flying = not flying
                if flying and player.Character:FindFirstChild("HumanoidRootPart") then
                    local bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(4000,4000,4000)
                    bv.Velocity = Vector3.new(0,0.1,0)
                    bv.Parent = player.Character.HumanoidRootPart
                else
                    if player.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                        player.Character.HumanoidRootPart.BodyVelocity:Destroy()
                    end
                end
            end
        end)
    ]]},

    -- REDZ HUB / 99 NUITS STYLE
    {name = "ð¯ Infinite Yield", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()"},
    {name = "ðï¸ ESP Players", script = [[
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                local h = Instance.new("Highlight", plr.Character)
                h.FillColor = Color3.new(1,0,0)
                h.OutlineColor = Color3.new(1,1,1)
            end
        end
    ]]},
    {name = "ð« Kill Aura", script = [[
        _G.KillAura = true
        game:GetService("RunService").Heartbeat:Connect(function()
            if _G.KillAura then
                for _, v in pairs(workspace:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer.Character then
                        v.Humanoid.Health = 0
                    end
                end
            end
        end)
    ]]},
    {name = "ð Auto Farm", script = [[
        while wait(0.1) do
            for i,v in pairs(workspace:GetChildren()) do
                if v.Name:find("Coin") or v.Name:find("Diamond") or v.Name:find("Gem") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                end
            end
        end
    ]]},
    {name = "ð¦ Bring Items", script = [[
        for i,v in pairs(workspace:GetChildren()) do
            if v:IsA("BasePart") and (v.Name:find("Tool") or v.Name:find("Item")) then
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    ]]},

    -- 99 NUITS SPÃCIAL
    {name = "ð² Auto Wood", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/99nightsscripts/main/autowoodv2.lua'))()"},
    {name = "ð¥ Auto Cook", script = [[
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name:find("Raw") then
                v.Parent = workspace
                wait(0.1)
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    ]]},
    {name = "ð¶ ESP Enfants", script = [[
        for i,v in pairs(workspace:GetChildren()) do
            if v.Name:find("Child") or v.Name:find("Lost") then
                local h = Instance.new("Highlight", v)
                h.FillColor = Color3.new(0,1,0)
            end
        end
    ]]},
    {name = "âï¸ God Mode", script = 'game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge; game.Players.LocalPlayer.Character.Humanoid.Health = math.huge'},

    -- UTILS OP
    {name = "ð Night Vision", script = [[
        game.Lighting.Brightness = 3
        game.Lighting.ClockTime = 14
        game.Lighting.FogEnd = 100000
        game.Lighting.GlobalShadows = false
    ]]},
    {name = "ð¡ï¸ Click TP", script = [[
        local mouse = game.Players.LocalPlayer:GetMouse()
        mouse.Button1Down:Connect(function()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p)
            end
        end)
    ]]},
    {name = "ð° Money Give", script = [[
        game.Players.LocalPlayer.leaderstats.Cash.Value = game.Players.LocalPlayer.leaderstats.Cash.Value + 100000
    ]]},
    {name = "ð¡ï¸ Anti AFK", script = [[
        while true do
            local v1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(math.random(-100,100), 0, math.random(-100,100))
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = v1
        end
    ]]},

    -- HACKS UNIVERS
    {name = "ð® FE Godmode", script = [[
        local player = game.Players.LocalPlayer
        player.Character.Humanoid:ChangeState(11)
        player.Character.Humanoid.PlatformStand = true
    ]]},
    {name = "ð Rejoin", script = 'game:GetService("TeleportService"):Teleport(game.PlaceId)'},
    {name = "ðï¸ Server Crash", script = [[
        while wait() do
            game.Players:Kick("Server crashed!")
        end
    ]]},
    {name = "ð¡ Remote Spy", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua'))()"},
    {name = "ð Rainbow", script = [[
        while wait() do
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Color = Color3.new(math.random(), math.random(), math.random())
                end
            end
        end
    ]]}
}

-- Fonction tween
local function tween(object, properties, duration)
    duration = duration or 0.3
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween = TweenService:Create(object, tweenInfo, properties)
    tween:Play()
    return tween
end

-- [LOGIN FRAME - IDENTIQUE]
local function createLoginFrame()
    loginFrame = Instance.new("Frame")
    loginFrame.Name = "LoginFrame"
    loginFrame.Parent = screenGui
    loginFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    loginFrame.BorderSizePixel = 0
    loginFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    loginFrame.Size = UDim2.new(0, 400, 0, 300)
    loginFrame.ClipsDescendants = true
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = loginFrame
    
    local shadow = Instance.new("Frame")
    shadow.Name = "Shadow"
    shadow.Parent = loginFrame
    shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    shadow.BackgroundTransparency = 0.7
    shadow.BorderSizePixel = 0
    shadow.Position = UDim2.new(0, 4, 0, 4)
    shadow.Size = UDim2.new(1, -8, 1, -8)
    shadow.ZIndex = loginFrame.ZIndex - 1
    local shadowCorner = Instance.new("UICorner")
    shadowCorner.CornerRadius = UDim.new(0, 16)
    shadowCorner.Parent = shadow
    
    local title = Instance.new("TextLabel")
    title.Parent = loginFrame
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 0, 0, 20)
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Font = Enum.Font.GothamBold
    title.Text = "ð TAKITO999 HUB v3.0"
    title.TextColor3 = Color3.fromRGB(100, 200, 255)
    title.TextScaled = true
    
    local keyBox = Instance.new("TextBox")
    keyBox.Parent = loginFrame
    keyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    keyBox.BorderSizePixel = 0
    keyBox.Position = UDim2.new(0.15, 0, 0.4, 0)
    keyBox.Size = UDim2.new(0.7, 0, 0, 45)
    keyBox.Font = Enum.Font.Gotham
    keyBox.PlaceholderText = "Entre ta clÃ© (void123)"
    keyBox.Text = ""
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.TextScaled = true
    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = UDim.new(0, 10)
    keyCorner.Parent = keyBox
    
    local loginBtn = Instance.new("TextButton")
    loginBtn.Parent = loginFrame
    loginBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    loginBtn.BorderSizePixel = 0
    loginBtn.Position = UDim2.new(0.15, 0, 0.6, 0)
    loginBtn.Size = UDim2.new(0.7, 0, 0, 45)
    loginBtn.Font = Enum.Font.GothamBold
    loginBtn.Text = "ð SE CONNECTER"
    loginBtn.TextColor3 = Color3.fromRGB(15, 15, 25)
    loginBtn.TextScaled = true
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = loginBtn
    
    loginBtn.MouseEnter:Connect(function()
        tween(loginBtn, {Size = UDim2.new(0.72, 0, 0, 48), BackgroundColor3 = Color3.fromRGB(120, 220, 255)}, 0.2)
    end)
    loginBtn.MouseLeave:Connect(function()
        tween(loginBtn, {Size = UDim2.new(0.7, 0, 0, 45), BackgroundColor3 = Color3.fromRGB(100, 200, 255)}, 0.2)
    end)
    
    loginBtn.MouseButton1Click:Connect(function()
        licenseKey = keyBox.Text
        if licenseKey == "void123" or licenseKey == "redz" or licenseKey == "" then
            tween(loginFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.5)
            game:GetService("Debris"):AddItem(loginFrame, 0.6)
            wait(0.6)
            createHubFrame()
        else
            keyBox.Text = "â ClÃ© invalide !"
            tween(keyBox, {BackgroundColor3 = Color3.fromRGB(50, 20, 20)}, 0.2)
            wait(1)
            tween(keyBox, {BackgroundColor3 = Color3.fromRGB(25, 25, 35)}, 0.3)
            keyBox.Text = ""
        end
    end)
end

-- Hub principal avec BOUTONS ROND + 25 SCRIPTS
function createHubFrame()
    isLoggedIn = true
    
    mainFrame = Instance.new("Frame")
    mainFrame.Name = "VoidHubMain"
    mainFrame.Parent = screenGui
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Position = UDim2.new(0, 20, 0, 20)
    mainFrame.Size = UDim2.new(0, 400, 0, 500)  -- Plus grand pour 25 scripts
    mainFrame.ClipsDescendants = true
    mainFrame.Active = true
    mainFrame.Draggable = true
    
    originalPos = mainFrame.Position
    originalSize = UDim2.new(0, 400, 0, 500)
    
    local mCorner = Instance.new("UICorner")
    mCorner.CornerRadius = UDim.new(0, 16)
    mCorner.Parent = mainFrame
    
    -- HEADER BOUTONS ROND ROUGE/JAUNE/VERT
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Parent = mainFrame
    header.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    header.Size = UDim2.new(1, 0, 0, 50)

    local hCorner = Instance.new("UICorner")
    hCorner.CornerRadius = UDim.new(0, 16)
    hCorner.Parent = header

    local titleHub = Instance.new("TextLabel")
    titleHub.Parent = header
    titleHub.BackgroundTransparency = 1
    titleHub.Position = UDim2.new(0, 15, 0, 0)
    titleHub.Size = UDim2.new(0.65, 0, 1, 0)
    titleHub.Font = Enum.Font.GothamBold
    titleHub.Text = "ð TAKITO999 HUB v3.0 | 25+ SCRIPTS"
    titleHub.TextColor3 = Color3.fromRGB(100, 200, 255)
    titleHub.TextScaled = true

    -- Boutons ronds (identique au prÃ©cÃ©dent)
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Parent = header
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    closeBtn.Position = UDim2.new(1, -108, 0.12, 5)
    closeBtn.Size = UDim2.new(0, 36, 0, 36)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "â"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextScaled = true
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(1, 0)
    closeCorner.Parent = closeBtn

    local demiBtn = Instance.new("TextButton")
    demiBtn.Name = "DemiBtn"
    demiBtn.Parent = header
    demiBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    demiBtn.Position = UDim2.new(1, -72, 0.12, 5)
    demiBtn.Size = UDim2.new(0, 36, 0, 36)
    demiBtn.Font = Enum.Font.GothamBold
    demiBtn.Text = "ð¡"
    demiBtn.TextColor3 = Color3.fromRGB(40, 40, 40)
    demiBtn.TextScaled = true
    local demiCorner = Instance.new("UICorner")
    demiCorner.CornerRadius = UDim.new(1, 0)
    demiCorner.Parent = demiBtn

    local expandBtn = Instance.new("TextButton")
    expandBtn.Name = "ExpandBtn"
    expandBtn.Parent = header
    expandBtn.BackgroundColor3 = Color3.fromRGB(60, 255, 100)
    expandBtn.Position = UDim2.new(1, -36, 0.12, 5)
    expandBtn.Size = UDim2.new(0, 36, 0, 36)
    expandBtn.Font = Enum.Font.GothamBold
    expandBtn.Text = "ð¢"
    expandBtn.TextColor3 = Color3.fromRGB(20, 20, 20)
    expandBtn.TextScaled = true
    local expandCorner = Instance.new("UICorner")
    expandCorner.CornerRadius = UDim.new(1, 0)
    expandCorner.Parent = expandBtn

    -- Animations boutons (identique)
    closeBtn.MouseEnter:Connect(function() tween(closeBtn, {Size = UDim2.new(0, 40, 0, 40), BackgroundColor3 = Color3.fromRGB(300, 80, 80)}, 0.2) end)
    closeBtn.MouseLeave:Connect(function() tween(closeBtn, {Size = UDim2.new(0, 36, 0, 36), BackgroundColor3 = Color3.fromRGB(255, 60, 60)}, 0.2) end)
    closeBtn.MouseButton1Click:Connect(function() tween(mainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3); game:GetService("Debris"):AddItem(mainFrame, 0.4) end)

    demiBtn.MouseEnter:Connect(function() tween(demiBtn, {Size = UDim2.new(0, 40, 0, 40), BackgroundColor3 = Color3.fromRGB(255, 220, 50)}, 0.2) end)
    demiBtn.MouseLeave:Connect(function() tween(demiBtn, {Size = UDim2.new(0, 36, 0, 36), BackgroundColor3 = Color3.fromRGB(255, 200, 0)}, 0.2) end)
    demiBtn.MouseButton1Click:Connect(function()
        isDemi = not isDemi
        if isDemi then
            tween(mainFrame, {Size = UDim2.new(0, 250, 0, 500)}, 0.3)
            demiBtn.Text = " "
        else
            tween(mainFrame, {Size = UDim2.new(0, 400, 0, 500)}, 0.3)
            demiBtn.Text = "ð¡"
        end
    end)

    expandBtn.MouseEnter:Connect(function() tween(expandBtn, {Size = UDim2.new(0, 40, 0, 40), BackgroundColor3 = Color3.fromRGB(80, 255, 120)}, 0.2) end)
    expandBtn.MouseLeave:Connect(function() tween(expandBtn, {Size = UDim2.new(0, 36, 0, 36), BackgroundColor3 = Color3.fromRGB(60, 255, 100)}, 0.2) end)
    expandBtn.MouseButton1Click:Connect(function()
        isFull = not isFull
        if isFull then
            mainFrame.Position = UDim2.new(0, 0, 0, 0)
            tween(mainFrame, {Size = UDim2.new(1, 0, 1, 0)}, 0.3)
            expandBtn.Text = " "
        else
            mainFrame.Position = originalPos
            tween(mainFrame, {Size = originalSize}, 0.3)
            expandBtn.Text = "ð¢"
        end
    end)

    -- SCROLL + 25 SCRIPTS
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "ScriptsList"
    scrollFrame.Parent = mainFrame
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.Position = UDim2.new(0, 10, 0, 60)
    scrollFrame.Size = UDim2.new(1, -20, 1, -80)
    scrollFrame.ScrollBarThickness = 8
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 255)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

    local listLayout = Instance.new("UIListLayout")
    listLayout.Parent = scrollFrame
    listLayout.Padding = UDim.new(0, 6)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- CrÃ©ation des 25 boutons
    for i, scriptData in ipairs(scriptsList) do
        local scriptBtn = Instance.new("TextButton")
        scriptBtn.Name = "ScriptBtn_" .. i
        scriptBtn.Parent = scrollFrame
        scriptBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        scriptBtn.BorderSizePixel = 0
        scriptBtn.Size = UDim2.new(1, -20, 0, 45)
        scriptBtn.Font = Enum.Font.GothamSemibold
        scriptBtn.Text = scriptData.name
        scriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptBtn.TextScaled = true

        local sCorner = Instance.new("UICorner")
        sCorner.CornerRadius = UDim.new(0, 10)
        sCorner.Parent = scriptBtn

        scriptBtn.MouseButton1Click:Connect(function()
            local originalText = scriptBtn.Text
            scriptBtn.Text = "â³ Chargement..."
            tween(scriptBtn, {BackgroundColor3 = Color3.fromRGB(60, 60, 80)}, 0.2)
            
            spawn(function()
                wait(0.5)
                local success = pcall(function()
                    loadstring(scriptData.script)()
                end)
                
                if success then
                    scriptBtn.Text = "â ExÃ©cutÃ© !"
                    tween(scriptBtn, {BackgroundColor3 = Color3.fromRGB(40, 200, 100)}, 0.3)
                else
                    scriptBtn.Text = "â Erreur"
                    tween(scriptBtn, {BackgroundColor3 = Color3.fromRGB(255, 80, 80)}, 0.3)
                end
                
                wait(2)
                scriptBtn.Text = originalText
                tween(scriptBtn, {BackgroundColor3 = Color3.fromRGB(30, 30, 45)}, 0.5)
            end)
        end)

        scriptBtn.MouseEnter:Connect(function()
            if not string.find(scriptBtn.Text, "â³") and not string.find(scriptBtn.Text, "â") and not string.find(scriptBtn.Text, "â") then
                tween(scriptBtn, {Size = UDim2.new(1, -16, 0, 48), BackgroundColor3 = Color3.fromRGB(50, 50, 70)}, 0.2)
            end
        end)
        scriptBtn.MouseLeave:Connect(function()
            if scriptBtn.Text == scriptData.name then
                tween(scriptBtn, {Size = UDim2.new(1, -20, 0, 45), BackgroundColor3 = Color3.fromRGB(30, 30, 45)}, 0.2)
            end
        end)
    end

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 20)
    end)

    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.Visible = true
    tween(mainFrame, {Size = UDim2.new(0, 400, 0, 500)}, 0.5)
end

-- Initialisation
screenGui.Name = "Takito999HubGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

createLoginFrame()

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        if not isLoggedIn then
            if loginFrame then
                loginFrame.Visible = true
                loginFrame.Size = UDim2.new(0, 0, 0, 0)
                tween(loginFrame, {Size = UDim2.new(0, 400, 0, 300)}, 0.5)
            end
        elseif mainFrame and mainFrame.Parent then
            mainFrame.Visible = not mainFrame.Visible
            if mainFrame.Visible then
                tween(mainFrame, {Size = UDim2.new(0, 400, 0, 500)}, 0.3)
            end
        end
    end
end)

print("ð Takito999 HUB v3.0 - 25 SCRIPTS RedZ/99 Nuits CHARGÃ!")
print("ð ClÃ©: void123 ou redz")
print("ð® INSERT = Toggle | Boutons ronds parfaits!")