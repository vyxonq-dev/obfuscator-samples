--[[
    SPYMM v6.0 - Obsidian UI
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local adjustBackpackRemote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Tools") and ReplicatedStorage.Remotes.Tools:FindFirstChild("AdjustBackpack")
local pickUpItemRemote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Interaction") and ReplicatedStorage.Remotes.Interaction:FindFirstChild("PickUpItem")

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "SPYMM v6.0",
    Footer = "Survive the Apocalypse",
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Visuals = Window:AddTab("Visuals", "eye"),
    Player = Window:AddTab("Player", "user"),
    Exploits = Window:AddTab("Exploits", "zap"),
    Misc = Window:AddTab("Misc", "settings"),
    Info = Window:AddTab("Info", "info"),
    ["UI Settings"] = Window:AddTab("UI Settings", "sliders-horizontal"),
}

local connections = {}
local mobESPInstances = {}
local itemESPInstances = {}
local autoPickupConnection = nil
local originalValues = {
    walkSpeed = nil,
}

local mobOptions = { ESP = false, Chams = false, Name = false, Distance = false }
local itemOptions = { ESP = false, Chams = false, Name = false, Distance = false }

local mobNames = {"Runner", "Crawler", "Riot", "Zombie"}
local itemNames = {
    "Bandage", "Barbed Wire", "Battery", "Beans", "Bloxiade", "Bloxy Cola",
    "Compound I", "Crowbar", "Dumbell", "Fuel", "Grenade", "Knife",
    "Long Ammo", "Medium Ammo", "Pistol Ammo", "Revolver", "Scrap",
    "Screws", "Shells", "Spatula", "Tray"
}

local charactersFolder = Workspace:FindFirstChild("Characters")
local droppedItemsFolder = Workspace:FindFirstChild("DroppedItems")

local function getItemMainPart(item)
    if item.PrimaryPart then return item.PrimaryPart end
    for _, child in ipairs(item:GetChildren()) do
        if child:IsA("BasePart") then
            return child
        end
    end
    return nil
end

local function removeMobESP(char)
    local esp = mobESPInstances[char]
    if esp then
        if esp.Highlight then esp.Highlight:Destroy() end
        if esp.Billboard then esp.Billboard:Destroy() end
        if esp.DistanceConnection then
            esp.DistanceConnection:Disconnect()
        end
        mobESPInstances[char] = nil
    end
end

local function removeItemESP(item)
    local esp = itemESPInstances[item]
    if esp then
        if esp.Highlight then esp.Highlight:Destroy() end
        if esp.Billboard then esp.Billboard:Destroy() end
        if esp.DistanceConnection then
            esp.DistanceConnection:Disconnect()
        end
        itemESPInstances[item] = nil
    end
end

local function createMobESP(char)
    if not char:IsA("Model") then return end
    if mobESPInstances[char] then return end

    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    if not root then return end

    local espTable = {}

    if mobOptions.Chams then
        local highlight = Instance.new("Highlight")
        highlight.Name = "MobESP_Highlight"
        highlight.Adornee = char
        highlight.FillColor = Color3.fromRGB(220, 0, 0)
        highlight.FillTransparency = 0.3
        highlight.OutlineColor = Color3.fromRGB(255, 185, 185)
        highlight.OutlineTransparency = 0.8
        highlight.Parent = char
        espTable.Highlight = highlight
    end

    if mobOptions.Name or mobOptions.Distance then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "MobESP_NameDistance"
        billboard.Adornee = root
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = char

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = char.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 200, 200)
        nameLabel.TextStrokeTransparency = 0.3
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = 14
        nameLabel.Visible = mobOptions.Name
        nameLabel.Parent = frame

        local distLabel = Instance.new("TextLabel")
        distLabel.Name = "DistLabel"
        distLabel.Size = UDim2.new(1, 0, 0.5, 0)
        distLabel.Position = UDim2.new(0, 0, 0.5, 0)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = "0m"
        distLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        distLabel.TextStrokeTransparency = 0.3
        distLabel.Font = Enum.Font.Gotham
        distLabel.TextSize = 12
        distLabel.Visible = mobOptions.Distance
        distLabel.Parent = frame

        espTable.Billboard = billboard
        espTable.NameLabel = nameLabel
        espTable.DistLabel = distLabel

        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not char or not char.Parent then
                connection:Disconnect()
                return
            end
            if distLabel and distLabel.Visible then
                local myChar = LocalPlayer.Character
                local myRoot = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("Torso") or myChar:FindFirstChild("UpperTorso"))
                if myRoot then
                    local dist = (myRoot.Position - root.Position).Magnitude
                    distLabel.Text = math.floor(dist) .. "m"
                end
            end
        end)
        espTable.DistanceConnection = connection
        table.insert(connections, connection)
    end

    mobESPInstances[char] = espTable
end

local function createItemESP(item)
    if not item:IsA("Model") then return end
    if itemESPInstances[item] then return end

    local mainPart = getItemMainPart(item)
    if not mainPart then return end

    local espTable = {}

    if itemOptions.Chams then
        local highlight = Instance.new("Highlight")
        highlight.Name = "ItemESP_Highlight"
        highlight.Adornee = item
        highlight.FillColor = Color3.fromRGB(255, 0, 255)
        highlight.FillTransparency = 0.4
        highlight.OutlineColor = Color3.fromRGB(200, 180, 255)
        highlight.OutlineTransparency = 0.8
        highlight.Parent = item
        espTable.Highlight = highlight
    end

    if itemOptions.Name or itemOptions.Distance then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ItemESP_NameDistance"
        billboard.Adornee = mainPart
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = item

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = item.Name
        nameLabel.TextColor3 = Color3.fromRGB(200, 255, 200)
        nameLabel.TextStrokeTransparency = 0.3
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = 14
        nameLabel.Visible = itemOptions.Name
        nameLabel.Parent = frame

        local distLabel = Instance.new("TextLabel")
        distLabel.Name = "DistLabel"
        distLabel.Size = UDim2.new(1, 0, 0.5, 0)
        distLabel.Position = UDim2.new(0, 0, 0.5, 0)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = "0m"
        distLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        distLabel.TextStrokeTransparency = 0.3
        distLabel.Font = Enum.Font.Gotham
        distLabel.TextSize = 12
        distLabel.Visible = itemOptions.Distance
        distLabel.Parent = frame

        espTable.Billboard = billboard
        espTable.NameLabel = nameLabel
        espTable.DistLabel = distLabel

        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not item or not item.Parent then
                connection:Disconnect()
                return
            end
            if distLabel and distLabel.Visible then
                local myChar = LocalPlayer.Character
                local myRoot = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("Torso") or myChar:FindFirstChild("UpperTorso"))
                if myRoot then
                    local dist = (myRoot.Position - mainPart.Position).Magnitude
                    distLabel.Text = math.floor(dist) .. "m"
                end
            end
        end)
        espTable.DistanceConnection = connection
        table.insert(connections, connection)
    end

    itemESPInstances[item] = espTable
end

local function refreshMobESP()
    for char, _ in pairs(mobESPInstances) do
        removeMobESP(char)
    end
    if not mobOptions.ESP then return end
    if not charactersFolder then
        Library:Notify({ Title = "Mob ESP", Description = "Characters folder not found", Time = 3 })
        return
    end
    for _, child in ipairs(charactersFolder:GetChildren()) do
        if table.find(mobNames, child.Name) then
            createMobESP(child)
        end
    end
end

local function refreshItemESP()
    for item, _ in pairs(itemESPInstances) do
        removeItemESP(item)
    end
    if not itemOptions.ESP then return end
    if not droppedItemsFolder then
        Library:Notify({ Title = "Item ESP", Description = "DroppedItems folder not found", Time = 3 })
        return
    end
    for _, child in ipairs(droppedItemsFolder:GetChildren()) do
        if table.find(itemNames, child.Name) then
            createItemESP(child)
        end
    end
end

if charactersFolder then
    local childAddedConn = charactersFolder.ChildAdded:Connect(function(child)
        if mobOptions.ESP and table.find(mobNames, child.Name) then
            createMobESP(child)
        end
    end)
    table.insert(connections, childAddedConn)

    local childRemovedConn = charactersFolder.ChildRemoved:Connect(function(child)
        removeMobESP(child)
    end)
    table.insert(connections, childRemovedConn)
end

if droppedItemsFolder then
    local childAddedConn = droppedItemsFolder.ChildAdded:Connect(function(child)
        if itemOptions.ESP and table.find(itemNames, child.Name) then
            createItemESP(child)
        end
    end)
    table.insert(connections, childAddedConn)

    local childRemovedConn = droppedItemsFolder.ChildRemoved:Connect(function(child)
        removeItemESP(child)
    end)
    table.insert(connections, childRemovedConn)
end

-- Visuals Tab
local mobESPGroup = Tabs.Visuals:AddLeftGroupbox("Mob ESP", "eye")

mobESPGroup:AddToggle("MobESP", {
    Text = "Mob ESP",
    Default = false,
    Callback = function(state)
        mobOptions.ESP = state
        refreshMobESP()
    end,
})

mobESPGroup:AddToggle("MobChams", {
    Text = "Chams",
    Default = false,
    Callback = function(state)
        mobOptions.Chams = state
        refreshMobESP()
    end,
})

mobESPGroup:AddToggle("MobName", {
    Text = "Show Names",
    Default = false,
    Callback = function(state)
        mobOptions.Name = state
        refreshMobESP()
    end,
})

mobESPGroup:AddToggle("MobDistance", {
    Text = "Show Distance",
    Default = false,
    Callback = function(state)
        mobOptions.Distance = state
        refreshMobESP()
    end,
})

local itemESPGroup = Tabs.Visuals:AddRightGroupbox("Item ESP", "package")

itemESPGroup:AddToggle("ItemESP", {
    Text = "Item ESP",
    Default = false,
    Callback = function(state)
        itemOptions.ESP = state
        refreshItemESP()
    end,
})

itemESPGroup:AddToggle("ItemChams", {
    Text = "Chams",
    Default = false,
    Callback = function(state)
        itemOptions.Chams = state
        refreshItemESP()
    end,
})

itemESPGroup:AddToggle("ItemName", {
    Text = "Show Names",
    Default = false,
    Callback = function(state)
        itemOptions.Name = state
        refreshItemESP()
    end,
})

itemESPGroup:AddToggle("ItemDistance", {
    Text = "Show Distance",
    Default = false,
    Callback = function(state)
        itemOptions.Distance = state
        refreshItemESP()
    end,
})

-- Player Tab
local movementGroup = Tabs.Player:AddLeftGroupbox("Movement", "move")

movementGroup:AddToggle("SpeedHack", {
    Text = "Speed Hack",
    Default = false,
    Callback = function(state)
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if state then
                    originalValues.walkSpeed = humanoid.WalkSpeed
                    humanoid.WalkSpeed = 50
                    Library:Notify({ Title = "Speed Hack", Description = "Speed set to 50", Time = 2 })
                else
                    humanoid.WalkSpeed = originalValues.walkSpeed or 16
                    Library:Notify({ Title = "Speed Hack", Description = "Speed restored to " .. (originalValues.walkSpeed or 16), Time = 2 })
                end
            end
        end
    end,
})

movementGroup:AddSlider("SpeedValue", {
    Text = "Walk Speed",
    Default = 50,
    Min = 16,
    Max = 200,
    Rounding = 0,
    Suffix = " studs/s",
    Callback = function(value)
        if Toggles.SpeedHack.Value then
            local char = LocalPlayer.Character
            if char then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = value
                end
            end
        end
    end,
})

movementGroup:AddToggle("InfJump", {
    Text = "Inf Jump",
    Default = false,
    Callback = function(state)
        Library:Notify({
            Title = "Inf Jump",
            Description = state and "Enabled - jump anywhere!" or "Disabled",
            Time = 2,
        })
    end,
})

local jumpConn = UserInputService.JumpRequest:Connect(function()
    if Toggles.InfJump.Value then
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)
table.insert(connections, jumpConn)

-- Exploits Tab
local autoPickupGroup = Tabs.Exploits:AddLeftGroupbox("Auto Pickup", "hand")

autoPickupGroup:AddToggle("AutoPickup", {
    Text = "Auto Pickup",
    Default = false,
    Callback = function(state)
        if state then
            startAutoPickup()
            Library:Notify({ Title = "Auto Pickup", Description = "Auto Pickup started", Time = 2 })
        else
            stopAutoPickup()
            Library:Notify({ Title = "Auto Pickup", Description = "Auto Pickup stopped", Time = 2 })
        end
    end,
})

autoPickupGroup:AddSlider("PickupRadius", {
    Text = "Pickup Radius",
    Default = 15,
    Min = 1,
    Max = 50,
    Rounding = 0,
    Suffix = " studs",
})

autoPickupGroup:AddToggle("AllItems", {
    Text = "Pick Up All Items",
    Default = false,
    Tooltip = "When enabled, all items within radius are picked up regardless of filter",
})

autoPickupGroup:AddDivider()

autoPickupGroup:AddLabel("Item Filter")
autoPickupGroup:AddDropdown("ItemWhitelist", {
    Values = itemNames,
    Default = 1,
    Multi = true,
    Text = "Item Whitelist",
    Tooltip = "Select which items to pick up. Only applies when 'Pick Up All Items' is off.",
    Searchable = true,
})

local function startAutoPickup()
    stopAutoPickup()
    autoPickupConnection = RunService.Heartbeat:Connect(function()
        if not Toggles.AutoPickup.Value then return end

        local char = LocalPlayer.Character
        if not char then return end
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        local radius = Options.PickupRadius.Value
        local pos = rootPart.Position

        if not droppedItemsFolder then return end

        local allSelected = Toggles.AllItems.Value
        local selectedItems = Options.ItemWhitelist.Value

        for _, item in ipairs(droppedItemsFolder:GetChildren()) do
            if not Toggles.AutoPickup.Value then break end

            if not allSelected then
                if not selectedItems[item.Name] then
                    continue
                end
            end

            local mainPart = item.PrimaryPart or getItemMainPart(item)
            if mainPart then
                local dist = (mainPart.Position - pos).Magnitude
                if dist <= radius then
                    if adjustBackpackRemote then
                        adjustBackpackRemote:FireServer(item)
                    elseif pickUpItemRemote then
                        pickUpItemRemote:FireServer(item)
                    end
                    task.wait(0.05)
                end
            end
        end
    end)
end

local function stopAutoPickup()
    if autoPickupConnection then
        autoPickupConnection:Disconnect()
        autoPickupConnection = nil
    end
end

-- Misc Tab
Tabs.Misc:AddLeftGroupbox("Misc"):AddLabel("Placeholder for future features.")

-- Info Tab
local infoGroup = Tabs.Info:AddLeftGroupbox("About", "info")

infoGroup:AddLabel("Author: Spy", { DoesWrap = true })
infoGroup:AddLabel("Discord: hxnrylsd", { DoesWrap = true })
infoGroup:AddLabel("Version: 6.0 (Obsidian UI Edition)", { DoesWrap = true })
infoGroup:AddLabel("My Socials: feds.lol/spy", { DoesWrap = true })

infoGroup:AddDivider()

infoGroup:AddLabel("\"Greatest AI Cheat I've ever seen!\"", { DoesWrap = true })
infoGroup:AddLabel("Created with my favorite Slave, Deepseek.", { DoesWrap = true })

infoGroup:AddDivider()

infoGroup:AddButton({
    Text = "UNLOAD",
    Func = function()
        Library:Unload()
    end,
    Risky = true,
    Tooltip = "Removes the GUI and cleans up all active features",
})

-- Unload Cleanup
Library:OnUnload(function()
    for char, _ in pairs(mobESPInstances) do
        removeMobESP(char)
    end
    for item, _ in pairs(itemESPInstances) do
        removeItemESP(item)
    end

    for _, conn in ipairs(connections) do
        if typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    connections = {}

    stopAutoPickup()

    if Toggles.SpeedHack.Value then
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = originalValues.walkSpeed or 16
            end
        end
    end

    Library:Notify({ Title = "SPYMM", Description = "Unloaded. Bye!", Time = 3 })
    print("SPYMM v6.0 unloaded.")
end)

-- UI Settings Tab
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(value)
        Library.KeybindFrame.Visible = value
    end,
})

MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})

MenuGroup:AddDropdown("NotificationSide", {
    Values = { "Left", "Right" },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(Value)
        Library:SetNotifySide(Value)
    end,
})

MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",
    Text = "DPI Scale",
    Callback = function(Value)
        Value = Value:gsub("%%", "")
        local DPI = tonumber(Value)
        Library:SetDPIScale(DPI)
    end,
})

MenuGroup:AddSlider("UICornerSlider", {
    Text = "Corner Radius",
    Default = Library.CornerRadius,
    Min = 0,
    Max = 20,
    Rounding = 0,
    Callback = function(value)
        Window:SetCornerRadius(value)
    end,
})

MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
    :AddKeyPicker("MenuKeybind", { Default = "Insert", NoUI = true, Text = "Menu keybind" })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("SPYMM")
SaveManager:SetFolder("SPYMM/survive-the-apocalypse")

SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

Library:Notify({
    Title = "SPYMM v6.0",
    Description = "Loaded successfully.\nPress Insert to toggle menu.",
    Time = 5,
})

print("SPYMM v6.0 - Obsidian UI Edition loaded. Press Insert to toggle menu.")
