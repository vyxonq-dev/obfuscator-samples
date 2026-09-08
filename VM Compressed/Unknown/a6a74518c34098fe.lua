--game https://www.roblox.com/games/132073733865215/2
Rayfield=loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Window=Rayfield:CreateWindow({
   Name="Simulator dodepa 2(beta)",
   Icon=0,
   LoadingTitle="Dep",
   LoadingSubtitle="Rayfield lib",
   ShowText="Rayfield",
   Theme="Serenity",

   ToggleUIKeybind="K",

   DisableRayfieldPrompts=false,
   DisableBuildWarnings=false,

   ConfigurationSaving={
      Enabled=false,
      FolderName=nil,
      FileName="Big Hub"
   },

   Discord={
      Enabled=false,
      Invite="noinvitelink",
      RememberJoins=true
   },

   KeySystem=false,
   KeySettings={
      Title="Untitled",
      Subtitle="Key System",
      Note="No method of obtaining the key is provided",
      FileName="Key",
      SaveKey=true,
      GrabKeyFromSite=false,
      Key={"Hello"}
   }
})

Tab=Window:CreateTab("Farm",4483362458)
PlayerTab=Window:CreateTab("Movement",4483362458)
SectionTab=Tab:CreateSection("Farm")
PlayerSection=PlayerTab:CreateSection("Movement Modifiers")

Tab:CreateButton({
    Name="Redeem Promo Codes",
    Callback=function()
        for _,code in ipairs({"RECORD1.5K","OMG1kLIKES","1.2KLIKES","1/5KLIKES"}) do
            game:GetService("ReplicatedStorage").PromoCodeSubmissionEvent:FireServer(code)
        end
    end
})

betAmount=100
betDelay=0.0001
Tab:CreateInput({
    Name="Bet Amount",
    PlaceholderText="Enter amount",
    Callback=function(input)
        betAmount=tonumber(input) or 100
    end
})

Tab:CreateSlider({
    Name="Bet Cooldown (seconds)",
    Range={0.0001,20},
    Increment=0.0001,
    CurrentValue=0.0001,
    Callback=function(value)
        betDelay=value
    end
})

Tab:CreateToggle({
    Name="Auto Bet",
    Callback=function(state)
        if state then
            betTask=task.spawn(function()
                while true do
                    game:GetService("ReplicatedStorage").CasinoBetEvent:FireServer(betAmount)
                    task.wait(betDelay)
                end
            end)
        else
            if betTask then task.cancel(betTask) end
        end
    end
})

iceDelay=0.0001
Tab:CreateSlider({
    Name="IceCrate Open Cooldown (seconds)",
    Range={0.0001,20},
    Increment=0.0001,
    CurrentValue=0.0001,
    Callback=function(value)
        iceDelay=value
    end
})

Tab:CreateToggle({
    Name="AutoOpenIceCrate",
    Callback=function(state)
        if state then
            icePos=game.Players.LocalPlayer.Character:GetPivot()
            iceTask=task.spawn(function()
                while true do
                    game.Players.LocalPlayer.Character:PivotTo(workspace.Crates.IceCrate:GetPivot()*CFrame.new(0,3,0))
                    if workspace.Crates.IceCrate:FindFirstChild("Crate") then
                        if workspace.Crates.IceCrate.Crate:FindFirstChild("ProximityPrompt") then
                            workspace.Crates.IceCrate.Crate.ProximityPrompt.HoldDuration=0
                            fireproximityprompt(workspace.Crates.IceCrate.Crate.ProximityPrompt)
                        end
                    end
                    task.wait()
                end
            end)
        else
            if iceTask then task.cancel(iceTask) end
            if icePos then game.Players.LocalPlayer.Character:PivotTo(icePos) end
        end
    end
})

upDelay=0.0001
Tab:CreateSlider({
    Name="UpCrate Open Cooldown (seconds)",
    Range={0.0001,20},
    Increment=0.0001,
    CurrentValue=0.0001,
    Callback=function(value)
        upDelay=value
    end
})

Tab:CreateToggle({
    Name="AutoOpenUpCrate",
    Callback=function(state)
        if state then
            upPos=game.Players.LocalPlayer.Character:GetPivot()
            upTask=task.spawn(function()
                while true do
                    game.Players.LocalPlayer.Character:PivotTo(workspace.Crates.UPCrate:GetPivot()*CFrame.new(0,3,0))
                    if workspace.Crates.UPCrate:FindFirstChild("Crate") then
                        if workspace.Crates.UPCrate.Crate:FindFirstChild("ProximityPrompt") then
                            workspace.Crates.UPCrate.Crate.ProximityPrompt.HoldDuration=0
                            fireproximityprompt(workspace.Crates.UPCrate.Crate.ProximityPrompt)
                        end
                    end
                    task.wait(upDelay)
                end
            end)
        else
            if upTask then task.cancel(upTask) end
            if upPos then game.Players.LocalPlayer.Character:PivotTo(upPos) end
        end
    end
})

lavaDelay=0.0001
Tab:CreateSlider({
    Name="LavaCrate Open Cooldown (seconds)",
    Range={0.0001,20},
    Increment=0.0001,
    CurrentValue=0.0001,
    Callback=function(value)
        lavaDelay=value
    end
})

Tab:CreateToggle({
    Name="AutoOpenLavaCrate",
    Callback=function(state)
        if state then
            lavaPos=game.Players.LocalPlayer.Character:GetPivot()
            lavaTask=task.spawn(function()
                while true do
                    game.Players.LocalPlayer.Character:PivotTo(workspace.Crates.lavaCrate:GetPivot()*CFrame.new(0,3,0))
                    if workspace.Crates.lavaCrate:FindFirstChild("Crate") then
                        if workspace.Crates.lavaCrate.Crate:FindFirstChild("ProximityPrompt") then
                            workspace.Crates.lavaCrate.Crate.ProximityPrompt.HoldDuration=0
                            fireproximityprompt(workspace.Crates.lavaCrate.Crate.ProximityPrompt)
                        end
                    end
                    task.wait(lavaDelay)
                end
            end)
        else
            if lavaTask then task.cancel(lavaTask) end
            if lavaPos then game.Players.LocalPlayer.Character:PivotTo(lavaPos) end
        end
    end
})

Tab:CreateToggle({
    Name="Auto Rebirth",
    Callback=function(state)
        if state then
            rebirthTask=task.spawn(function()
                while true do
                    price=tonumber(game.Players.LocalPlayer.PlayerGui.CashGui.RebirthsFrame.RebirthButton.Text:match("Цена: (%d+)"))
                    if price and game.Players.LocalPlayer.leaderstats.Dengi.Value>=price then
                        game:GetService("ReplicatedStorage").RebirthRequestEvent:FireServer()
                    end
                    task.wait(0.5)
                end
            end)
        else
            if rebirthTask then task.cancel(rebirthTask) end
        end
    end
})

Tab:CreateToggle({
    Name="AutoFarm",
    Callback=function(state)
        if state then
            farmPos=game.Players.LocalPlayer.Character:GetPivot()
            farmTask=task.spawn(function()
                while true do
                    if game.Players.LocalPlayer.leaderstats.Dengi.Value>=20000 then
                        game.Players.LocalPlayer.Character:PivotTo(workspace.Crates.IceCrate:GetPivot()*CFrame.new(0,3,0))
                        if workspace.Crates.IceCrate:FindFirstChild("Crate") then
                            if workspace.Crates.IceCrate.Crate:FindFirstChild("ProximityPrompt") then
                                workspace.Crates.IceCrate.Crate.ProximityPrompt.HoldDuration=0
                                fireproximityprompt(workspace.Crates.IceCrate.Crate.ProximityPrompt)
                            end
                        end
                        task.wait(0.1)
                    elseif game.Players.LocalPlayer.leaderstats.Dengi.Value>=1500 then
                        game:GetService("ReplicatedStorage").CasinoBetEvent:FireServer(100)
                        task.wait(betDelay)
                    elseif game.Players.LocalPlayer.leaderstats.Dengi.Value>=80 then
                        game:GetService("ReplicatedStorage").CasinoBetEvent:FireServer(20)
                        task.wait(betDelay)
                    else
                        task.wait(0.5)
                    end
                end
            end)
        else
            if farmTask then task.cancel(farmTask) end
            if farmPos then game.Players.LocalPlayer.Character:PivotTo(farmPos) end
        end
    end
})

walkSpeed=16
PlayerTab:CreateSlider({
    Name="Walk Speed",
    Range={16,100},
    Increment=1,
    CurrentValue=16,
    Callback=function(value)
        walkSpeed=value
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=value
        end
    end
})

jumpPower=50
PlayerTab:CreateSlider({
    Name="Jump Power",
    Range={50,150},
    Increment=1,
    CurrentValue=50,
    Callback=function(value)
        jumpPower=value
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower=value
            game.Players.LocalPlayer.Character.Humanoid.UseJumpPower=true
        end
    end
})

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    repeat task.wait() until character:FindFirstChild("Humanoid")
    if walkSpeed then character.Humanoid.WalkSpeed=walkSpeed end
    if jumpPower then 
        character.Humanoid.JumpPower=jumpPower 
        character.Humanoid.UseJumpPower=true 
    end
end)

flySpeed=10
PlayerTab:CreateSlider({
    Name="Fly Speed",
    Range={10,200},
    Increment=1,
    CurrentValue=10,
    Callback=function(value)
        flySpeed=value
    end
})

PlayerTab:CreateToggle({
    Name="Fly",
    Callback=function(state)
        if state then
            flyTask=task.spawn(function()
                bodyVelocity=Instance.new("BodyVelocity")
                bodyVelocity.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
                bodyVelocity.Parent=game.Players.LocalPlayer.Character.HumanoidRootPart
                bodyGyro=Instance.new("BodyGyro")
                bodyGyro.MaxTorque=Vector3.new(math.huge,math.huge,math.huge)
                bodyGyro.P=9000
                bodyGyro.Parent=game.Players.LocalPlayer.Character.HumanoidRootPart
                for _,part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide=false end
                end
                while true do
                    bodyGyro.CFrame=game.Workspace.CurrentCamera.CFrame
                    vel=Vector3.new(0,0,0)
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                        vel=vel+game.Workspace.CurrentCamera.CFrame.LookVector*flySpeed
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                        vel=vel-game.Workspace.CurrentCamera.CFrame.LookVector*flySpeed
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                        vel=vel-game.Workspace.CurrentCamera.CFrame_rightVector*flySpeed
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                        vel=vel+game.Workspace.CurrentCamera.CFrame.RightVector*flySpeed
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                        vel=vel+Vector3.new(0,flySpeed,0)
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
                        vel=vel+Vector3.new(0,-flySpeed,0)
                    end
                    bodyVelocity.Velocity=vel
                    task.wait()
                end
            end)
        else
            if flyTask then task.cancel(flyTask) end
            if bodyVelocity then bodyVelocity:Destroy() end
            if bodyGyro then bodyGyro:Destroy() end
            for _,part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide=true end
            end
        end
    end
})

PlayerTab:CreateToggle({
    Name="Infinite Jump",
    Callback=function(state)
        if state then
            jumpConnection=game:GetService("UserInputService").JumpRequest:Connect(function()
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            if jumpConnection then jumpConnection:Disconnect() end
        end
    end
})

PlayerTab:CreateToggle({
    Name="Anti-AFK",
    Callback=function(state)
        if state then
            afkTask=task.spawn(function()
                while true do
                    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                    game.Workspace.CurrentCamera.CFrame=game.Workspace.CurrentCamera.CFrame*CFrame.Angles(0,math.rad(10),0)
                    task.wait(10)
                end
            end)
        else
            if afkTask then task.cancel(afkTask) end
        end
    end
})
