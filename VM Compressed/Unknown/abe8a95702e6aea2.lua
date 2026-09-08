
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SkienSaken", -- Title of the UI
   Icon = 116944586486958,    
   LoadingTitle = "Loading SkienSaken", -- First text to show when loading the UI
   LoadingSubtitle = "by Poik3",
   Theme = "Amethyst",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "",
      FileName = ""
   },

   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/DMpKbMCy",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "STOP RIGHT THERE!",
      Subtitle = "this is an annoying key system.",
      Note = "The Key is in my Discord server", -- Use this to tell the user how to get a key
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {
         "Y0uC0uLdSp@mTh1sR@nd0mly",
         "Dev"
      }
   }
})

Rayfield:Notify({
    Title = "Welcome to SkienSaken",
    Content = "Join the discord for support and updates! (https://discord.gg/DMpKbMCy)",
    Duration = 10,
    Image = "home",
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local leaderstats = player:WaitForChild("leaderstats")
local money = leaderstats:WaitForChild("Money")
local IntroMusic = Instance.new("Sound")

local InfoTab = Window:CreateTab("Info", 4483362458) -- Title, Image
local Label = InfoTab:CreateLabel("The script is currently in development. join my Discord for updates!", 18505728250, Color3.fromRGB(90, 182, 154), false) -- Title, Icon, Color, IgnoreTheme
local Paragraph = InfoTab:CreateParagraph({Title = "How to Use", Content = "How to use the script will be explained in the future, but for now, you can join my Discord server for updates and support!"}) -- Title, Content
local Paragraph2 = InfoTab:CreateParagraph({
    Title = "How much money do you have left.",
    Content = "Loading..."
})
local CopyDiscordButton = InfoTab:CreateButton({
    Name = "Copy Discord Invite",
    image = 83768243028802,
    Callback = function()
        setclipboard("https://discord.gg/DMpKbMCy")
        Rayfield:Notify({
          Title = "Invite Copied!",
          Content = "The Discord invite has been copied to your clipboard.",
          Duration = 3,
          Image = 83768243028802,
})

    end,
})

-- Update every second
task.spawn(function()
    while true do
        Paragraph2:Set({
            task.wait(0.5), -- Small wait to ensure the UI updates smoothly
            Title = "Did i hear 'How much money do you have left?'?",
            Content = "You currently have " .. money.Value .. " money."
        })
        task.wait(1)
    end
end)

local Label4 = InfoTab:CreateLabel("Label Example", 18505728250) -- Title, Icon




-- Main Tab -------------------------------------------------------------------------------------------------------------------------------------------------------
local Main = Window:CreateTab("Main",85436299122876)
local sprintModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
local Toggle = Main:CreateToggle({
   Name = "No Stamina Loss", -- Title of the toggle
   CurrentValue = false,
   Flag = "No Stamina Loss", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 -- Load the sprinting module
        if Value then
            -- Toggle ON → No stamina loss
            sprintModule:ChangeStat("StaminaLoss", 0)
        else
            -- Toggle OFF → Restore normal stamina loss
            sprintModule:ChangeStat("StaminaLoss", 10)
        end
    end,
})

local SprintingSpeed = Main:CreateSlider({
   Name = "Sprint Speed (the default is 26 btw!)", -- Title of the slider
   Range = {0, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 26,
   Flag = "Slider1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    sprintModule:ChangeStat("SprintSpeed", Value)

    -- Apply instantly if the player is sprinting
    if sprintModule.IsSprinting then
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end
end
})


--Main Tab End -------------------------------------------------------------------------------------------------------------------------------------------------------
-- Coloring Tab -------------------------------------------------------------------------------------------------------------------------------------------------------
local ColoringTab = Window:CreateTab("Coloring", 4483362458) -- Title, Image

local HitboxColor = Color3.fromRGB(255, 63, 63) -- Default hitbox color (white)
local ColorPicker = ColoringTab:CreateColorPicker({
    Name = "Hitbox Color",
    Color = Color3.fromRGB(255, 63, 63), -- Default color
    Flag = "ColorPicker1",
    Callback = function(Value)
        HitboxColor = Value
    end
})
local HitboxFolder = workspace:WaitForChild("Hitboxes")
local lable2 = ColoringTab:CreateLabel("The original hitbox color is red. (255, 63, 63)", 4483362458, Color3.fromRGB(255, 63, 63), false) -- Title, Icon, Color, IgnoreTheme

-- Recolor existing hitboxes
for _, part in ipairs(HitboxFolder:GetChildren()) do
    if part:IsA("BasePart") then
        part.Color = HitboxColor
    end
end

-- Recolor new hitboxes as they appear
HitboxFolder.ChildAdded:Connect(function(part)
    if part:IsA("BasePart") then
        part.Color = HitboxColor
    end
end)

local ResetButton = ColoringTab:CreateButton({
    Name = "Reset Hitbox Color",
    Icon = 4483362458,
    Callback = function()
        HitboxColor = Color3.fromRGB(255, 63, 63) -- Reset to original color
        ColorPicker:Set(HitboxColor) -- Update the color picker UI
        -- Recolor all hitboxes to the original color
        for _, part in ipairs(HitboxFolder:GetChildren()) do
            if part:IsA("BasePart") then
                part.Color = HitboxColor
            end
        end
    end,
})
-- Coloring Tab End -------------------------------------------------------------------------------------------------------------------------------------------------------
-- Highlight Control Tab -------------------------------------------------------------------------------------------------------------------------------------------------------
--========================================================--
--  FULL CLIENTSIDED HIGHLIGHT SYSTEM
--  NaturalHighlight + CreatedHighlight
--  Independent settings for both
--========================================================--

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local HighlightTab = Window:CreateTab("Highlight", "highlighter") -- Lucide icon

--========================================================--
--  HIGHLIGHT REFERENCES
--========================================================--

local NaturalHighlight = nil
local CreatedHighlight = nil

--========================================================--
--  SETTINGS TABLES
--========================================================--

local NaturalSettings = {
    Enabled = true,
    FillColor = Color3.fromRGB(255, 255, 0),
    OutlineColor = Color3.fromRGB(255, 255, 255),
    FillTransparency = 0,
    OutlineTransparency = 0,
    DepthMode = Enum.HighlightDepthMode.Occluded
}

local CreatedSettings = {
    Enabled = true,
    FillColor = Color3.fromRGB(255, 0, 0),
    OutlineColor = Color3.fromRGB(255, 255, 255),
    FillTransparency = 0,
    OutlineTransparency = 0,
    DepthMode = Enum.HighlightDepthMode.Occluded
}
--========================================================--
--  APPLY FUNCTIONS
--========================================================--
local function ApplyNaturalSettings()
    if not NaturalHighlight then
        StatusLabel:Set("No natural highlight found")
        return
    end

    NaturalHighlight.Enabled = NaturalSettings.Enabled
    NaturalHighlight.FillColor = NaturalSettings.FillColor
    NaturalHighlight.OutlineColor = NaturalSettings.OutlineColor
    NaturalHighlight.FillTransparency = NaturalSettings.FillTransparency
    NaturalHighlight.OutlineTransparency = NaturalSettings.OutlineTransparency
    NaturalHighlight.DepthMode = NaturalSettings.DepthMode

    StatusLabel:Set("Applied settings to Natural Highlight")
end
local function ApplyCreatedSettings()
    if not CreatedHighlight then
        StatusLabel:Set("No CreatedHighlight exists")
        return
    end

    CreatedHighlight.Enabled = CreatedSettings.Enabled
    CreatedHighlight.FillColor = CreatedSettings.FillColor
    CreatedHighlight.OutlineColor = CreatedSettings.OutlineColor
    CreatedHighlight.FillTransparency = CreatedSettings.FillTransparency
    CreatedHighlight.OutlineTransparency = CreatedSettings.OutlineTransparency
    CreatedHighlight.DepthMode = CreatedSettings.DepthMode

    StatusLabel:Set("Applied settings to CreatedHighlight")
end
--========================================================--
--  BUTTONS
--========================================================--
-- CHECK NATURAL HIGHLIGHT
HighlightTab:CreateButton({
    Name = "Check Natural Highlight",
    Callback = function()
        local char = player.Character
        if not char then return end

        local found = char:FindFirstChild("Highlight")

        if found then
            NaturalHighlight = found
            StatusLabel:Set("Natural Highlight FOUND")
        else
            NaturalHighlight = nil
            StatusLabel:Set("Natural Highlight NOT FOUND")
        end
    end
})
-- CREATE CREATEDHIGHLIGHT
HighlightTab:CreateButton({
    Name = "Create Script Highlight",
    Callback = function()
        local char = player.Character
        if not char then return end

        if NaturalHighlight then
            StatusLabel:Set("Cannot create: Natural highlight exists")
            return
        end

        if CreatedHighlight then
            StatusLabel:Set("CreatedHighlight already exists")
            return
        end

        local hl = Instance.new("Highlight")
        hl.Name = "CreatedHighlight"
        hl.Parent = char

        CreatedHighlight = hl
        ApplyCreatedSettings()

        StatusLabel:Set("CreatedHighlight CREATED")
    end
})
--========================================================--
--  NATURAL HIGHLIGHT SETTINGS UI
--========================================================--

HighlightTab:CreateToggle({
    Name = "Enable Natural Highlight",
    CurrentValue = NaturalSettings.Enabled,
    Callback = function(v)
        NaturalSettings.Enabled = v
        ApplyNaturalSettings()
    end
})
HighlightTab:CreateColorPicker({
    Name = "Natural Fill Color",
    Color = NaturalSettings.FillColor,
    Callback = function(c)
        NaturalSettings.FillColor = c
        ApplyNaturalSettings()
    end
})
HighlightTab:CreateColorPicker({
    Name = "Natural Outline Color",
    Color = NaturalSettings.OutlineColor,
    Callback = function(c)
        NaturalSettings.OutlineColor = c
        ApplyNaturalSettings()
    end
})
HighlightTab:CreateSlider({
    Name = "Natural Fill Transparency",
    Range = {0, 30},
    Increment = 1.5,
    CurrentValue = NaturalSettings.FillTransparency,
    Callback = function(v)
        NaturalSettings.FillTransparency = v
        ApplyNaturalSettings()
    end
})
HighlightTab:CreateSlider({
    Name = "Natural Outline Transparency",
    Range = {0, 30},
    Increment = 1.5,
    CurrentValue = NaturalSettings.OutlineTransparency,
    Callback = function(v)
        NaturalSettings.OutlineTransparency = v
        ApplyNaturalSettings()
    end
})
HighlightTab:CreateDropdown({
    Name = "Natural Depth Mode",
    Options = {"Occluded", "AlwaysOnTop"},
    CurrentOption = "Occluded",
    Callback = function(opt)
        NaturalSettings.DepthMode =
            opt == "Occluded"
            and Enum.HighlightDepthMode.Occluded
            or Enum.HighlightDepthMode.AlwaysOnTop

        ApplyNaturalSettings()
    end
})

--========================================================--
--  CREATED HIGHLIGHT SETTINGS UI
--========================================================--

HighlightTab:CreateToggle({
    Name = "Enable Created Highlight",
    CurrentValue = CreatedSettings.Enabled,
    Callback = function(v)
        CreatedSettings.Enabled = v
        ApplyCreatedSettings()
    end
})
HighlightTab:CreateColorPicker({
    Name = "Created Fill Color",
    Color = CreatedSettings.FillColor,
    Callback = function(c)
        CreatedSettings.FillColor = c
        ApplyCreatedSettings()
    end
})
HighlightTab:CreateColorPicker({
    Name = "Created Outline Color",
    Color = CreatedSettings.OutlineColor,
    Callback = function(c)
        CreatedSettings.OutlineColor = c
        ApplyCreatedSettings()
    end
})
HighlightTab:CreateSlider({
    Name = "Created Fill Transparency",
    Range = {0, 1},
    Increment = 0.05,
    CurrentValue = CreatedSettings.FillTransparency,
    Callback = function(v)
        CreatedSettings.FillTransparency = v
        ApplyCreatedSettings()
    end
})
HighlightTab:CreateSlider({
    Name = "Created Outline Transparency",
    Range = {0, 1},
    Increment = 0.05,
    CurrentValue = CreatedSettings.OutlineTransparency,
    Callback = function(v)
        CreatedSettings.OutlineTransparency = v
        ApplyCreatedSettings()
    end
})
HighlightTab:CreateDropdown({
    Name = "Created Depth Mode",
    Options = {"Occluded", "AlwaysOnTop"},
    CurrentOption = "Occluded",
    Callback = function(opt)
        CreatedSettings.DepthMode =
            opt == "Occluded"
            and Enum.HighlightDepthMode.Occluded
            or Enum.HighlightDepthMode.AlwaysOnTop

        ApplyCreatedSettings()
    end
})
-- Highlight Control Tab End -------------------------------------------------------------------------------------------------------------------------------------------------------
-- Premium Tab -------------------------------------------------------------------------------------------------------------------------------------------------------
local PremiumTab = Window:CreateTab("Premium", 4483362458) -- Title, Image
local PremiumAskerLabel = PremiumTab:CreateLabel("This tab is for ₚᵣₑₘᵢᵤₘ users only.", 4483362458, Color3.fromRGB(255, 63, 63), false) -- Title, Icon, Color, IgnoreTheme
local PremiumAskerParagraph = PremiumTab:CreateParagraph({
    Title = "How to get premium?",
    Content = "To get premium, you need to join our game called MasScripts™ or join out discord server and ask for it!"
}) -- Title, Content

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

local leftClickConnection

local LeftClickToggle = PremiumTab:CreateToggle({
    Name = "Left‑Click Teleport",
    CurrentValue = false,
    Flag = "LeftClickTP",
    Callback = function(enabled)
        if enabled then
            leftClickConnection = UIS.InputBegan:Connect(function(input, gp)
                if gp then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hit = mouse.Hit

                    if hrp and hit then
                        -- keep rotation, change only position
                        local currentRotation = hrp.CFrame - hrp.CFrame.Position
                        hrp.CFrame = CFrame.new(hit.p + Vector3.new(0, 3, 0)) * currentRotation
                    end
                end
            end)

        else
            if leftClickConnection then
                leftClickConnection:Disconnect()
                leftClickConnection = nil
            end
        end
    end,
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ZoomInputMax = PremiumTab:CreateInput({
    Name = "Max Camera Distance",
    CurrentValue = "12",
    PlaceholderText = "Enter a number or 'inf'",
    RemoveTextAfterFocusLost = false,
    Flag = "CamMaxDistanceInput",
    Callback = function(Text)
        Text = Text:lower()

        -- Infinite zoom
        if Text == "inf" or Text == "infinite" then
            player.CameraMaxZoomDistance = math.huge
            return
        end

        -- Convert to number
        local number = tonumber(Text)

        if not number then
            Rayfield:Notify({
                Title = "What r u typing bruh?",
                Content = "Please enter a valid number or 'inf' for infinite distance.",
                Duration = 6.5,
                Image = "badge-alert",
            })
            return
        end

        -- Minimum allowed value
        if number < 1 then
            player.CameraMaxZoomDistance = 12 -- default Roblox max zoom distance
            Rayfield:Notify({
                Title = "Number too low!",
                Content = "Camera distance cannot be less than 1. Resetting to default (12).",
                Duration = 6.5,
                Image = "badge-alert",
            })
            return
        end

        -- Valid number
        player.CameraMaxZoomDistance = number
    end,
})


local Players = game:GetService("Players")
local player = Players.LocalPlayer
local hum = player.Character:WaitForChild("Humanoid")

local PlayerModule = require(player.PlayerScripts:WaitForChild("PlayerModule"))
local Controls = PlayerModule:GetControls()

-- Keyboard controller (the one from your decompiled script)
local Keyboard = Controls.keyboardController

local JumpToggle = PremiumTab:CreateToggle({
    Name = "Allow Jump (not finished due to the 'copyright' issues.)",
    CurrentValue = false,
    Flag = "JumpToggle",
    Callback = function(state)
        if Keyboard then
            Keyboard.jumpEnabled = state
            hum.JumpPower = state and 50 -- Optional: Set JumpPower to 0 when jump is disabled to prevent jumping via scripts
        end
        if not state then
            hum.JumpPower = 0
        else
            hum.JumpPower = 50 -- Reset to default jump power when enabled
        end
    end,
})

-- Premium Tab End -------------------------------------------------------------------------------------------------------------------------------------------------------q
-- Combat Tab -------------------------------------------------------------------------------------------------------------------------------------------------------
local CombatTab = Window:CreateTab("Combat", 4483362458) -- Title, Image

local ShedLetskySection = CombatTab:CreateSection("Shedletsky")

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- Correct keybind path
local keybindValue = player:WaitForChild("PlayerData")
    :WaitForChild("Settings")
    :WaitForChild("Keybinds")
    :WaitForChild("AltAbility1")

local spinEnabled = false
local connection

-- Function to get the character model from workspace
local function getCharacterModel()
    local folderPlayers = workspace:WaitForChild("Players")
    local survivors = folderPlayers:WaitForChild("Survivors")
    return survivors:FindFirstChild("Shedletsky")
end

local Toggle = CombatTab:CreateToggle({
    Name = "Shedletsky Spin (WORKING ON IT!!!)",
    CurrentValue = false,
    Flag = "ShedSpinToggle",
    Callback = function(Value)
        spinEnabled = Value

        -- Disconnect old listener
        if connection then
            connection:Disconnect()
            connection = nil
        end

        if Value then
            local character = getCharacterModel()

            if not character then
                warn("Character 'Shedletsky' not found in workspace.Players.Survivors")
                return
            end

            connection = UIS.InputBegan:Connect(function(input, gp)
                if gp then return end

                -- Check if pressed key matches the keybind
                if input.KeyCode.Name == keybindValue.Value then
                    task.wait(0.575)

                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(360), 0)
                    end
                end
            end)
        end
    end,
})
