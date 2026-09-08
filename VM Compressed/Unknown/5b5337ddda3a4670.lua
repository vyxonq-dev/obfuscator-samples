--==================================================================--
--                    KozakHub by PardarStudio                      --
--                                                                  --
--  Official Open Source Repository. Do not modify or redistribute  --
--  without proper credit and authorization from PardarStudio.      --
--                                                                  --
--     [NOTE]                                                       --
--     Script TE format (.elcs) avalaible at                        --
--     https://robte.net/Baba228/userteformat/raw_runtime.2913      --
--                                                                  --
--==================================================================--

_G.KozakHub = _G.KozakHub or {}
local KozakHub = _G.KozakHub

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

KozakHub.Fluent = Fluent
KozakHub.Window = Fluent:CreateWindow({
    Title = "Kozak Hub",
    SubTitle = "by Babkakvaser228",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.Insert
})

KozakHub.Tabs = {}

local KozakHub = _G.KozakHub or {}

KozakHub.Tabs.Home = KozakHub.Window:AddTab({ Title = "Home", Icon = "home" })

local KozakHub = _G.KozakHub or {}

if KozakHub.Tabs and KozakHub.Tabs.Home then
    local HomeTab = KozakHub.Tabs.Home

    HomeTab:AddParagraph({
        Title = "Kozak-Hub",
        Content = "═════════════════════════════════════════\n" ..
                  "         👑 Developer: Babkakvaser228\n" ..
                  "         💎 Thanks for running our script!\n" ..
                  "═════════════════════════════════════════"
    })
end


local KozakHub = _G.KozakHub or {}

if KozakHub.Window then
    KozakHub.Tabs = KozakHub.Tabs or {}
    KozakHub.Tabs.House = KozakHub.Window:AddTab({
        Title = "House",
        Icon = "building"
    })
end

local KozakHub = _G.KozakHub or {}
local Workspace = game:GetService("Workspace")

KozakHub.HouseMap = KozakHub.HouseMap or {}
KozakHub.SelectedHouseLot = KozakHub.SelectedHouseLot or nil

local function getLotNumber(lot)
    local numberFolder = lot:FindFirstChild("Number")
    if numberFolder then
        for _, desc in ipairs(numberFolder:GetDescendants()) do
            if desc:IsA("TextLabel") and desc.Text ~= "" then
                local cleanedText = desc.Text:gsub("#", ""):match("%d+")
                if cleanedText then
                    return cleanedText
                end
            end
        end
    end

    return lot.Name:match("%d+") or lot.Name
end

local function getHouseOwner(lot)
    if not lot then return nil end

    local ownerName = nil
    local ownerObj = lot:FindFirstChild("Owner") or lot:FindFirstChild("OwnerValue") or lot:FindFirstChild("HouseOwner")

    if ownerObj then
        if ownerObj:IsA("StringValue") and ownerObj.Value ~= "" then
            ownerName = ownerObj.Value
        elseif ownerObj:IsA("ObjectValue") and ownerObj.Value then
            ownerName = ownerObj.Value.Name
        end
    end

    if not ownerName then
        local attrOwner = lot:GetAttribute("Owner")
        if attrOwner and tostring(attrOwner) ~= "" then
            ownerName = tostring(attrOwner)
        end
    end

    if ownerName then
        local lowerName = ownerName:lower()
        if lowerName:find("for sale") or lowerName:find("sale") or lowerName == "net" or lowerName == "nobody" then
            return nil
        end
        return ownerName
    end

    return nil
end

local function getHouseLots()
    local options = {}
    KozakHub.HouseMap = {}

    local lotsFolder = Workspace:FindFirstChild("001_Lots") or Workspace:FindFirstChild("Lots")
    if lotsFolder then
        for _, lot in ipairs(lotsFolder:GetChildren()) do
            local ownerName = getHouseOwner(lot)
            if ownerName then
                local lotNum = getLotNumber(lot)
                local label = string.format("%s's House (%s)", ownerName, lotNum)
                table.insert(options, label)
                KozakHub.HouseMap[label] = lot
            end
        end
    end

    if #options == 0 then
        table.insert(options, "No available houses")
    end

    return options
end

if KozakHub.Tabs and KozakHub.Tabs.House then
    local HouseTab = KozakHub.Tabs.House
    local initialLots = getHouseLots()

    if initialLots[1] and KozakHub.HouseMap[initialLots[1]] then
        KozakHub.SelectedHouseLot = KozakHub.HouseMap[initialLots[1]]
    end

    local HouseDropdown = HouseTab:AddDropdown("SelectHouseDropdown", {
        Title = "Select House",
        Description = "Choose a house from an active player",
        Values = initialLots,
        Multi = false,
        Default = 1,
        Callback = function(Value)
            if KozakHub.HouseMap[Value] then
                KozakHub.SelectedHouseLot = KozakHub.HouseMap[Value]
            end
        end
    })

    local function refreshLots()
        pcall(function()
            local newLots = getHouseLots()
            if HouseDropdown and HouseDropdown.SetValues then
                HouseDropdown:SetValues(newLots)
            end
            if HouseDropdown and HouseDropdown.Value and KozakHub.HouseMap[HouseDropdown.Value] then
                KozakHub.SelectedHouseLot = KozakHub.HouseMap[HouseDropdown.Value]
            end
        end)
    end

    HouseTab:AddButton({
        Title = "Refresh House List",
        Description = "Force-refresh the list of owned houses",
        Callback = refreshLots
    })

    local lotsFolder = Workspace:FindFirstChild("001_Lots") or Workspace:FindFirstChild("Lots")
    if lotsFolder then
        lotsFolder.ChildAdded:Connect(function() pcall(refreshLots) end)
        lotsFolder.ChildRemoved:Connect(function() pcall(refreshLots) end)
    end
end

local KozakHub = _G.KozakHub or {}
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function KozakHub.UnbanAllHouses()
    local lotsFolder = Workspace:FindFirstChild("001_Lots") or Workspace:FindFirstChild("Lots")

    local remoteEvents = {}
    for _, desc in ipairs(ReplicatedStorage:GetDescendants()) do
        if desc:IsA("RemoteEvent") then
            local name = desc.Name:lower()
            if name == "re" or name:find("unban") or name:find("house") then
                table.insert(remoteEvents, desc)
            end
        end
    end

    if lotsFolder then
        for _, lot in ipairs(lotsFolder:GetChildren()) do
            -- Fire unban signals for every lot
            for _, remote in ipairs(remoteEvents) do
                pcall(function()
                    remote:FireServer("Unban", lot)
                    remote:FireServer("UnbanPlayer", lot)
                    remote:FireServer("ClearBan", lot)
                end)
            end

            for _, obj in ipairs(lot:GetDescendants()) do
                local name = obj.Name:lower()
                if name:find("ban") or name:find("barrier") then
                    pcall(function() obj:Destroy() end)
                end
            end
        end
    end

    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local name = obj.Name:lower()
            if name:find("banblock") or name:find("houseban") then
                pcall(function() obj:Destroy() end)
            end
        end
    end

    if KozakHub.Fluent then
        KozakHub.Fluent:Notify({
            Title = "Kozak-Hub",
            Content = "All houses have been unbanned successfully!",
            Duration = 3
        })
    end
end

if KozakHub.Tabs and KozakHub.Tabs.House then
    KozakHub.Tabs.House:AddButton({
        Title = "Unban All Houses",
        Description = "Removes the ban from every active house on the server",
        Callback = function()
            pcall(KozakHub.UnbanAllHouses)
        end
    })
end

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function KozakHub.TeleportToSafe()
    local lot = KozakHub.SelectedHouseLot
    local char = LocalPlayer.Character
    if not lot or not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local safeObj = nil
    for _, desc in ipairs(lot:GetDescendants()) do
        if (desc:IsA("BasePart") or desc:IsA("Model")) and desc.Name:lower():find("safe") then
            safeObj = desc
            break
        end
    end

    if safeObj then
        local safeCFrame = nil
        if safeObj:IsA("Model") then
            safeCFrame = safeObj:GetPivot()
        elseif safeObj:IsA("BasePart") then
            safeCFrame = safeObj.CFrame
        end

        if safeCFrame then
            local safePos = safeCFrame.Position

            local spawnPos = safePos + (safeCFrame.LookVector * 3) + Vector3.new(0, 0.5, 0)
            local finalCFrame = CFrame.lookAt(spawnPos, safePos)

            char:PivotTo(finalCFrame)

            if KozakHub.Fluent then
                KozakHub.Fluent:Notify({
                    Title = "Kozak-Hub",
                    Content = "Teleported to safe!",
                    Duration = 3
                })
            end
        end
    else
        if KozakHub.Fluent then
            KozakHub.Fluent:Notify({
                Title = "Kozak-Hub",
                Content = "No safe found in the selected house.",
                Duration = 3
            })
        end
    end
end

if KozakHub.Tabs and KozakHub.Tabs.House then
    KozakHub.Tabs.House:AddButton({
        Title = "TP to Safe",
        Description = "Teleports you directly to the safe in the selected house",
        Callback = function()
            pcall(KozakHub.TeleportToSafe)
        end
    })
end

local KozakHub = _G.KozakHub or {}

KozakHub.Tabs.Player = KozakHub.Window:AddTab({ Title = "Player", Icon = "user" })

KozakHub.WalkSpeed  = KozakHub.WalkSpeed  or 16
KozakHub.JumpPower  = KozakHub.JumpPower  or 50
KozakHub.FlySpeed   = KozakHub.FlySpeed   or 50
KozakHub.Flying     = KozakHub.Flying     or false
KozakHub.ESPEnabled = KozakHub.ESPEnabled or false
KozakHub.ESPColor   = KozakHub.ESPColor   or Color3.fromRGB(0, 220, 130)

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

KozakHub.WalkSpeed = KozakHub.WalkSpeed or 16

function KozakHub.SetWalkSpeed(val)
    KozakHub.WalkSpeed = val
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = val
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if hum and KozakHub.WalkSpeed then
        hum.WalkSpeed = KozakHub.WalkSpeed
    end
end)

if KozakHub.Tabs and KozakHub.Tabs.Player then
    KozakHub.Tabs.Player:AddSlider("WalkSpeed", {
        Title = "Walk Speed",
        Description = "Controls the player's movement speed",
        Default = KozakHub.WalkSpeed,
        Min = 16,
        Max = 1000,
        Rounding = 0,
        Callback = function(Value)
            KozakHub.SetWalkSpeed(Value)
        end
    })
end

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

KozakHub.JumpPower = KozakHub.JumpPower or 50

function KozakHub.SetJumpPower(val)
    KozakHub.JumpPower = val
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = val
            hum.JumpHeight = val / 2.5
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if hum then
        task.wait(0.1)
        hum.UseJumpPower = true
        if KozakHub.JumpPower then
            hum.JumpPower = KozakHub.JumpPower
            hum.JumpHeight = KozakHub.JumpPower / 2.5
        end
    end
end)

if LocalPlayer.Character then
    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.UseJumpPower = true
        hum.JumpPower = KozakHub.JumpPower
        hum.JumpHeight = KozakHub.JumpPower / 2.5
    end
end

if KozakHub.Tabs and KozakHub.Tabs.Player then
    KozakHub.Tabs.Player:AddSlider("JumpPower", {
        Title = "Jump Power",
        Description = "Controls the player's jump height",
        Default = KozakHub.JumpPower,
        Min = 50,
        Max = 1000,
        Rounding = 0,
        Callback = function(Value)
            KozakHub.SetJumpPower(Value)
        end
    })
end

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

KozakHub.FlySpeed    = KozakHub.FlySpeed    or 50
KozakHub.Flying      = false
KozakHub.TimedNoclip = false
KozakHub.WalkSpeed   = KozakHub.WalkSpeed   or 16

local bodyVelocity = nil
local bodyGyro = nil

function KozakHub.SetFlySpeed(val)
    KozakHub.FlySpeed = val
end

function KozakHub.SetFlyState(state)
    KozakHub.Flying = state
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChildOfClass("Humanoid") then return end
    local root = char.HumanoidRootPart
    local hum  = char:FindFirstChildOfClass("Humanoid")

    if KozakHub.Flying then
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        hum.PlatformStand = true

        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end

        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = root

        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        bodyGyro.CFrame = root.CFrame
        bodyGyro.Parent = root
    else
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        hum.PlatformStand = false
        if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
        if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
    end
end

RunService.PreRender:Connect(function()
    if KozakHub.WalkSpeed and KozakHub.WalkSpeed > 16 and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum and hum.WalkSpeed ~= KozakHub.WalkSpeed then
            hum.WalkSpeed = KozakHub.WalkSpeed
        end
    end
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.E and not KozakHub.TimedNoclip then
        KozakHub.TimedNoclip = true
        task.delay(1, function() KozakHub.TimedNoclip = false end)
    end
end)

RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if char and (KozakHub.Flying or KozakHub.TimedNoclip) then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if KozakHub.Flying
        and LocalPlayer.Character
        and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        and bodyVelocity
        and bodyGyro
    then
        local camera  = workspace.CurrentCamera
        local moveDir = Vector3.zero

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space)       then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end

        bodyGyro.CFrame        = camera.CFrame
        bodyVelocity.Velocity  = moveDir * KozakHub.FlySpeed
    end
end)

if KozakHub.Tabs and KozakHub.Tabs.Player then
    KozakHub.Tabs.Player:AddToggle("FlyToggle", {
        Title = "Fly + Noclip",
        Description = "Enables flight and noclip (press E for a quick noclip burst)",
        Default = false,
        Callback = function(Value)
            KozakHub.SetFlyState(Value)
        end
    })
end

local KozakHub = _G.KozakHub or {}

KozakHub.FlySpeed = KozakHub.FlySpeed or 50

if KozakHub.Tabs and KozakHub.Tabs.Player then
    KozakHub.Tabs.Player:AddSlider("FlySpeed", {
        Title = "Fly Speed",
        Description = "Controls how fast the player flies",
        Default = KozakHub.FlySpeed,
        Min = 10,
        Max = 10000,
        Rounding = 0,
        Callback = function(Value)
            if KozakHub.SetFlySpeed then
                KozakHub.SetFlySpeed(Value)
            else
                KozakHub.FlySpeed = Value
            end
        end
    })
end

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

KozakHub.ESPEnabled = false
KozakHub.ESPColor   = Color3.fromRGB(0, 220, 130)

local function removeESP(char)
    if not char then return end
    if char:FindFirstChild("ESPHighlight") then char.ESPHighlight:Destroy() end
    local head = char:FindFirstChild("Head")
    if head and head:FindFirstChild("ESPNameTag") then
        head.ESPNameTag:Destroy()
    end
end

local function applyESP(p, char)
    if not char or p == LocalPlayer then return end
    local head = char:FindFirstChild("Head")
    if not head then return end

    local highlight = char:FindFirstChild("ESPHighlight") or Instance.new("Highlight")
    highlight.Name              = "ESPHighlight"
    highlight.FillColor         = KozakHub.ESPColor
    highlight.FillTransparency  = 0.4
    highlight.OutlineColor      = Color3.fromRGB(255, 255, 255)
    highlight.OutlineTransparency = 0.2
    highlight.Enabled           = KozakHub.ESPEnabled
    highlight.Parent            = char

    local tag = head:FindFirstChild("ESPNameTag")
    if not tag then
        tag = Instance.new("BillboardGui")
        tag.Name         = "ESPNameTag"
        tag.Size         = UDim2.new(0, 160, 0, 30)
        tag.StudsOffset  = Vector3.new(0, 3, 0)
        tag.AlwaysOnTop  = true

        local label = Instance.new("TextLabel")
        label.Name                 = "TagLabel"
        label.Size                 = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3           = KozakHub.ESPColor
        label.Font                 = Enum.Font.GothamBold
        label.TextSize             = 12
        label.TextStrokeTransparency = 0.3
        label.Parent               = tag
        tag.Parent                 = head
    end
    tag.Enabled = KozakHub.ESPEnabled
    if tag:FindFirstChild("TagLabel") then
        tag.TagLabel.TextColor3 = KozakHub.ESPColor
    end
end

function KozakHub.RefreshESP()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            applyESP(p, p.Character)
        end
    end
end

function KozakHub.SetESPState(state)
    KozakHub.ESPEnabled = state
    if KozakHub.ESPEnabled then
        KozakHub.RefreshESP()
    else
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character then removeESP(p.Character) end
        end
    end
end

RunService.RenderStepped:Connect(function()
    if KozakHub.ESPEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        local myPos = LocalPlayer.Character.Head.Position
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local head = p.Character.Head
                local tag  = head:FindFirstChild("ESPNameTag")
                if tag and tag:FindFirstChild("TagLabel") then
                    local dist = math.floor((head.Position - myPos).Magnitude)
                    tag.TagLabel.Text = p.Name .. " [" .. dist .. "m]"
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(3)
        if KozakHub.ESPEnabled then KozakHub.RefreshESP() end
    end
end)

if KozakHub.Tabs and KozakHub.Tabs.Player then
    KozakHub.Tabs.Player:AddToggle("ESPToggle", {
        Title = "ESP Players",
        Description = "Highlights all players and shows their distance",
        Default = false,
        Callback = function(Value)
            KozakHub.SetESPState(Value)
        end
    })
end

local KozakHub = _G.KozakHub or {}

KozakHub.ESPColor = KozakHub.ESPColor or Color3.fromRGB(0, 220, 130)

if KozakHub.Tabs and KozakHub.Tabs.Player then
    KozakHub.Tabs.Player:AddColorpicker("ESPColorPicker", {
        Title = "ESP Color",
        Description = "Sets the highlight color for ESP",
        Default = KozakHub.ESPColor,
        Callback = function(Value)
            KozakHub.ESPColor = Value
            if KozakHub.ESPEnabled and KozakHub.RefreshESP then
                KozakHub.RefreshESP()
            end
        end
    })
end

local KozakHub = _G.KozakHub or {}

KozakHub.Tabs.Settings = KozakHub.Window:AddTab({ Title = "Settings", Icon = "settings" })

local KozakHub = _G.KozakHub or {}

if KozakHub.Tabs and KozakHub.Tabs.Settings then
    local Themes = {"Dark", "Light", "Darker", "Aqua", "Amethyst"}

    KozakHub.Tabs.Settings:AddDropdown("ThemeDropdown", {
        Title = "UI Theme",
        Description = "Choose the interface color theme",
        Values = Themes,
        Multi = false,
        Default = "Dark",
        Callback = function(Value)
            if KozakHub.Fluent then
                KozakHub.Fluent:SetTheme(Value)
            end
        end
    })
end

local KozakHub = _G.KozakHub or {}

if KozakHub.Tabs and KozakHub.Tabs.Settings then
    KozakHub.Tabs.Settings:AddButton({
        Title = "Reset All",
        Description = "Resets all settings back to their default values",
        Callback = function()
            local options = KozakHub.Fluent and KozakHub.Fluent.Options

            if options then
                pcall(function()
                    if options.WalkSpeed          then options.WalkSpeed:SetValue(16) end
                    if options.JumpPower           then options.JumpPower:SetValue(50) end
                    if options.FlySpeed            then options.FlySpeed:SetValue(50) end
                    if options.FlyToggle           then options.FlyToggle:SetValue(false) end
                    if options.ESPToggle           then options.ESPToggle:SetValue(false) end
                    if options.WatchTargetToggle   then options.WatchTargetToggle:SetValue(false) end
                    if options.FlingAllToggle      then options.FlingAllToggle:SetValue(false) end
                    if options.WheelSpinToggle     then options.WheelSpinToggle:SetValue(false) end
                    if options.WheelSpinSpeedSlider then options.WheelSpinSpeedSlider:SetValue(150) end
                    if options.ThemeDropdown       then options.ThemeDropdown:SetValue("Dark") end

                    if options.ESPColorPicker then
                        if options.ESPColorPicker.SetValueRGB then
                            options.ESPColorPicker:SetValueRGB(Color3.fromRGB(0, 220, 130))
                        elseif options.ESPColorPicker.SetValue then
                            options.ESPColorPicker:SetValue({Color3.fromRGB(0, 220, 130), 0})
                        end
                    end
                end)
            end

            if KozakHub.SetWalkSpeed   then KozakHub.SetWalkSpeed(16) end
            if KozakHub.SetJumpPower   then KozakHub.SetJumpPower(50) end
            if KozakHub.SetFlySpeed    then KozakHub.SetFlySpeed(50) end
            if KozakHub.SetFlyState    then KozakHub.SetFlyState(false) end
            if KozakHub.SetESPState    then KozakHub.SetESPState(false) end
            if KozakHub.SetFlingAllState  then KozakHub.SetFlingAllState(false) end
            if KozakHub.SetSpectateState  then KozakHub.SetSpectateState(false) end

            KozakHub.ESPColor        = Color3.fromRGB(0, 220, 130)
            KozakHub.WheelSpinEnabled = false
            KozakHub.WheelSpinSpeed   = 150

            if KozakHub.RefreshESP then KozakHub.RefreshESP() end

            if KozakHub.Fluent then
                KozakHub.Fluent:Notify({
                    Title = "Kozak-Hub",
                    Content = "All settings have been reset to default.",
                    Duration = 3
                })
            end
        end
    })

    KozakHub.Tabs.Settings:AddButton({
        Title = "Unload Kozak-Hub",
        Description = "Cleanly unloads the entire script and destroys the UI",
        Callback = function()
            if KozakHub.SetFlyState      then KozakHub.SetFlyState(false) end
            if KozakHub.SetESPState      then KozakHub.SetESPState(false) end
            if KozakHub.SetFlingAllState then KozakHub.SetFlingAllState(false) end
            if KozakHub.SetSpectateState then KozakHub.SetSpectateState(false) end

            if KozakHub.Fluent then
                KozakHub.Fluent:Destroy()
            end
            _G.KozakHub = nil
        end
    })
end

local KozakHub = _G.KozakHub or {}

KozakHub.Tabs.Troll = KozakHub.Window:AddTab({ Title = "Troll", Icon = "sword" })

KozakHub.TargetPlayer   = nil
KozakHub.FlingAllActive = false

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

KozakHub.TargetPlayer = nil

local function getPlayerNames()
    local names = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(names, p.Name)
        end
    end
    return #names > 0 and names or {"No players"}
end

if KozakHub.Tabs and KozakHub.Tabs.Troll then
    local initialNames = getPlayerNames()

    if initialNames[1] and initialNames[1] ~= "No players" then
        KozakHub.TargetPlayer = Players:FindFirstChild(initialNames[1])
    end

    local PlayerDropdown = KozakHub.Tabs.Troll:AddDropdown("SelectTargetDropdown", {
        Title = "Select Target",
        Description = "Automatically updated list of players",
        Values = initialNames,
        Multi = false,
        Default = 1,
        Callback = function(Value)
            if Value and Value ~= "No players" then
                KozakHub.TargetPlayer = Players:FindFirstChild(Value)
            else
                KozakHub.TargetPlayer = nil
            end
        end
    })

    local function updatePlayerList()
        task.defer(function()
            pcall(function()
                local currentNames = getPlayerNames()

                if PlayerDropdown and PlayerDropdown.SetValues then
                    PlayerDropdown:SetValues(currentNames)
                end

                if KozakHub.TargetPlayer and not Players:FindFirstChild(KozakHub.TargetPlayer.Name) then
                    KozakHub.TargetPlayer = nil
                end

                if KozakHub.TargetPlayer then
                    if PlayerDropdown and PlayerDropdown.SetValue then
                        PlayerDropdown:SetValue(KozakHub.TargetPlayer.Name)
                    end
                else
                    if currentNames[1] and currentNames[1] ~= "No players" then
                        KozakHub.TargetPlayer = Players:FindFirstChild(currentNames[1])
                        if PlayerDropdown and PlayerDropdown.SetValue then
                            PlayerDropdown:SetValue(currentNames[1])
                        end
                    else
                        KozakHub.TargetPlayer = nil
                        if PlayerDropdown and PlayerDropdown.SetValue then
                            PlayerDropdown:SetValue("No players")
                        end
                    end
                end
            end)
        end)
    end

    Players.PlayerAdded:Connect(updatePlayerList)
    Players.PlayerRemoving:Connect(function(player)
        if player == KozakHub.TargetPlayer then
            KozakHub.TargetPlayer = nil
        end
        updatePlayerList()
    end)
end

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

KozakHub.Spectating = false
local spectateConnection = nil

local function resetCamera()
    local camera = workspace.CurrentCamera
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            camera.CameraSubject = hum
        end
    end
end

function KozakHub.SetSpectateState(state)
    KozakHub.Spectating = state

    if spectateConnection then
        spectateConnection:Disconnect()
        spectateConnection = nil
    end

    if state then
        -- Lock the camera onto the target every frame, including after respawns
        spectateConnection = RunService.RenderStepped:Connect(function()
            if not KozakHub.Spectating then return end

            local camera = workspace.CurrentCamera
            local target = KozakHub.TargetPlayer

            if target and target.Character then
                local targetHum = target.Character:FindFirstChildOfClass("Humanoid")
                if targetHum and camera.CameraSubject ~= targetHum then
                    camera.CameraSubject = targetHum
                end
            end
        end)
    else
        resetCamera()
    end
end

Players.PlayerRemoving:Connect(function(player)
    if player == KozakHub.TargetPlayer and KozakHub.Spectating then
        local options = KozakHub.Fluent and KozakHub.Fluent.Options
        if options and options.WatchTargetToggle then
            options.WatchTargetToggle:SetValue(false)
        else
            KozakHub.SetSpectateState(false)
        end
    end
end)

if KozakHub.Tabs and KozakHub.Tabs.Troll then
    KozakHub.Tabs.Troll:AddToggle("WatchTargetToggle", {
        Title = "Spectate Target",
        Description = "Locks the camera onto the selected player (survives respawns)",
        Default = false,
        Callback = function(Value)
            KozakHub.SetSpectateState(Value)
        end
    })
end

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function KozakHub.TeleportToTarget()
    local target = KozakHub.TargetPlayer
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local myChar = LocalPlayer.Character
        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
            myChar.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
        end
    end
end

if KozakHub.Tabs and KozakHub.Tabs.Troll then
    KozakHub.Tabs.Troll:AddButton({
        Title = "TP to Target",
        Description = "Teleports you directly behind the selected player",
        Callback = function()
            KozakHub.TeleportToTarget()
        end
    })
end

local KozakHub = _G.KozakHub or {}
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local isExecuting = false

local function getBallObjectName()
    return "Soccer" .. (LocalPlayer and LocalPlayer.Name or "")
end

local function getBallPart()
    local ballObjectName = getBallObjectName()
    local found = Workspace:FindFirstChild(ballObjectName, true)

    if not found and LocalPlayer.Character then
        found = LocalPlayer.Character:FindFirstChild(ballObjectName, true)
    end
    if not found then
        local bp = LocalPlayer:FindFirstChildOfClass("Backpack")
        if bp then found = bp:FindFirstChild(ballObjectName, true) end
    end

    if found then
        if found:IsA("BasePart") then
            return found
        elseif found:IsA("Model") and found.PrimaryPart then
            return found.PrimaryPart
        elseif found:IsA("Model") then
            return found:FindFirstChildOfClass("BasePart")
        elseif found:IsA("Tool") and found:FindFirstChild("Handle") then
            return found.Handle
        end
    end
    return nil
end

local function equipBall()
    local char = LocalPlayer and LocalPlayer.Character
    if not char then return nil end

    local tool = char:FindFirstChild("SoccerBall") or char:FindFirstChild("Soccer Ball") or char:FindFirstChildOfClass("Tool")
    if not tool then
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        if backpack then
            tool = backpack:FindFirstChild("SoccerBall") or backpack:FindFirstChild("Soccer Ball") or backpack:FindFirstChildOfClass("Tool")
            if tool then
                tool.Parent = char
                task.wait()
            end
        end
    end
    return tool
end

function KozakHub.ExecuteBallFling()
    if isExecuting then return end

    local target = KozakHub.TargetPlayer
    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

    isExecuting = true

    local char       = LocalPlayer.Character
    local humanoid   = char and char:FindFirstChildOfClass("Humanoid")
    local targetRoot = target.Character.HumanoidRootPart
    local startTargetPos = targetRoot.Position

    local tool = equipBall()
    if tool and tool:IsA("Tool") then
        tool:Activate()
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(500, 500))
        end)
    end

    local ballPart  = nil
    local searchStart = tick()
    while tick() - searchStart < 0.5 do
        ballPart = getBallPart()
        if ballPart then break end
        task.wait()
    end

    if ballPart and targetRoot then
        if ballPart.Parent ~= Workspace then
            ballPart.Parent = Workspace
        end

        local function hideBall()
            ballPart.Transparency = 1
            for _, child in ipairs(ballPart:GetDescendants()) do
                if child:IsA("BasePart") or child:IsA("Decal") or child:IsA("Texture") then
                    pcall(function() child.Transparency = 1 end)
                elseif child:IsA("ParticleEmitter") or child:IsA("Trail") or child:IsA("Beam") then
                    pcall(function() child.Enabled = false end)
                end
            end
        end

        hideBall()
        ballPart.CanCollide = true
        ballPart.CanTouch   = true
        ballPart.CFrame     = targetRoot.CFrame
        ballPart.AssemblyLinearVelocity  = Vector3.new(0, 0, 0)
        ballPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        task.wait(0.03)

        local targetFled    = false
        local flingConnection = nil

        flingConnection = RunService.Heartbeat:Connect(function()
            if not targetRoot or not targetRoot.Parent or not target.Character then
                targetFled = true
                return
            end

            ballPart = getBallPart() or ballPart
            if not ballPart or not ballPart.Parent then return end

            if ballPart.Parent ~= Workspace then ballPart.Parent = Workspace end

            hideBall()

            ballPart.Anchored     = false
            ballPart.CanCollide   = true
            ballPart.CanTouch     = true
            ballPart.Massless     = false
            ballPart.CustomPhysicalProperties = PhysicalProperties.new(100, 100, 100, 100, 100)

            for _, child in ipairs(ballPart:GetChildren()) do
                if child:IsA("BodyAngularVelocity") or child:IsA("BodyVelocity")
                    or child:IsA("BodyGyro") or child:IsA("AlignPosition")
                then
                    child:Destroy()
                end
            end

            local targetVel = targetRoot.AssemblyLinearVelocity
            local speed     = targetVel.Magnitude
            local targetPos = targetRoot.Position
            if speed > 1 then
                local leadDist = math.clamp(speed * 0.9, 6, 25)
                targetPos = targetRoot.Position + (targetVel.Unit * leadDist)
            end

            ballPart.CFrame = CFrame.new(targetPos)

            ballPart.AssemblyAngularVelocity = Vector3.new(20000000, 20000000, 20000000)
            ballPart.AssemblyLinearVelocity  = Vector3.new(
                (math.random() - 0.5) * 10000,
                250000,
                (math.random() - 0.5) * 10000
            )

            local currentDist  = (targetRoot.Position - startTargetPos).Magnitude
            local currentSpeed = targetRoot.AssemblyLinearVelocity.Magnitude
            if currentDist >= 10000 or targetRoot.Position.Y >= 10000 or currentSpeed >= 10000 then
                targetFled = true
            end
        end)

        local flingStart = tick()
        while not targetFled and (tick() - flingStart < 8.0) do
            task.wait()
        end

        if flingConnection then flingConnection:Disconnect() end
    end

    if humanoid then
        humanoid:UnequipTools()
        task.wait()
        equipBall()
        task.wait()
        humanoid:UnequipTools()
    end

    isExecuting = false
end

if KozakHub.Tabs and KozakHub.Tabs.Troll then
    KozakHub.Tabs.Troll:AddButton({
        Title = "Fling Target",
        Description = "Snaps the ball to the target's body and ultra-flings them",
        Callback = function()
            task.spawn(function()
                KozakHub.ExecuteBallFling()
            end)
        end
    })
end

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

KozakHub.FlingAllActive = false

function KozakHub.SetFlingAllState(state)
    KozakHub.FlingAllActive = state
    if state then
        task.spawn(function()
            while KozakHub.FlingAllActive do
                local playerList = Players:GetPlayers()
                for _, p in ipairs(playerList) do
                    if not KozakHub.FlingAllActive then break end

                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local humanoid = p.Character:FindFirstChildOfClass("Humanoid")

                        if humanoid and humanoid.Health > 0 and not p.Character:FindFirstChildOfClass("ForceField") then
                            KozakHub.TargetPlayer = p
                            if KozakHub.ExecuteBallFling then
                                KozakHub.ExecuteBallFling()
                            end
                            task.wait(0.05)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end

if KozakHub.Tabs and KozakHub.Tabs.Troll then
    KozakHub.Tabs.Troll:AddToggle("FlingAllToggle", {
        Title = "Fling All (Loop)",
        Description = "Continuously flings every living player on the server",
        Default = false,
        Callback = function(Value)
            KozakHub.SetFlingAllState(Value)
        end
    })
end

local KozakHub = _G.KozakHub or {}

KozakHub.Tabs.Vehicle = KozakHub.Window:AddTab({ Title = "Vehicle", Icon = "car" })

KozakHub.WheelSpinSpeed   = KozakHub.WheelSpinSpeed or 150
KozakHub.WheelSpinEnabled = false

local KozakHub = _G.KozakHub or {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

KozakHub.WheelSpinSpeed   = KozakHub.WheelSpinSpeed or 150
KozakHub.WheelSpinEnabled = false

local function getPlayerCar()
    local vehicles = workspace:FindFirstChild("Vehicles")
    if vehicles then
        local myCar = vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
        if myCar then return myCar end
        for _, car in ipairs(vehicles:GetChildren()) do
            if car.Name:find(LocalPlayer.Name) then return car end
        end
    end
 
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.SeatPart then
            return hum.SeatPart:FindFirstAncestorOfClass("Model")
        end
    end
    return nil
end

local function applyWheelSpin()
    local car = getPlayerCar()
    if not car then return end

    local wheelsFolder = car:FindFirstChild("Wheels", true)
    local searchScope  = wheelsFolder or car

    for _, obj in ipairs(searchScope:GetDescendants()) do
        if obj:IsA("CylindricalConstraint") then
            obj.AngularActuatorType = Enum.ActuatorType.Motor
            obj.MotorMaxTorque      = 99999999
            obj.AngularVelocity     = KozakHub.WheelSpinSpeed
        elseif obj:IsA("BasePart") and (obj.Name:find("Wheel") or obj.Name == "PhysicalWheel") then
            obj.AssemblyAngularVelocity = obj.CFrame.RightVector * (-KozakHub.WheelSpinSpeed)
        end
    end
end

RunService.Heartbeat:Connect(function()
    if KozakHub.WheelSpinEnabled then
        applyWheelSpin()
    end
end)

if KozakHub.Tabs and KozakHub.Tabs.Vehicle then
    KozakHub.Tabs.Vehicle:AddToggle("WheelSpinToggle", {
        Title = "Vehicle Spin",
        Description = "Spins the vehicle wheels at max speed (do not exit the vehicle!)",
        Default = false,
        Callback = function(Value)
            KozakHub.WheelSpinEnabled = Value
        end
    })
end
