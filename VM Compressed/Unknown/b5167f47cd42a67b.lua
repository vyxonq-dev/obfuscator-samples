if game.PlaceId == 11938746175 then

    local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
    local workspace = game:GetService("Workspace")
    local player = game.Players.LocalPlayer
    local adminium = workspace:FindFirstChild("Adminium")
    local Players = game:GetService("Players")
    local StarterGui_upvr = game:GetService("StarterGui")
    local TweenService_upvr = game:GetService("TweenService")
    
    workspace:SetAttribute("MineSpeed", 0.1)
    
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    wait(3)
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local MessageFrame = PlayerGui:FindFirstChild("Gui") and PlayerGui.Gui:FindFirstChild("MessageFrame")
    
    if not MessageFrame then
        warn("oof!")
        return
    end
    
    local MessageClient = MessageFrame:FindFirstChild("MessageClient")
    local AnimateModule_upvr = require(MessageClient:FindFirstChild("AnimateModule"))
    
    if StarterGui_upvr:GetAttribute("AdminTutorial") then
        MessageFrame.Visible = true
        local music = MessageClient:FindFirstChild("Music")
    
        if music then
            music:Play()
            local musicTween = TweenService_upvr:Create(music, TweenInfo.new(1), { Volume = 0.5 })
            musicTween:Play()
        else
            warn("idk!")
        end
    
        AnimateModule_upvr:TransparencyTween(MessageFrame, 0)
        task.wait(1)
    
        local textLabel = game:GetService("Players").LocalPlayer.PlayerGui.Gui.MessageFrame:FindFirstChild("TextLabel")
        if textLabel then
            AnimateModule_upvr:TextTransparencyTween(textLabel)
            AnimateModule_upvr:TypeWrite(
                textLabel,
                "<stroke color='#181824' joins='miter' thickness='3'>Hello, <font color='rgb(200, 200, 255)'>@" ..
                tostring(LocalPlayer.Name) .. "</font>.</stroke>",
                0.05
            )
    
            task.wait(2)
    
            AnimateModule_upvr:TextTransparencyTween(textLabel)
            AnimateModule_upvr:TypeWrite(
                textLabel,
                "<stroke color='#181824' joins='miter' thickness='3' >Thanks For Execute Script <font color='rgb(130, 130, 198)'>'Elected Admin'</font> lol \n\n This my first script, <font color='rgb(200, 200, 255)'>Thanks Again </font>XD</stroke>",
                0.025
            )
        else
            warn("nope!")
        end
    
        task.wait(3.9)
    
        AnimateModule_upvr:TransparencyTween(MessageFrame, 1)
    
        if music then
            local fadeOutTween = TweenService_upvr:Create(music, TweenInfo.new(1), { Volume = 0 })
            fadeOutTween:Play()
            fadeOutTween.Completed:Wait()
            music:Stop()
        end
    
        MessageFrame.Visible = false
    end
    
    
    local Window = Rayfield:CreateWindow({
        Name = "Elected Admin | System Hub",
        Icon = 0, 
        LoadingTitle = "Welcome...",
        LoadingSubtitle = "by Andrey",
        Theme = "DarkBlue", 
        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false, 
        ConfigurationSaving = {
           Enabled = true,
           FileName = "Andrey Hub"
        },
        Discord = {
           Enabled = true, 
           Invite = "HtucSVyKFH",
           RememberJoins = true 
        },
        KeySystem = false,
        KeySettings = {
            Title = "Elected Admin | Key System",
            Subtitle = "Key System",
            Note = "Join to Discord Server discord.gg/HtucSVyKFH", -- Use this to tell the user how to get a key
            FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
            SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
            GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
            Key = {"FirstScript120"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }}
    )
    
    local Tab = Window:CreateTab("Auto", 4483362458) -- Title, Image
    local Tabs = Window:CreateTab("Funny", 4483362458) -- Title, Image
    local Tabss = Window:CreateTab("Others", 4483362458) -- Title, Image
    local isMining = false 
    
    local Toggle = Tab:CreateToggle({
        Name = "Auto Mining (AFK)",
        CurrentValue = false,
        Flag = "Toggle1", 
        Callback = function(Value)
            isMining = Value 
    
            if isMining then
                local targetPosition = Vector3.new(-3.47625732, 3.31440401, 0.270684868)
                local targetOrientation = CFrame.new(targetPosition, 
                    targetPosition + Vector3.new(-0.124756418, 0.0027975454, -0.992183447))
    
                local function teleportPlayer()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        wait(0.35)
                        player.Character:SetPrimaryPartCFrame(targetOrientation)
                    end
                end
    
                Rayfield:Notify({
                    Title = "Warning",
                    Content = "Auto Mining (AFK) in testing, and may not work correctly",
                    Duration = 6.5,
                    Image = 4483362458,
                })
    
                local isPlayerDead = false
    
                player.CharacterAdded:Connect(function(char)
                    local humanoid = char:WaitForChild("Humanoid")
                    humanoid.Died:Connect(function()
                        isPlayerDead = true
                    end)
                end)
    
                while isMining do
                    if isPlayerDead then
                        repeat
                            task.wait(3)
                        until player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        isPlayerDead = false
                    end
    
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        teleportPlayer()
                        local mineSpeed = workspace:GetAttribute("MineSpeed") or 0.1
                        ReplicatedStorage_upvr.Remotes.MineEvent:FireServer()
                        ReplicatedStorage_upvr.Remotes.AdminiumMined:Fire()
                        task.wait(mineSpeed)
                    else
                        task.wait(1)
                    end
                end
            end
        end,
    })
    
    local isUpgrade = false
    
    local Toggle = Tab:CreateToggle({
       Name = "Auto Upgrade",
       CurrentValue = false,
       Flag = "Toggle1",
       Callback = function(Value)
        isUpgrade = Value
    
           if isUpgrade then
               while isUpgrade do
                wait(0.5)
                   ReplicatedStorage_upvr.Remotes.UpgradeEvent:FireServer()
    
               end
           end
       end,
    })
    
    local Button = Tabs:CreateButton({
        Name = "Fake Popup Admin",
        Callback = function()
            local player = game.Players.LocalPlayer
            local PlayerGui = player:FindFirstChild("PlayerGui")
            if not PlayerGui then
                warn("Error!")
                return
            end
    
            local MessageFrame = PlayerGui:FindFirstChild("Gui") and PlayerGui.Gui:FindFirstChild("MessageFrame")
            if not MessageFrame then
                warn("Error 2!")
                return
            end
    
            local MessageClient = MessageFrame:FindFirstChild("MessageClient")
            local AnimateModule_upvr = MessageClient and require(MessageClient:FindFirstChild("AnimateModule"))
            if not AnimateModule_upvr then
                warn("Error 3")
                return
            end
    
            if StarterGui_upvr:GetAttribute("AdminTutorial") then
                MessageFrame.Visible = true
    
                local music = MessageClient:FindFirstChild("Music")
                if music then
                    music:Play()
                    local musicTween = TweenService_upvr:Create(music, TweenInfo.new(1), { Volume = 0.5 })
                    musicTween:Play()
                else
                    warn("Error 4")
                end
            
                AnimateModule_upvr:TransparencyTween(MessageFrame, 0)
                task.wait(1)
                
                local textLabel = MessageFrame:FindFirstChild("TextLabel")
                if textLabel then
                    AnimateModule_upvr:TextTransparencyTween(textLabel)
                    AnimateModule_upvr:TypeWrite(
                        textLabel,
                        "<stroke color='#181824' joins='miter' thickness='3'>Congratulations, <font color='rgb(200, 200, 255)'>@" ..
                        tostring(player.Name) .. "</font>.</stroke>",
                        0.05
                    )
                
                    task.wait(2)
                
                    AnimateModule_upvr:TextTransparencyTween(textLabel)
                    AnimateModule_upvr:TypeWrite(
                        textLabel,
                        "<stroke color='#181824' joins='miter' thickness='3' >You got <font color='rgb(130, 130, 198)'>'admin'</font> lol \n\n try using the <font color='rgb(200, 200, 255)'>';help'</font> command or something</stroke>",
                        0.025
                    )
                else
                    warn("Error 5")
                end
            
                task.wait(3.9)
            
    
                AnimateModule_upvr:TransparencyTween(MessageFrame, 1)
                
                if music then
                    local fadeOutTween = TweenService_upvr:Create(music, TweenInfo.new(1), { Volume = 0 })
                    fadeOutTween:Play()
                    fadeOutTween.Completed:Wait()
                    music:Stop()
                end
            
                MessageFrame.Visible = false
            end        
        end,
    })
    
    local Button = Tabs:CreateButton({
        Name = "Teleport to 700 Year ago map",
        Callback = function()
            game.ReplicatedStorage.Remotes.ServersEvent:FireServer("", 15226689528)
        end,
     })
    
    local Button = Tabs:CreateButton({
        Name = "Teleport to hallowen map",
        Callback = function()
            game.ReplicatedStorage.Remotes.ServersEvent:FireServer("", 82631899380415)
        end,
     })
    
     local Button = Tabs:CreateButton({
        Name = "Teleport to Mar (In Space) ",
        Callback = function()
           local player = game.Players.LocalPlayer
           local character = player.Character or player.CharacterAdded:Wait()
           if character then
              character:SetPrimaryPartCFrame(CFrame.new(-15425.5186, 30002.3125, -6022.82861, 
                 0.309293032, -3.00018996e-08, -0.950966775, 
                 8.47761361e-10, 1, -3.12731139e-08, 
                 0.950966775, 8.86636364e-09, 0.309293032))
           end
        end,
     })
    
     local Button = Tabs:CreateButton({
        Name = "Teleport to Moon (In Space)",
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
    
            if character then
                local newCFrame = CFrame.new(
                    15252.7266, 20126.2578, 5869.2627,
                    0.999961436, -7.14466805e-05, 0.00877863541,
                    -1.85425519e-09, 0.99996686, 0.00813864078,
                    -0.00877892599, -0.00813832693, 0.999928296
                )
                character:SetPrimaryPartCFrame(newCFrame)
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Teleport to Moon Not working...",
                    Duration = 6.5,
                    Image = 4483362458,
                 })
            end
        end,
    })
    
    local Button = Tabs:CreateButton({
        Name = "Teleport to Spawn",
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
            local position = Vector3.new(21.791317, 2.3144083, 0.637120187)
            local orientation = Vector3.new(-0.0224121027, -0.000665124273, 0.999748588)
    
            humanoidRootPart.CFrame = CFrame.new(position, position + orientation)
        end,
    })
    
    local Toggle = Tabss:CreateToggle({
        Name = "Anti Jail",
        CurrentValue = false,
        Flag = "Toggle1", 
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local isRunning = Value 
    
            if Value then
                task.spawn(function()
                    while isRunning do
                        task.wait(0.1)  
    
                        local adminObjects = workspace:FindFirstChild("AdminObjects")
                        if adminObjects then
                            local jailObject = adminObjects:FindFirstChild(player.Name .. "Jail")
                            if jailObject then
                                jailObject:Destroy()  
                                print("Deleted: " .. jailObject.Name)
                            end
                        end
                    end
                end)
            else
                isRunning = false
            end
        end,
    })
    
    
    local Toggle_AntiFling = Tabss:CreateToggle({
        Name = "Anti Fling",
        CurrentValue = false,
        Flag = "Toggle_AntiFling", 
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local position = Vector3.new(21.791317, 2.3144083, 0.637120187) 
            local orientation = Vector3.new(-0.0224121027, -0.000665124273, 0.999748588)
    
            if Value then
                task.spawn(function()
                    while Value do
                        task.wait(0.1)
    
                        local character = player.Character
                        if character then
                            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                            local humanoid = character:FindFirstChildOfClass("Humanoid")
    
                            if humanoidRootPart and humanoid then
                                if humanoidRootPart.Velocity.Magnitude > 100 then
                                    print("finded")
    
                                    humanoid.Sit = false
    
                                    humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                    humanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
    
                                    humanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(orientation.X), math.rad(orientation.Y), math.rad(orientation.Z))
                                end
                            end
                        end
                    end
                end)
            end
        end,
    })
end
else
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Error | System Hub",
    Icon = 0,
    LoadingTitle = "Welcome...",
    LoadingSubtitle = "by Andrey",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "System Hub | Script 2"
    },
    Discord = {
        Enabled = true,
        Invite = "HtucSVyKFH",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "PS99 | Key System",
        Subtitle = "Key System",
        Note = "Join to Discord Server discord.gg/HtucSVyKFH",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"grgscript5"}
    }
})

local Tab = Window:CreateTab("Why?", "rewind")
local Label = Tab:CreateLabel("Not Supported For This Game", "rewind")
