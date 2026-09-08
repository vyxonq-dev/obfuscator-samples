local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local aPlaceI = {
    [14896802601] = true,
    [16667550979] = true
}

if not aPlaceI[game.PlaceId] then
    Fluent:Notify({
        Title = "PLACE",
        Content = "Place not supported!",
        Duration = 5
    })
    
    return
end

local Window = Fluent:CreateWindow({
    Title = "RMxploit",
    SubTitle = "Residence Massacre OP Script",
    TabWidth = 120,
    Size = UDim2.fromOffset(520, 420),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    VisualsT = Window:AddTab({ Title = "Visuals", Icon = "" }),
    N1 = Window:AddTab({ Title = "Night 1", Icon = "" }),
    N2 = Window:AddTab({ Title = "Night 2", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

local locations = {
    ["Ladder"] = CFrame.new(-0.173666388, 9.29997444, -81.3216171, 0.71976018, 4.61229028e-08, -0.694222808, 2.05241513e-08, 1, 8.7717325e-08, 0.694222808, -7.73837669e-08, 0.71976018),
    ["Generator"] = CFrame.new(-79.722, 4.675, -131.918),
    ["Bedroom"] = CFrame.new(-32.645, 23.8, -72.845),
    ["LivingRoom"] = CFrame.new(-34.962, 8.05, -47.153),
    ["Entrance"] = CFrame.new(-11.036, 7.73, -31.822),
    ["SafeSpot"] = CFrame.new(-339.321, 82.4, -40.622),
    ["DeliveryBoard"] = CFrame.new(-282.224, 82.4, 14.674),
    ["Main"] = CFrame.new(-304.235, 82.4, -6.777),
    ["Corridor1"] = CFrame.new(-303.846, 82.4, 50.169),
    ["Entrance2"] = CFrame.new(-217.417, 82.4, 65.412),
    ["Corridor2"] = CFrame.new(-293.11, 82.4, -89.501)
}

local function Teleport(location)
    Character:SetPrimaryPartCFrame(locations[location])
end

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Residence Massacre",
        SubContent = "Suggest stuff if yo want lolol",
        Duration = 8
    })

local RS = game.ReplicatedStorage
local Remotes = RS.Remotes
local items = RS.Items or nil

--//MAIN\\--

   Tabs.Main:AddParagraph({
        Title = "REMOTES",
        Content = "Remotes are located down there."
    })

    local FlashcamDropdown = Tabs.Main:AddDropdown("FlashCam", {
        Title = "FlashCam:",
        Values = {"1", "2", "3", "None"},
        Multi = false,
        Default = 1,
    })

    FlashcamDropdown:SetValue("None")

    FlashcamDropdown:OnChanged(function(Value)
        Remotes.FlashCam:FireServer(Value)
    end)

   Tabs.Main:AddParagraph({
        Title = "BASIC",
        Content = "Basic stuff are located down there."
    })

	Tabs.Main:AddButton({
        Title = "Bypass Anti-Cheat",
        Description = "You Bypass the anti-cheat with this.",
        Callback = function()
            local disabledAC = false
local remotesFolder = game.ReplicatedStorage.Remotes
local AnticheatRemote = remotesFolder.Kick
    if disabledAC then return end

    AnticheatRemote.Name = ""

    Instance.new("RemoteEvent", remotesFolder).Name = "Kick"

    disabledAC = true
            Fluent:Notify({
                Title = "ANTI-CHEAY",
                Content = "Bypassed Anti-Cheat!.",
                Duration = 5
             })
        end
    })
	
local AutoWire = Tabs.Main:AddToggle("Auto-Wire", {Title = "Auto-Wire", Default = false })

AutoWire:OnChanged(function(Toggle)
    local Fuses = workspace:FindFirstChild("FuseBox")
    if not Fuses then return end
    local OneTime = false

    if Toggle then
        task.spawn(function()
            while AutoWire.Value do
                for _, Wire in ipairs(Fuses.Wires:GetChildren()) do
                    local Sparkles = Wire:FindFirstChild("Sparkles")
                    if Sparkles.Enabled and not OneTime then
			OneTime = true
                        RS.Remotes.ClickWire:FireServer(Wire)
		        task.wait(0.5)
			OneTime = false
                    end
                end
                task.wait(0.5)
            end
        end)
    end
end)

	Tabs.Main:AddButton({
        Title = "Remove Closet barriers",
        Description = "Remove every closets barriers",
        Callback = function()
            for _, closets in pairs(doors:GetChildren()) do
	    if closets.Name == "Closet" and closets:FindFirstChild("Ignore") then
		closets.Ignore:Destroy()
	    end
				end
            Fluent:Notify({
                Title = "CLOSETS",
                Content = "Removed Closets barriers!",
                Duration = 5
             })
        end
    })

    Tabs.Main:AddButton({
        Title = "Events Notifier (Unfinished)",
        Description = "tells you if Larry spawned outside or inside",
        Callback = function()
            workspace.ChildAdded:Connect(function(whoi)
	            if whoi.Name == "Mutant" and whoi.Config.Wandering.Value == true then
                    Fluent:Notify({
                        Title = "LARRY",
                        Content = "Larry has spawned outside!",
                        Duration = 5
                    })
	            elseif whoi.Name == "Mutant" and whoi.Config.Wandering.Value == false then
		            Fluent:Notify({
                        Title = "LARRY",
                        Content = "Larry has spawned in a Window!",
                        Duration = 5
                    })		
                end
            end)
            workspace.ChildRemoved:Connect(function(whowi)
                if whowi.Name == "Mutant" then
                    Fluent:Notify({
                        Title = "LARRY",
                        Content = "Larry has dispawned!",
                        Duration = 5
                    })
                end
            end)
        end
    })
        
	
    Tabs.Main:AddButton({
        Title = "INF Sprint",
        Description = "Unlimited Sprint",
        Callback = function()
            Character.Sprint.Stam:SetAttribute("Max", 999999)
            Character.Sprint.Stam.Value = 999999      
            Fluent:Notify({
                Title = "STAMINA",
                Content = "You've been given infinite stamina.",
                Duration = 5
             })
        end
    })

    Tabs.Main:AddButton({
        Title = "Fix Sprint",
        Description = "Fix Sprint incase of not working",
        Callback = function()
            Character:SetAttribute("SprintSpeed", 16)
            task.wait(0.1)
            Character:SetAttribute("SprintSpeed", 17)
            Fluent:Notify({
                Title = "SPRINT",
                Content = "Fixed sprint! (Hopefully).",
                Duration = 5
             })
        end
    })

    Tabs.Main:AddButton({
        Title = "INF O2",
        Description = "Unlimited Oxygen",
        Callback = function()
            Character.Breath:SetAttribute("Max", 999999)
            Character.Breath.Value = 999999
            game.Lighting.Blur.Enabled = false
            workspace.Sounds.HeavyBreath.Looped = false      
            workspace.Sounds.HeavyBreath.Playing = false      
            Fluent:Notify({
                Title = "BREATH",
                Content = "You've been given infinite O2.",
                Duration = 5
             })
        end
    })

   Tabs.Main:AddParagraph({
        Title = "LOCALSCRIPTS",
        Content = "Disable certain LocalScripts buttons are located down there."
    })


    Tabs.Main:AddButton({
        Title = "Disable Cold",
        Description = "Disables the Freeze Localscript",
        Callback = function()
            Character.Temperature.Enabled = false
            Fluent:Notify({
                Title = "CHRISTMAS",
                Content = "Freeze localscript has been disabled.",
                Duration = 5
             })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "Disable Deathhandler (not recommended)",
        Description = "Disables the DeathHandler Localscript",
        Callback = function()
            LocalPlayer.PlayerScripts.DeathHandler.Enabled = false
            Fluent:Notify({
                Title = "LOCALSCRIPT",
                Content = "Deathhandler localscript has been disabled.",
                Duration = 5
             })
        end
    })

   Tabs.Main:AddParagraph({
        Title = "MOST BASIC",
        Content = "Most basic things are located down there."
    })

    --Options.FullBright:SetValue(false)
    
    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "SprintSpeed",
        Description = "Use if you bypassed Anti-Cheat or you are at Night 2",
        Default = 16,
        Min = 17,
        Max = 45,
        Rounding = 1,
        Callback = function(Value)
            Character:SetAttribute("SprintSpeed", Value)
        end
    })

    Slider:SetValue(3)

--//VISUALS\\--

    Tabs.VisualsT:AddButton({
        Title = "Disable Static",
        Description = "Disables the Static image",
        Callback = function()
            LocalPlayer.PlayerGui.DialogueUI.Static.Visible = false
            Fluent:Notify({
                Title = "VISUAL",
                Content = "Static has been disabled.",
                Duration = 5
             })
        end
    })

Tabs.VisualsT:AddButton({
    Title = "Every Player ESP",
    Description = "ESP For any Players",
    Callback = function()
        local players = game:GetService("Players")
        local localPlayer = players.LocalPlayer 

        local function addESP(player)
            if player == localPlayer then return end

            player.CharacterAdded:Connect(function(character)
                local highlight = Instance.new("Highlight")
                highlight.Parent = game:GetService("CoreGui")
                highlight.Adornee = character
                highlight.OutlineColor = Color3.fromRGB(0, 0, 255)
                highlight.FillColor = Color3.fromRGB(173, 216, 230)
                highlight.FillTransparency = 0.85
            end)

            if player.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = game:GetService("CoreGui")
                highlight.Adornee = player.Character
                highlight.OutlineColor = Color3.fromRGB(0, 0, 255)
                highlight.FillColor = Color3.fromRGB(0, 0, 255)
                highlight.FillTransparency = 0.9
            end
        end

        for _, player in pairs(players:GetPlayers()) do
            addESP(player)
        end

        players.PlayerAdded:Connect(addESP)

        Fluent:Notify({
            Title = "VISUAL ESP [PLAYERS]",
            Content = "Success.",
            Duration = 5
        })
    end
})



    Tabs.VisualsT:AddButton({
        Title = "Larry ESP (Requires anti-cheat bypass)",
        Description = "ESP For Larry Night 1 & 2",
        Callback = function()
            local H = Instance.new("Highlight")
	    H.Parent = game.CoreGui
            H.Adornee = workspace:WaitForChild("Mutant")
            H.FillTransparency = 1
            Fluent:Notify({
                Title = "VISUAL ESP [LARRY]",
                Content = "Success.",
                Duration = 5
             })
        end
    })

    Tabs.VisualsT:AddButton({
        Title = "Stalker ESP",
        Description = "ESP For Stalker [Night 2]",
        Callback = function()
            --RS.MutantVal:Destroy()
            --task.wait(1)
            local H = Instance.new("Highlight")
            H.Parent = workspace:WaitForChild("Stalker")
            H.FillTransparency = 1
            Fluent:Notify({
                Title = "VISUAL ESP [STALKER]",
                Content = "Success.",
                Duration = 5
             })
        end
    })

    Tabs.VisualsT:AddButton({
        Title = "Zombies ESP",
        Description = "Zombies  & Skeletons ESP",
        Callback = function()
            local zombies = {"FrozenBloodZombie", "Zombie", "BloodZombie", "FrozenZombie"}

    game.Workspace.ChildAdded:Connect(function(child)
         if child:IsA("Model") and table.find(zombies, child.Name) and not child:FindFirstChildOfClass("Highlight") then
            local h = Instance.new("Highlight", child)
             h.FillTransparency = 1
    end
end)

for _, child in ipairs(game.Workspace:GetChildren()) do
    if child:IsA("Model") and table.find(zombies, child.Name) then
        local h = Instance.new("Highlight", child)
        h.FillTransparency = 1
    end
end
            Fluent:Notify({
                Title = "VISUAL ESP [ZOMBIES & SKELETONS]",
                Content = "Success.",
                Duration = 5
             })
        end
    })

--//NIGHT 1\\--

    Tabs.N1:AddParagraph({
        Title = "Teleports",
        Content = "Teleports are located down there."
    })

    Tabs.N1:AddButton({
        Title = "Teleport to Ladder",
        Description = "Teleport",
        Callback = function()
            Teleport("Ladder")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

    Tabs.N1:AddButton({
        Title = "Teleport to Generator",
        Description = "Teleport",
        Callback = function()
            Teleport("Generator")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

    Tabs.N1:AddButton({
        Title = "Teleport to Entrance",
        Description = "Teleport",
        Callback = function()
            Teleport("Entrance")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

    Tabs.N1:AddButton({
        Title = "Teleport to LivingRoom",
        Description = "Teleport",
        Callback = function()
            Teleport("LivingRoom")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

    Tabs.N1:AddButton({
        Title = "Teleport to BedRoom",
        Description = "Teleport",
        Callback = function()
            Teleport("Bedroom")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

   Tabs.N1:AddParagraph({
        Title = "AUTOMATICS",
        Content = "Automatics are located down there."
    })

   Tabs.N1:AddButton({
        Title = "Refill Fireplace",
        Description = "You may use with more people.",
        Callback = function()
            local OCframe = character.HumanoidRootPart.CFrame
            workspace.WoodPile.Detector.CanCollide = false
        character.HumanoidRootPart.CFrame = CFrame.new(-27.1490536, 8.69999981, -118.611603, 0.999933779, 1.25921233e-07, -0.0115088131, -1.26111075e-07, 1, -1.57700288e-08, 0.0115088131, 1.72203727e-08, 0.999933779)
        task.wait(0.25)
            fireclickdetector(workspace.WoodPile.Detector.ClickDetector)
            task.wait(0.25)
            character.HumanoidRootPart.CFrame = CFrame.new(-45.1136208, 7.84974337, -60.2411423, 0.0467772186, -0.000410021428, 0.998905241, 1.91703771e-06, 0.99999994, 0.000410380948, -0.998905301, -1.72815417e-05, 0.0467772186)
            task.wait(0.5)
            character.HumanoidRootPart.CFrame = OCframe
            Fluent:Notify({
                Title = "CHRISTMAS",
                Content = "Refilled Fire-place!",
                Duration = 5
             })
        end
    })

    Tabs.N1:AddButton({
        Title = "Refill Fireplace 2",
        Description = "You may use with more people. (No TP Back)",
        Callback = function()
            --local OCframe = character.HumanoidRootPart.CFrame
            workspace.WoodPile.Detector.CanCollide = false
        character.HumanoidRootPart.CFrame = CFrame.new(-27.1490536, 8.69999981, -118.611603, 0.999933779, 1.25921233e-07, -0.0115088131, -1.26111075e-07, 1, -1.57700288e-08, 0.0115088131, 1.72203727e-08, 0.999933779)
        task.wait(0.25)
            fireclickdetector(workspace.WoodPile.Detector.ClickDetector)
            task.wait(0.25)
            character.HumanoidRootPart.CFrame = CFrame.new(-45.1136208, 7.84974337, -60.2411423, 0.0467772186, -0.000410021428, 0.998905241, 1.91703771e-06, 0.99999994, 0.000410380948, -0.998905301, -1.72815417e-05, 0.0467772186)
            --task.wait(0.5)
            --character.HumanoidRootPart.CFrame = OCframe
            Fluent:Notify({
                Title = "CHRISTMAS",
                Content = "Refilled Fire-place!",
                Duration = 5
             })
        end
    })

    Tabs.N1:AddButton({
    Title = "Auto Scare",
    Description = "Requires at least one camera placed",
    Callback = function()
        workspace.ChildAdded:Connect(function(whoi)
            if whoi.Name == "Mutant" and whoi:FindFirstChild("Config") and whoi.Config:FindFirstChild("Wandering") then
                if whoi.Config.Wandering.Value == false then
                    task.wait(1.5)
                    game.ReplicatedStorage.Remotes.FlashCam:FireServer("1")
                end
            end
        end)
    end
})
	
   Tabs.N1:AddButton({
        Title = "Grab Wood",
        Description = "You may use with more people too.",
        Callback = function()
         local OCframe = character.HumanoidRootPart.CFrame
            
            workspace.WoodPile.Detector.CanCollide = false
        character.HumanoidRootPart.CFrame = CFrame.new(-27.1490536, 8.69999981, -118.611603, 0.999933779, 1.25921233e-07, -0.0115088131, -1.26111075e-07, 1, -1.57700288e-08, 0.0115088131, 1.72203727e-08, 0.999933779)
        task.wait(0.25)
        fireclickdetector(workspace.WoodPile.Detector.ClickDetector)
        task.wait(0.25)
        character.HumanoidRootPart.CFrame = OCframe
            Fluent:Notify({
                Title = "CHRISTMAS",
                Content = "Grabbing Wood...",
                Duration = 5
             })
        end
    })

    Tabs.N1:AddButton({
        Title = "Grab Barricade Pile (Quite useless)",
        Description = "Quick.",
        Callback = function()
         local OCframe = character.HumanoidRootPart.CFrame
            
        character.HumanoidRootPart.CFrame = CFrame.new(-43.144, 25.3, -68.021)
        task.wait(0.25)
        fireclickdetector(workspace.BarricadePile.Detector.ClickDetector)
            task.wait(0.25)
            character.HumanoidRootPart.CFrame = OCframe
            Fluent:Notify({
                Title = "BARRICADES",
                Content = "Grabbed Barricade!",
                Duration = 5
             })
        end
    })

    Tabs.N1:AddButton({
        Title = "Refill Generator",
        Description = "Quick.",
        Callback = function()
         local OCframe = character.HumanoidRootPart.CFrame
            
        character.HumanoidRootPart.CFrame = CFrame.new(-76.039, 4.675, -133.78)
        task.wait(0.25)
        fireclickdetector(workspace.Shack.JerryCan.ClickDetector)
            task.wait(0.5)
            fireclickdetector(workspace.Shack.Generator.ClickDetector)
            task.wait(0.5)
            character.HumanoidRootPart.CFrame = OCframe
            Fluent:Notify({
                Title = "GENERATOR",
                Content = "Refilled",
                Duration = 5
             })
        end
    })

   Tabs.N1:AddButton({
        Title = "Grab JerryCan",
        Description = "Quick.",
        Callback = function()
         local OCframe = character.HumanoidRootPart.CFrame
            
        character.HumanoidRootPart.CFrame = CFrame.new(-76.039, 4.675, -133.78)
        task.wait(0.25)
        fireclickdetector(workspace.Shack.JerryCan.ClickDetector)
            task.wait(0.25)
            character.HumanoidRootPart.CFrame = OCframe
            Fluent:Notify({
                Title = "JERRY CAN",
                Content = "Grabbed!",
                Duration = 5
             })
        end
    })

   Tabs.N1:AddParagraph({
        Title = "Endless",
        Content = "Endless stuff are located down there."
    })

   Tabs.N1:AddButton({
        Title = "Open UpgradeFrame",
        Description = "Upgrades",
        Callback = function()
            LocalPlayer.PlayerGui.DialogueUI.UpgradeFrame.Visible = true
            LocalPlayer.PlayerGui.DialogueUI.UpgradeFrame.Position = UDim2.new(0.499, 0, 0.5, 0)
            Fluent:Notify({
                Title = "ENDLESS",
                Content = "UpgradeFrame's visible!",
                Duration = 5
             })
        end
    })

   Tabs.N1:AddButton({
        Title = "EZ Gambler mini-game",
        Description = "Very EZ",
        Callback = function()
            if RS.Assets:FindFirstChild("Gambler") then
                RS.Assets.Gambler.Cups["1"].BrickColor = BrickColor.new("Really red")
                RS.Assets.Gambler.Cups["3"].BrickColor = BrickColor.new("Lime green")
            else
                workspace.Gambler.Cups["1"].BrickColor = BrickColor.new("Really red")
                workspace.Gambler.Cups["3"].BrickColor = BrickColor.new("Lime green")
            end
            Fluent:Notify({
                Title = "ENDLESS",
                Content = "Gambler mini-game is easier!",
                Duration = 5
             })
        end
    })

  Tabs.N1:AddParagraph({
        Title = "PvP",
        Content = "PvP stuff are located down here."
    })

   Tabs.N1:AddButton({
        Title = "Place trap",
        Description = "Trolling",
        Callback = function()
         -- keys

local C = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

game:GetService("ReplicatedStorage").Remotes.PlayerMutant:FireServer(table.unpack({
    [1] = "Trap",
    [2] = C,
}))
            Fluent:Notify({
                Title = "PVP",
                Content = "Placed Trap!",
                Duration = 5
             })
        end
    })
	
   Tabs.N1:AddButton({
        Title = "Un-anchor root part",
        Description = "Trolling",
        Callback = function()
         local C = game.Players.LocalPlayer.Character.HumanoidRootPart

         C.Anchored = false
            Fluent:Notify({
                Title = "PVP",
                Content = "un-achored rootpart!",
                Duration = 5
             })
        end
    })

   Tabs.N1:AddButton({
        Title = "Fast (requires anti-cheat bypass)",
        Description = "Trolling",
        Callback = function()
         local C = game.Players.LocalPlayer.Character.Humanoid

	while true do
	    C.WalkSpeed = 30
	    task.wait(0.1)
	end

         C.Anchored = false
            Fluent:Notify({
                Title = "PVP",
                Content = "You're fast now!",
                Duration = 5
             })
        end
    })

   Tabs.N1:AddButton({
        Title = "Enable Jumping",
        Description = "Trolling",
        Callback = function()
         local C = game.Players.LocalPlayer.Character.Humanoid
	  while true do
              C:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
	      C.JumpPower = 50
	      task.wait(0.1)
	  end
            Fluent:Notify({
                Title = "PVP",
                Content = "You can jump now!",
                Duration = 5
             })
        end
    })
--//NIGHT 2\\--

    Tabs.N2:AddButton({
        Title = "Give Tablet",
        Description = "Give yourself the Camera Tablet",
        Callback = function()
            local t = items.Tablet:Clone()
            t.Parent = Character
            Fluent:Notify({
                Title = "ITEMS",
                Content = "You've been given the Tablet.",
                Duration = 5
             })
        end
    })

   Tabs.N2:AddParagraph({
        Title = "Teleports",
        Content = "Teleports are located down there."
    })

   Tabs.N2:AddButton({
        Title = "Teleport to Entrance",
        Description = "Teleport",
        Callback = function()
            Teleport("Entrance2")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

  Tabs.N2:AddButton({
        Title = "Teleport to DeliveryBoard",
        Description = "Teleport",
        Callback = function()
            Teleport("DeliveryBoard")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

   Tabs.N2:AddButton({
        Title = "Teleport to Main",
        Description = "Teleport",
        Callback = function()
            Teleport("Main")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

   Tabs.N2:AddButton({
        Title = "Teleport to Corridor 1",
        Description = "Teleport",
        Callback = function()
            Teleport("Corridor1")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

   Tabs.N2:AddButton({
        Title = "Teleport to Corridor 2",
        Description = "Teleport",
        Callback = function()
            Teleport("Corridor2")
            Fluent:Notify({
                Title = "TP",
                Content = "Teleported!",
                Duration = 5
             })
        end
    })

   Tabs.N2:AddParagraph({
        Title = "Automatics",
        Content = "Automatics are located down there."
    })


    Tabs.N2:AddButton({
        Title = "Refill Power",
        Description = "A automatic that's for refilling the Power Generator.",
        Callback = function()
        local OCframe = character.HumanoidRootPart.CFrame
            
        character.HumanoidRootPart.CFrame = CFrame.new(-318.606567, 82.3999634, 97.8991776, -0.0253890008, -5.39555138e-08, -0.999677658, 3.64161301e-09, 1, -5.40653993e-08, 0.999677658, -5.01310549e-09, -0.0253890008)
        task.wait(0.25)
            fireclickdetector(workspace.PowerCell.ClickDetector)
            task.wait(0.25)
            character.HumanoidRootPart.CFrame = CFrame.new(-271.368439, 82.3999634, 112.977608, -0.9987728, -3.20747908e-08, 0.0495270789, -2.73038125e-08, 1, 9.70072804e-08, -0.0495270789, 9.55359525e-08, -0.9987728)
            task.wait(0.25)
            fireclickdetector(workspace.Generator.Detector.ClickDetector)
            task.wait(0.25)
            character.HumanoidRootPart.CFrame = OCframe
            Fluent:Notify({
                Title = "NIGHT 2",
                Content = "Refilled power!",
                Duration = 5
             })
        end
    })

   Tabs.N2:AddParagraph({
        Title = "ANTIS",
        Content = "Some Buttons that make you inmune to certain things is located down there."
    })

     Tabs.N2:AddButton({
        Title = "Disable Stalker View DMG",
        Description = "If you look at Stalker nothing happens if you exec this.",
        Callback = function()
            game.ReplicatedStorage.Remotes.LookAt:Destroy()
            Fluent:Notify({
                Title = "STALKER",
                Content = "You're inmune to Stalker view damage now.",
                Duration = 5
             })
        end
    })

     Tabs.N2:AddButton({
        Title = "Anti Vent-Pests",
        Description = "The Vent-Pests can't snatch you with this.",
        Callback = function()
        local grids = workspace.Grids
		for _, gridel in grids:GetChildren() do
            if gridel:IsA("Model") then
                for _, child in gridel:GetChildren() do
                    if child:IsA("Part") and child.Name == "Hitbox" then
                        child:Destroy()
                    end
                end
            end
            Fluent:Notify({
                Title = "PESTS",
                Content = "You're inmune to Vent Pest's snatch now.",
                Duration = 5
             })
        end
        end
     })

   Tabs.N2:AddParagraph({
        Title = "REMOTES",
        Content = "Remotes are located down there."
    })

     Tabs.N2:AddButton({
        Title = "Revive",
        Description = "Use this to revive, Only at Night 2.",
        Callback = function()
            Remotes.LoadCharacter:FireServer()
            wait(1)
            Fluent:Notify({
                Title = "NIGHT 2",
                Content = "Revived!",
                Duration = 5
             })
        end
    })

     Tabs.N2:AddButton({
        Title = "Escape-Snatch",
        Description = "Use this to escape the snatch of a Vent Pest.",
        Callback = function()
            Remotes.EscapeSnatch:FireServer()
            Fluent:Notify({
                Title = "NIGHT 2",
                Content = "Escaped the Snatch!",
                Duration = 5
             })
        end
    })

     local Dropdown = Tabs.N2:AddDropdown("Delivery", {
        Title = "Delivery:",
        Values = {"Camera", "Lock", "UVLamp", "MotionSensor", "None"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("None")

    Dropdown:OnChanged(function(Value)
        Remotes.Delivery:FireServer(Value)
    end)

    local RepairDropdown = Tabs.N2:AddDropdown("RepairWire", {
        Title = "Repair Wire:",
        Values = {"1", "2", "3", "4", "None"},
        Multi = false,
        Default = 1,
    })

    RepairDropdown:SetValue("None")

    RepairDropdown:OnChanged(function(Value)
        Remotes.Repair:FireServer(Value)
            Fluent:Notify({
                Title = "NIGHT 2",
                Content = "Repairing: " ..Value.. " (If RepairWorker isn't ded)",
                Duration = 5
            })
    end)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Help",
    Content = "My Residence is getting Massacred :((.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
end
