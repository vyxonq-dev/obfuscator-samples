local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "X Hub - Blizzard 2",
    SubTitle = "Full Auto + Manual",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 360),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main (B2)", Icon = "home" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "settings" })
}

local Options = Fluent.Options

-- Main Tab Content
do
    -- Objectives Section
    local ObjectivesSection = Tabs.Main:AddSection("Objectives")

    ObjectivesSection:AddButton({
        Title = "Remove Tapes (Theres delay,so wait.)",
        Callback = function()
            fireclickdetector(workspace.Tape1.ClickDetector)
            wait(0.9)
            fireclickdetector(workspace.Tape2.ClickDetector)
        end
    })

    ObjectivesSection:AddButton({
        Title = "Enter Mall",
        Callback = function()
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-343, 267, -152))
        end
    })

    ObjectivesSection:AddButton({
        Title = "Teleport to Entrance",
        Callback = function()
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-438, 268, -212))
        end
    })

    ObjectivesSection:AddButton({
        Title = "Rest",
        Callback = function()
            fireproximityprompt(workspace.Triggers.TentPart.ProximityPrompt)
        end
    })

    ObjectivesSection:AddButton({
        Title = "Turn on Radio",
        Callback = function()
            fireclickdetector(workspace.Triggers.Radio.ClickDetector)
        end
    })

    ObjectivesSection:AddButton({
        Title = "Skip Radio",
        Callback = function()
            fireclickdetector(workspace.Triggers.RadioON.ClickDetector)
        end
    })

    -- Preparation Section
    local PrepSection = Tabs.Main:AddSection("During the Blizzard")

    PrepSection:AddButton({
        Title = "Sell Item",
        Callback = function()
            fireclickdetector(workspace.Triggers.CarClick.Click)
        end
    })

    PrepSection:AddButton({
        Title = "Open Trunk",
        Callback = function()
            fireclickdetector(workspace.cartrunk.Click)
        end
    })

    PrepSection:AddButton({
        Title = "Place Battery in Heater",
        Callback = function()
            fireclickdetector(workspace.FurnitureHeater.Hitbox.Click)
        end
    })

    PrepSection:AddButton({
        Title = "Place Battery in Computer",
        Callback = function()
            fireclickdetector(workspace.ComputerFolder.Battery.Click)
        end
    })

    PrepSection:AddButton({
        Title = "Open Computer",
        Callback = function()
            fireclickdetector(workspace.Camms.ClickDetector)
        end
    }) 

    local antiFreezeLoop
    PrepSection:AddButton({
        Title = "Heater Range++",
        Callback = function()
            if antiFreezeLoop then
                antiFreezeLoop:Disconnect()
            end
            
            antiFreezeLoop = game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("Players").LocalPlayer.HeaterValue.Value = true
                task.wait(0.1)
            end)
        end
    })

    -- Auto Flash Toggle
    local autoFlashConnection
    PrepSection:AddToggle("AutoFlash", {
        Title = "Auto Flash",
        Default = false
    }):OnChanged(function(Value)
        if Value then
            autoFlashConnection = workspace.ChildAdded:Connect(function(child)
                if child.Name == "Winterhorn" then
                    task.wait(0.4)
                    game:GetService("ReplicatedStorage").Remote_Events.FlashEvent:FireServer()
                end
            end)
        else
            if autoFlashConnection then
                autoFlashConnection:Disconnect()
            end
        end
    end)

    -- Spam Flash Toggle
    local spamFlashLoop
    PrepSection:AddToggle("SpamFlash", {
        Title = "Spam Flash",
        Default = false
    }):OnChanged(function(Value)
        if Value then
            spamFlashLoop = task.spawn(function()
                while task.wait(0.5) do
                    game:GetService("ReplicatedStorage").Remote_Events.FlashEvent:FireServer()
                    if not Options.SpamFlash.Value then break end
                end
            end)
        end
    end)

    -- Supply Items
    local function getSupplyItems()
        local items = {}
        for _, obj in pairs(workspace.SuppliesLocations:GetDescendants()) do
            if (obj:FindFirstChild("Click") or obj:FindFirstChild("ClickDetector")) then
                table.insert(items, obj.Name)
            end
        end
        return items
    end

    local SupplyDropdown = PrepSection:AddDropdown("SupplyDropdown", {
        Title = "Select Item",
        Values = getSupplyItems(),
        Multi = false,
        Default = 1,
    })

    PrepSection:AddButton({
        Title = "Refresh Items",
        Callback = function()
            SupplyDropdown:SetValues(getSupplyItems())
        end
    })

    PrepSection:AddButton({
        Title = "Get Selected Item",
        Callback = function()
            local selectedValue = Options.SupplyDropdown.Value
            for _, obj in pairs(workspace.SuppliesLocations:GetDescendants()) do
                if obj.Name == selectedValue then
                    if obj:FindFirstChild("Click") then
                        fireclickdetector(obj.Click)
                        break
                    elseif obj:FindFirstChild("ClickDetector") then
                        fireclickdetector(obj.ClickDetector)
                        break
                    end
                end
            end
        end
    })
end

-- Misc Tab Content
do
    local PlayerSection = Tabs.Misc:AddSection("Player Settings")

    PlayerSection:AddInput("WalkspeedInput", {
        Title = "Walkspeed",
        Default = tostring(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed),
        Placeholder = "Enter walkspeed",
        Numeric = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Value)
        end
    })

    -- Store original lighting settings
    local lighting = game:GetService("Lighting")
    local originalSettings = {
        Brightness = lighting.Brightness,
        ClockTime = lighting.ClockTime,
        FogEnd = lighting.FogEnd,
        GlobalShadows = lighting.GlobalShadows,
        OutdoorAmbient = lighting.OutdoorAmbient,
        Ambient = lighting.Ambient
    }

    local fullbrightLoop
    PlayerSection:AddToggle("FullbrightToggle", {
        Title = "Fullbright",
        Default = false
    }):OnChanged(function(Value)
        if fullbrightLoop then
            fullbrightLoop:Disconnect()
        end
        
        if Value then
            fullbrightLoop = game:GetService("RunService").RenderStepped:Connect(function()
                lighting.Brightness = 4
                lighting.FogEnd = 100000
                lighting.GlobalShadows = false
                lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                lighting.Ambient = Color3.fromRGB(128, 128, 128)
            end)
        else
            lighting.Brightness = originalSettings.Brightness
            lighting.FogEnd = originalSettings.FogEnd
            lighting.GlobalShadows = originalSettings.GlobalShadows
            lighting.OutdoorAmbient = originalSettings.OutdoorAmbient
            lighting.Ambient = originalSettings.Ambient
        end
    end)

    local ItemsSection = Tabs.Misc:AddSection("Items")

    ItemsSection:AddButton({
        Title = "Buy Battery",
        Callback = function()
            fireclickdetector(workspace.Triggers.BatteriesPart.ClickDetector)
        end
    })

    ItemsSection:AddButton({
        Title = "Buy Flashlight",
        Callback = function()
            fireclickdetector(workspace.Triggers.FlashlightPart.ClickDetector)
        end
    })
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("XHub")
SaveManager:SetFolder("XHub/Blizzard2")

InterfaceManager:BuildInterfaceSection(Tabs.Misc)
SaveManager:BuildConfigSection(Tabs.Misc)

Window:SelectTab(1)

Fluent:Notify({
    Title = "X Hub - Blizzard 2",
    Content = "Script loaded successfully!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()
