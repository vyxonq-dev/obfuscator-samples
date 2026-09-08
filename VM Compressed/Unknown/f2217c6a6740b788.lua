local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "X Hub - NBTB • Open Source Version",
    SubTitle = "new update!1!1!",
    TabWidth = 130,
    Size = UDim2.fromOffset(500, 360),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Blizzard 1", Icon = "home" }),
    btwo = Window:AddTab({ Title = "Blizzard 2", Icon = "map" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

Fluent:Notify({
    Title = "Hello!",
    Content = "Thanks for using X Hub.",
    Duration = 5
})

local itemPickup = workspace:FindFirstChild("ItemPickup")
if itemPickup and itemPickup:IsA("Sound") then
    itemPickup.SoundId = "rbxassetid://320412149"
end

local soundService = game:GetService("SoundService")

local cameraStatic = soundService:FindFirstChild("Camera static")
if cameraStatic then
    cameraStatic.Volume = 0
end

Tabs.btwo:AddButton({
    Title = "Execute Blizzard 2 Script",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/jogosutora/Nbb/refs/heads/main/blizzardtwo.lua"))()
    end
})

-- Main Features
do
    -- SERVER INFO SECTION
    local ServerSection = Tabs.Main:AddSection("Game Data")
    
    local PlayerCountParagraph = Tabs.Main:AddParagraph({
        Title = "Server Status",
        Content = "Players Online: " .. #game.Players:GetPlayers() .. "/" .. game.Players.MaxPlayers
    })
    
    game.Players.PlayerAdded:Connect(function()
        PlayerCountParagraph:SetDesc("Players Online: " .. #game.Players:GetPlayers() .. "/" .. game.Players.MaxPlayers)
    end)
    
    game.Players.PlayerRemoving:Connect(function()
        PlayerCountParagraph:SetDesc("Players Online: " .. #game.Players:GetPlayers() .. "/" .. game.Players.MaxPlayers)
    end)
    
    Tabs.Main:AddButton({
        Title = "[REQUIRED] Remove Anticheat Barrier",
        Description = "Removes all barrier-related objects",
        Callback = function()
            -- Remove anything with "barrier" in its name (case insensitive)
            for _, object in pairs(workspace:GetDescendants()) do
                if object.Name:lower():match("barrier") then
                    object:Destroy()
                end
            end
            
            -- Remove specific KickBarriers folder if it exists
            if workspace:FindFirstChild("KickBarriers") then
                workspace.KickBarriers:Destroy()
            end
            
            Fluent:Notify({
                Title = "Barriers Removed",
                Content = "All barrier objects have been removed",
                Duration = 2
            })
        end
    })
    -- VISUAL SECTION
    local VisualSection = Tabs.Main:AddSection("Visual Features")

    -- Headlight Controls
    local HeadLight = nil
    local LightToggle = Tabs.Main:AddToggle("HeadlightToggle", {
        Title = "Headlight",
        Description = "Toggle light source from character head",
        Default = false
    })

    LightToggle:OnChanged(function()
        if Options.HeadlightToggle.Value then
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Head") then
                HeadLight = Instance.new("PointLight")
                HeadLight.Parent = game.Players.LocalPlayer.Character.Head
                HeadLight.Brightness = Options.LightPower.Value
                HeadLight.Color = Options.LightColor.Value
            end
        else
            if HeadLight then
                HeadLight:Destroy()
                HeadLight = nil
            end
        end
    end)

    local LightSlider = Tabs.Main:AddSlider("LightPower", {
        Title = "Light Power",
        Description = "Adjust the brightness of your headlight",
        Default = 5,
        Min = 0,
        Max = 10,
        Rounding = 1,
    })

    LightSlider:OnChanged(function(Value)
        if HeadLight then
            HeadLight.Brightness = Value
        end
    end)

    local ColorPicker = Tabs.Main:AddColorpicker("LightColor", {
        Title = "Light Color",
        Description = "Customize your headlight color",
        Default = Color3.fromRGB(255, 255, 255)
    })

    ColorPicker:OnChanged(function()
        if HeadLight then
            HeadLight.Color = Options.LightColor.Value
        end
    end)

    -- Fullbright Toggle
    local FullbrightToggle = Tabs.Main:AddToggle("FullbrightToggle", {
        Title = "Fullbright",
        Description = "Remove darkness from the game",
        Default = false
    })

    local DefaultAmbient = game.Lighting.Ambient
    local DefaultOutdoorAmbient = game.Lighting.OutdoorAmbient
    local DefaultBrightness = game.Lighting.Brightness

    FullbrightToggle:OnChanged(function()
        if Options.FullbrightToggle.Value then
            game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            game.Lighting.Brightness = 2
        else
            game.Lighting.Ambient = DefaultAmbient
            game.Lighting.OutdoorAmbient = DefaultOutdoorAmbient
            game.Lighting.Brightness = DefaultBrightness
        end
    end)
    
    Tabs.Main:AddButton({
        Title = "Open Computer UI ~ Remove Color Correction",
        Callback = function()
            fireclickdetector(workspace.Triggers.CamerasPC.ClickDetector)
            wait(0.2)
            game:GetService("Lighting").ColorCorrection.Enabled = false
        end
    })

    -- Flash Toggles
    local SpamFlashToggle = Tabs.Main:AddToggle("SpamFlash", {
        Title = "Spam Flash",
        Description = "Bypass cooldown",
        Default = false
    })
    
    -- Auto Flash Toggle
    local AutoFlashToggle = Tabs.Main:AddToggle("AutoFlash", {
        Title = "Auto Flash",
        Default = false
    })

    -- Winterhorn ESP
    local WinterhornToggle = Tabs.Main:AddToggle("WinterhornESP", {
        Title = "[AUTO] Winterhorn ESP",
        Description = "Automatically highlights Winterhorn when it spawns",
        Default = false
    })

    local function addHighlight(model)
        if not model:FindFirstChild("Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.Parent = model
        end
    end

    WinterhornToggle:OnChanged(function()
        if Options.WinterhornESP.Value then
            -- Check existing
            local existing = workspace:FindFirstChild("Winterhorn", true)
            if existing then
                addHighlight(existing)
            end

            -- Watch for new ones
            workspace.DescendantAdded:Connect(function(desc)
                if Options.WinterhornESP.Value and desc.Name == "Winterhorn" then
                    addHighlight(desc)
                end
            end)
        else
            -- Remove existing highlights
            local existing = workspace:FindFirstChild("Winterhorn", true)
            if existing and existing:FindFirstChild("Highlight") then
                existing.Highlight:Destroy()
            end
        end
    end)

    -- WOOD SECTION
    local WoodSection = Tabs.Main:AddSection("Wood Operations")

    -- Grab Wood Button
    Tabs.Main:AddButton({
        Title = "[🪵] Grab Wood",
        Description = "Collect wood from the outside shelf",
        Callback = function()
            if workspace:FindFirstChild("Other") and workspace.Other:FindFirstChild("WoodClick") then
                fireclickdetector(workspace.Other.WoodClick.Click)
                Fluent:Notify({
                    Title = "Success",
                    Content = "Grabbed wood!",
                    Duration = 2
                })
            end
        end
    })

    -- Get Wood from Storage Button
    Tabs.Main:AddButton({
        Title = "[🪵] Get Wood from Storage",
        Description = "Retrieve wood from storage",
        Callback = function()
            if workspace:FindFirstChild("Other") and workspace.Other:FindFirstChild("WoodsStorage") then
                fireclickdetector(workspace.Other.WoodsStorage.Detector.ClickDetector)
                Fluent:Notify({
                    Title = "Success",
                    Content = "Retrieved wood from storage!",
                    Duration = 2
                })
            end
        end
    })

    -- Place Wood Button
    Tabs.Main:AddButton({
        Title = "Place Wood",
        Description = "Must have wood in inventory",
        Callback = function()
            if workspace:FindFirstChild("Other") and workspace.Other:FindFirstChild("FireWoodTouch") then
                local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Other.FireWoodTouch.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
            end
        end
    })

    -- Auto Place Wood Toggle
    local AutoWoodToggle = Tabs.Main:AddToggle("AutoWoodToggle", {
        Title = "Auto Place Wood",
        Description = "Automatically grabs and places wood every 30 seconds",
        Default = false
    })

    -- ITEMS SECTION
    local ItemsSection = Tabs.Main:AddSection("Others")

    -- Get All Cola Button
    Tabs.Main:AddButton({
        Title = "[🍾] Get All Cola",
        Description = "Collect all cola items in the area",
        Callback = function()
            local itemsFound = 0
            for _, item in pairs(workspace.Items:GetDescendants()) do
                if item.Name == "Cola" and item:FindFirstChild("ClickDetector") then
                    fireclickdetector(item.ClickDetector)
                    itemsFound = itemsFound + 1
                end
            end
            Fluent:Notify({
                Title = "Cola Collected",
                Content = "Found " .. itemsFound .. " cola items",
                Duration = 2
            })
        end
    })

    local AutoHideToggle = Tabs.Main:AddToggle("AutoHideWinterhorn", {
        Title = "[Read Desc] Auto Hide from Winterhorn",
        Description = "DELETE BARRIER FIRST • Automatically teleports to safe spot when Winterhorn spawns",
        Default = false
    })
    -- LOCKERS SECTION
    local LockersSection = Tabs.Main:AddSection("Lockers")

    -- Spam Lockers Toggle
    local SpamLockersToggle = Tabs.Main:AddToggle("SpamLockers", {
        Title = "[🚪] Spam Lockers Nearby",
        Description = "Continuously triggers all locker interactions",
        Default = false
    })

    -- Auto Wood Loop
    task.spawn(function()
        while true do
            wait(30)
            if Options.AutoWoodToggle.Value then
                -- Grab Wood
                if workspace:FindFirstChild("Other") and workspace.Other:FindFirstChild("WoodClick") then
                    fireclickdetector(workspace.Other.WoodClick.Click)
                    wait(1)
                    
                    -- Place Wood
                    if workspace.Other:FindFirstChild("FireWoodTouch") then
                        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Other.FireWoodTouch.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
                    end
                end
            end
            
            if Fluent.Unloaded then break end
        end
    end)
    
    -- Spam Flash Loop
    task.spawn(function()
        while true do
            wait(0.1)
            if Options.SpamFlash.Value then
                game:GetService("ReplicatedStorage").RemoteEvents.Flash:FireServer()
            end
            if Fluent.Unloaded then break end
        end
    end)
    
    -- Auto Flash Loop
    task.spawn(function()
        workspace.DescendantAdded:Connect(function(desc)
            if Options.AutoFlash.Value and desc.Name == "Winterhorn" then
                wait(0.2)
                game:GetService("ReplicatedStorage").RemoteEvents.Flash:FireServer()
            end
        end)
    end)
    
    -- Winterhorn monitoring loop
    task.spawn(function()
        local hidingPosition = CFrame.new(127, 39, -165)
        local oldPosition = nil
        local isHiding = false
        
        while true do
            wait(0.5)
            if Options.AutoHideWinterhorn.Value then
                local winterhorn = workspace:FindFirstChild("Winterhorn", true)
                
                -- Winterhorn exists and we're not hiding
                if winterhorn and not isHiding then
                    oldPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hidingPosition
                    isHiding = true
                    
                    Fluent:Notify({
                        Title = "Auto Hide",
                        Content = "Winterhorn detected! Hiding...",
                        Duration = 2
                    })
                
                -- Winterhorn is gone and we are hiding
                elseif not winterhorn and isHiding and oldPosition then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPosition
                    isHiding = false
                    
                    Fluent:Notify({
                        Title = "Auto Hide",
                        Content = "Winterhorn gone, returning to position",
                        Duration = 2
                    })
                end
            end
            
            if Fluent.Unloaded then break end
        end
    end)

    -- Lockers Loop
    task.spawn(function()
        while true do
            wait(1)
            if Options.SpamLockers.Value then
                for i = 1, 4 do
                    if workspace:FindFirstChild("Lockers") and 
                       workspace.Lockers:FindFirstChild(tostring(i)) and 
                       workspace.Lockers[tostring(i)]:FindFirstChild("ClickDetect") then
                        fireclickdetector(workspace.Lockers[tostring(i)].ClickDetect.ClickDetector)
                    end
                end
            end
            
            if Fluent.Unloaded then break end
        end
    end)
end


-- Configure save manager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("SigmaOhio")
SaveManager:SetFolder("SigmaOhio/configs")

-- Build setting tabs
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- Select default tab
Window:SelectTab(1)

-- Load configs
SaveManager:LoadAutoloadConfig()
