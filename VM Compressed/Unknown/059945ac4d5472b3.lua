

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local legecyenginescript = Instance.new("TextButton")
local ProjectMenacing = Instance.new("TextButton")
local Breackinstory = Instance.new("TextButton")
local jackshub = Instance.new("TextButton")
local togascript = Instance.new("TextButton")
local petsim = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(111, 231, 255)
Main.Position = UDim2.new(0.494505525, 0, 0.462637424, 0)
Main.Size = UDim2.new(0, 382, 0, 230)
Main.Active = true
Main.Draggable = true

TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(158, 184, 255)
TextLabel.Size = UDim2.new(0, 382, 0, 27)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Gui v2  | by unluckydj"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

legecyenginescript.Name = "legecy engine script"
legecyenginescript.Parent = TextLabel
legecyenginescript.BackgroundColor3 = Color3.fromRGB(121, 94, 255)
legecyenginescript.Position = UDim2.new(0.612565458, 0, 1.55555558, 0)
legecyenginescript.Size = UDim2.new(0, 135, 0, 35)
legecyenginescript.Font = Enum.Font.SourceSans
legecyenginescript.Text = "Legecy engine script"
legecyenginescript.TextColor3 = Color3.fromRGB(0, 0, 0)
legecyenginescript.TextSize = 14.000
legecyenginescript.MouseButton1Down:connect(function()
	loadstring(game:HttpGet('https://github.com/LeanNBud/LegacyEngine/raw/main/DBOG/loader', true))()
end)

ProjectMenacing.Name = "Project Menacing"
ProjectMenacing.Parent = TextLabel
ProjectMenacing.BackgroundColor3 = Color3.fromRGB(121, 94, 255)
ProjectMenacing.Position = UDim2.new(0.0340314507, 0, 4, 0)
ProjectMenacing.Size = UDim2.new(0, 135, 0, 35)
ProjectMenacing.Font = Enum.Font.SourceSans
ProjectMenacing.Text = "Project Menacing"
ProjectMenacing.TextColor3 = Color3.fromRGB(0, 0, 0)
ProjectMenacing.TextSize = 14.000
ProjectMenacing.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/heber126/JojoGame/main/eeeeeeeeeeeeeee",true))()
end)

Breackinstory.Name = "Breack in story"
Breackinstory.Parent = TextLabel
Breackinstory.BackgroundColor3 = Color3.fromRGB(121, 94, 255)
Breackinstory.Position = UDim2.new(0.0340314507, 0, 6.55555582, 0)
Breackinstory.Size = UDim2.new(0, 135, 0, 35)
Breackinstory.Font = Enum.Font.SourceSans
Breackinstory.Text = "Breack in story"
Breackinstory.TextColor3 = Color3.fromRGB(0, 0, 0)
Breackinstory.TextSize = 14.000
Breackinstory.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Levi4Chan/Rblx-Scripts/main/Break-In.lua"))()
end)

jackshub.Name = "jacks hub"
jackshub.Parent = TextLabel
jackshub.BackgroundColor3 = Color3.fromRGB(121, 94, 255)
jackshub.Position = UDim2.new(0.612565458, 0, 6.55555582, 0)
jackshub.Size = UDim2.new(0, 135, 0, 35)
jackshub.Font = Enum.Font.SourceSans
jackshub.Text = "jacks hub"
jackshub.TextColor3 = Color3.fromRGB(0, 0, 0)
jackshub.TextSize = 14.000
jackshub.MouseButton1Down:connect(function()
	loadstring(game:HttpGet"https://pastebin.com/raw/eccv9pgu")()
end)

togascript.Name = "toga script"
togascript.Parent = TextLabel
togascript.BackgroundColor3 = Color3.fromRGB(121, 94, 255)
togascript.Position = UDim2.new(0.612565458, 0, 4, 0)
togascript.Size = UDim2.new(0, 135, 0, 35)
togascript.Font = Enum.Font.SourceSans
togascript.Text = "toga script"
togascript.TextColor3 = Color3.fromRGB(0, 0, 0)
togascript.TextSize = 14.000
togascript.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/HimikoToga1474/Ahegao-Hub/master/Main.Lua"))()
end)

petsim.Name = "pet sim"
petsim.Parent = TextLabel
petsim.BackgroundColor3 = Color3.fromRGB(121, 94, 255)
petsim.Position = UDim2.new(0.0340314507, 0, 1.55555558, 0)
petsim.Size = UDim2.new(0, 135, 0, 35)
petsim.Font = Enum.Font.SourceSans
petsim.Text = "pet sim"
petsim.TextColor3 = Color3.fromRGB(0, 0, 0)
petsim.TextSize = 14.000
petsim.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/kB7CVpBd"))()
end)
