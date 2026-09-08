local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
 
 local Window = Rayfield:CreateWindow({
     Name = "Sprout Testing",
     Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
     LoadingTitle = "Loading...",
     LoadingSubtitle = "by isssacque1234",
     Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
  
     DisableRayfieldPrompts = false,
     DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
  
     ConfigurationSaving = {
        Enabled = true,
        FolderName = skibidi, -- Create a custom folder for your hub/game
        FileName = "skibidi script"
     },
 
  
     KeySystem = true, -- Set this to true to use our key system
     KeySettings = {
        Title = "Key",
        Subtitle = "Key System",
        Note = "https://discord.gg/c4Ctp35FHm", -- Use this to tell the user how to get a key
        FileName = "skibidi key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = {"Key_1010", "Key_9990"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
     }
  }) 
 
 
 
  local mainTab = Window:CreateTab("Main", "crosshair")
 
  local Section = mainTab:CreateSection("Main Settings")
 
 
 local Toggle = mainTab:CreateToggle({
    Name = "Auto Heal all; use normal sprout",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        getgenv().autoHealEnabled = Value

        if Value then
            task.spawn(function()
                while getgenv().autoHealEnabled do
                    for _, player in ipairs(game.Players:GetPlayers()) do
                        if player.Character then
                            local args = {
                                [1] = player.Character:WaitForChild("HumanoidRootPart")
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("HealAbility"):FireServer(unpack(args))
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            getgenv().autoHealEnabled = false
        end
    end
})


local Toggle = mainTab:CreateToggle({
    Name = "Crash the server; use normal sprout",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(Value)
        getgenv().autoHealEnabled = Value

        if Value then
            task.spawn(function()
                while getgenv().autoHealEnabled do
                    for _, player in ipairs(game.Players:GetPlayers()) do
                        if player.Character then
                            local args = {
                                [1] = player.Character:WaitForChild("HumanoidRootPart")
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("HealAbility"):FireServer(unpack(args))
                        end
                    end
                    task.wait(0.01)
                end
            end)
        else
            getgenv().autoHealEnabled = false
        end
    end
})
 
 
  Rayfield:Notify({
     Title = "Script by isssacque1234",
     Content = "loaded",
     Duration = 6.5,
     Image = 4483362458,
  })
