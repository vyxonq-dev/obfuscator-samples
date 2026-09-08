-- Gui to Lua
-- Version: 3.2

-- Instances:

local InnohubLoader = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")

--Properties:

InnohubLoader.Name = "Innohub Loader"
InnohubLoader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
InnohubLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = InnohubLoader
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.5, 0, -2.0940001, 0)
Frame.Size = UDim2.new(0, 50, 0, 50)

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Image = "http://www.roblox.com/asset/?id=9349764246"

TextLabel.Parent = InnohubLoader
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(1, 0, 0.386999995, 0)
TextLabel.Size = UDim2.new(0.15488565, 0, 0.0517529212, 0)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Innohub loaded"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 36.000
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true

-- Scripts:

local function HOSXP_fake_script() -- Frame.FrameMoveScript 
	local script = Instance.new('LocalScript', Frame)

	wait("3")
	script.Parent:TweenPosition(UDim2.new(0.5,0,0.4,0),"Out","Sine",1.5)
	wait("3")
	script.Parent:TweenPosition(UDim2.new(1.5,0,0.01,0),"Out","Sine",1.7)
end
coroutine.wrap(HOSXP_fake_script)()
local function CYPOUN_fake_script() -- TextLabel.TextMoveScript 
	local script = Instance.new('LocalScript', TextLabel)

	wait(1)
	script.Parent:TweenPosition(UDim2.new(0,0,0.01,0),"Out","Sine",1.7)
	wait(5)
	script.Parent:TweenPosition(UDim2.new(-1,0,0.01,0),"Out","Sine",1.7)
end
coroutine.wrap(CYPOUN_fake_script)()
wait("7")
local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()

local MainUI = UILibrary.Load("InnoHub - AR-sub v4")
local FirstPage = MainUI.AddPage("Maps")
local TeamsNShit = MainUI.AddPage("Teams")
local ThirdPage = MainUI.AddPage("Credits")

local aegarafdfsgsdghfdhfgjgfhrasfasf = FirstPage.AddButton("Glacier", function()
    game.Workspace.Map:Destroy()
    game:GetObjects("rbxassetid://6232128004")[1].Parent = workspace
end)

local asdfasfdasfsadfasfdasdfsafasfd = FirstPage.AddButton("Tuscan", function()
    game.Workspace.Map:Destroy()
    game:GetObjects("rbxassetid://8841164335")[1].Parent = workspace
end)
    
local adsfsdfsadfasfasfd = FirstPage.AddButton("Sandtown", function()
    game.Workspace.Map:Destroy()
    game:GetObjects("rbxassetid://9368314696")[1].Parent = workspace
end)
 

local SecondBasfdasdfutton = FirstPage.AddButton("Hillside", function()
    game.Workspace.Map:Destroy()
    game:GetObjects("rbxassetid://6099656856")[1].Parent = workspace
end)
 
local SecondasdfafssafdafdsfsaButton = FirstPage.AddButton("Matrix", function()
    game.Workspace.Map:Destroy()
    game:GetObjects("rbxassetid://6887336684")[1].Parent = workspace
end)
 
local SecoafsdfsdafdsafdsasfasfagdfasdgfaaersdfndButton = FirstPage.AddButton("Dizzy", function()
    game.Workspace.Map:Destroy()
    game:GetObjects("rbxassetid://8835956502")[1].Parent = workspace
end)
 
local Snesthen = TeamsNShit.AddButton("Purple team", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Innocentallity/Scripts/main/APurpleTeam"))();
end)
 
local wassupitsmeorangegamer = TeamsNShit.AddButton("Green team", function()
    loadstring(game:HttpGet("https://github.com/Innocentallity/Scripts/blob/main/AGreenTeam"))();
end)
 
local rawrtodaywewilleatballs = TeamsNShit.AddButton("Yellow team", function()
    loadstring(game:HttpGet("https://github.com/Innocentallity/Scripts/blob/main/AYellowTeam"))();
end)

local FirstLabelYay = ThirdPage.AddLabel("LosSantosDev#0901 - Ban menu and bypass")
local FourthLabel = ThirdPage.AddLabel("MikeyXD#9235 - Ban menu and AR-sub V4")
local SecondLabel = ThirdPage.AddLabel("Inno#0005 - Skins, Melees")

local FifthButton = ThirdPage.AddButton("Join Inno's Discord (Link will copy to clipboard)", function()
    setclipboard("https://discord.gg/N9Xg6xAkfB")
end)
