--[[
    ███████╗██╗██╗  ██╗███████╗    ██╗  ██╗██╗   ██╗██████╗ 
    ██╔════╝██║╚██╗██╔╝╚══███╔╝    ██║  ██║██║   ██║██╔══██╗
    █████╗  ██║ ╚███╔╝   ███╔╝     ███████║██║   ██║██████╔╝
    ██╔══╝  ██║ ██╔██╗  ███╔╝      ██╔══██║██║   ██║██╔══██╗
    ██║     ██║██╔╝ ██╗███████╗    ██║  ██║╚██████╔╝██████╔╝
    ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
                    DOORS Edition - OP Features
                         Key System Protected
]]

--!nocheck
--!nolint

-- Key System Configuration
local VALID_KEY = "Fixz2025"
local DISCORD_LINK = "https://discord.gg/G4AuBncANE"
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local showKeyGUI = true

-- Create folder for key storage
if not isfolder("FixzHub") then
    makefolder("FixzHub")
end

-- Check for saved key
if isfile("FixzHub/key.txt") then
    local savedKey = readfile("FixzHub/key.txt")
    if savedKey == VALID_KEY then
        showKeyGUI = false
    end
end

-- Main Script Function
local function LoadMainScript()
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

    local Window = Fluent:CreateWindow({
        Title = "Fixz Hub | DOORS",
        SubTitle = "OP Features",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.RightControl
    })

    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "home" }),
        ESP = Window:AddTab({ Title = "ESP", Icon = "eye" }),
        Visuals = Window:AddTab({ Title = "Visuals", Icon = "monitor" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    }

    -- Variables
    local LocalPlayer = game.Players.LocalPlayer
    local Rooms = workspace.CurrentRooms
    local EspObjects = {}

    -- Notification Function
    local function Notify(title, content, duration)
        Fluent:Notify({
            Title = title,
            Content = content,
            Duration = duration or 3
        })
    end

    -- ESP Function
    local function CreateESP(object, text, color)
        local BillboardGui = Instance.new("BillboardGui")
        local TextLabel = Instance.new("TextLabel")
        local Highlight = Instance.new("Highlight")

        BillboardGui.Parent = object
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.fromScale(0, 0)
        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)

        TextLabel.Parent = BillboardGui
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.fromScale(1, 1)
        TextLabel.Font = Enum.Font.SourceSansBold
        TextLabel.TextSize = 16
        TextLabel.TextColor3 = color
        TextLabel.TextStrokeTransparency = 0.5
        TextLabel.Text = text

        Highlight.Parent = object
        Highlight.FillColor = color
        Highlight.OutlineColor = color
        Highlight.FillTransparency = 0.5
        Highlight.OutlineTransparency = 0

        table.insert(EspObjects, {BillboardGui, Highlight})
        
        return BillboardGui, Highlight
    end

    -- ==================== MAIN TAB ====================
    local MainSection = Tabs.Main:AddSection("Automation")

    local AutoInteract = Tabs.Main:AddToggle("AutoInteract", {
        Title = "Auto Interact",
        Description = "Automatically interact with nearby objects",
        Default = false
    })

    local AutoInteractKeybind = Tabs.Main:AddKeybind("AutoInteractKey", {
        Title = "Auto Interact Key",
        Mode = "Hold",
        Default = "R",
        Callback = function(Value)
            -- Handled in main loop
        end
    })

    local AutoHide = Tabs.Main:AddToggle("AutoHide", {
        Title = "Auto Hide",
        Description = "Automatically hide from entities",
        Default = false
    })

    local PredictionTime = Tabs.Main:AddSlider("PredictionTime", {
        Title = "Prediction Time",
        Description = "How early to hide",
        Default = 0.5,
        Min = 0.1,
        Max = 2,
        Rounding = 1
    })

    Tabs.Main:AddSection("Anti-Entity")

    local AntiEyes = Tabs.Main:AddToggle("AntiEyes", {
        Title = "Anti-Eyes",
        Description = "Automatically look away from Eyes",
        Default = false
    })

    local AntiScreech = Tabs.Main:AddToggle("AntiScreech", {
        Title = "Anti-Screech",
        Description = "Auto-look at Screech",
        Default = false
    })

    local AntiDupe = Tabs.Main:AddToggle("AntiDupe", {
        Title = "Anti-Dupe",
        Description = "Prevent touching fake doors",
        Default = false
    })

    local AntiSnare = Tabs.Main:AddToggle("AntiSnare", {
        Title = "Anti-Snare",
        Description = "Prevent snare damage",
        Default = false
    })

    Tabs.Main:AddSection("Exploits")

    local SpeedHack = Tabs.Main:AddToggle("SpeedHack", {
        Title = "Speed Hack",
        Description = "Increase movement speed",
        Default = false
    })

    local SpeedValue = Tabs.Main:AddSlider("SpeedValue", {
        Title = "Speed Amount",
        Default = 20,
        Min = 16,
        Max = 100,
        Rounding = 0
    })

    local InfiniteJump = Tabs.Main:AddToggle("InfiniteJump", {
        Title = "Infinite Jump",
        Description = "Jump at any time",
        Default = false
    })

    local NoClip = Tabs.Main:AddToggle("NoClip", {
        Title = "No Clip",
        Description = "Walk through walls",
        Default = false
    })

    -- ==================== ESP TAB ====================
    Tabs.ESP:AddSection("Entity ESP")

    local EntityESP = Tabs.ESP:AddToggle("EntityESP", {
        Title = "Entity ESP",
        Description = "See entities through walls",
        Default = false
    })

    local EntityColor = Tabs.ESP:AddColorpicker("EntityColor", {
        Title = "Entity Color",
        Default = Color3.fromRGB(255, 0, 0)
    })

    Tabs.ESP:AddSection("Item ESP")

    local KeyESP = Tabs.ESP:AddToggle("KeyESP", {
        Title = "Key ESP",
        Description = "Show keys",
        Default = false
    })

    local LeverESP = Tabs.ESP:AddToggle("LeverESP", {
        Title = "Lever ESP",
        Description = "Show levers",
        Default = false
    })

    local ItemESP = Tabs.ESP:AddToggle("ItemESP", {
        Title = "Item ESP",
        Description = "Show all items",
        Default = false
    })

    local DoorESP = Tabs.ESP:AddToggle("DoorESP", {
        Title = "Door ESP",
        Description = "Highlight doors",
        Default = false
    })

    -- ==================== VISUALS TAB ====================
    Tabs.Visuals:AddSection("Camera")

    local FOVSlider = Tabs.Visuals:AddSlider("FOV", {
        Title = "Field of View",
        Default = 70,
        Min = 70,
        Max = 120,
        Rounding = 0
    })

    local Fullbright = Tabs.Visuals:AddToggle("Fullbright", {
        Title = "Fullbright",
        Description = "Remove darkness",
        Default = false
    })

    local NoFog = Tabs.Visuals:AddToggle("NoFog", {
        Title = "No Fog",
        Description = "Remove fog",
        Default = false
    })

    Tabs.Visuals:AddSection("Effects")

    local NoJumpscare = Tabs.Visuals:AddToggle("NoJumpscare", {
        Title = "No Jumpscares",
        Description = "Disable jumpscare effects",
        Default = false
    })

    local NoShake = Tabs.Visuals:AddToggle("NoShake", {
        Title = "No Camera Shake",
        Description = "Remove camera shake",
        Default = false
    })

    -- ==================== SETTINGS TAB ====================
    SaveManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    SaveManager:SetFolder("FixzHub/DOORS")
    SaveManager:BuildConfigSection(Tabs.Settings)

    InterfaceManager:SetLibrary(Fluent)
    InterfaceManager:SetFolder("FixzHub")
    InterfaceManager:BuildInterfaceSection(Tabs.Settings)

    -- ==================== MAIN LOGIC ====================

    -- Speed Hack
    game:GetService("RunService").RenderStepped:Connect(function()
        if SpeedHack.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = SpeedValue.Value
        end
    end)

    -- Infinite Jump
    if LocalPlayer.Character then
        LocalPlayer.Character:SetAttribute("CanJump", true)
    end

    game:GetService("RunService").Heartbeat:Connect(function()
        if InfiniteJump.Value and LocalPlayer.Character then
            LocalPlayer.Character:SetAttribute("CanJump", true)
        end
    end)

    -- NoClip
    game:GetService("RunService").Stepped:Connect(function()
        if NoClip.Value and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)

    -- FOV
    game:GetService("RunService").RenderStepped:Connect(function()
        if workspace.CurrentCamera then
            workspace.CurrentCamera.FieldOfView = FOVSlider.Value
        end
    end)

    -- Fullbright
    game:GetService("RunService").RenderStepped:Connect(function()
        if Fullbright.Value then
            game.Lighting.Brightness = 2
            game.Lighting.ClockTime = 14
            game.Lighting.GlobalShadows = false
            game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end
    end)

    -- No Fog
    game:GetService("RunService").RenderStepped:Connect(function()
        if NoFog.Value then
            game.Lighting.FogEnd = 100000
            if game.Lighting:FindFirstChildOfClass("Atmosphere") then
                game.Lighting:FindFirstChildOfClass("Atmosphere").Density = 0
            end
        end
    end)

    -- Anti-Dupe
    game:GetService("RunService").Heartbeat:Connect(function()
        if AntiDupe.Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "DoorFake" and v:FindFirstChild("Hidden") then
                    v.Hidden.CanTouch = false
                end
            end
        end
    end)

    -- Anti-Snare
    game:GetService("RunService").Heartbeat:Connect(function()
        if AntiSnare.Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Snare" and v:FindFirstChild("Hitbox") then
                    v.Hitbox.CanTouch = false
                end
            end
        end
    end)

    -- Anti-Eyes/Lookman
    game:GetService("RunService").RenderStepped:Connect(function()
        if AntiEyes.Value then
            if workspace:FindFirstChild("Eyes") or workspace:FindFirstChild("BackdoorLookman") then
                game.ReplicatedStorage.RemotesFolder.MotorReplication:FireServer(-650)
            end
        end
    end)

    -- Entity ESP
    workspace.ChildAdded:Connect(function(child)
        if EntityESP.Value then
            task.wait(0.1)
            if child:IsA("Model") then
                local entityNames = {"RushMoving", "AmbushMoving", "Eyes", "BackdoorLookman", "A60", "A120"}
                if table.find(entityNames, child.Name) then
                    local primaryPart = child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart")
                    if primaryPart then
                        CreateESP(child, child.Name, EntityColor.Value)
                        Notify("Entity Detected!", child.Name .. " has spawned!", 3)
                    end
                end
            end
        end
    end)

    -- Key/Item ESP
    Rooms.DescendantAdded:Connect(function(descendant)
        task.wait(0.1)
        if descendant:IsA("Model") then
            if KeyESP.Value and descendant.Name == "KeyObtain" then
                CreateESP(descendant, "Key", Color3.fromRGB(255, 255, 0))
            elseif LeverESP.Value and descendant.Name == "LeverForGate" then
                CreateESP(descendant, "Lever", Color3.fromRGB(0, 255, 0))
            elseif DoorESP.Value and descendant.Name == "Door" then
                CreateESP(descendant, "Door", Color3.fromRGB(0, 150, 255))
            end
        end
    end)

    -- Success Notification
    Notify("Fixz Hub Loaded!", "All features are ready to use!", 5)

    Window:SelectTab(1)

    SaveManager:LoadAutoloadConfig()
end

-- ==================== KEY SYSTEM GUI ====================
if showKeyGUI then
    local Obsidian = loadstring(game:HttpGet(repo .. "Library.lua"))()

    local Window = Obsidian:CreateWindow({
        Title = "Fixz Hub",
        Footer = "Key System",
        ToggleKeybind = Enum.KeyCode.F8,
        SetMobileButtonSide = "Left",
        DisableSearch = true,
        ShowCustomCursor = false,
        Icon = "rbxassetid://135799847160092",
        IconSize = UDim2.fromOffset(40, 40),
        Size = UDim2.fromOffset(400, 300),
        Center = true,
        AutoShow = true
    })

    local Tabs = {
        KeyTab = Window:AddKeyTab("Key", "key"),
    }

    Tabs.KeyTab:AddLabel({
        Text = "Fixz Hub Key System",
        DoesWrap = true,
        Size = 20,
    })

    Tabs.KeyTab:AddLabel({
        Text = "Get key from discord.gg/G4AuBncANE",
        DoesWrap = true,
        Size = 17,
    })

    Tabs.KeyTab:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            setclipboard(DISCORD_LINK)
            Obsidian:Notify("Discord link copied to clipboard!", 10)
        end
    })

    Tabs.KeyTab:AddKeyBox(VALID_KEY, function(Success, ReceivedKey)
        if Success then
            writefile("FixzHub/key.txt", ReceivedKey)
            Obsidian:Unload()
            LoadMainScript()
        else
            Obsidian:Notify("Wrong key! Get the key from our Discord.", 5)
        end
    end)
else
    -- Key is valid, load main script
    LoadMainScript()
end