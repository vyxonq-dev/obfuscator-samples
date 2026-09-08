--Yes opensourced B) please no ban me if owner of game B( that wouldnt be nice now

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Learning with Pibby GUI : Shag420#6729", HidePremium = false, SaveConfig = false, ConfigFolder = ""})

OrionLib:MakeNotification({
	Name = "Credits:",
	Content = "Shag420#6729",
	Image = "rbxassetid://0",
	Time = 10
})


local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420#6729")

Tab:AddButton({
	Name = "Get Free Tools",
	Callback = function()
        for i,v in next, game:GetService("Workspace").EmeraldsGivers:GetDescendants() do
            if v:IsA("ClickDetector") then
            fireclickdetector(v)
            end
            end
  	end    
})

Tab:AddToggle({
	Name = "Loop Get Free Tools",
	Default = false,
	Callback = function(Value)
        getgenv().lgt = Value
        while lgt do
            task.wait()
            for i,v in next, game:GetService("Workspace").EmeraldsGivers:GetDescendants() do
                if v:IsA("ClickDetector") then
                fireclickdetector(v)
                end
                end
        end
    end    
})

Tab:AddButton({
	Name = "Get Points : Can get characters",
	Callback = function()
        for i,v in next, game:GetService("Workspace").EmeraldsGivers:GetDescendants() do
            if v:IsA("ClickDetector") and string.match(v.Parent.Parent.Name, "Emerald") then
            fireclickdetector(v)
            task.wait(0.01)
            fireclickdetector(game:GetService("Workspace").SkySanctuary["Master Emerald"].ChaosEmerald.ClickDetector)
            end
            end
  	end    
})

Tab:AddToggle({
	Name = "Loop Get Points : Can get characters",
	Default = false,
	Callback = function(Value)
        getgenv().pointsfarm = Value
        while pointsfarm do
            task.wait()
        for i,v in next, game:GetService("Workspace").EmeraldsGivers:GetDescendants() do
        if v:IsA("ClickDetector") and string.match(v.Parent.Parent.Name, "Emerald") then
        fireclickdetector(v)
        task.wait(0.01)
        fireclickdetector(game:GetService("Workspace").SkySanctuary["Master Emerald"].ChaosEmerald.ClickDetector)
        end
        end
        end
    end    
})

Tab:AddButton({
	Name = "Get Emeralds",
	Callback = function()
for i,v in next, game:GetService("Workspace").EmeraldsGivers:GetDescendants() do
    if v:IsA("ClickDetector") and string.match(v.Parent.Parent.Name, "Emerald") then
    fireclickdetector(v)
    end
    end
end    
})

Tab:AddToggle({
	Name = "Loop Get Emeralds",
	Default = false,
	Callback = function(Value)
        getgenv().lge = Value
        while lge do
            task.wait()
            for i,v in next, game:GetService("Workspace").EmeraldsGivers:GetDescendants() do
                if v:IsA("ClickDetector") and string.match(v.Parent.Parent.Name, "Emerald") then
                fireclickdetector(v)
                end
                end
        end
    end    
})

Tab:AddButton({
	Name = "Drop All Emeralds In Inventory",
	Callback = function()
        for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
            if v:IsA("Tool") and string.match(v.Name, "Emerald") then
            v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        task.wait()
        for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
            if string.match(v.Name, "Emerald") then
            v.Parent = game.Players.LocalPlayer.Character
            task.wait(0.01)
            v.Parent = game.Workspace
            else
            end
            end
end    
})

Tab:AddToggle({
	Name = "Loop Drop All Emeralds In Inventory",
	Default = false,
	Callback = function(Value)
getgenv().ldae = Value
while ldae do
task.wait()
for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
    if v:IsA("Tool") and string.match(v.Name, "Emerald") then
    v.Parent = game.Players.LocalPlayer.Backpack
    end
end
task.wait()
for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
    if string.match(v.Name, "Emerald") then
    v.Parent = game.Players.LocalPlayer.Character
    task.wait(0.01)
    v.Parent = game.Workspace
    else
    end
    end
end
    end    
})

Tab:AddButton({
	Name = "Pickup Any Spawned Dragon Balls",
	Callback = function()
        for i,v in next, game:GetService("Workspace").DragonBallsSpawner.SpawnedDFS:GetDescendants() do
            if v:IsA("Part") then
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            end
            end
end    
})

Tab:AddToggle({
	Name = "Loop Pickup Any Spawned Dragon Balls",
	Default = false,
	Callback = function(Value)
getgenv().paddb = Value
while paddb do
task.wait()
for i,v in next, game:GetService("Workspace").DragonBallsSpawner.SpawnedDFS:GetDescendants() do
    if v:IsA("Part") then
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
    end
    end
end
    end    
})



local Tab = Window:MakeTab({
	Name = "Characters",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420#6729")

Tab:AddButton({
	Name = "Get Majin Sonic",
	Callback = function()
    fireclickdetector(game:GetService("Workspace").EmeraldsGivers.Codegiver.ClickDetector)
    task.wait(0.1)
    fireclickdetector(game:GetService("Workspace").hihihihi.LapTop.HitBox.ClickDetector)
end    
})

Tab:AddToggle({
	Name = "Loop Get Majin Sonic : Gets golden morph",
	Default = false,
	Callback = function(Value)
getgenv().ggm = Value
while ggm do
task.wait()
fireclickdetector(game:GetService("Workspace").EmeraldsGivers.Codegiver.ClickDetector)
    task.wait(0.1)
    fireclickdetector(game:GetService("Workspace").hihihihi.LapTop.HitBox.ClickDetector)
end
    end    
})

Tab:AddButton({
	Name = "Get Glitch Morph",
	Callback = function()
        fireclickdetector(game:GetService("Workspace").EmeraldsGivers.GlitchGiver.Part.ClickDetector)
end    
})

local Tab = Window:MakeTab({
	Name = "Fun",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420#6729")

Tab:AddButton({
	Name = "Random Item : $300 Points",
	Callback = function()
        fireclickdetector(game:GetService("Workspace").FX.MisteryBox.HitBox.ClickDetector)
end    
})

Tab:AddToggle({
	Name = "Spam Drop Gems : Can be laggy",
	Default = false,
	Callback = function(Value)
        getgenv().gemsdrop = Value
        while gemsdrop do
            task.wait()
        for i,v in next, game:GetService("Workspace").EmeraldsGivers:GetDescendants() do
        if v:IsA("ClickDetector") and string.match(v.Parent.Parent.Name, "Emerald") then
        fireclickdetector(v)
        task.wait(0.01)
        for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if string.match(v.Name, "Emerald") then
        v.Parent = game.Players.LocalPlayer.Character
        task.wait(0.01)
        v.Parent = game.Workspace
        else
        end
        end
        end
        end
        end
    end    
})

OrionLib:Init()