local demonfall = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local infyield = Instance.new("TextButton")
local v = Instance.new("TextLabel")
local _1 = Instance.new("TextButton")
local _2 = Instance.new("TextButton")
local _3 = Instance.new("TextButton")
local ARROW = Instance.new("TextButton")

demonfall.Name = "h"
demonfall.Parent = game.CoreGui
demonfall.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = demonfall
Main.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.421647877, 0, 0.396319032, 0)
Main.Size = UDim2.new(0.177221343, 0, 0.529447556, 0)
Main.Active = true
Main.Draggable = true

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 0.700
Title.Size = UDim2.new(0.999999881, 0, 0.165263668, 0)
Title.Font = Enum.Font.Code
Title.Text = "DEMONFALL EXPLOIT HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 25.000
Title.TextWrapped = true

infyield.Name = "infyield"
infyield.Parent = Main
infyield.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
infyield.BackgroundTransparency = 0.700
infyield.Position = UDim2.new(0.0961880982, 0, 0.195909619, 0)
infyield.Size = UDim2.new(0.241182789, 0, 0.0961087123, 0)
infyield.Font = Enum.Font.SourceSans
infyield.Text = "Infiniteyield Admin Commands"
infyield.TextColor3 = Color3.fromRGB(255, 255, 255)
infyield.TextScaled = true
infyield.TextSize = 14.000
infyield.TextWrapped = true
infyield.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

v.Name = "v"
v.Parent = Main
v.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
v.BackgroundTransparency = 1.000
v.Position = UDim2.new(0.0824678317, 0, 0.310148388, 0)
v.Size = UDim2.new(0.26389727, 0, 0.0584499724, 0)
v.Font = Enum.Font.Code
v.Text = "UNIVERSAL SCRIPT"
v.TextColor3 = Color3.fromRGB(255, 0, 0)
v.TextScaled = true
v.TextSize = 25.000
v.TextWrapped = true

_1.Name = "1"
_1.Parent = Main
_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_1.BackgroundTransparency = 0.700
_1.Position = UDim2.new(0.676517963, 0, 0.195909619, 0)
_1.Size = UDim2.new(0.241182789, 0, 0.0961087123, 0)
_1.Font = Enum.Font.SourceSans
_1.Text = "#1"
_1.TextColor3 = Color3.fromRGB(255, 255, 255)
_1.TextScaled = true
_1.TextSize = 14.000
_1.TextWrapped = true
_1.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/KeoneGithub/KeoneGithub/main/DemonCockCandy"))()
end)

_2.Name = "2"
_2.Parent = Main
_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_2.BackgroundTransparency = 0.700
_2.Position = UDim2.new(0.0870249942, 0, 0.423959911, 0)
_2.Size = UDim2.new(0.241182789, 0, 0.0961087123, 0)
_2.Font = Enum.Font.SourceSans
_2.Text = "#2"
_2.TextColor3 = Color3.fromRGB(255, 255, 255)
_2.TextScaled = true
_2.TextSize = 14.000
_2.TextWrapped = true
_2.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ghost-home/public/main/demonfall.lua', true))()
end)

_3.Name = "3"
_3.Parent = Main
_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_3.BackgroundTransparency = 0.700
_3.Position = UDim2.new(0.667354882, 0, 0.423959911, 0)
_3.Size = UDim2.new(0.241182789, 0, 0.0961087123, 0)
_3.Font = Enum.Font.SourceSans
_3.Text = "#3"
_3.TextColor3 = Color3.fromRGB(255, 255, 255)
_3.TextScaled = true
_3.TextSize = 14.000
_3.TextWrapped = true
_3.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LioK251/Scripts/main/"..game.PlaceId..".lua"))()
end)

ARROW.Name = "ARROW"
ARROW.Parent = demonfall
ARROW.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ARROW.BackgroundTransparency = 0.700
ARROW.Position = UDim2.new(0.421464115, 0, 0.369207025, 0)
ARROW.Size = UDim2.new(0.0357849374, 0, 0.0260349363, 0)
ARROW.Font = Enum.Font.SourceSans
ARROW.Text = "Close"
ARROW.TextColor3 = Color3.fromRGB(255, 255, 255)
ARROW.TextScaled = true
ARROW.TextSize = 14.000
ARROW.TextWrapped = true
ARROW.Draggable = true

-- Scripts:

local function PHEPTLY_fake_script() -- ARROW.openclose 
	local script = Instance.new('LocalScript', ARROW)

	local buttontopress = script.Parent
	local closingthingy = script.Parent.Parent.Main
	local closed = false
	
	buttontopress.MouseButton1Click:Connect(function()
		if closed == false then
			closingthingy.Visible = false
			buttontopress.Text = "Open"
			closed = true
		elseif closed == true then
			closingthingy.Visible = true
			buttontopress.Text = "Close"
			closed = false
		end
	end)
end
coroutine.wrap(PHEPTLY_fake_script)()
