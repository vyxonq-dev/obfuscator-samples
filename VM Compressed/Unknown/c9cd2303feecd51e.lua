-- X Hub - Skinwalkers Enhanced Script
-- Improved by X Hub created by Rellware

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Variables
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- Waypoints Storage
local Waypoints = {}
local WaypointNames = {"None"}

-- ESP Variables
local ESPEnabled = false
local ESPHighlights = {}
local ESPSettings = {
    fillColor = Color3.fromRGB(255, 0, 0),
    fillTransparency = 0.7,
    outlineColor = Color3.fromRGB(255, 255, 255),
    outlineTransparency = 0
}

-- Update character references when respawned
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = newCharacter:WaitForChild("Humanoid")
    RootPart = newCharacter:WaitForChild("HumanoidRootPart")
end)

-- Utility Functions
local function safelyGetTool(toolName)
    local success, tool = pcall(function()
        return ReplicatedStorage.Assets.Tools[toolName]
    end)
    return success and tool or nil
end

local function giveItemToPlayer(toolName, amount)
    local tool = safelyGetTool(toolName)
    if not tool then
        return false, "Tool not found: " .. toolName
    end
    
    local success, err = pcall(function()
        -- Set amount first if specified
        if amount and tool:FindFirstChild("Amount") then
            tool.Amount.Value = amount
        end
        -- Move the tool directly from ReplicatedStorage to player's backpack
        tool.Parent = LocalPlayer.Backpack
    end)
    
    return success, err
end

local function teleportToPosition(position)
    if not RootPart then return false end
    
    local success, err = pcall(function()
        local tweenInfo = TweenInfo.new(
            1, -- Duration
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out,
            0, -- Repeat count
            false, -- Reverse
            0 -- Delay
        )
        
        local tween = TweenService:Create(RootPart, tweenInfo, {
            CFrame = CFrame.new(position)
        })
        
        tween:Play()
    end)
    
    return success, err
end

local function bulkCollectProximityPrompts()
    local collected = 0
    local failed = 0
    
    if not Workspace:FindFirstChild("GameObjects") then
        return false, "GameObjects folder not found"
    end
    
    for _, obj in pairs(Workspace.GameObjects:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            local success, err = pcall(function()
                fireproximityprompt(obj)
            end)
            
            if success then
                collected = collected + 1
            else
                failed = failed + 1
            end
            wait(0.05) -- Small delay to prevent overwhelming
        end
    end
    
    return true, string.format("Collected: %d, Failed: %d", collected, failed)
end

-- ESP Functions
local function createESPHighlight(character)
    local highlight = Instance.new("Highlight")
    highlight.Name = "SkinwalkerESP"
    highlight.FillColor = ESPSettings.fillColor
    highlight.FillTransparency = ESPSettings.fillTransparency
    highlight.OutlineColor = ESPSettings.outlineColor
    highlight.OutlineTransparency = ESPSettings.outlineTransparency
    highlight.Parent = character
    return highlight
end

local function enableSkinwalkerESP()
    if not Workspace:FindFirstChild("Runners") or not Workspace.Runners:FindFirstChild("Skinwalkers") then
        return false, "Skinwalkers folder not found"
    end
    
    for _, skinwalker in pairs(Workspace.Runners.Skinwalkers:GetChildren()) do
        if skinwalker:IsA("Model") and not skinwalker:FindFirstChild("SkinwalkerESP") then
            local highlight = createESPHighlight(skinwalker)
            table.insert(ESPHighlights, highlight)
        end
    end
    
    return true, "ESP enabled for all skinwalkers"
end

local function disableSkinwalkerESP()
    for _, highlight in pairs(ESPHighlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    ESPHighlights = {}
    
    -- Also remove any remaining ESP highlights
    if Workspace:FindFirstChild("Runners") and Workspace.Runners:FindFirstChild("Skinwalkers") then
        for _, skinwalker in pairs(Workspace.Runners.Skinwalkers:GetChildren()) do
            local esp = skinwalker:FindFirstChild("SkinwalkerESP")
            if esp then
                esp:Destroy()
            end
        end
    end
    
    return true, "ESP disabled for all skinwalkers"
end

local function updateESPColors()
    for _, highlight in pairs(ESPHighlights) do
        if highlight and highlight.Parent then
            highlight.FillColor = ESPSettings.fillColor
            highlight.FillTransparency = ESPSettings.fillTransparency
            highlight.OutlineColor = ESPSettings.outlineColor
            highlight.OutlineTransparency = ESPSettings.outlineTransparency
        end
    end
end

-- Create GUI
local Window = Rayfield:CreateWindow({
    Name = "fennecz_ on discord $$",
    Icon = 4483362458,
    LoadingTitle = "X Hub Loading",
    LoadingSubtitle = "Scripted by Fennec",
    Theme = "Default",
    
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "XHub_Skinwalkers"
    },
    
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    
    KeySystem = false,
    KeySettings = {
        Title = "X Hub Key System",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "XHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

-- Main Tab
local Main = Window:CreateTab("Main", 4483362458)
local ItemSection = Main:CreateSection("Give Items")

-- Item giving buttons with improved error handling
local Button = Main:CreateButton({
    Name = "🥤 Get 999 Cola",
    Callback = function()
        local success, result = giveItemToPlayer("Cola", 999)
        if success then
            Rayfield:Notify({
                Title = "Success!",
                Content = "999 Cola added to inventory",
                Duration = 3,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to give Cola: " .. (result or "Unknown error"),
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

local Button = Main:CreateButton({
    Name = "🔫 Get Gatling Gun",
    Callback = function()
        local success, result = giveItemToPlayer("Gatling")
        if success then
            Rayfield:Notify({
                Title = "Success!",
                Content = "Gatling Gun added to inventory",
                Duration = 3,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to give Gatling Gun: " .. (result or "Unknown error"),
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

local Button = Main:CreateButton({
    Name = "🧨 Get 999 Snappers",
    Callback = function()
        local success, result = giveItemToPlayer("Snapper", 999)
        if success then
            Rayfield:Notify({
                Title = "Success!",
                Content = "999 Snappers added to inventory",
                Duration = 3,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to give Snappers: " .. (result or "Unknown error"),
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

local Button = Main:CreateButton({
    Name = "🛡️ Get 999 Turrets",
    Callback = function()
        local success, result = giveItemToPlayer("Turret", 999)
        if success then
            Rayfield:Notify({
                Title = "Success!",
                Content = "999 Turrets added to inventory",
                Duration = 3,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to give Turrets: " .. (result or "Unknown error"),
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

-- Bulk collect section
local BulkSection = Main:CreateSection("Bulk Actions")

local Button = Main:CreateButton({
    Name = "📦 Bulk Collect All Items",
    Callback = function()
        Rayfield:Notify({
            Title = "Collecting...",
            Content = "Attempting to collect all proximity prompts",
            Duration = 2,
            Image = 4483362458,
        })
        
        local success, result = bulkCollectProximityPrompts()
        if success then
            Rayfield:Notify({
                Title = "Bulk Collect Complete!",
                Content = result,
                Duration = 5,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Bulk Collect Failed",
                Content = result,
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

-- ESP Tab
local ESP_Tab = Window:CreateTab("ESP", 4483362458)
local ESPSection = ESP_Tab:CreateSection("Skinwalker ESP")

local Toggle = ESP_Tab:CreateToggle({
    Name = "👁️ Skinwalkers ESP",
    CurrentValue = false,
    Flag = "SkinwalkerESP_Toggle",
    Callback = function(Value)
        ESPEnabled = Value
        if Value then
            local success, result = enableSkinwalkerESP()
            if success then
                Rayfield:Notify({
                    Title = "ESP Enabled!",
                    Content = result,
                    Duration = 3,
                    Image = 4483362458,
                })
            else
                Rayfield:Notify({
                    Title = "ESP Error",
                    Content = result,
                    Duration = 5,
                    Image = 4483362458,
                })
            end
        else
            local success, result = disableSkinwalkerESP()
            if success then
                Rayfield:Notify({
                    Title = "ESP Disabled!",
                    Content = result,
                    Duration = 3,
                    Image = 4483362458,
                })
            end
        end
    end,
})

local ESPColorSection = ESP_Tab:CreateSection("ESP Customization")

local ColorPicker = ESP_Tab:CreateColorPicker({
    Name = "🎨 Fill Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "ESPFillColor",
    Callback = function(Value)
        ESPSettings.fillColor = Value
        updateESPColors()
    end
})

local Slider = ESP_Tab:CreateSlider({
    Name = "🌫️ Fill Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 0.7,
    Flag = "ESPFillTrans",
    Callback = function(Value)
        ESPSettings.fillTransparency = Value
        updateESPColors()
    end,
})

local ColorPicker = ESP_Tab:CreateColorPicker({
    Name = "🖼️ Outline Color",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "ESPOutlineColor",
    Callback = function(Value)
        ESPSettings.outlineColor = Value
        updateESPColors()
    end
})

local Slider = ESP_Tab:CreateSlider({
    Name = "📐 Outline Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 0,
    Flag = "ESPOutlineTrans",
    Callback = function(Value)
        ESPSettings.outlineTransparency = Value
        updateESPColors()
    end,
})

local Button = ESP_Tab:CreateButton({
    Name = "🔄 Refresh ESP",
    Callback = function()
        if ESPEnabled then
            disableSkinwalkerESP()
            local success, result = enableSkinwalkerESP()
            if success then
                Rayfield:Notify({
                    Title = "ESP Refreshed!",
                    Content = "All skinwalkers re-highlighted",
                    Duration = 3,
                    Image = 4483362458,
                })
            end
        else
            Rayfield:Notify({
                Title = "ESP Not Active",
                Content = "Enable ESP first before refreshing",
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

-- Auto-refresh ESP when new skinwalkers spawn
if Workspace:FindFirstChild("Runners") and Workspace.Runners:FindFirstChild("Skinwalkers") then
    Workspace.Runners.Skinwalkers.ChildAdded:Connect(function(child)
        if ESPEnabled and child:IsA("Model") then
            wait(0.1) -- Small delay to ensure the model is fully loaded
            local highlight = createESPHighlight(child)
            table.insert(ESPHighlights, highlight)
        end
    end)
    
    Workspace.Runners.Skinwalkers.ChildRemoved:Connect(function(child)
        -- Remove from ESPHighlights table if it exists
        for i, highlight in ipairs(ESPHighlights) do
            if highlight.Parent == child then
                table.remove(ESPHighlights, i)
                break
            end
        end
    end)
end
local Waypoints_Tab = Window:CreateTab("Waypoints", 4483362458)
local WaypointSection = Waypoints_Tab:CreateSection("Waypoint Management")

local Input = Waypoints_Tab:CreateInput({
    Name = "Waypoint Name",
    PlaceholderText = "Enter waypoint name...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        -- Input is handled when save button is pressed
    end,
})

local Button = Waypoints_Tab:CreateButton({
    Name = "💾 Save Current Position",
    Callback = function()
        local waypointName = Input.CurrentInput
        if waypointName and waypointName ~= "" and RootPart then
            if Waypoints[waypointName] then
                Rayfield:Notify({
                    Title = "Waypoint Exists",
                    Content = "Waypoint '" .. waypointName .. "' already exists!",
                    Duration = 3,
                    Image = 4483362458,
                })
                return
            end
            
            Waypoints[waypointName] = RootPart.Position
            table.insert(WaypointNames, waypointName)
            
            Rayfield:Notify({
                Title = "Waypoint Saved!",
                Content = "Position saved as '" .. waypointName .. "'",
                Duration = 3,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Please enter a valid waypoint name",
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

local Dropdown = Waypoints_Tab:CreateDropdown({
    Name = "📍 Select Waypoint",
    Options = WaypointNames,
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "WaypointDropdown",
    Callback = function(Option)
        -- Handled by teleport button
    end,
})

local Button = Waypoints_Tab:CreateButton({
    Name = "🚀 Teleport to Waypoint",
    Callback = function()
        local selectedWaypoint = Dropdown.CurrentOption[1]
        if selectedWaypoint == "None" or not Waypoints[selectedWaypoint] then
            Rayfield:Notify({
                Title = "No Waypoint Selected",
                Content = "Please select a valid waypoint",
                Duration = 3,
                Image = 4483362458,
            })
            return
        end
        
        local success, err = teleportToPosition(Waypoints[selectedWaypoint])
        if success then
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "Moved to waypoint: " .. selectedWaypoint,
                Duration = 3,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Teleport Failed",
                Content = "Error: " .. (err or "Unknown error"),
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

local Button = Waypoints_Tab:CreateButton({
    Name = "🗑️ Clear All Waypoints",
    Callback = function()
        Waypoints = {}
        WaypointNames = {"None"}
        Dropdown:Refresh(WaypointNames, true)
        
        Rayfield:Notify({
            Title = "Waypoints Cleared",
            Content = "All waypoints have been deleted",
            Duration = 3,
            Image = 4483362458,
        })
    end,
})

-- Character Tab
local Character_Tab = Window:CreateTab("Character", 4483362458)
local MovementSection = Character_Tab:CreateSection("Movement Settings")

local Slider = Character_Tab:CreateSlider({
    Name = "🚶 Walk Speed",
    Range = {16, 200},
    Increment = 2,
    Suffix = " WS",
    CurrentValue = 16,
    Flag = "WalkSpeed_Slider",
    Callback = function(Value)
        if Humanoid then
            Humanoid.WalkSpeed = Value
        end
    end,
})

local Slider = Character_Tab:CreateSlider({
    Name = "🦘 Jump Power",
    Range = {25, 200},
    Increment = 5,
    Suffix = " JP",
    CurrentValue = 25,
    Flag = "JumpPower_Slider",
    Callback = function(Value)
        if Humanoid then
            Humanoid.JumpPower = Value
        end
    end,
})

local Toggle = Character_Tab:CreateToggle({
    Name = "✨ Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump_Toggle",
    Callback = function(Value)
        if Value then
            UserInputService.JumpRequest:Connect(function()
                if Humanoid then
                    Humanoid:ChangeState("Jumping")
                end
            end)
        end
    end,
})

-- Info Tab
local Info = Window:CreateTab("Info", 4483362458)
local InfoSection = Info:CreateSection("Script Information")

local Paragraph = Info:CreateParagraph({
    Title = "About X Hub",
    Content = "X Hub enhanced Skinwalkers script with optimized code, error handling, waypoint system, bulk collection features, and customizable ESP. Improved by X Hub created by Rellware."
})

local Paragraph = Info:CreateParagraph({
    Title = "X Hub v2.0 Features",
    Content = "• Improved error handling and notifications\n• Custom waypoint system with teleportation\n• Bulk proximity prompt collection (Synapse function)\n• Enhanced character controls\n• Customizable Skinwalker ESP system\n• Optimized code structure\n• Better user interface"
})

local Paragraph = Info:CreateParagraph({
    Title = "ESP Usage Tips",
    Content = "• Toggle ESP to highlight all skinwalkers\n• Customize colors and transparency\n• ESP auto-refreshes when new skinwalkers spawn\n• Use refresh button if ESP gets out of sync\n• Save waypoints near escape routes\n• Use bulk collect to quickly gather items"
})

-- Initialize
Rayfield:Notify({
    Title = "X Hub Loaded!",
    Content = "X Hub - Skinwalkers v2.0 is ready to use",
    Duration = 5,
    Image = 4483362458,
})
