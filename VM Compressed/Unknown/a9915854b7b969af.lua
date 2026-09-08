if game.PlaceId == 13127800756 or true then
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
       Name = "🌀 Khaos Hub | Arm Wrestle Simulator",
       LoadingTitle = "Initializing Khaos System...",
       LoadingSubtitle = "by Khaos",
       ConfigurationSaving = {
          Enabled = true,
          Folder = "KhaosHubConfig", -- The name of the folder where configs are saved
          FileName = "KhaosHub"
       },
       Discord = {
          Enabled = false,
          Invite = "EsvfHZACs9", 
          RememberJoins = true 
       },
       KeySystem = false,
       -- CREATIVE CONTROL: Custom Theme Styling
       Theme = "Ocean", -- Using a clean, high-contrast theme
    })

    -- A cool intro notification
    Rayfield:Notify({
       Title = "Khaos Hub Online",
       Content = "Visual Systems Loaded",
       Duration = 5,
       Image = 4483362458,
    })

    ---------------------------------------------------------
    -- AUTO FARM TAB
    ---------------------------------------------------------
    local FarmTab = Window:CreateTab("⚡ Auto Farm", 4483362458) 
    
    local AutoClickActive = false 
    local AutoRebirthActive = false
    local AutoSuperActive = false
    
    FarmTab:CreateSection("— Training Systems —")

    FarmTab:CreateToggle({
       Name = "Enable Auto Clicker",
       CurrentValue = false,
       Flag = "AutoClickToggle", 
       Callback = function(Value)
           AutoClickActive = Value
           if AutoClickActive then
               task.spawn(function()
                   local clickRemote = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RE"):WaitForChild("onClick")
                   while AutoClickActive do
                       clickRemote:FireServer()
                       task.wait(0.01) 
                   end
               end)
           end
       end,
    })

    FarmTab:CreateSection("— Progression Systems —")

    FarmTab:CreateToggle({
       Name = "Infinite Auto Rebirth",
       CurrentValue = false,
       Flag = "AutoRebirth", 
       Callback = function(Value)
           AutoRebirthActive = Value
           if AutoRebirthActive then
               task.spawn(function()
                   while AutoRebirthActive do
                       game:GetService("ReplicatedStorage").Packages.Knit.Services.RebirthService.RE.onRebirthRequest:FireServer()
                       task.wait(3) 
                   end
               end)
           end
       end,
    })

    FarmTab:CreateToggle({
       Name = "Infinite Super Rebirth",
       CurrentValue = false,
       Flag = "AutoSuperRebirth", 
       Callback = function(Value)
           AutoSuperActive = Value
           if AutoSuperActive then
               task.spawn(function()
                   while AutoSuperActive do
                       game:GetService("ReplicatedStorage").Packages.Knit.Services.RebirthService.RE.onSuperRebirth:FireServer()
                       task.wait(3)
                   end
               end)
           end
       end,
    })

    ---------------------------------------------------------
    -- TELEPORT TAB
    ---------------------------------------------------------
    local TeleportTab = Window:CreateTab("🌐 World Warp", 4483362458)

    TeleportTab:CreateSection("— Dimensional Travel —")

    local ZoneMapping = {
        ["Garden"] = "Garden",
        ["World 1"] = "1",
        ["World 2"] = "2",
        ["World 3"] = "3",
        ["World 4"] = "4",
        ["World 5"] = "5",
        ["World 6"] = "6"
    }

    local SelectedAreaName = "Garden" 

    TeleportTab:CreateDropdown({
       Name = "Select Destination",
       Options = {"Garden", "World 1", "World 2", "World 3", "World 4", "World 5", "World 6"}, 
       CurrentOption = {"Garden"},
       MultipleOptions = false,
       Flag = "AreaDropdown",
       Callback = function(Options)
           SelectedAreaName = Options[1]
       end,
    })

    TeleportTab:CreateButton({
       Name = "Initiate Teleport",
       Callback = function()
           local folderName = ZoneMapping[SelectedAreaName]
           local zoneFolder = workspace.Zones:FindFirstChild(folderName)
           local TeleportRemote = game:GetService("ReplicatedStorage").Packages.Knit.Services.ZoneService.RE.teleport
           
           if zoneFolder then
               local interactables = zoneFolder:FindFirstChild("Interactables")
               local spawnPart = nil
               
               if interactables then
                   pcall(function()
                       spawnPart = interactables.Teleports.Locations:FindFirstChild("Spawn")
                   end)
               end

               if spawnPart then
                   TeleportRemote:FireServer(spawnPart)
               else
                   TeleportRemote:FireServer(zoneFolder)
               end
           else
               Rayfield:Notify({
                   Title = "Transmission Error",
                   Content = "Destination " .. SelectedAreaName .. " is offline!",
                   Duration = 3
               })
           end
       end,
    })

else
    warn("Khaos Hub: Invalid Game Identity.")
end