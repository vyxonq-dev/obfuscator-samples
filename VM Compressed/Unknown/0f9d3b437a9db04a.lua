
local scriptFound = false
local spin = true
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local MarketPlaceService = game:GetService("MarketplaceService")
--Properties:
local function tweenTable(obj, time, args)
	game:GetService("TweenService"):Create(obj, TweenInfo.new(time, Enum.EasingStyle.Linear), args):Play()
end
ImageLabel.ImageTransparency = 1

local function typef(text)
	for i = 1,#text  do
		TextLabel.Text = string.sub(text, 1, i)
		wait(0.02)
	end
end
local function addScript(placeId, func)
	if game.PlaceId == tonumber(placeId) then
		scriptFound = true
spawn(function()
		
		spin = false
		typef("Script found for "..MarketPlaceService:GetProductInfo(placeId).Name.."; Now loading!")
		func()
		wait(3)
		typef("Deloading UI")
		wait(3)
		tweenTable(Frame, 3, {
			BackgroundTransparency = 1
		})

tweenTable(ImageLabel, 3,{
ImageTransparency =1
})
		tweenTable(TextLabel, 3,{
TextTransparency =1
})
		wait(3)
		ScreenGui:Remove()
end)
	end
end
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0.150000006, 0, 0.400000006, 0)
Frame.Transparency = 1

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Image = "rbxassetid://9319293234"

TextLabel.Parent = Frame
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.5, 0,1, 0)
TextLabel.Size = UDim2.new(1, 0, 0, 0)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.Text = ""
TextLabel.TextColor3 = Color3.fromRGB(214, 214, 214)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UICorner.CornerRadius = UDim.new(0.075000003, 0)
UICorner.Parent = Frame

wait(1)
tweenTable(Frame, 1.5, {
BackgroundTransparency = 0
})
tweenTable(ImageLabel, 1.5,{
ImageTransparency = 0
})
wait(1.5)
tweenTable(ImageLabel, 2, {
	Size = UDim2.new(0.5, 0,0.5, 0),
	Position = UDim2.new(0.249, 0,0.057, 0)
})
tweenTable(TextLabel, 2, {
	Position = UDim2.new(0.5, 0, 0.800000012, 0),
	Size = UDim2.new(1, 0, 0.400000006, 0)
})
typef("Scanning Peppermint's Github repositories for game script...")
wait(3)
-- funcs here

addScript("6576912941", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Peppermintsaregood/PeppermintsACGGUI/main/Main.lua"))()
end)
addScript("5580097107", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Peppermintsaregood/FrappeSnappe/main/loadstring.lua"))()
end)
addScript("9359839118", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Peppermintsaregood/gss/main/main.lua'))()
end)
-- if the script fails to load or the person doesnt have a powerful enough executer we wait then terminated the gui
if scriptFound == false then
	typef("No scripts found, Deloading UI")
	wait(3)
		tweenTable(Frame, 3, {
			BackgroundTransparency = 1
		})

tweenTable(ImageLabel, 3,{
ImageTransparency =1
})
		tweenTable(TextLabel, 3,{
TextTransparency =1
})

	wait(3)
	ScreenGui:Remove()
end
wait(7)
ScreenGui:Destroy()

