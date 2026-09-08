local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "ChaosHub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Discord",
	Text = "Make Sure To Join The Discord Server! :D",
	Duration = 5,
	Callback = function() end
}

GUI:Credit{
	Name = "Chaotic_Void",
	Description = "Hub Owner",
}

local Tab = GUI:Tab{
	Name = "Main",
	Icon = "rbxthumb://type=Asset&id=3517717568&w=150&h=150"
}

Tab:Toggle{
	Name = "Auto Click",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().speed = state
        if state then
            click()
        end
    end
}

Tab:Toggle{
	Name = "Auto Rebirth",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().rebirth = state
        if state then
            rebirth()
        end
    end
}

Tab:Toggle{
	Name = "Collect Orbs",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().orb = state
        if state then
            fire()
        end
    end
}

Tab:Toggle{
	Name = "Collect Rings",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().ring = state
        if state then
            ring()
        end
    end
}

Tab:Button{
	Name = "Win Race",
	Description = nil,
	Callback = function() 
    race()
    end
}


ad = {}
for i,v in pairs(game:GetService("Workspace").Teleports:GetChildren()) do
if v:IsA('Part') or v:IsA("SpawnLocation") then
   if not table.find(ad, v.Name) then
       table.insert(ad, v.Name)
   end 
end
end

local MyDropdown = Tab:Dropdown{
	Name = "Teleports",
	StartingText = "List Of Teleports",
	Description = nil,
	Items = 
    ad,
	Callback = function(c)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Teleports[c].CFrame
    end
}

local Tab = GUI:Tab{
	Name = "Discord",
	Icon = "rbxthumb://type=Asset&id=9334666836&w=150&h=150"
}

Tab:Button{
	Name = "Copy Discord Server Invite",
	Description = nil,
	Callback = function()
        GUI:Notification{
            Title = "Discord",
            Text = "Discord Invite Has Been Copied!",
            Duration = 3,
            Callback = function() end
        }
        setclipboard("https://discord.gg/wk7Wer9rGk")
    end
}

function click()
while getgenv().speed == true do
game:GetService("ReplicatedStorage").Remotes.AddSpeed:FireServer()
wait(0.2)
end
end

function rebirth()
    while getgenv().rebirth == true do
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
    wait(1)
    end
    end

function fire()
    while getgenv().orb == true do
    for i, v in pairs(game:GetService("Workspace").OrbSpawns:GetDescendants()) do
        if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
        end
    end
    wait()
    end
end

function ring()
while getgenv().ring == true do
for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "TouchInterest" and v.Parent:IsA("MeshPart") and v.Parent then
            firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
        end
    end
    wait()
end
end

function race()
    for i, v in pairs(game:GetService("Workspace").RaceEnd:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
        end
    end
end