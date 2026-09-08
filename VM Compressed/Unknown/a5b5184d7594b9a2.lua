--BRO WHY SEE THIS?

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Lithos | Beta Script",
   Icon = nil, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "skibidi toilet",
   LoadingSubtitle = "by ScriptTrol(me)",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "WARNING",
   Content = "THIS IS BETA SCRIPT, YEA VERY ESAY GET BAN.. SO DONT USE MAIN ACC. USE ALT ACC",
   Duration = 6.5,
   Image = "triangle-alert",
})

local MainTab = Window:CreateTab("Main", "Home")
local MainSection = MainTab:CreateSection("Troll")

local Button = MainTab:CreateButton({
   Name = "Remove Anti cheater(by zyletrophene)",
   Callback = function()
   run_on_actor(function()
    for i, obj in pairs(getgc(true)) do
        if type(obj) == "table" then
            if rawget(obj, "Detected") and rawget(obj, "AddDetector") and rawget(obj, "Launch") then
                for k, v in pairs(obj) do
                    obj[k] = nil
                end
            end
        end
    end
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Ragdoll Player Gui(F1)",
   Callback = function()
   local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- Create main GUI with ResetOnSpawn = false
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RagdollGUI"
screenGui.ResetOnSpawn = false  -- Prevents GUI from resetting on respawn
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Mobile open/close button
local mobileToggle = Instance.new("TextButton")
mobileToggle.Name = "MobileToggle"
mobileToggle.Size = UDim2.new(0, 60, 0, 60)
mobileToggle.Position = UDim2.new(0, 20, 0.5, -30)
mobileToggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mobileToggle.TextColor3 = Color3.new(1, 1, 1)
mobileToggle.Text = "Open"
mobileToggle.Visible = false
mobileToggle.Parent = screenGui

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 350)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "PLAYER RAGDOLL"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0.5, -15)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.Parent = titleBar

-- Player list
local playerList = Instance.new("ScrollingFrame")
playerList.Name = "PlayerList"
playerList.Size = UDim2.new(1, -20, 1, -110)
playerList.Position = UDim2.new(0, 10, 0, 50)
playerList.BackgroundTransparency = 1
playerList.BorderSizePixel = 0
playerList.AutomaticCanvasSize = Enum.AutomaticSize.Y
playerList.ScrollBarThickness = 6
playerList.CanvasSize = UDim2.new(0, 0, 0, 0)
playerList.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = playerList

-- Ragdoll button
local ragdollButton = Instance.new("TextButton")
ragdollButton.Name = "RagdollButton"
ragdollButton.Size = UDim2.new(1, -40, 0, 50)
ragdollButton.Position = UDim2.new(0, 20, 1, -70)
ragdollButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
ragdollButton.TextColor3 = Color3.new(1, 1, 1)
ragdollButton.Text = "RAGDOLL PLAYER"
ragdollButton.Font = Enum.Font.GothamBold
ragdollButton.TextSize = 18
ragdollButton.Parent = mainFrame

-- Variables
local selectedPlayer = nil

-- Function to create player buttons
local function createPlayerButton(player)
    local button = Instance.new("TextButton")
    button.Name = player.Name
    button.Size = UDim2.new(1, 0, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    button.BorderSizePixel = 0
    button.Text = player.Name
    button.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.Parent = playerList
    
    button.MouseButton1Click:Connect(function()
        -- Deselect previous
        for _, child in ipairs(playerList:GetChildren()) do
            if child:IsA("TextButton") and child ~= button then
                child.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
            end
        end
        
        -- Select new
        button.BackgroundColor3 = Color3.fromRGB(70, 100, 170)
        selectedPlayer = player
    end)
end

-- Update player list
local function updatePlayerList()
    -- Clear existing buttons
    for _, child in ipairs(playerList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    -- Create new buttons
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            createPlayerButton(player)
        end
    end
end

-- Initialize player list
updatePlayerList()
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

-- GUI toggle function
local function toggleGUI(visible)
    if UserInputService.TouchEnabled then
        mobileToggle.Visible = not visible
    end
    mainFrame.Visible = visible
end

-- Mobile toggle button
mobileToggle.MouseButton1Click:Connect(function()
    toggleGUI(not mainFrame.Visible)
end)

-- Close button
closeButton.MouseButton1Click:Connect(function()
    toggleGUI(false)
end)

-- PC controls (F1 toggle)
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F1 then
        toggleGUI(not mainFrame.Visible)
    end
end)

-- Ragdoll function targeting specific player
ragdollButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        -- Find the target player's ragdoll system in workspace
        local targetPlayerFolder = workspace:FindFirstChild(selectedPlayer.Name)
        if targetPlayerFolder then
            local ragdollR6 = targetPlayerFolder:FindFirstChild("RagdollR6")
            if ragdollR6 then
                local ragdollEvent = ragdollR6:FindFirstChild("Ragdoll")
                if ragdollEvent and ragdollEvent:IsA("RemoteEvent") then
                    -- Fire the event on the TARGET player's ragdoll system
                    ragdollEvent:FireServer()
                end
            end
        end
    else
        -- Show selection reminder
        ragdollButton.Text = "SELECT A PLAYER FIRST!"
        task.wait(1.5)
        ragdollButton.Text = "RAGDOLL PLAYER"
    end
end)

-- Auto-detect device type
if UserInputService.TouchEnabled then
    mobileToggle.Visible = true
else
    -- Instructions for PC users
    local hint = Instance.new("TextLabel")
    hint.Name = "Hint"
    hint.Text = "Press F1 to toggle menu"
    hint.TextColor3 = Color3.new(1, 1, 1)
    hint.BackgroundTransparency = 1
    hint.Size = UDim2.new(0, 200, 0, 30)
    hint.Position = UDim2.new(0.5, -100, 1, -35)
    hint.Font = Enum.Font.Gotham
    hint.TextSize = 14
    hint.Parent = mainFrame
end

-- Ensure GUI persists through respawns
localPlayer.CharacterAdded:Connect(function()
    -- Re-parent GUI to new PlayerGui if needed
    if not screenGui.Parent then
        screenGui.Parent = localPlayer:WaitForChild("PlayerGui")
    end
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "broken player pickaxe gui (no key code)",
   Callback = function()
   local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "ToggleableGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Add OPEN/CLOSE toggle button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 60, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(60, 130, 200)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Text = "OPEN"
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 14
toggleButton.ZIndex = 10
toggleButton.Parent = gui

-- Add corner rounding to toggle button
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleButton

-- Main window
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 250)
mainFrame.Position = UDim2.new(0.3, 0, 0.4, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 35, 40)
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 1
mainFrame.Visible = true
mainFrame.Parent = gui

-- Drag area (top bar)
local dragArea = Instance.new("Frame")
dragArea.Size = UDim2.new(1, 0, 0, 30)
dragArea.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
dragArea.BorderSizePixel = 0
dragArea.ZIndex = 2
dragArea.Name = "DragBar"
dragArea.Parent = mainFrame

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 20
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.ZIndex = 3
closeButton.Name = "CloseButton"
closeButton.Parent = dragArea

-- Title text
local titleText = Instance.new("TextLabel")
titleText.Text = "GUI - Drag Me"
titleText.Font = Enum.Font.SourceSansBold
titleText.TextSize = 16
titleText.TextColor3 = Color3.new(1, 1, 1)
titleText.Size = UDim2.new(1, -40, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.ZIndex = 2
titleText.Parent = dragArea

-- Content area
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -40)
content.Position = UDim2.new(0, 10, 0, 35)
content.BackgroundTransparency = 1
content.ZIndex = 1
content.Parent = mainFrame

-- Player selection
local playerButton = Instance.new("TextButton")
playerButton.Text = "SELECT PLAYER"
playerButton.Font = Enum.Font.SourceSansSemibold
playerButton.TextSize = 16
playerButton.TextColor3 = Color3.new(1, 1, 1)
playerButton.Size = UDim2.new(1, 0, 0, 35)
playerButton.Position = UDim2.new(0, 0, 0, 10)
playerButton.BackgroundColor3 = Color3.fromRGB(50, 60, 70)
playerButton.ZIndex = 2
playerButton.Name = "PlayerButton"
playerButton.Parent = content

-- Pickaxe selection
local pickaxeButton = Instance.new("TextButton")
pickaxeButton.Text = "SELECT PICKAXE"
pickaxeButton.Font = Enum.Font.SourceSansSemibold
pickaxeButton.TextSize = 16
pickaxeButton.TextColor3 = Color3.new(1, 1, 1)
pickaxeButton.Size = UDim2.new(1, 0, 0, 35)
pickaxeButton.Position = UDim2.new(0, 0, 0, 55)
pickaxeButton.BackgroundColor3 = Color3.fromRGB(50, 60, 70)
pickaxeButton.ZIndex = 2
pickaxeButton.Name = "PickaxeButton"
pickaxeButton.Parent = content

-- Fire button
local fireButton = Instance.new("TextButton")
fireButton.Text = "FIRE DAMAGE (50 TIMES)"
fireButton.Font = Enum.Font.SourceSansBold
fireButton.TextSize = 18
fireButton.TextColor3 = Color3.new(1, 1, 1)
fireButton.Size = UDim2.new(1, 0, 0, 40)
fireButton.Position = UDim2.new(0, 0, 0, 100)
fireButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
fireButton.ZIndex = 2
fireButton.Name = "FireButton"
fireButton.Parent = content

-- Status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Text = ""
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextSize = 14
statusLabel.TextColor3 = Color3.new(1, 0.8, 0.2)
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 150)
statusLabel.BackgroundTransparency = 1
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Visible = false
statusLabel.ZIndex = 2
statusLabel.Parent = content

-- Corner rounding
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 4)

for _, btn in ipairs({playerButton, pickaxeButton, fireButton}) do
    btnCorner:Clone().Parent = btn
end

-- Toggle Button Functionality
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    
    if mainFrame.Visible then
        toggleButton.Text = "CLOSE"
        toggleButton.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
    else
        toggleButton.Text = "OPEN"
        toggleButton.BackgroundColor3 = Color3.fromRGB(60, 130, 200)
    end
end)

-- Close Button Functionality
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    toggleButton.Text = "OPEN"
    toggleButton.BackgroundColor3 = Color3.fromRGB(60, 130, 200)
end)

-- Drag functionality
local dragStartPos, frameStartPos
local dragging = false

dragArea.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStartPos = input.Position
        frameStartPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStartPos
        mainFrame.Position = UDim2.new(
            frameStartPos.X.Scale, 
            frameStartPos.X.Offset + delta.X,
            frameStartPos.Y.Scale,
            frameStartPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Pickaxe options
local pickaxeOptions = {
    "Iron Pickaxe", 
    "Limbo Pickaxe", 
    "Old Iron Pickaxe", 
    "Steel Pickaxe", 
    "Stone Pickaxe", 
    "Wooden Pickaxe"
}

-- Player selection
playerButton.MouseButton1Click:Connect(function()
    -- Create player selection menu
    local selectionFrame = Instance.new("Frame")
    selectionFrame.Size = UDim2.new(0.8, 0, 0, 200)
    selectionFrame.Position = UDim2.new(0.1, 0, 0.5, -100)
    selectionFrame.BackgroundColor3 = Color3.fromRGB(50, 55, 60)
    selectionFrame.BorderSizePixel = 0
    selectionFrame.ZIndex = 4
    selectionFrame.Parent = mainFrame
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -10, 1, -10)
    scrollFrame.Position = UDim2.new(0, 5, 0, 5)
    scrollFrame.BorderSizePixel = 0
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.Parent = selectionFrame
    
    local players = Players:GetPlayers()
    local yPos = 0
    
    for _, player in ipairs(players) do
        local playerBtn = Instance.new("TextButton")
        playerBtn.Text = player.Name
        playerBtn.Font = Enum.Font.SourceSans
        playerBtn.TextSize = 16
        playerBtn.TextColor3 = Color3.new(1, 1, 1)
        playerBtn.Size = UDim2.new(1, -10, 0, 30)
        playerBtn.Position = UDim2.new(0, 5, 0, yPos)
        playerBtn.BackgroundColor3 = Color3.fromRGB(70, 80, 90)
        playerBtn.BorderSizePixel = 0
        playerBtn.ZIndex = 5
        playerBtn.Parent = scrollFrame
        
        playerBtn.MouseButton1Click:Connect(function()
            playerButton.Text = "PLAYER: " .. player.Name
            selectionFrame:Destroy()
        end)
        
        yPos = yPos + 35
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    
    -- Close button for selection
    local closeSelect = Instance.new("TextButton")
    closeSelect.Text = "X"
    closeSelect.Font = Enum.Font.SourceSansBold
    closeSelect.TextSize = 18
    closeSelect.TextColor3 = Color3.new(1, 1, 1)
    closeSelect.Size = UDim2.new(0, 30, 0, 30)
    closeSelect.Position = UDim2.new(1, -30, 0, 0)
    closeSelect.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeSelect.BorderSizePixel = 0
    closeSelect.ZIndex = 5
    closeSelect.Parent = selectionFrame
    
    closeSelect.MouseButton1Click:Connect(function()
        selectionFrame:Destroy()
    end)
    
    corner:Clone().Parent = selectionFrame
end)

-- Pickaxe selection
pickaxeButton.MouseButton1Click:Connect(function()
    -- Create pickaxe selection menu
    local selectionFrame = Instance.new("Frame")
    selectionFrame.Size = UDim2.new(0.8, 0, 0, 200)
    selectionFrame.Position = UDim2.new(0.1, 0, 0.5, -100)
    selectionFrame.BackgroundColor3 = Color3.fromRGB(50, 55, 60)
    selectionFrame.BorderSizePixel = 0
    selectionFrame.ZIndex = 4
    selectionFrame.Parent = mainFrame
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -10, 1, -10)
    scrollFrame.Position = UDim2.new(0, 5, 0, 5)
    scrollFrame.BorderSizePixel = 0
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.Parent = selectionFrame
    
    local yPos = 0
    
    for _, pickaxe in ipairs(pickaxeOptions) do
        local pickBtn = Instance.new("TextButton")
        pickBtn.Text = pickaxe
        pickBtn.Font = Enum.Font.SourceSans
        pickBtn.TextSize = 16
        pickBtn.TextColor3 = Color3.new(1, 1, 1)
        pickBtn.Size = UDim2.new(1, -10, 0, 30)
        pickBtn.Position = UDim2.new(0, 5, 0, yPos)
        pickBtn.BackgroundColor3 = Color3.fromRGB(70, 80, 90)
        pickBtn.BorderSizePixel = 0
        pickBtn.ZIndex = 5
        pickBtn.Parent = scrollFrame
        
        pickBtn.MouseButton1Click:Connect(function()
            pickaxeButton.Text = "PICKAXE: " .. pickaxe
            selectionFrame:Destroy()
        end)
        
        yPos = yPos + 35
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    
    -- Close button for selection
    local closeSelect = Instance.new("TextButton")
    closeSelect.Text = "X"
    closeSelect.Font = Enum.Font.SourceSansBold
    closeSelect.TextSize = 18
    closeSelect.TextColor3 = Color3.new(1, 1, 1)
    closeSelect.Size = UDim2.new(0, 30, 0, 30)
    closeSelect.Position = UDim2.new(1, -30, 0, 0)
    closeSelect.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeSelect.BorderSizePixel = 0
    closeSelect.ZIndex = 5
    closeSelect.Parent = selectionFrame
    
    closeSelect.MouseButton1Click:Connect(function()
        selectionFrame:Destroy()
    end)
    
    corner:Clone().Parent = selectionFrame
end)

-- Fire damage functionality
fireButton.MouseButton1Click:Connect(function()
    -- Validate player selection
    if not string.find(playerButton.Text, "PLAYER:") then
        statusLabel.Text = "SELECT A PLAYER FIRST!"
        statusLabel.Visible = true
        task.wait(1.5)
        statusLabel.Visible = false
        return
    end
    
    -- Validate pickaxe selection
    if not string.find(pickaxeButton.Text, "PICKAXE:") then
        statusLabel.Text = "SELECT A PICKAXE FIRST!"
        statusLabel.Visible = true
        task.wait(1.5)
        statusLabel.Visible = false
        return
    end
    
    -- Extract selected player and pickaxe
    local playerName = string.gsub(playerButton.Text, "PLAYER: ", "")
    local pickaxeName = string.gsub(pickaxeButton.Text, "PICKAXE: ", "")
    
    -- Verify player exists
    local targetPlayer = Players:FindFirstChild(playerName)
    if not targetPlayer then
        statusLabel.Text = "PLAYER NOT FOUND: " .. playerName
        statusLabel.Visible = true
        task.wait(1.5)
        statusLabel.Visible = false
        return
    end
    
    -- Verify pickaxe exists
    local backpack = targetPlayer:FindFirstChild("Backpack")
    local character = targetPlayer.Character
    local pickaxe = nil
    
    -- Look in backpack first
    if backpack then
        pickaxe = backpack:FindFirstChild(pickaxeName)
    end
    
    -- Look in character next
    if not pickaxe and character then
        pickaxe = character:FindFirstChild(pickaxeName)
    end
    
    if not pickaxe then
        statusLabel.Text = "PICKAXE NOT FOUND: " .. pickaxeName
        statusLabel.Visible = true
        task.wait(1.5)
        statusLabel.Visible = false
        return
    end
    
    -- Verify damage event exists
    local eventsFolder = pickaxe:FindFirstChild("Events")
    if not eventsFolder then
        statusLabel.Text = "NO EVENTS FOLDER!"
        statusLabel.Visible = true
        task.wait(1.5)
        statusLabel.Visible = false
        return
    end
    
    local damageEvent = eventsFolder:FindFirstChild("Damage")
    if not damageEvent then
        statusLabel.Text = "NO DAMAGE EVENT!"
        statusLabel.Visible = true
        task.wait(1.5)
        statusLabel.Visible = false
        return
    end
    
    -- Prepare rock reference
    local rock = workspace:FindFirstChild("Rocks")
    if rock then
        rock = rock:FindFirstChild("Rock")
        if rock then
            rock = rock:FindFirstChild("Rock")
        end
    end
    
    -- Fire damage
    fireButton.Text = "FIRING DAMAGE..."
    fireButton.BackgroundColor3 = Color3.fromRGB(200, 120, 50)
    statusLabel.Text = "FIRING DAMAGE 50 TIMES..."
    statusLabel.Visible = true
    
    for i = 1, 100 do
        -- Fire the damage event
        if rock then
            damageEvent:FireServer(rock)
        else
            damageEvent:FireServer()  -- Fire anyway if rock not found
        end
        
        statusLabel.Text = "FIRED " .. i .. "/100"
        task.wait(0.05)  -- Small delay between damage events
    end
    
    fireButton.Text = "DAMAGE COMPLETE!"
    fireButton.BackgroundColor3 = Color3.fromRGB(50, 180, 70)
    statusLabel.Text = "✅ DAMAGE SUCCESSFUL!"
    task.wait(1.5)
    
    -- Reset UI
    fireButton.Text = "BROKEN PICKAXE"
    fireButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
    statusLabel.Visible = false
end)
   end,
})
