local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "WXZ HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]
local Tab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of thlocal Tab = Window:MakeTab({
	Name = "Tab 1",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
Tab:AddParagraph("Owner","Yallto_weak")
local Tab = Window:MakeTab({
	Name = "Esp/Name",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
local Section = Tab:AddSection({
	Name = "Esp"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "Red Esp",
	Callback = function()
      		local Players = game:GetService("Players")

-- Function to create a highlight effect
local function highlightPlayer(character)
    if character and not character:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.FillColor = Color3.fromRGB(255, 100, 100) -- Light red
        highlight.OutlineColor = Color3.fromRGB(255, 50, 50) -- Darker red
        highlight.FillTransparency = 0.5 -- Slight transparency
    end
end

-- Apply highlights to all existing players
for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        highlightPlayer(player.Character)
    end
    -- Listen for character respawn
    player.CharacterAdded:Connect(highlightPlayer)
end

-- Listen for new players joining and apply highlights
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(highlightPlayer)
end)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "Blue Esp",
	Callback = function()
      		local Players = game:GetService("Players")

-- Function to create a highlight effect
local function highlightPlayer(character)
    if character and not character:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.FillColor = Color3.fromRGB(173, 216, 230) -- Light blue
        highlight.OutlineColor = Color3.fromRGB(100, 149, 237) -- Slightly darker blue
        highlight.FillTransparency = 0.5 -- Slight transparency
    end
end

-- Apply highlights to all existing players
for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        highlightPlayer(player.Character)
    end
    -- Listen for character respawn
    player.CharacterAdded:Connect(highlightPlayer)
end

-- Listen for new players joining and apply highlights
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(highlightPlayer)
end)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "Green Esp",
	Callback = function()
      		local Players = game:GetService("Players")

-- Function to create a highlight effect
local function highlightPlayer(character)
    if character and not character:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.FillColor = Color3.fromRGB(144, 238, 144) -- Light green
        highlight.OutlineColor = Color3.fromRGB(50, 205, 50) -- Lime green
        highlight.FillTransparency = 0.5 -- Slight transparency
    end
end

-- Apply highlights to all existing players
for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        highlightPlayer(player.Character)
    end
    -- Listen for character respawn
    player.CharacterAdded:Connect(highlightPlayer)
end

-- Listen for new players joining and apply highlights
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(highlightPlayer)
end)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Section = Tab:AddSection({
	Name = "Name Esp"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "White Name ESP",
	Callback = function()
      		local Players = game:GetService("Players")

-- Function to create a name tag for a player
local function createNameTag(character, player)
    if character and not character:FindFirstChild("NameTag") then
        local head = character:FindFirstChild("Head")
        if head then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NameTag"
            billboard.Adornee = head
            billboard.Size = UDim2.new(4, 0, 1, 0) -- Adjust size
            billboard.StudsOffset = Vector3.new(0, 2, 0) -- Position above head
            billboard.Parent = character

            -- Create text label
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = player.Name
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
            textLabel.TextStrokeTransparency = 0 -- Outline text
            textLabel.TextScaled = true
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.Parent = billboard
        end
    end
end

-- Function to apply name tags to all players
local function applyNameTags(player)
    if player.Character then
        createNameTag(player.Character, player)
    end
    player.CharacterAdded:Connect(function(character)
        createNameTag(character, player)
    end)
end

-- Apply to existing players
for _, player in pairs(Players:GetPlayers()) do
    applyNameTags(player)
end

-- Listen for new players
Players.PlayerAdded:Connect(applyNameTags)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "Blue Name Esp",
	Callback = function()
      		local Players = game:GetService("Players")

-- Function to create a name tag for a player
local function createNameTag(character, player)
    if character and not character:FindFirstChild("NameTag") then
        local head = character:FindFirstChild("Head")
        if head then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NameTag"
            billboard.Adornee = head
            billboard.Size = UDim2.new(4, 0, 1, 0) -- Adjust size
            billboard.StudsOffset = Vector3.new(0, 2, 0) -- Position above head
            billboard.AlwaysOnTop = true
            billboard.Parent = character

            -- Create text label
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = player.Name
            textLabel.TextColor3 = Color3.fromRGB(173, 216, 230) -- Light blue
            textLabel.TextStrokeTransparency = 0 -- Outline text for visibility
            textLabel.TextScaled = true
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.Parent = billboard
        end
    end
end

-- Function to apply name tags to all players
local function applyNameTags(player)
    if player.Character then
        createNameTag(player.Character, player)
    end
    player.CharacterAdded:Connect(function(character)
        createNameTag(character, player)
    end)
end

-- Apply to existing players
for _, player in pairs(Players:GetPlayers()) do
    applyNameTags(player)
end

-- Listen for new players
Players.PlayerAdded:Connect(applyNameTags)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "Green Name Esp",
	Callback = function()
      		local Players = game:GetService("Players")

-- Function to create a name tag for a player
local function createNameTag(character, player)
    if character and not character:FindFirstChild("NameTag") then
        local head = character:FindFirstChild("Head")
        if head then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NameTag"
            billboard.Adornee = head
            billboard.Size = UDim2.new(4, 0, 1, 0) -- Adjust size
            billboard.StudsOffset = Vector3.new(0, 2, 0) -- Position above head
            billboard.AlwaysOnTop = true
            billboard.Parent = character

            -- Create text label
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = player.Name
            textLabel.TextColor3 = Color3.fromRGB(144, 238, 144) -- Light Green
            textLabel.TextStrokeTransparency = 0 -- Outline text for visibility
            textLabel.TextScaled = true
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.Parent = billboard
        end
    end
end

-- Function to apply name tags to all players
local function applyNameTags(player)
    if player.Character then
        createNameTag(player.Character, player)
    end
    player.CharacterAdded:Connect(function(character)
        createNameTag(character, player)
    end)
end

-- Apply to existing players
for _, player in pairs(Players:GetPlayers()) do
    applyNameTags(player)
end

-- Listen for new players
Players.PlayerAdded:Connect(applyNameTags)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Tab = Window:MakeTab({
	Name = "Aimbot",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
Tab:AddParagraph("not done Yet","Coming soon")