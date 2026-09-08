local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local Window = Rayfield:CreateWindow({
   Name = "Death in the Box - TexRBLX",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Death in the Box",
   LoadingSubtitle = "by TexRBLX",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "TexRBLX DITB"
   },
   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
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
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local brightLoop

local function sendNotification(title, content, duration, image)
    imageFinal = image or 4483362458
    Rayfield:Notify({Title = title, Content = content, Duration = duration, Image = imageFinal})
end

local function brightnessLoop()
    if brightLoop then
        brightLoop:Disconnect()
    end
    local function brightFunc()
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end

    brightLoop = RunService.RenderStepped:Connect(brightFunc)
end

local alivePlayers = {} -- Table to track alive players
local selectedPlayer = nil -- Holds the currently selected player from the dropdown

-- Function to get and update the list of all players
local function getAllPlayers()
    local dropdownOptions = {}

    for _, player in ipairs(Players:GetPlayers()) do
        local playerModel = workspace:FindFirstChild(player.Name)
        if playerModel then
            local humanoid = playerModel:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local playerStatus = player.Name
                if humanoid.Health <= 0 then
                    playerStatus = player.Name .. " - Dead"
                end
                table.insert(dropdownOptions, playerStatus)
            end
        end
    end

    return dropdownOptions
end

-- Create the dropdown with all players
local dropdownOptions = getAllPlayers()

-- Create the dropdown UI only after gathering all players
local Dropdown = Tab:CreateDropdown({
    Name = "Players",
    Options = dropdownOptions, -- Populate with the complete list
    CurrentOption = {},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
        selectedPlayer = Options[1] -- Update the selected player
    end,
})

-- edge case
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            -- Update the dropdown when health changes
            Dropdown:Set(getAllPlayers())
        end)
    end)
end)

Players.PlayerRemoving:Connect(function()
    -- Update dropdown options when a player leaves
    Dropdown:Set(getAllPlayers())
end)

-- Periodically update the dropdown every 5 seconds
task.spawn(function()
    while true do
        Dropdown:Set(getAllPlayers()) -- Refresh the dropdown options every 5 seconds
        task.wait(5)
    end
end)

local fullbrightToggle = Tab:CreateToggle({
    Name = "See in dark (fullbright)",
    CurrentValue = false,
    Flag = "FullbrightToggle", -- Unique flag for saving the toggle state
    Callback = function(Value)
        if Value then
            brightnessLoop()
        else
            if brightLoop then
                brightLoop:Disconnect()
            end
        end
    end,
})

-- Button UI
local Button = Tab:CreateButton({
    Name = "Check Cards",
    Callback = function()
        if selectedPlayer then
            local playerModel = workspace:FindFirstChild(selectedPlayer)
            if playerModel then
                -- Check if the player is dead
                local humanoid = playerModel:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Health <= 0 then
                    -- Notify if player is dead
                    sendNotification("Player Status", string.format("%s is dead.", selectedPlayer), 5, "alert-triangle")
                    return
                end

                -- Check for Cards folder
                local cardsFolder = playerModel:FindFirstChild("Cards")
                if cardsFolder and cardsFolder:IsA("Folder") then
                    print("Folders in " .. selectedPlayer .. "'s Cards:")
					sendNotification("Cards", string.format("Folders in %s's cards: ", selectedPlayer), 5, "alert-triangle")
                    for _, folder in ipairs(cardsFolder:GetChildren()) do
                        if folder:IsA("Folder") then
                            print(folder.Name)
							sendNotification("Cards", string.format("%s", folder.Name), 5, "alert-triangle")
                        end
                    end
                else
                    -- Notify if Cards folder is missing
                    sendNotification("Missing Cards Folder", selectedPlayer .. " does not have a Cards folder.", 5, "alert-triangle")
                end
            else
                print("Player model for " .. selectedPlayer .. " not found in Workspace.")
            end
        else
            print("No player selected in the dropdown.")
        end
    end,
})
