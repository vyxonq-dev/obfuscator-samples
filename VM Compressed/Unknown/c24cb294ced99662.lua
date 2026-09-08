
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local scripts = Instance.new("TextButton")
local About = Instance.new("TextButton")
local Discorduser = Instance.new("TextButton")
local about = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Scripts = Instance.new("Frame")
local titanage = Instance.new("TextButton")
local demonfall = Instance.new("TextButton")
local AHerosDestiny = Instance.new("TextButton")
local reaper2 = Instance.new("TextButton")
local LegacyEngine = Instance.new("TextButton")
local finalstand = Instance.new("TextButton")
local MurderMystery2 = Instance.new("TextButton")
local Prisonlife = Instance.new("TextButton")
local ServerHopper = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
MainFrame.BorderColor3 = Color3.fromRGB(42, 66, 83)
MainFrame.Position = UDim2.new(0.336080581, 0, 0.363736272, 0)
MainFrame.Size = UDim2.new(0, 571, 0, 310)
MainFrame.Active = true
MainFrame.Draggable = true

scripts.Name = "scripts"
scripts.Parent = MainFrame
scripts.BackgroundColor3 = Color3.fromRGB(48, 61, 102)
scripts.Position = UDim2.new(-0.000239856541, 0, -2.98023224e-08, 0)
scripts.Size = UDim2.new(0, 172, 0, 47)
scripts.Font = Enum.Font.SourceSansBold
scripts.Text = "Scripts"
scripts.TextColor3 = Color3.fromRGB(0, 0, 0)
scripts.TextScaled = true
scripts.TextSize = 14.000
scripts.TextWrapped = true


About.Name = "About"
About.Parent = MainFrame
About.BackgroundColor3 = Color3.fromRGB(48, 61, 102)
About.Position = UDim2.new(0.300986052, 0, 0, 0)
About.Size = UDim2.new(0, 204, 0, 47)
About.Font = Enum.Font.SourceSansBold
About.Text = "About"
About.TextColor3 = Color3.fromRGB(0, 0, 0)
About.TextScaled = true
About.TextSize = 14.000
About.TextWrapped = true

Discorduser.Name = "Discorduser"
Discorduser.Parent = MainFrame
Discorduser.BackgroundColor3 = Color3.fromRGB(48, 61, 102)
Discorduser.Position = UDim2.new(0.658254027, 0, 0, 0)
Discorduser.Size = UDim2.new(0, 195, 0, 47)
Discorduser.Font = Enum.Font.SourceSansBold
Discorduser.Text = "Gui V3 | made by unluckydj#8573"
Discorduser.TextColor3 = Color3.fromRGB(0, 0, 0)
Discorduser.TextScaled = true
Discorduser.TextSize = 14.000
Discorduser.TextWrapped = true

about.Name = "about"
about.Parent = MainFrame
about.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
about.Position = UDim2.new(0.00175131345, 0, 0.151612908, 0)
about.Size = UDim2.new(0, 569, 0, 263)
about.Visible = false

TextLabel.Parent = about
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "THIS IS JUST A GUI THIS SCRIPTS ARE NOT MINE"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

Scripts.Name = "Scripts"
Scripts.Parent = MainFrame
Scripts.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Scripts.BackgroundTransparency = 1.000
Scripts.Position = UDim2.new(0, 0, 0.151612908, 0)
Scripts.Size = UDim2.new(0, 570, 0, 263)

titanage.Name = "titanage"
titanage.Parent = Scripts
titanage.BackgroundColor3 = Color3.fromRGB(26, 111, 111)
titanage.Position = UDim2.new(0, 0, 0.0684410632, 0)
titanage.Size = UDim2.new(0, 170, 0, 56)
titanage.Font = Enum.Font.SourceSansBold
titanage.Text = "titanage"
titanage.TextColor3 = Color3.fromRGB(0, 0, 0)
titanage.TextScaled = true
titanage.TextSize = 14.000
titanage.TextWrapped = true
titanage.MouseButton1Down:connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/xennyy/Scripts/main/Titanage.lua'))()
end)

demonfall.Name = "demonfall"
demonfall.Parent = Scripts
demonfall.BackgroundColor3 = Color3.fromRGB(26, 111, 111)
demonfall.Position = UDim2.new(0.350877196, 0, 0.0684410632, 0)
demonfall.Size = UDim2.new(0, 170, 0, 56)
demonfall.Font = Enum.Font.SourceSansBold
demonfall.Text = "demonfall"
demonfall.TextColor3 = Color3.fromRGB(0, 0, 0)
demonfall.TextScaled = true
demonfall.TextSize = 14.000
demonfall.TextWrapped = true
demonfall.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LeadMarker/OpenSource/main/Demonfall.lua"))()
end)

AHerosDestiny.Name = "A Hero's Destiny"
AHerosDestiny.Parent = Scripts
AHerosDestiny.BackgroundColor3 = Color3.fromRGB(26, 111, 111)
AHerosDestiny.Position = UDim2.new(0.680701733, 0, 0.0684410632, 0)
AHerosDestiny.Size = UDim2.new(0, 170, 0, 56)
AHerosDestiny.Font = Enum.Font.SourceSansBold
AHerosDestiny.Text = "A Hero's Destiny"
AHerosDestiny.TextColor3 = Color3.fromRGB(0, 0, 0)
AHerosDestiny.TextScaled = true
AHerosDestiny.TextSize = 14.000
AHerosDestiny.TextWrapped = true
AHerosDestiny.MouseButton1Down:connect(function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/ttd1108/Script/master/aherosdestiny2'), true))()
end)

reaper2.Name = "reaper 2"
reaper2.Parent = Scripts
reaper2.BackgroundColor3 = Color3.fromRGB(26, 111, 111)
reaper2.Position = UDim2.new(0.680701733, 0, 0.380228132, 0)
reaper2.Size = UDim2.new(0, 170, 0, 56)
reaper2.Font = Enum.Font.SourceSansBold
reaper2.Text = "reaper 2"
reaper2.TextColor3 = Color3.fromRGB(0, 0, 0)
reaper2.TextScaled = true
reaper2.TextSize = 14.000
reaper2.TextWrapped = true
reaper2.MouseButton1Down:connect(function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/Reaper2'),true))()
end)

LegacyEngine.Name = "Legacy Engine"
LegacyEngine.Parent = Scripts
LegacyEngine.BackgroundColor3 = Color3.fromRGB(26, 111, 111)
LegacyEngine.Position = UDim2.new(0.350877166, 0, 0.380228132, 0)
LegacyEngine.Size = UDim2.new(0, 170, 0, 56)
LegacyEngine.Font = Enum.Font.SourceSansBold
LegacyEngine.Text = "legacy Engine"
LegacyEngine.TextColor3 = Color3.fromRGB(0, 0, 0)
LegacyEngine.TextScaled = true
LegacyEngine.TextSize = 14.000
LegacyEngine.TextWrapped = true
LegacyEngine.MouseButton1Down:connect(function()
	loadstring(game:HttpGet('https://github.com/LeanNBud/LegacyEngine/raw/main/DBOG/loader', true))()
end)

finalstand.Name = "final stand"
finalstand.Parent = Scripts
finalstand.BackgroundColor3 = Color3.fromRGB(26, 111, 111)
finalstand.Position = UDim2.new(0.00175437331, 0, 0.380228132, 0)
finalstand.Size = UDim2.new(0, 170, 0, 56)
finalstand.Font = Enum.Font.SourceSansBold
finalstand.Text = "final stand"
finalstand.TextColor3 = Color3.fromRGB(0, 0, 0)
finalstand.TextScaled = true
finalstand.TextSize = 14.000
finalstand.TextWrapped = true
finalstand.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Sys0002/luau/main/AutoQuestPlay.lua"))()
end)

MurderMystery2.Name = "Murder Mystery 2"
MurderMystery2.Parent = Scripts
MurderMystery2.BackgroundColor3 = Color3.fromRGB(26, 111, 111)
MurderMystery2.Position = UDim2.new(0.00175437331, 0, 0.722433448, 0)
MurderMystery2.Size = UDim2.new(0, 170, 0, 56)
MurderMystery2.Font = Enum.Font.SourceSansBold
MurderMystery2.Text = "Murder Mystery 2"
MurderMystery2.TextColor3 = Color3.fromRGB(0, 0, 0)
MurderMystery2.TextScaled = true
MurderMystery2.TextSize = 14.000
MurderMystery2.TextWrapped = true
MurderMystery2.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cjdjmj/new-ui-godmode/main/README.md", true))()
end)

Prisonlife.Name = "Prison life"
Prisonlife.Parent = Scripts
Prisonlife.BackgroundColor3 = Color3.fromRGB(26, 111, 111)
Prisonlife.Position = UDim2.new(0.350877166, 0, 0.722433448, 0)
Prisonlife.Size = UDim2.new(0, 170, 0, 56)
Prisonlife.Font = Enum.Font.SourceSansBold
Prisonlife.Text = "Prison life"
Prisonlife.TextColor3 = Color3.fromRGB(0, 0, 0)
Prisonlife.TextScaled = true
Prisonlife.TextSize = 14.000
Prisonlife.TextWrapped = true
Prisonlife.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/9ab2s523"))()

end)

ServerHopper.Name = "Server Hopper"
ServerHopper.Parent = Scripts
ServerHopper.BackgroundColor3 = Color3.fromRGB(26, 111, 111)
ServerHopper.Position = UDim2.new(0.680701733, 0, 0.722433448, 0)
ServerHopper.Size = UDim2.new(0, 170, 0, 56)
ServerHopper.Font = Enum.Font.SourceSansBold
ServerHopper.Text = "Server Hopper"
ServerHopper.TextColor3 = Color3.fromRGB(0, 0, 0)
ServerHopper.TextScaled = true
ServerHopper.TextSize = 14.000
ServerHopper.TextWrapped = true
ServerHopper.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/KeoneGithub/KeoneGithub/main/ServerHopperUniversal"))()
end)

-- Scripts:

local function KDBAUXI_fake_script() -- scripts.LocalScript 
	local script = Instance.new('LocalScript', scripts)

	script.Parent.MouseButton1Down:connect(function()
		script.Parent.Parent.scripts.Visible = true
		script.parent.parent.About.Visiable = false
	end)
end
coroutine.wrap(KDBAUXI_fake_script)()
local function QWCR_fake_script() -- About.LocalScript 
	local script = Instance.new('LocalScript', About)

	script.Parent.MouseButton1Down:connect(function()
		script.Parent.Parent.scripts.Visible = false
		script.parent.parent.About.Visiable = true
	end)
end
coroutine.wrap(QWCR_fake_script)()
