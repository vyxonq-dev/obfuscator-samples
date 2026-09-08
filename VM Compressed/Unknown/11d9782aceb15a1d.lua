--bro why see here???

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Brainrot Battlegrounds | Script",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "You Are Nigga",
   LoadingSubtitle = "By ScriptTrol",
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

local MainTab = Window:CreateTab("Main", "Home")
local Section = MainTab:CreateSection("Op")

local Button = MainTab:CreateButton({
   Name = "inf Awaken (Gui)",
   Callback = function()
   -- LocalScript in StarterPlayerScripts
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer.PlayerGui
ScreenGui.Name = "AwakenGUI"
ScreenGui.ResetOnSpawn = false -- GUI persists across respawns

-- Main Frame (smaller size, draggable)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 250)
Frame.Position = UDim2.new(0.5, -100, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Toggle Button (to show/hide the main frame)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 30, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ToggleButton.Text = ">"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Text = "Awaken Selector"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Frame

-- Player Selection
local PlayerLabel = Instance.new("TextLabel")
PlayerLabel.Size = UDim2.new(1, -10, 0, 20)
PlayerLabel.Position = UDim2.new(0, 5, 0, 40)
PlayerLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
PlayerLabel.Text = "Select Player"
PlayerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerLabel.TextScaled = true
PlayerLabel.Parent = Frame

local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Size = UDim2.new(1, -10, 0, 60)
PlayerScroll.Position = UDim2.new(0, 5, 0, 70)
PlayerScroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PlayerScroll.BorderSizePixel = 0
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScroll.Parent = Frame

-- Character Selection
local CharacterLabel = Instance.new("TextLabel")
CharacterLabel.Size = UDim2.new(1, -10, 0, 20)
CharacterLabel.Position = UDim2.new(0, 5, 0, 140)
CharacterLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
CharacterLabel.Text = "Select Character"
CharacterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CharacterLabel.TextScaled = true
CharacterLabel.Parent = Frame

local CharacterScroll = Instance.new("ScrollingFrame")
CharacterScroll.Size = UDim2.new(1, -10, 0, 60)
CharacterScroll.Position = UDim2.new(0, 5, 0, 170)
CharacterScroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CharacterScroll.BorderSizePixel = 0
CharacterScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
CharacterScroll.Parent = Frame

-- Execute Button
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Size = UDim2.new(1, -10, 0, 30)
ExecuteButton.Position = UDim2.new(0, 5, 0, 215)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
ExecuteButton.Text = "Awaken"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextScaled = true
ExecuteButton.Font = Enum.Font.SourceSansBold
ExecuteButton.Parent = Frame

-- Character List
local Characters = {
    "Cameraman",
    "Titan Cameraman",
    "Thanos",
    "Gumball",
    "Skibi Warrior",
    "Wild Nugget",
    "Egor",
    "Sneaky King",
    "Tung",
    "Player 456",
    "Imposter",
    "Huggy",
    "Host Kis",
    "Grimace",
    "Wally",
    "Grug",
    "Caseoh",
    "Digital Clown"
}

-- Variables to store selections
local SelectedPlayer = nil
local SelectedCharacter = nil
local isGuiVisible = true

-- Toggle GUI visibility
ToggleButton.MouseButton1Click:Connect(function()
    isGuiVisible = not isGuiVisible
    Frame.Visible = isGuiVisible
    ToggleButton.Text = isGuiVisible and ">" or "<"
end)

-- Function to update player list
local function UpdatePlayerList()
    for _, v in pairs(PlayerScroll:GetChildren()) do
        if v:IsA("TextButton") then
            v:Destroy()
        end
    end
    local yOffset = 5
    for _, player in pairs(Players:GetPlayers()) do
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, -5, 0, 20)
        Button.Position = UDim2.new(0, 2, 0, yOffset)
        Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Button.Text = player.Name
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextScaled = true
        Button.Parent = PlayerScroll
        Button.MouseButton1Click:Connect(function()
            SelectedPlayer = player.Name
            PlayerLabel.Text = "Player: " .. player.Name
        end)
        yOffset = yOffset + 25
    end
    PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

-- Function to populate character list
local function UpdateCharacterList()
    local yOffset = 5
    for _, char in pairs(Characters) do
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, -5, 0, 20)
        Button.Position = UDim2.new(0, 2, 0, yOffset)
        Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Button.Text = char
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextScaled = true
        Button.Parent = CharacterScroll
        Button.MouseButton1Click:Connect(function()
            SelectedCharacter = char
            CharacterLabel.Text = "Char: " .. char
        end)
        yOffset = yOffset + 25
    end
    CharacterScroll.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

-- Execute Button Functionality with FireServer and detailed error handling
ExecuteButton.MouseButton1Click:Connect(function()
    if not SelectedPlayer or not SelectedCharacter then
        ExecuteButton.Text = "Select Both!"
        wait(1)
        ExecuteButton.Text = "Awaken"
        return
    end

    local awakenString = SelectedCharacter .. " Awaken"
    local success, err = pcall(function()
        -- Check if workspace.Alive exists
        if not workspace:FindFirstChild("Alive") then
            error("workspace.Alive does not exist")
        end

        -- Check if player instance exists in Alive
        local playerFolder = workspace.Alive:FindFirstChild(SelectedPlayer)
        if not playerFolder then
            error("Player '" .. SelectedPlayer .. "' not found in workspace.Alive")
        end

        -- Check if CharacterHandler exists
        local characterHandler = playerFolder:FindFirstChild("CharacterHandler")
        if not characterHandler then
            error("CharacterHandler not found for player '" .. SelectedPlayer .. "'")
        end

        -- Check if Requests exists
        local requests = characterHandler:FindFirstChild("Requests")
        if not requests then
            error("Requests not found in CharacterHandler for player '" .. SelectedPlayer .. "'")
        end

        -- Check if awakenString exists in Requests
        local awakenEvent = requests:FindFirstChild(awakenString)
        if not awakenEvent then
            error("Event '" .. awakenString .. "' not found in Requests")
        end

        -- Check if awakenEvent is a RemoteEvent
        if not awakenEvent:IsA("RemoteEvent") then
            error("'" .. awakenString .. "' is not a RemoteEvent")
        end

        -- Fire the RemoteEvent to the server
        awakenEvent:FireServer()
    end)

    if success then
        ExecuteButton.Text = "Success!"
        wait(1)
        ExecuteButton.Text = "Awaken"
    else
        ExecuteButton.Text = "Error!"
        warn("Error executing awaken: " .. tostring(err))
        wait(1)
        ExecuteButton.Text = "Awaken"
    end
end)

-- Update player list on player join/leave
Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)

-- Initial population
UpdatePlayerList()
UpdateCharacterList()
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "inf money",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        _G.auto = Value  -- Set the global variable directly
        
        if _G.auto then
            coroutine.wrap(function()
                while _G.auto do  -- Will break automatically when _G.auto becomes false
                    game:GetService("ReplicatedStorage").Requests.BuyEventThing:FireServer(table.unpack({
                        [1] = "Cash",
                        [2] = 0,
                    }))
                    task.wait()
                end
            end)()
        end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Be Titan Cameraman",
   Callback = function()
   game:GetService("ReplicatedStorage").Requests.Picked:FireServer("Titan Cameraman")
   end,
})

local Button = MainTab:CreateButton({
   Name = "Be Thanos",
   Callback = function()
   game:GetService("ReplicatedStorage").Requests.Picked:FireServer("Thanos")
   end,
})

local Button = MainTab:CreateButton({
   Name = "Be Egor",
   Callback = function()
   game:GetService("ReplicatedStorage").Requests.Picked:FireServer("Egor")
   end,
})

local Button = MainTab:CreateButton({
   Name = "Be Sneaky King",
   Callback = function()
   game:GetService("ReplicatedStorage").Requests.Picked:FireServer("Sneaky King")
   end,
})

local Button = MainTab:CreateButton({
   Name = "No Stun (By vincent009)",
   Callback = function()
   --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--add us on roblox vincentplayz9356
local player = game:GetService("Players").LocalPlayer

local function setupCharacter(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Sit = false
    
    local connections = {}
    
    local function handleBadState(newState)
        if newState == Enum.HumanoidStateType.Ragdoll or 
           newState == Enum.HumanoidStateType.FallingDown or 
           newState == Enum.HumanoidStateType.PlatformStanding or
           newState == Enum.HumanoidStateType.Seated then
            humanoid.Sit = false
            humanoid.PlatformStand = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            if character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.Anchored = false
            end
            return true
        end
        return false
    end
    
    handleBadState(humanoid:GetState())
    
    table.insert(connections, humanoid.StateChanged:Connect(function(_, newState)
        handleBadState(newState)
    end))
    
    for _, seat in pairs(workspace:GetDescendants()) do
        if seat:IsA("Seat") then
            table.insert(connections, seat:GetPropertyChangedSignal("Occupant"):Connect(function()
                if seat.Occupant == humanoid then
                    task.wait(0.1)
                    humanoid.Sit = false
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end))
        end
    end
    
    table.insert(connections, humanoid.Died:Connect(function()
        for _, conn in ipairs(connections) do
            conn:Disconnect()
        end
    end))
end

if player.Character then
    setupCharacter(player.Character)
end

player.CharacterAdded:Connect(setupCharacter)
   end,
})
