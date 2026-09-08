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
	Name = "Auto Swing",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
    if state then
            getgenv().a = true
            while getgenv().a == true do
            game:GetService("ReplicatedStorage").Events.Clicked:FireServer()
            wait()
            end
        else
            getgenv().a = false  
        end
    end
}

Tab:Toggle{
	Name = "Auto Buy Saber",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().b = state
        if state then
            saber()
        end
    end
}

Tab:Toggle{
	Name = "Auto Buy Dna",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().c = state
        if state then
            dna()
        end
    end
}

Tab:Toggle{
	Name = "Auto Buy JumpBoosts",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().d = state
        if state then
            jump()
        end
    end
}

Tab:Toggle{
	Name = "Auto Buy BossBoosts",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().e = state
        if state then
            boss()
        end
    end
}

Tab:Toggle{
	Name = "Auto Buy Auras",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().f = state
        if state then
            aura()
        end
    end
}

Tab:Toggle{
	Name = "Auto Buy PetAuras",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().g = state
        if state then
            PetAuras()
        end
    end
}

ad = {}
for i,v in pairs(game:GetService("ReplicatedStorage").Eggs:GetChildren()) do
if v:IsA('Folder') then
   if not table.find(ad, v.Name) then
       table.insert(ad, v.Name)
   end 
end
end

local MyDropdown = Tab:Dropdown{
	Name = "Eggs",
	StartingText = "List Of Eggs",
	Description = nil,
	Items = 
    ad,
	Callback = function(c) 
        Eggs = c
    end
}

Tab:Toggle{
	Name = "Auto Open Egg",
	StartingState = false,
	Description = nil,
	Callback = function(state)
        if state then
        getgenv().pets = true 
        while getgenv().pets == true do
        local ohInstance1 = game:GetService("ReplicatedStorage").Eggs[Eggs]
        local ohNumber2 = 1
        game:GetService("ReplicatedStorage").Events.HatchEggs:InvokeServer(ohInstance1, ohNumber2)
        wait()
        end
    else
        getgenv().pets = false
    end 
    end
}

Tab:Toggle{
	Name = "Auto CombineAllPets",
	StartingState = false,
	Description = nil,
	Callback = function(state)
        if state then
        getgenv().combine = true
        while getgenv().combine == true do
        game:GetService("ReplicatedStorage").Events.CombineAll:FireServer()
        wait(5)
        end
    else
        getgenv().combine = false
    end
end
}

local Tab = GUI:Tab{
	Name = "Misc",
	Icon = "rbxthumb://type=Asset&id=3331928717&w=150&h=150"
}

Tab:Button{
	Name = "Goto King of Hill",
	Description = nil,
	Callback = function() 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(790.539794921875, 249.75267028808594, 32.12065124511719)
    end
}

Tab:Button{
	Name = "Goto Sell Area",
	Description = nil,
	Callback = function() 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").SellArea.CFrame
    end
}

Tab:Toggle{
	Name = "Auto Flag(suggested use in vip servers or small)",
	StartingState = false,
	Description = nil,
	Callback = function(state)
        if state then
            getgenv().flag = true
            while getgenv().flag == true do
                local CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                for i , v in pairs(game.Workspace.Flags:GetChildren()) do
                    if v.OwnerValue.Value ~= game.Players.LocalPlayer.Name then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame
                        repeat
                        wait()
                        until  v.OwnerValue.Value == game.Players.LocalPlayer.Name
                        wait(13.5)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame
                    end
                end
            end
        else
            getgenv().flag = false 
        end
end
}


local Tab = GUI:Tab{
	Name = "Player",
	Icon = "rbxthumb://type=Asset&id=8797391505&w=150&h=150"
}

Tab:Slider{
	Name = "Walk Speed",
	Default = 50,
	Min = 0,
	Max = 200,
	Callback = function(speed) 
        pcall(function()
			game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = speed
        end)
    end
}

Tab:Slider{
	Name = "Jump Power",
	Default = 50,
	Min = 0,
	Max = 200,
	Callback = function(jump) 
        pcall(function()
			game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = jump
        end)
    end
}

Tab:Slider{
	Name = "Gravity",
	Default = 50,
	Min = 0,
	Max = 200,
	Callback = function(text) 
            workspace.Gravity = text
    end
}

Tab:Button{
	Name = "Inf Jump",
	Description = nil,
	Callback = function() 
    local infjump = true
    game:GetService("UserInputService").JumpRequest:connect(function()
    if infjump then
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
   end
end)
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


function saber()
getgenv().b = true
while getgenv().b == true do
    local ohString1 = "Swords"
    game:GetService("ReplicatedStorage").Events.BuyAll:FireServer(ohString1)
wait(3)
end
end

function dna()
getgenv().c = true
while getgenv().c == true do
local ohString1 = "Backpacks"
game:GetService("ReplicatedStorage").Events.BuyAll:FireServer(ohString1)
wait(3)
end
end

function jump()
getgenv().d = true
while getgenv().d == true do
local ohString1 = "JumpBoosts"
game:GetService("ReplicatedStorage").Events.BuyAll:FireServer(ohString1)
wait(3)
end
end

function boss()
getgenv().e = true
while getgenv().e == true do
local ohString1 = "BossBoosts"
game:GetService("ReplicatedStorage").Events.BuyAll:FireServer(ohString1)
wait(3)
end
end

function aura()
getgenv().f = true
while getgenv().f == true do
local ohString1 = "Auras"
game:GetService("ReplicatedStorage").Events.BuyAll:FireServer(ohString1)
wait(3)
end
end

function PetAuras()
getgenv().g = true
while getgenv().g == true do
local ohString1 = "PetAuras"
game:GetService("ReplicatedStorage").Events.BuyAll:FireServer(ohString1)
wait(3)
end
end
