local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "ChaosHub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Game Detected",
	Text = "Rebirth Champions X",
	Duration = 3,
	Callback = function() end
}

GUI:Notification{
	Title = "Discord",
	Text = "Make Sure To Join The Discord Server! :D",
	Duration = 3,
	Callback = function() end
}

GUI:Credit{
	Name = "Chaotic_Void",
	Description = "Owner",
}

local Tab = GUI:Tab{
	Name = "Main",
	Icon = "rbxthumb://type=Asset&id=3517717568&w=150&h=150"
}

Tab:Toggle{
	Name = "1500x Clicks",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
    if state then
        getgenv().a = true
        while getgenv().a == true do
        local ohString1 = "Cave"
        game:GetService("ReplicatedStorage").Events.WorldBoost:FireServer(ohString1)
        wait()
        end
    else
        getgenv().a = false
    end
    end
}

Tab:Toggle{
	Name = "Auto Click",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
    getgenv().a = state
    if state then
        click()
    end
    end
}

Tab:Slider{
    Name = "Amount Of Rebirths",
    Default = 50,
    Min = 0,
    Max = 50,
    Callback = function(a) 
        SelectRebirth = a
    end
}

Tab:Toggle{
	Name = "Auto Rebirth",
	StartingState = false,
	Description = nil,
	Callback = function(state)
        getgenv().Rebirth = state
        if state then
            rebirth()
        end
    end
}

local Tab = GUI:Tab{
	Name = "Misc",
	Icon = "rbxthumb://type=Asset&id=3331928717&w=150&h=150"
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

function click()
    while getgenv().a == true do
    game:GetService("ReplicatedStorage").Events.Click3:FireServer()
    wait()
    end
    end


function rebirth()
while getgenv().Rebirth == true do
local ohNumber1 = SelectRebirth
game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(ohNumber1)
wait(2)
end
end