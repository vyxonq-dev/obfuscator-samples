local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Chain But Kira | Script",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "WAIT WAIT WAIT!!!",
   LoadingSubtitle = "By ScriptTrol",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Corn Hub"
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
   Title = "5V UPDATA",
   Content = "I CAN SAY THIS IS LAST UPDATA OK??",
   Duration = 6.5,
   Image = nil,
})

local MainTab = Window:CreateTab("INF Stamina", nil) -- Title, Image
local MainSection = MainTab:CreateSection("This is Test")

local MainButton = MainTab:CreateButton({
   Name = "INF Stamina",
   Callback = function()
    while true do
-- Generated with Sigma Spy Github: https://github.com/depthso/Sigma-Spy
-- Services
local Players = game:GetService("Players")

-- Remote
local RemoteEvent = Players.LocalPlayer.Character.RagdollSCript.RemoteEvent -- RemoteEvent 

-- This data was received from the server
firesignal(RemoteEvent.OnClientEvent, 
    "Stamina",
    100,
    100
)
task.wait(7)
end
   end,
})

local MainButton = MainTab:CreateButton({
   Name = "INF CBTStamina",
   Callback = function()
   while true do
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CBTStamina.Value = (100)
task.wait(0.5)
end
   end,
})

local MainButton = MainTab:CreateButton({
   Name = "INF XSAW Gas",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer

-- Function to force Gas to 100
local function lockGas(tool)
    if not tool or not tool:FindFirstChild("Gas") then return end
    
    -- HACK: Override the Value property
    local gas = tool.Gas
    while true do
        gas.Value = 100
        task.wait(0.1) -- Small delay to prevent lag
    end
end

-- Check Backpack & Character
local function checkForTool()
    -- Check Backpack
    local backpack = player:FindFirstChildOfClass("Backpack")
    if backpack then
        local xsaw = backpack:FindFirstChild("XSAW")
        if xsaw then lockGas(xsaw) end
    end
    
    -- Check Character
    local character = player.Character
    if character then
        local xsaw = character:FindFirstChild("XSAW")
        if xsaw then lockGas(xsaw) end
    end
end

-- Run when tool is added
player.Backpack.ChildAdded:Connect(checkForTool)
player.CharacterAdded:Connect(function()
    checkForTool()
end)

-- Initial check
checkForTool()
   end,
})

local MainButton = MainTab:CreateButton({
   Name = "INF M1911 Ammo",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer
local playerName = player.Name

-- Search for your model in workspace
local playerModel = workspace:FindFirstChild(playerName)
if playerModel then
    local weaponScript = playerModel:FindFirstChild("M1911")
    if weaponScript then
        local remoteEvent = weaponScript:FindFirstChild("Script"):FindFirstChild("RemoteEvent")
        if remoteEvent then
            remoteEvent:FireServer(table.unpack({
                [1] = "Shoot",
                [2] = 999999999999999999999,
            }))
            print("Successfully")
        else
            warn("RemoteEvent not found in M1911")
        end
    else
        warn("M1911 not found in your hand")
    end
else
    warn("Your player model not found in workspace")
end
   end,
})

local MainButton = MainTab:CreateButton({
   Name = "INF M1911TWO Ammo",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer
local playerName = player.Name

-- Search for your model in workspace
local playerModel = workspace:FindFirstChild(playerName)
if playerModel then
    local weaponScript = playerModel:FindFirstChild("M1911TWO")
    if weaponScript then
        local remoteEvent = weaponScript:FindFirstChild("Script"):FindFirstChild("RemoteEvent")
        if remoteEvent then
            remoteEvent:FireServer(table.unpack({
                [1] = "Shoot",
                [2] = 999999999999999999999,
            }))
            print("Successfully")
        else
            warn("RemoteEvent not found in M1911TWO")
        end
    else
        warn("M1911TWO not found in your hand")
    end
else
    warn("Your player model not found in workspace")
end
   end,
})

local MainButton = MainTab:CreateButton({
   Name = "INF MakeshiftAK Ammo",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer
local playerName = player.Name

-- Search for your model in workspace
local playerModel = workspace:FindFirstChild(playerName)
if playerModel then
    local weaponScript = playerModel:FindFirstChild("MakeshiftAK")
    if weaponScript then
        local remoteEvent = weaponScript:FindFirstChild("Script"):FindFirstChild("RemoteEvent")
        if remoteEvent then
            remoteEvent:FireServer(table.unpack({
                [1] = "Shoot",
                [2] = 999999999999999999999,
            }))
            print("Successfully")
        else
            warn("RemoteEvent not found in MakeshiftAK")
        end
    else
        warn("MakeshiftAK not found in your hand")
    end
else
    warn("Your player model not found in workspace")
end
   end,
})

local Main100Tab = Window:CreateTab("Steal Item", nil) -- Title, Image
local Main100Section = Main100Tab:CreateSection("you know?, l idk want shar this script lol ")

local Main100Button = Main100Tab:CreateButton({
   Name = "Steal Gui (F1)",
   Callback = function()
   local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- Debug print function
local function debugPrint(message)
    print("[STEAL GUI] " .. message)
    warn("[STEAL GUI] " .. message)
end

-- Create main GUI
debugPrint("Creating GUI elements...")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StealGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")
debugPrint("ScreenGui created")

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 250)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Selectable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui
debugPrint("Main frame created")

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0, 200, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "ITEM STEALER"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = titleBar
debugPrint("Title bar created")

-- Player selection
local playerLabel = Instance.new("TextLabel")
playerLabel.Name = "PlayerLabel"
playerLabel.Size = UDim2.new(1, -20, 0, 20)
playerLabel.Position = UDim2.new(0, 10, 0, 40)
playerLabel.BackgroundTransparency = 1
playerLabel.Text = "SELECT PLAYER:"
playerLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
playerLabel.TextXAlignment = Enum.TextXAlignment.Left
playerLabel.Font = Enum.Font.Gotham
playerLabel.TextSize = 12
playerLabel.Parent = mainFrame

local playerDropdown = Instance.new("TextButton")
playerDropdown.Name = "PlayerDropdown"
playerDropdown.Size = UDim2.new(1, -20, 0, 30)
playerDropdown.Position = UDim2.new(0, 10, 0, 60)
playerDropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
playerDropdown.BorderSizePixel = 0
playerDropdown.Font = Enum.Font.Gotham
playerDropdown.Text = "All Players"
playerDropdown.TextColor3 = Color3.fromRGB(255, 255, 255) -- FIXED: Changed to white
playerDropdown.TextSize = 14
playerDropdown.Parent = mainFrame
debugPrint("Player dropdown created")

-- Item selection
local itemLabel = Instance.new("TextLabel")
itemLabel.Name = "ItemLabel"
itemLabel.Size = UDim2.new(1, -20, 0, 20)
itemLabel.Position = UDim2.new(0, 10, 0, 100)
itemLabel.BackgroundTransparency = 1
itemLabel.Text = "SELECT ITEM:"
itemLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
itemLabel.TextXAlignment = Enum.TextXAlignment.Left
itemLabel.Font = Enum.Font.Gotham
itemLabel.TextSize = 12
itemLabel.Parent = mainFrame

local itemDropdown = Instance.new("TextButton")
itemDropdown.Name = "ItemDropdown"
itemDropdown.Size = UDim2.new(1, -20, 0, 30)
itemDropdown.Position = UDim2.new(0, 10, 0, 120)
itemDropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
itemDropdown.BorderSizePixel = 0
itemDropdown.Font = Enum.Font.Gotham
itemDropdown.Text = "Choose Item"
itemDropdown.TextColor3 = Color3.fromRGB(255, 255, 255) -- FIXED: Changed to white
itemDropdown.TextSize = 14
itemDropdown.Parent = mainFrame
debugPrint("Item dropdown created")

-- Steal button
local stealButton = Instance.new("TextButton")
stealButton.Name = "StealButton"
stealButton.Size = UDim2.new(1, -20, 0, 40)
stealButton.Position = UDim2.new(0, 10, 1, -50)
stealButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
stealButton.BorderSizePixel = 0
stealButton.Font = Enum.Font.GothamBold
stealButton.Text = "STEAL ITEM"
stealButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- FIXED: Changed to white
stealButton.TextSize = 16
stealButton.Parent = mainFrame
debugPrint("Steal button created")

-- Status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "Status"
statusLabel.Size = UDim2.new(1, -20, 0, 20)
statusLabel.Position = UDim2.new(0, 10, 0, 170)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Ready"
statusLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.Parent = mainFrame
debugPrint("Status label created")

-- Open/Close button (mobile)
local openButton = Instance.new("TextButton")
openButton.Name = "OpenButton"
openButton.Size = UDim2.new(0, 80, 0, 40)
openButton.Position = UDim2.new(1, -90, 0, 10)
openButton.BackgroundColor3 = Color3.fromRGB(30, 30, 180)
openButton.BorderSizePixel = 0
openButton.Font = Enum.Font.GothamBold
openButton.Text = "OPEN"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- FIXED: Changed to white
openButton.TextSize = 14
openButton.Visible = false
openButton.Parent = screenGui
debugPrint("Open button created")

-- Device detection
debugPrint("Detecting device...")
local isMobile = UIS.TouchEnabled
debugPrint("Is mobile: " .. tostring(isMobile))

if isMobile then
    openButton.Visible = true
    mainFrame.Visible = false
    debugPrint("Mobile UI initialized")
else
    openButton.Visible = false
    mainFrame.Visible = true
    debugPrint("PC UI initialized")
end

-- Player dropdown functionality
local playerSelection = "All"
playerDropdown.MouseButton1Click:Connect(function()
    debugPrint("Player dropdown clicked")
    
    -- Destroy existing dropdown if any
    local existing = mainFrame:FindFirstChild("PlayerSelectionFrame")
    if existing then
        existing:Destroy()
        debugPrint("Removed existing player dropdown")
    end
    
    local selectionGui = Instance.new("Frame")
    selectionGui.Name = "PlayerSelectionFrame"
    selectionGui.Size = UDim2.new(1, -20, 0, 150)
    selectionGui.Position = UDim2.new(0, 10, 0, 60)
    selectionGui.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    selectionGui.BorderSizePixel = 0
    selectionGui.ZIndex = 10
    selectionGui.Parent = mainFrame
    debugPrint("Player selection frame created")

    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.ScrollBarThickness = 5
    scrollingFrame.ZIndex = 10
    scrollingFrame.Parent = selectionGui

    local layout = Instance.new("UIListLayout")
    layout.Parent = scrollingFrame
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
    end)

    -- Add "All Players" option
    local allButton = Instance.new("TextButton")
    allButton.Size = UDim2.new(1, 0, 0, 30)
    allButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    allButton.BorderSizePixel = 0
    allButton.Font = Enum.Font.Gotham
    allButton.Text = "All Players"
    allButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- FIXED: Changed to white
    allButton.TextSize = 14
    allButton.ZIndex = 10
    allButton.Parent = scrollingFrame

    allButton.MouseButton1Click:Connect(function()
        playerSelection = "All"
        playerDropdown.Text = "All Players"
        selectionGui:Destroy()
        debugPrint("Selected: All Players")
    end)

    -- Add individual players
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            local playerButton = Instance.new("TextButton")
            playerButton.Size = UDim2.new(1, 0, 0, 30)
            playerButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            playerButton.BorderSizePixel = 0
            playerButton.Font = Enum.Font.Gotham
            playerButton.Text = plr.Name
            playerButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- FIXED: Changed to white
            playerButton.TextSize = 14
            playerButton.ZIndex = 10
            playerButton.Parent = scrollingFrame

            playerButton.MouseButton1Click:Connect(function()
                playerSelection = plr.Name
                playerDropdown.Text = plr.Name
                selectionGui:Destroy()
                debugPrint("Selected player: " .. plr.Name)
            end)
        end
    end
end)

-- Item dropdown functionality
local itemList = {"MakeshiftAK", "XSAW", "Reficul", "CombatKnife", "CombatKnifeTWO", "Angelica", "Beartrap", "BloodBag", "Radio", "Soup's Energy Drink", 
                 "M1911", "M1911TWO", "MacheteTWO", "Machete", "Vest", "VestTWO", "M67Grenade", "StunGrenade", "Jack'O-Mine", "Tablet", "Tomahawk"}
local itemSelection = ""

itemDropdown.MouseButton1Click:Connect(function()
    debugPrint("Item dropdown clicked")
    
    -- Destroy existing dropdown if any
    local existing = mainFrame:FindFirstChild("ItemSelectionFrame")
    if existing then
        existing:Destroy()
        debugPrint("Removed existing item dropdown")
    end
    
    local selectionGui = Instance.new("Frame")
    selectionGui.Name = "ItemSelectionFrame"
    selectionGui.Size = UDim2.new(1, -20, 0, 150)
    selectionGui.Position = UDim2.new(0, 10, 0, 120)
    selectionGui.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    selectionGui.BorderSizePixel = 0
    selectionGui.ZIndex = 10
    selectionGui.Parent = mainFrame
    debugPrint("Item selection frame created")

    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.ScrollBarThickness = 5
    scrollingFrame.ZIndex = 10
    scrollingFrame.Parent = selectionGui

    local layout = Instance.new("UIListLayout")
    layout.Parent = scrollingFrame
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
    end)

    for _, item in ipairs(itemList) do
        local itemButton = Instance.new("TextButton")
        itemButton.Size = UDim2.new(1, 0, 0, 30)
        itemButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        itemButton.BorderSizePixel = 0
        itemButton.Font = Enum.Font.Gotham
        itemButton.Text = item
        itemButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- FIXED: Changed to white
        itemButton.TextSize = 14
        itemButton.ZIndex = 10
        itemButton.Parent = scrollingFrame

        itemButton.MouseButton1Click:Connect(function()
            itemSelection = item
            itemDropdown.Text = item
            selectionGui:Destroy()
            debugPrint("Selected item: " .. item)
        end)
    end
end)

-- Steal functionality
stealButton.MouseButton1Click:Connect(function()
    debugPrint("Steal button clicked")
    
    if itemSelection == "" then
        debugPrint("No item selected")
        itemDropdown.Text = "SELECT ITEM FIRST!"
        task.wait(1.5)
        itemDropdown.Text = "Choose Item"
        return
    end
    
    statusLabel.Text = "Stealing " .. itemSelection .. "..."
    statusLabel.TextColor3 = Color3.fromRGB(255, 255, 150)
    debugPrint("Attempting to steal: " .. itemSelection)
    
    local targetPlayer = nil
    
    if playerSelection == "All" then
        debugPrint("Searching all players for item")
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local item = plr.Character:FindFirstChild(itemSelection)
                if item then
                    targetPlayer = plr
                    debugPrint("Found item on player: " .. plr.Name)
                    break
                end
            end
        end
    else
        debugPrint("Targeting specific player: " .. playerSelection)
        targetPlayer = Players:FindFirstChild(playerSelection)
    end
    
    if targetPlayer then
        debugPrint("Target player found: " .. targetPlayer.Name)
        local char = targetPlayer.Character
        if char then
            debugPrint("Character found")
            local item = char:FindFirstChild(itemSelection)
            if item then
                debugPrint("Item found in character")
                
                -- Make the player drop the item
                debugPrint("Firing DropItem event")
                game:GetService("ReplicatedStorage").DropItem:FireServer(item)
                
                -- Wait for item to drop
                task.wait(0.5)
                debugPrint("Searching for dropped item")
                
                -- Find the dropped item
                local itemsFolder = workspace:FindFirstChild("Items")
                if itemsFolder then
                    local droppedItem = nil
                    
                    -- Search for the item by name
                    for _, obj in ipairs(itemsFolder:GetChildren()) do
                        if obj.Name == itemSelection then
                            droppedItem = obj
                            break
                        end
                    end
                    
                    if droppedItem then
                        debugPrint("Dropped item found")
                        -- Pick up the item
                        game:GetService("ReplicatedStorage").Pickup:FireServer(droppedItem)
                        statusLabel.Text = "Success! Stole " .. itemSelection
                        statusLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
                        debugPrint("Item stolen successfully")
                    else
                        statusLabel.Text = "Error: Item not found in workspace"
                        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                        debugPrint("Dropped item not found")
                    end
                else
                    statusLabel.Text = "Error: Items folder not found"
                    statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                    debugPrint("Items folder not found in workspace")
                end
            else
                statusLabel.Text = "Error: Player doesn't have item"
                statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                debugPrint("Item not found on player")
            end
        else
            statusLabel.Text = "Error: Player character not found"
            statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            debugPrint("Player character not found")
        end
    else
        statusLabel.Text = "Error: Player not found"
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        debugPrint("Target player not found")
    end
end)

-- Mobile controls
openButton.MouseButton1Click:Connect(function()
    debugPrint("Open button clicked")
    mainFrame.Visible = true
    openButton.Visible = false
end)

-- Close button functionality
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.Gotham
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- FIXED: Changed to white
closeButton.TextSize = 14
closeButton.Visible = isMobile
closeButton.Parent = titleBar

closeButton.MouseButton1Click:Connect(function()
    debugPrint("Close button clicked")
    mainFrame.Visible = false
    openButton.Visible = true
end)

-- PC controls (F1 toggle)
if not isMobile then
    debugPrint("Setting up F1 toggle")
    UIS.InputBegan:Connect(function(input, processed)
        if processed then return end
        
        if input.KeyCode == Enum.KeyCode.F1 then
            mainFrame.Visible = not mainFrame.Visible
            debugPrint("F1 pressed - GUI visible: " .. tostring(mainFrame.Visible))
        end
    end)
end

-- Create a function to make elements draggable
local function makeDraggable(element, frame)
    local dragging = false
    local dragInput, dragStart, startPos
    
    element.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    element.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                     startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Make GUI draggable via title bar
makeDraggable(titleBar, mainFrame)

-- Make open button draggable (mobile only)
if isMobile then
    makeDraggable(openButton, openButton)
    
    -- Also make the open button text draggable
    local openText = openButton:FindFirstChildOfClass("TextLabel")
    if openText then
        makeDraggable(openText, openButton)
    end
end

debugPrint("GUI creation complete")
   end,
})

local MainLagTab = Window:CreateTab("funny", nil) -- Title, Image
local MainLagSection = MainLagTab:CreateSection("Lag server")

local Toggle = MainLagTab:CreateToggle({
   Name = "Auto Buy Radio",
   CurrentValue = false,
   Flag = "AutoRadio",
   Callback = function(Value)
        _G.auto = Value  -- Set the global variable directly
        
        -- Start/stop the buying loop
        if _G.auto then
            coroutine.wrap(function()
                while _G.auto do  -- Will break automatically when _G.auto becomes false
                    game:GetService("ReplicatedStorage").Buy:FireServer(table.unpack({
                        [1] = game:GetService("Lighting").Items.Radio,
                        [2] = 0,
                        [3] = 0
                    }))
                    task.wait()
                end
            end)()
        end
   end,
})

local Main1000Tab = Window:CreateTab("Inf Attack", nil) -- Title, Image
local Main1000Section = Main1000Tab:CreateSection("Fire🔥🔥")

local Main1000Button = Main1000Tab:CreateButton({
   Name = "M1911 Attack (hold)",
   Callback = function()
   while true do
   local player = game:GetService("Players").LocalPlayer

-- Search for the player model in workspace
local playerModel = workspace:FindFirstChild(player.Name)
if playerModel then
    local m1911 = playerModel:FindFirstChild("M1911")
    if m1911 then
        local toolScript = m1911:FindFirstChild("Script")
        if toolScript then
            local remoteEvent = toolScript:FindFirstChild("RemoteEvent")
            if remoteEvent then
                remoteEvent:FireServer("Hit")
                print("Successfully fired M1911 Hit event!")
            else
                warn("RemoteEvent not found in M1911 Script")
            end
        else
            warn("Script not found in M1911")
        end
    else
        warn("M1911 not found in your workspace model")
    end
else
    warn("Your player model not found in workspace")
end
wait()
end
   end,
})

local Main1000Button = Main1000Tab:CreateButton({
   Name = "MakeshiftAK Attack (hold)",
   Callback = function()
   while true do
   local player = game:GetService("Players").LocalPlayer

-- Search for the player model in workspace
local playerModel = workspace:FindFirstChild(player.Name)
if playerModel then
    local m1911 = playerModel:FindFirstChild("MakeshiftAK")
    if m1911 then
        local toolScript = m1911:FindFirstChild("Script")
        if toolScript then
            local remoteEvent = toolScript:FindFirstChild("RemoteEvent")
            if remoteEvent then
                remoteEvent:FireServer("Hit")
                print("Successfully fired MakeshiftAK Hit event!")
            else
                warn("RemoteEvent not found in MakeshiftAK Script")
            end
        else
            warn("Script not found in MakeshiftAK")
        end
    else
        warn("MakeshiftAK not found in your workspace model")
    end
else
    warn("Your player model not found in workspace")
end
wait()
end
   end,
})

local Main10Tab = Window:CreateTab("NO CD", nil) -- Title, Image
local Main10Section = Main10Tab:CreateSection("yep all is beta")

local Main10Button = Main10Tab:CreateButton({
   Name = "XSAW inf Charge",
   Callback = function()
   local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Function to create the GUI
local function createChargeGUI()
    -- Check if GUI already exists
    if PlayerGui:FindFirstChild("charge") then
        PlayerGui.charge:Destroy()
    end

    local charge = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TextButton = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")

    -- GUI setup
    charge.Name = "charge"
    charge.Parent = PlayerGui
    charge.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    charge.ResetOnSpawn = false  -- Crucial for persistence

    Frame.Parent = charge
    Frame.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.113, 0, 0.089, 0)
    Frame.Size = UDim2.new(0, 140, 0, 61)
    Frame.Active = true
    Frame.Draggable = true

    UICorner.Parent = Frame

    TextButton.Parent = Frame
    TextButton.BackgroundColor3 = Color3.fromRGB(131, 131, 131)
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0.1, 0, 0.1, 0)
    TextButton.Size = UDim2.new(0, 107, 0, 51)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = "XSAW (V)"
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 25  -- Reduced for better fit
    UICorner_2.Parent = TextButton

    return charge, TextButton
end

-- Charge execution function
local function executeCharge()
    local playerModel = workspace:FindFirstChild(Player.Name)
    if not playerModel then return end

    local xSawScript = playerModel:FindFirstChild("XSAW")
    if not xSawScript then return end

    local mainScript = xSawScript:FindFirstChild("Script")
    if not mainScript then return end

    local remoteEvent = mainScript:FindFirstChild("RemoteEvent")
    if remoteEvent then
        remoteEvent:FireServer("Charge")
    end
end

-- Main setup
local chargeGUI, chargeButton = createChargeGUI()

-- Connect button
chargeButton.MouseButton1Click:Connect(executeCharge)

-- Keybind setup
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.V then
        executeCharge()
    end
end)

-- Handle respawns
Player.CharacterAdded:Connect(function()
    if not PlayerGui:FindFirstChild("charge") then
        chargeGUI, chargeButton = createChargeGUI()
        chargeButton.MouseButton1Click:Connect(executeCharge)
    end
end)

local Remote = game:GetService("ReplicatedStorage").AddNotif
firesignal(Remote.OnClientEvent, "WARNING!!!!!")
wait(1.5)
local Remote = game:GetService("ReplicatedStorage").AddNotif
firesignal(Remote.OnClientEvent, "Dont No Try")
wait(1.5)
local Remote = game:GetService("ReplicatedStorage").AddNotif
firesignal(Remote.OnClientEvent, "You may be banned")
   end,
})

local Main10Button = Main10Tab:CreateButton({
   Name = "Tomahawk inf Charge",
   Callback = function()
   local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Function to create the GUI
local function createChargeGUI()
    -- Check if GUI already exists
    if PlayerGui:FindFirstChild("charge") then
        PlayerGui.charge:Destroy()
    end

    local charge = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TextButton = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")

    -- GUI setup
    charge.Name = "charge"
    charge.Parent = PlayerGui
    charge.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    charge.ResetOnSpawn = false  -- Crucial for persistence

    Frame.Parent = charge
    Frame.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.113, 0, 0.089, 0)
    Frame.Size = UDim2.new(0, 140, 0, 61)
    Frame.Active = true
    Frame.Draggable = true

    UICorner.Parent = Frame

    TextButton.Parent = Frame
    TextButton.BackgroundColor3 = Color3.fromRGB(131, 131, 131)
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0.1, 0, 0.1, 0)
    TextButton.Size = UDim2.new(0, 107, 0, 51)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = "Tomahawk (B)"
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 25  -- Reduced for better fit
    UICorner_2.Parent = TextButton

    return charge, TextButton
end

-- Charge execution function
local function executeCharge()
    local playerModel = workspace:FindFirstChild(Player.Name)
    if not playerModel then return end

    local xSawScript = playerModel:FindFirstChild("Tomahawk")
    if not xSawScript then return end

    local mainScript = xSawScript:FindFirstChild("Script")
    if not mainScript then return end

    local remoteEvent = mainScript:FindFirstChild("RemoteEvent")
    if remoteEvent then
        remoteEvent:FireServer("Charge")
    end
end

-- Main setup
local chargeGUI, chargeButton = createChargeGUI()

-- Connect button
chargeButton.MouseButton1Click:Connect(executeCharge)

-- Keybind setup
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.B then
        executeCharge()
    end
end)

-- Handle respawns
Player.CharacterAdded:Connect(function()
    if not PlayerGui:FindFirstChild("charge") then
        chargeGUI, chargeButton = createChargeGUI()
        chargeButton.MouseButton1Click:Connect(executeCharge)
    end
end)

local Remote = game:GetService("ReplicatedStorage").AddNotif
firesignal(Remote.OnClientEvent, "WARNING!!!!!")
wait(1.5)
local Remote = game:GetService("ReplicatedStorage").AddNotif
firesignal(Remote.OnClientEvent, "Dont No Try")
wait(1.5)
local Remote = game:GetService("ReplicatedStorage").AddNotif
firesignal(Remote.OnClientEvent, "You may be banned")
   end,
})

local Main10Button = Main10Tab:CreateButton({
   Name = "INF dodge (No 100%)",
   Callback = function()
   while true do
local player = game:GetService("Players").LocalPlayer
local playerName = player.Name

-- Search for your model in workspace
local playerModel = workspace:FindFirstChild(playerName)
if playerModel then
    local ragdollScript = playerModel:FindFirstChild("RagdollScript") -- Case sensitive!
    if ragdollScript then
        local remoteEvent = ragdollScript:FindFirstChild("RemoteEvent")
        if remoteEvent then
            remoteEvent:FireServer(table.unpack({
                [1] = "Dodge",
                [2] = 1,
            }))
            print("Successfully!")
        else
            warn("RemoteEvent not found in RagdollScript")
        end
    else
        warn("RagdollScript not found in your workspace model")
    end
else
    warn("Your player model not found in workspace")
end
wait(0)
end
   end,
})

local Main10button = Main10Tab:CreateButton({
   Name = "Auto All Clash🔥",
   Callback = function()
   local Workspace = game:GetService("Workspace")

-- Create blocker UI
local blockerUI = Instance.new("ScreenGui")
blockerUI.Name = "RemoteBlockerUI"
blockerUI.Parent = PlayerGui
blockerUI.ResetOnSpawn = false

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0, 200, 0, 40)
StatusLabel.Position = UDim2.new(1, -220, 0, 10)  -- Top-right position
StatusLabel.BackgroundTransparency = 0.7
StatusLabel.BackgroundColor3 = Color3.new(0, 0.5, 0)
StatusLabel.Text = "Remote Blocker: ACTIVE"
StatusLabel.TextColor3 = Color3.new(1, 1, 1)
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.Parent = blockerUI

-- Enhanced function to find Kira RemoteEvent
local function findKiraRemote()
    local function searchByName()
        local kira = Workspace:FindFirstChild("Kira")
        if kira then
            return kira:FindFirstChild("RemoteEvent")
        end
        return nil
    end
    
    local function deepSearch()
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name == "RemoteEvent" and obj.Parent and obj.Parent.Name == "Kira" then
                return obj
            end
        end
        return nil
    end
    
    return searchByName() or deepSearch()
end

-- Core blocking function
local function BlockSpecificRemotes()
    local oldFireServer
    oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
        if self and self.Parent and self.Parent.Name == "Kira" and self.Name == "RemoteEvent" then
            if ... == "Fail" then
                print("[Blocked] Fail event")
                return nil
            end
        end
        return oldFireServer(self, ...)
    end)

    local oldInvokeServer
    oldInvokeServer = hookfunction(Instance.new("RemoteEvent").InvokeServer, function(self, ...)
        if self and self.Parent and self.Parent.Name == "Kira" and self.Name == "RemoteEvent" then
            if ... == "XSAWClash" then
                print("[Blocked] XSAWClash event")
                return nil
            end
        end
        return oldInvokeServer(self, ...)
    end)
end

-- Fallback protection
local function startFallbackProtection()
    while task.wait(1) do
        local remote = findKiraRemote()
        if remote and remote:IsDescendantOf(Workspace) then
            pcall(function()
                remote:Destroy()
                print("Fallback: RemoteEvent destroyed")
            end)
            
            if remote.Parent then
                pcall(function()
                    remote.FireServer = function() end
                    remote.InvokeServer = function() end
                    print("Fallback: RemoteEvent functions disabled")
                end)
            end
        end
    end
end

-- Initialize blocker
local success, err = pcall(BlockSpecificRemotes)
if not success then
    StatusLabel.Text = "Using Fallback Protection"
    StatusLabel.BackgroundColor3 = Color3.new(0.8, 0, 0)
    task.spawn(startFallbackProtection)
end

-- Monitoring system
task.spawn(function()
    while task.wait(3) do
        local remote = findKiraRemote()
        if remote then
            StatusLabel.Text = "Auto Clash: Blocking"
            StatusLabel.BackgroundColor3 = Color3.new(0, 0.5, 0)
        else
            StatusLabel.Text = "Auto Clash: Inactive"
            StatusLabel.BackgroundColor3 = Color3.new(0.8, 0.8, 0)
        end
    end
end)

print("All systems initialized!")
   end,
})

local Main10Button = Main10Tab:CreateButton({
   Name = "MacheteTwo God Block (open auto clash)",
   Callback = function()
   while true do 
   local player = game:GetService("Players").LocalPlayer
local playerName = player.Name

-- Search for your model in workspace
local playerModel = workspace:FindFirstChild(playerName)
if playerModel then
    local weapon = playerModel:FindFirstChild("MacheteTWO")
    if weapon then
        local weaponScript = weapon:FindFirstChild("Script")
        if weaponScript then
            local remoteEvent = weaponScript:FindFirstChild("RemoteEvent")
            if remoteEvent then
                remoteEvent:FireServer("Block")
                print("Successfully")
            else
                warn("RemoteEvent not found in MacheteTWO Script")
            end
        else
            warn("Script not found in MacheteTWO")
        end
    else
        warn("MacheteTWO not found in your workspace model")
    end
else
    warn("Your player model not found in workspace")
end
   wait(0)
   end
   end,
})

local Main1Tab = Window:CreateTab("Unlock Blueprint", nil) -- Title, Image
local Main1Section = Main1Tab:CreateSection("Work 100%")

local Main1Button = Main1Tab:CreateButton({
   Name = "Unlock All",
   Callback = function()
   game:GetService("Players").LocalPlayer.Blueprints.CombatKnifeTWO.Value = true
   game:GetService("Players").LocalPlayer.Blueprints.Angelica.Value = true
   game:GetService("Players").LocalPlayer.Blueprints.M1911.Value = true
   game:GetService("Players").LocalPlayer.Blueprints.M1911TWO.Value = true
   game:GetService("Players").LocalPlayer.Blueprints.Reficul.Value = true
   game:GetService("Players").LocalPlayer.Blueprints.XSAW.Value = true
   game:GetService("Players").LocalPlayer.Blueprints.MakeshiftAK.Value = true
   game:GetService("Players").LocalPlayer.Blueprints.MacheteTWO.Value = true
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Unlock CombatKnifeTWO",
   Callback = function()
   game:GetService("Players").LocalPlayer.Blueprints.CombatKnifeTWO.Value = true
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Unlock Angelica",
   Callback = function()
   game:GetService("Players").LocalPlayer.Blueprints.Angelica.Value = true
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Unlock M1911",
   Callback = function()
   game:GetService("Players").LocalPlayer.Blueprints.M1911.Value = true
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Unlock M1911TWO",
   Callback = function()
   game:GetService("Players").LocalPlayer.Blueprints.M1911TWO.Value = true
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Unlock Reficul",
   Callback = function()
   game:GetService("Players").LocalPlayer.Blueprints.Reficul.Value = true
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Unlock XSAW",
   Callback = function()
   game:GetService("Players").LocalPlayer.Blueprints.XSAW.Value = true
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Unlock MakeshiftAk",
   Callback = function()
   game:GetService("Players").LocalPlayer.Blueprints.MakeshiftAK.Value = true
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Unlock Machete",
   Callback = function()
   game:GetService("Players").LocalPlayer.Blueprints.MacheteTWO.Value = true
   end,
})

local Main2Tab = Window:CreateTab("ESP", nil) -- Title, Image
local Main2Section = Main2Tab:CreateSection("Esp ltem or Npc")

local Main2Button = Main2Tab:CreateButton({
   Name = "Esp Scraps (no full)",
   Callback = function()
   local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local scrapsFolder = workspace.Map.Interactable.Scraps
local textColor = Color3.fromRGB(0, 255, 0)  -- Green color

-- Table to track active ESP components
local activeESP = {}
local activeScraps = {}

-- Function to create ESP for a scrap
local function createScrapESP(scrap)
    -- Skip if already has ESP
    if activeESP[scrap] then return end
    
    -- Create ESP components
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ScrapESP"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 100, 0, 20)  -- Very compact
    billboard.StudsOffset = Vector3.new(0, 1.8, 0)
    billboard.Adornee = scrap
    billboard.Parent = scrap
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "ESPLabel"
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = textColor
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0.7
    textLabel.TextSize = 11  -- Small text
    textLabel.Font = Enum.Font.SourceSans
    textLabel.Text = "Scrap"
    textLabel.TextYAlignment = Enum.TextYAlignment.Center
    textLabel.Parent = billboard
    
    -- Store in tracking tables
    activeESP[scrap] = billboard
    activeScraps[scrap] = true
    
    return billboard
end

-- Function to remove ESP for a scrap
local function removeScrapESP(scrap)
    if activeESP[scrap] then
        activeESP[scrap]:Destroy()
        activeESP[scrap] = nil
        activeScraps[scrap] = nil
    end
end

-- Main update function
local function update()
    -- Process existing scraps in the folder
    for _, scrap in ipairs(scrapsFolder:GetChildren()) do
        if scrap:IsA("BasePart") and not activeScraps[scrap] then
            createScrapESP(scrap)
        end
    end
    
    -- Check for scraps that need removal
    for scrap in pairs(activeScraps) do
        if not scrap:IsDescendantOf(workspace) or not scrap:IsDescendantOf(scrapsFolder) then
            removeScrapESP(scrap)
        end
    end
    
    -- Update distances for visible scraps
    local character = player.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    
    if rootPart then
        for scrap in pairs(activeScraps) do
            if activeESP[scrap] and activeESP[scrap].Parent then
                local distance = math.floor((rootPart.Position - scrap.Position).Magnitude)
                activeESP[scrap].ESPLabel.Text = string.format("Scrap (%d)", distance)
            end
        end
    end
end

-- Set up heartbeat loop
RunService.Heartbeat:Connect(update)

-- Initial scan
update()

-- Cleanup when player leaves
player.CharacterRemoving:Connect(function()
    for scrap in pairs(activeScraps) do
        removeScrapESP(scrap)
    end
end)

-- Handle folder changes
scrapsFolder.ChildAdded:Connect(function(child)
    if child:IsA("BasePart") and not activeScraps[child] then
        createScrapESP(child)
    end
end)

scrapsFolder.ChildRemoved:Connect(function(child)
    if activeScraps[child] then
        removeScrapESP(child)
    end
end)
   end,
})

local Main2Button = Main2Tab:CreateButton({
   Name = "ESP Kira",
   Callback = function()
   -- Kira ESP Script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local textSize = 14 -- Adjust text size here

local function createESP(character)
    -- Create Highlight
    local highlight = Instance.new("Highlight")
    highlight.Name = "KiraESP_Highlight"
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    highlight.FillColor = Color3.fromRGB(255, 50, 50)
    highlight.FillTransparency = 0.5
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = character

    -- Create ESP Text
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "KiraESP_Text"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.Adornee = character:WaitForChild("HumanoidRootPart")
    billboard.Parent = character

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "ESPInfo"
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0.5, 0, 0, 0)
    textLabel.AnchorPoint = Vector2.new(0.5, 0)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = textSize
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextYAlignment = Enum.TextYAlignment.Top
    textLabel.Parent = billboard

    return highlight, textLabel
end

local function main()
    local kira = workspace:FindFirstChild("Kira")
    if not kira then
        warn("Kira not found in workspace")
        return
    end

    local humanoid = kira:FindFirstChildOfClass("Humanoid")
    local rootPart = kira:FindFirstChild("HumanoidRootPart")
    
    if not (humanoid and rootPart) then
        warn("Kira missing humanoid or root part")
        return
    end

    local highlight, textLabel = createESP(kira)

    -- Update ESP in real-time
    RunService.Heartbeat:Connect(function()
        if not (kira and kira.Parent and humanoid and humanoid.Parent and rootPart and rootPart.Parent) then
            highlight:Destroy()
            textLabel.Parent:Destroy()
            return
        end

        -- Calculate distance
        local localRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        local distance = localRoot and (localRoot.Position - rootPart.Position).Magnitude or 0

        -- Update text
        textLabel.Text = string.format("Kira\n%.1f studs", distance)
    end)
end

-- Initialization
if not game:IsLoaded() then
    game.Loaded:Wait()
end

main()
   end,
})

local Main4Tab = Window:CreateTab("Teleport", nil) -- Title, Image
local Main4Section = Main4Tab:CreateSection("Part")

local Main4Button = Main4Tab:CreateButton({
   Name = "Workshop",
   Callback = function()
     local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(-257.286133, 62.0749893, 669.891846, 0.813478172, -1.28048372e-08, 0.58159548, 1.99865546e-08, 1, -5.93847416e-09, -0.58159548, 1.64549103e-08, 0.813478172)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    wait(0.1)
    pl.CFrame = location
   end,
})

local Main4Button = Main4Tab:CreateButton({
   Name = "PowerPoint",
   Callback = function()
     local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(445.675964, 18.25, 564.147949, -0.801124573, -3.98102458e-08, -0.598497629, 4.30014424e-09, 1, -7.22729609e-08, 0.598497629, -6.04732691e-08, -0.801124573)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    wait(0.1)
    pl.CFrame = location
   end,
})

local Main4Button = Main4Tab:CreateButton({
   Name = "Warehouse",
   Callback = function()
     local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(436.069641, 22.1289825, 182.937592, 0.959346414, 5.52487556e-10, -0.282231182, -4.41049242e-09, 1, -1.30343585e-08, 0.282231182, 1.37492444e-08, 0.959346414)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    wait(0.1)
    pl.CFrame = location
   end,
})

local Main5Tab = Window:CreateTab("Auto Farm", nil) -- Title, Image
local Main5Section = Main5Tab:CreateSection("Script")

local Main5Button = Main5Tab:CreateButton({
   Name = "Automatic Scraps (beta) ",
   Callback = function()
     local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local folder = workspace.Map.Interactable:FindFirstChild("Scraps")

if not folder then
    warn("Scraps folder not found!")
    return
end

local active = false
local debounce = false

-- Auto-collect function
local function collectScrap(scrap)
    firetouchinterest(player.Character.HumanoidRootPart, scrap, 0) -- Begin touch
    firetouchinterest(player.Character.HumanoidRootPart, scrap, 1) -- End touch
    print("Collected scrap:", scrap.Name)
end

-- Toggle with F5
UIS.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.F5 and not gameProcessed then
        active = not active
        print("Script", active and "STARTED" or "STOPPED")
    end
end)

while task.wait(1) do
    if active and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        -- Get valid scraps
        local scraps = {}
        for _, item in ipairs(folder:GetChildren()) do
            if item:IsA("BasePart") then
                table.insert(scraps, item)
            end
        end
        
        if #scraps > 0 and not debounce then
            debounce = true
            
            -- Select random scrap
            local randomScrap = scraps[math.random(#scraps)]
            
            -- Teleport to scrap
            player.Character.HumanoidRootPart.CFrame = randomScrap.CFrame * CFrame.new(0, 3, 0)
            
            -- Auto-collect
            task.wait(0.5) -- Wait for teleport to complete
            collectScrap(randomScrap)
            
            debounce = false
        end
    end
end

local Remote = game:GetService("ReplicatedStorage").AddNotif
firesignal(Remote.OnClientEvent, "Click F5 For Start")
   end,
})

local Main5Button = Main5Tab:CreateButton({
   Name = "Keyboard",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
   end,
})

local Main5Button = Main5Tab:CreateButton({
   Name = "Auto Frame (By Qorz Scripting)",
   Callback = function()
    --// Universal V1 GUI Script
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

--// Create the GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "UniversalV1"

-- Animated RGB Function
local function rgb()
    local counter = 0
    return function()
        counter = counter + 1
        return Color3.fromHSV((counter % 360) / 360, 1, 1)
    end
end

local getColor = rgb()

-- Main Frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

-- Top Label
local TitleLabel = Instance.new("TextLabel", MainFrame)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Universal V1"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 20

-- Open/Close Button
local OpenCloseButton = Instance.new("TextButton", ScreenGui)
OpenCloseButton.Size = UDim2.new(0, 100, 0, 30)
OpenCloseButton.Position = UDim2.new(0.5, -50, 0.9, 0)
OpenCloseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenCloseButton.Text = "Close"
OpenCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenCloseButton.Font = Enum.Font.SourceSansBold
OpenCloseButton.TextSize = 14

-- Loop Fullbright Button
local FullbrightButton = Instance.new("TextButton", MainFrame)
FullbrightButton.Size = UDim2.new(0.8, 0, 0.2, 0)
FullbrightButton.Position = UDim2.new(0.1, 0, 0.2, 0)
FullbrightButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FullbrightButton.Text = "Loop Fullbright"
FullbrightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FullbrightButton.Font = Enum.Font.SourceSansBold
FullbrightButton.TextSize = 14

-- Auto Farm Button
local AutoFarmButton = Instance.new("TextButton", MainFrame)
AutoFarmButton.Size = UDim2.new(0.8, 0, 0.2, 0)
AutoFarmButton.Position = UDim2.new(0.1, 0, 0.45, 0)
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AutoFarmButton.Text = "Auto Farm"
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.Font = Enum.Font.SourceSansBold
AutoFarmButton.TextSize = 14

-- Infinite Jump Button
local InfiniteJumpButton = Instance.new("TextButton", MainFrame)
InfiniteJumpButton.Size = UDim2.new(0.8, 0, 0.2, 0)
InfiniteJumpButton.Position = UDim2.new(0.1, 0, 0.7, 0)
InfiniteJumpButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InfiniteJumpButton.Text = "Infinite Jump"
InfiniteJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteJumpButton.Font = Enum.Font.SourceSansBold
InfiniteJumpButton.TextSize = 14

-- Functions
-- Loop Fullbright
local isFullbright = false
FullbrightButton.MouseButton1Click:Connect(function()
    isFullbright = not isFullbright
    FullbrightButton.Text = isFullbright and "Disable Fullbright" or "Loop Fullbright"

    if isFullbright then
        RunService:BindToRenderStep("Fullbright", Enum.RenderPriority.Last.Value, function()
            game.Lighting.Ambient = Color3.new(1, 1, 1)
            game.Lighting.Brightness = 2
        end)
    else
        RunService:UnbindFromRenderStep("Fullbright")
        game.Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
        game.Lighting.Brightness = 1
    end
end)

-- Auto Farm
local isAutoFarming = false
local previousPosition = nil
AutoFarmButton.MouseButton1Click:Connect(function()
    isAutoFarming = not isAutoFarming
    AutoFarmButton.Text = isAutoFarming and "Disable Auto Farm" or "Auto Farm"

    if isAutoFarming then
        -- Save the player's current position
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            previousPosition = character.HumanoidRootPart.Position
            -- Continuously keep the player 50 studs in the sky
            RunService:BindToRenderStep("AutoFarm", Enum.RenderPriority.Character.Value, function()
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.Velocity = Vector3.zero -- Stop falling
                    character.HumanoidRootPart.CFrame = CFrame.new(previousPosition + Vector3.new(0, 50, 0))
                end
            end)
        end
    else
        -- Stop Auto Farming and teleport the player back to their original position
        RunService:UnbindFromRenderStep("AutoFarm")
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") and previousPosition then
            character.HumanoidRootPart.CFrame = CFrame.new(previousPosition)
        end
        previousPosition = nil
    end
end)

-- Infinite Jump
local isInfiniteJump = false
InfiniteJumpButton.MouseButton1Click:Connect(function()
    isInfiniteJump = not isInfiniteJump
    InfiniteJumpButton.Text = isInfiniteJump and "Disable Infinite Jump" or "Infinite Jump"

    if isInfiniteJump then
        UserInputService.JumpRequest:Connect(function()
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end
end)

-- Open/Close GUI
local isOpen = true
OpenCloseButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    MainFrame.Visible = isOpen
    OpenCloseButton.Text = isOpen and "Close" or "Open"
end)

-- RGB Animation
RunService.RenderStepped:Connect(function()
    MainFrame.BorderColor3 = getColor()
    FullbrightButton.BackgroundColor3 = getColor()
    AutoFarmButton.BackgroundColor3 = getColor()
    InfiniteJumpButton.BackgroundColor3 = getColor()
    OpenCloseButton.BackgroundColor3 = getColor()
end)
   end,
})

local Main3Tab = Window:CreateTab("More", nil) -- Title, Image
local Main3Section = Main3Tab:CreateSection("Script")

local Main3Button = Main3Tab:CreateButton({
   Name = "infinite yield",
   Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})
