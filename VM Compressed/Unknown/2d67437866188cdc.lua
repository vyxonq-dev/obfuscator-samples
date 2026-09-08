-- [Rayfield Loader]
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- [Window Setup]
local Window = Rayfield:CreateWindow({
    Name = "Ultimate Town Sandbox GUI",
    LoadingTitle = "UTS GUI",
    LoadingSubtitle = "by QuinnZyra",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "UTS_GUI",
        FileName = "Settings"
    },
})

-- === Home Tab ===
local HomeTab = Window:CreateTab("Home")
HomeTab:CreateSection("Actions")
HomeTab:CreateButton({
    Name = "Claim Royalty Rewards (ONLY ONCE!)",
    Callback = function()
        pcall(function() game.ReplicatedStorage.Events.CheckLoyalty:InvokeServer() end)
    end,
})
HomeTab:CreateButton({
    Name = "Teleport to nearest Car/Heli",
    Callback = function()
        local player = game.Players.LocalPlayer
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local nearest, minDist = nil, math.huge
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("VehicleSeat") then
                local dist = (hrp.Position - v.Position).Magnitude
                if dist < minDist then
                    minDist = dist
                    nearest = v
                end
            end
        end
        if nearest then
            hrp.CFrame = nearest.CFrame + Vector3.new(0,3,0)
            task.wait(0.2)
            firetouchinterest(hrp, nearest, 0)
            task.wait(0.1)
            firetouchinterest(hrp, nearest, 1)
        end
    end,
})

-- === Player Tab ===
local PlayerTab = Window:CreateTab("Player")
local wsToggle, wsSpeed = false, 16
PlayerTab:CreateToggle({
    Name = "Enable WalkSpeed",
    CurrentValue = wsToggle,
    Callback = function(v) wsToggle = v end,
})
PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16,1000},
    Increment = 1,
    CurrentValue = wsSpeed,
    Callback = function(v) wsSpeed = v end,
})
game:GetService("RunService").RenderStepped:Connect(function()
    local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum and wsToggle then hum.WalkSpeed = wsSpeed end
end)

local infJump = false
PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = infJump,
    Callback = function(v) infJump = v end,
})
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJump then
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

local noclipEnabled, noclipConn = false, nil
PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = noclipEnabled,
    Callback = function(v)
        noclipEnabled = v
        local rs = game:GetService("RunService")
        local char = game.Players.LocalPlayer.Character
        if v then
            noclipConn = rs.Stepped:Connect(function()
                if char then
                    for _, p in ipairs(char:GetDescendants()) do
                        if p:IsA("BasePart") then p.CanCollide = false end
                    end
                end
            end)
        else
            if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
            if char then
                for _, p in ipairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = true end
                end
            end
        end
    end,
})

-- === Teleports Tab ===
local TeleTab = Window:CreateTab("Teleports")
local function addTeleport(name,pos)
    TeleTab:CreateButton({
        Name = name,
        Callback = function()
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = CFrame.new(pos) end
        end,
    })
end
local locs = {
    ["Gas Station"] = Vector3.new(517.57,11.5,-175.81),
    ["Police Station"] = Vector3.new(485.3,12,-16.9),
    ["Burger Bite"] = Vector3.new(415.43,12,28.73),
    ["Gun Store"] = Vector3.new(454.45,12.5,78.15),
    ["Hospital"] = Vector3.new(557.5,10.5,118.32),
    ["Hair Salon"] = Vector3.new(271.1,5.5,14),
    ["Cafe Verde"] = Vector3.new(231.23,5.5,14.08),
    ["Bandit Hideout"] = Vector3.new(413.02,11.5,-108.47),
    ["Beach"] = Vector3.new(717.17,4,-82.56),
    ["Pizza Place"] = Vector3.new(226.01,5,98.04),
    ["Clothing Store"] = Vector3.new(82.53,5,68.12),
    ["David's Dump"] = Vector3.new(-35.04,9,296.89),
}
for nm,pos in pairs(locs) do addTeleport(nm,pos) end

-- === AutoFarm Tab ===
local AutoFarmTab = Window:CreateTab("AutoFarm")
local autoLoot = false
local startCFrame = nil
local farmThreads = {}

AutoFarmTab:CreateToggle({
    Name = "Farm Plants/Flowers",
    CurrentValue = autoLoot,
    Callback = function(enabled)
        autoLoot = enabled
        local char = game.Players.LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if enabled and hrp then
            startCFrame = hrp.CFrame
            farmThreads.jump = coroutine.create(function()
                while autoLoot do
                    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                    task.wait(5)
                end
            end)
            coroutine.resume(farmThreads.jump)
            farmThreads.loot = coroutine.create(function()
                while autoLoot do
                    for _, obj in ipairs(workspace:GetDescendants()) do
                        if not autoLoot then break end
                        if obj:IsA("ProximityPrompt") and obj.Enabled then
                            local part = obj.Parent:IsA("Model") and obj.Parent.PrimaryPart or obj.Parent
                            if part and hrp then
                                for i = 1, 10 do
                                    if not autoLoot then break end
                                    hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
                                    task.wait(0.05)
                                    pcall(function() fireproximityprompt(obj) end)
                                end
                            end
                        end
                    end
                    task.wait(0.1)
                end
                if not autoLoot and hrp and startCFrame then
                    task.wait(0.2)
                    hrp.CFrame = startCFrame
                end
            end)
            coroutine.resume(farmThreads.loot)
        elseif not enabled then
            autoLoot = false
        end
    end,
})

local autoLootTrash = false
local trashStartCFrame = nil
AutoFarmTab:CreateToggle({
    Name = "Loot Trash/Chests",
    CurrentValue = autoLootTrash,
    Callback = function(enabled)
        autoLootTrash = enabled
        local char = game.Players.LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if enabled and hrp then
            trashStartCFrame = hrp.CFrame
            coroutine.wrap(function()
                while autoLootTrash do
                    for _, obj in ipairs(workspace:GetDescendants()) do
                        if not autoLootTrash then break end
                        if obj:IsA("ProximityPrompt") and obj.Enabled then
                            local parentName = obj.Parent.Name:lower()
                            local keywords = {
                                "trashcan","trashcans","trashbags","dumpster",
                                "treasurechest","mayorssafe","mayorstreasure",
                                "banditsafe","winterbanditsafe",
                            }
                            for _, kw in ipairs(keywords) do
                                if parentName:find(kw) then
                                    local part = obj.Parent:IsA("Model") and obj.Parent.PrimaryPart or obj.Parent
                                    if part and hrp then
                                        for i = 1, 5 do
                                            if not autoLootTrash then break end
                                            hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
                                            task.wait(0.05)
                                            pcall(function() fireproximityprompt(obj) end)
                                        end
                                    end
                                    break
                                end
                            end
                        end
                    end
                    task.wait(0.1)
                end
                if hrp and trashStartCFrame then
                    task.wait(0.2)
                    hrp.CFrame = trashStartCFrame
                end
            end)()
        elseif not enabled and hrp and trashStartCFrame then
            hrp.CFrame = trashStartCFrame
        end
    end,
})

local antiAfk = false
local afkConn
AutoFarmTab:CreateToggle({
    Name = "AntiAfk",
    CurrentValue = antiAfk,
    Callback = function(enabled)
        antiAfk = enabled
        local vu = game:GetService("VirtualUser")
        if enabled then
            afkConn = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        else
            if afkConn then afkConn:Disconnect(); afkConn = nil end
        end
    end,
})

-- === Troll Tab ===
local TrollTab = Window:CreateTab("Troll")
local spin = false
TrollTab:CreateToggle({
    Name = "Spinbot",
    CurrentValue = spin,
    Callback = function(v) spin = v end,
})
game:GetService("RunService").RenderStepped:Connect(function()
    if spin then
        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(30), 0)
        end
    end
end)
TrollTab:CreateButton({
    Name = "Anchor Car",
    Callback = function()
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.SeatPart then
            humanoid.SeatPart.Anchored = true
        end
    end,
})

-- === Visual Tab (ESP) ===
local VisualTab = Window:CreateTab("Visual")
local espEnabled = false
local highlightColor = Color3.fromRGB(255, 0, 0)
local nameColor = Color3.fromRGB(255, 255, 255)
local espSize = 14

VisualTab:CreateToggle({
    Name = "ESP (Highlights + Names)",
    CurrentValue = espEnabled,
    Callback = function(v) espEnabled = v end,
})
VisualTab:CreateColorPicker({
    Name = "Highlight Color",
    Color = highlightColor,
    Callback = function(c) highlightColor = c end,
})
VisualTab:CreateColorPicker({
    Name = "Name Tag Color",
    Color = nameColor,
    Callback = function(c) nameColor = c end,
})
VisualTab:CreateSlider({
    Name = "Name Tag Text Size",
    Range = {10, 30},
    Increment = 1,
    CurrentValue = espSize,
    Callback = function(size) espSize = size end,
})

task.spawn(function()
    while true do
        if espEnabled then
            for _, p in ipairs(game.Players:GetPlayers()) do
                if p ~= game.Players.LocalPlayer and p.Character then
                    local char = p.Character
                    if not char:FindFirstChild("ESP_Highlight") then
                        local hl = Instance.new("Highlight", char)
                        hl.Name = "ESP_Highlight"
                        hl.Adornee = char
                        hl.FillTransparency = 0.5
                    end
                    char.ESP_Highlight.FillColor = highlightColor

                    if not char:FindFirstChild("ESP_NameTag") then
                        local tag = Instance.new("BillboardGui")
                        tag.Name = "ESP_NameTag"
                        tag.Size = UDim2.new(0,200,0,30)
                        tag.AlwaysOnTop = true
                        tag.StudsOffset = Vector3.new(0,3,0)
                        tag.Adornee = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
                        tag.Parent = char

                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1,0,1,0)
                        label.BackgroundTransparency = 1
                        label.Text = p.Name
                        label.TextColor3 = nameColor
                        label.TextScaled = true
                        label.Font = Enum.Font.SourceSansBold
                        label.Parent = tag
                    else
                        local label = char.ESP_NameTag:FindFirstChildOfClass("TextLabel")
                        if label then
                            label.TextSize = espSize
                            label.TextColor3 = nameColor
                        end
                    end
                end
            end
        else
            for _, p in ipairs(game.Players:GetPlayers()) do
                if p.Character then
                    if p.Character:FindFirstChild("ESP_Highlight") then p.Character.ESP_Highlight:Destroy() end
                    if p.Character:FindFirstChild("ESP_NameTag") then p.Character.ESP_NameTag:Destroy() end
                end
            end
        end
        task.wait(5)
    end
end)

-- === Misc Tab ===
local MiscTab = Window:CreateTab("Misc")
MiscTab:CreateSection("Scripts")
MiscTab:CreateButton({
    Name = "Inf Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})
MiscTab:CreateSection("Server")
MiscTab:CreateButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end,
})

-- === QuickBuy Tab ===
local QuickBuyTab = Window:CreateTab("QuickBuy")
QuickBuyTab:CreateButton({
    Name = "Buy GhostBurger (24.99)",
    Callback = function()
        local rs = game:GetService("ReplicatedStorage")
        local events = rs:FindFirstChild("Events")
        local globals = rs:FindFirstChild("GlobalVariables")
        if not events or not globals then return end
        local foodBuyPrices = globals:FindFirstChild("FoodBuyPrices")
        if not foodBuyPrices or not foodBuyPrices:FindFirstChild("BurgerPlace") then return end
        pcall(function()
            events.BuyConsumable:FireServer("GhostBurger", foodBuyPrices.BurgerPlace)
        end)
    end,
})