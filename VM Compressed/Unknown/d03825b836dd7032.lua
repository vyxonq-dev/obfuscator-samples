local MatoUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Itzzavi335/Mato-Ui-Library/refs/heads/main/Source.luau"))()

local Window = MatoUI:CreateWindow({
    Title = "3008 | RealForLife",
    Subtitle = "The Best 3008 Exploit",
    Size = UDim2.new(0, 600, 0, 450)
})


-- Syntax: Window:AddBadge("Text", BackgroundColor, TextColor optional)


local ClientTab   = Window:AddTab("Main")
local FETab   = Window:AddTab("PrivateS Only")

ClientTab:AddWarning({
    Title = "WARNING ",
    Message = "!THE MOD PANEL CAN KICK YOU!"
})

FETab:AddInformation({
    Title = "This tab Is only for private server VIP or singleplayer VIP",
    Message = ""
})

ClientTab:AddInformation({
    Title = "Last Update / Credits",
    Message = "Credits : RealForLife | Last Updated : 23 December 25 | V1.0"
})


ClientTab:AddButton({
    Name = "Show Mod Panel",
    Callback = function() game:GetService("Players").LocalPlayer:SetAttribute("IngameRank", 3) 
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.TopBar.Menus.Mod.Visible = true  game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Menus.Extras.Sections.Mod.Visible = true 
 for i, all in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Menus.Mod.StartMenu.Buttons:GetChildren()) do if all:IsA("TextButton") then all.Visible = true 
end 
end
    end
})
ClientTab:AddButton({
    Name = "Enable Timer/Clock",
    Callback = function() 
local ClockUI = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.TopBar.Calendar.Gamepass_Clock
ClockUI.Visible = true
local GameTime = game:GetService("ReplicatedStorage").ServerSettings.TimeSettings.TimeLeft

GameTime:GetPropertyChangedSignal("Value"):Connect(function()
local function formatthing(sec)
    local minutes = math.floor(sec / 60)
    local remainingSeconds = sec % 60

    return string.format("%02d:%02d", minutes, remainingSeconds)
end
ClockUI.Text = formatthing(GameTime.Value)
if GameTime.Value == 5 then
ClockUI.Countdown:Play()
end 
end) 
end
})


ClientTab:AddButton({
    Name = "FullBright",
    Callback = function() 
local light = game.Lighting
light.Brightness = 31
light.GlobalShadows = false
end
})

ClientTab:AddButton({
    Name = "FullBright Loop",
    Callback = function()
task.spawn(function()
while task.wait(.1) do
local light = game.Lighting
light.Brightness = 31
light.GlobalShadows = false
            end
      end) 
end
})

ClientTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 300,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})
FETab:AddButton({
    Name = "BlackOutDay | Only works If the server just start",
    Callback = function()
        local args = {
	"SetState",
	{
		State = "BlackoutDay"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Vip"):FireServer(unpack(args))

    end
})
FETab:AddButton({
    Name = "BlueNight",
    Callback = function()
        local args = {
	"SetState",
	{
		State = "BlueNight"
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Vip"):FireServer(unpack(args))

    end
})

ClientTab:AddButton({
    Name = "Highlight Employee Loop",
    Callback = function()
task.spawn(function()
while task.wait(.1) do
for i, all in ipairs(workspace.GameObjects.Physical.Employees:GetChildren()) do Instance.new("Highlight").Parent = all end
            end
      end) 
end
})
