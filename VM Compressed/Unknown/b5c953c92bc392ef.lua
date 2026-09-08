local GameId = game.GameId
local NotificationLoad = loadstring(game:HttpGet(('https://raw.githubusercontent.com/treeofplant/Notif/main/library.lua'),true))()

local Links = {
    [1490130369] = {
        ScriptLink = "https://api.luarmor.net/files/v3/loaders/b51325b35c4c7cf0eddf46b4f9657f74.lua",
        KeyLink = "https://discord.gg/3mrasRydM2"
    },
    [7436755782] = {
        ScriptLink = "https://api.luarmor.net/files/v3/loaders/cd2b976f54b489cf4ee7cf4be0a54bf8.lua",
        KeyLink = "https://discord.gg/3mrasRydM2"
		    },
	[8355209732] = {
    ScriptLink = "https://api.luarmor.net/files/v3/loaders/89f97251dfb423c181a6ebcd890efeb0.lua",
    KeyLink = "https://discord.gg/3mrasRydM2"
		    },
    [8306754181] = {
        ScriptLink = "https://api.luarmor.net/files/v3/loaders/9a1b7cb50cf339d37d89362b275a54c2.lua",
        KeyLink = "https://discord.gg/3mrasRydM2"
    }

}

if not Links[GameId] then
    NotificationLoad:NewNotification({
		["Mode"] = "info",
		["Title"] = "Game Not Supported",
		["Description"] = "Lightux does not support the game you are playing.",
		["Timeout"] = 7,
		["Audio"] = true 
	})
    return
end


local KEYSYSTEM = Instance.new("ScreenGui")
local Frame = Instance.new("ImageLabel")
local Frame_2 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local Frame_3 = Instance.new("Frame")
local Frame_4 = Instance.new("Frame")
local TextBox = Instance.new("Frame")
local KeyInput = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local Frame_5 = Instance.new("Frame")
local CheckKey = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local CopyWebsite = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")
local UICorner_5 = Instance.new("UICorner")
local Close = Instance.new("ImageButton")



KEYSYSTEM.Name = "KEYSYSTEM"

if gethui then
	KEYSYSTEM.Parent = gethui()
else
	KEYSYSTEM.Parent = game:FindFirstChildWhichIsA("CoreGui")
end

KEYSYSTEM.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Name = "Frame"
Frame.Parent = KEYSYSTEM
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.161640152, 0, 0.160551667, 0)
Frame.Size = UDim2.new(0, 450, 0, 280)
Frame.Image = "http://www.roblox.com/asset/?id=15229583503"

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.166666672, 0, 0.242857143, 0)
Frame_2.Size = UDim2.new(0, 299, 0, 143)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Frame_2

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.384615391, 0, 0.0489510484, 0)
TextLabel.Size = UDim2.new(0, 70, 0, 20)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Key System"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.188811183, 0)
TextLabel_2.Size = UDim2.new(0, 299, 0, 13)
TextLabel_2.Font = Enum.Font.SourceSansBold
TextLabel_2.Text = "Enter your key in for the scripthub"
TextLabel_2.TextColor3 = Color3.fromRGB(152, 152, 152)
TextLabel_2.TextSize = 12.000

Frame_3.Parent = Frame_2
Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.618729115, 0, 0.125874132, 0)
Frame_3.Size = UDim2.new(0, 60, 0, 2)

Frame_4.Parent = Frame_2
Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.new(0.18394649, 0, 0.125874132, 0)
Frame_4.Size = UDim2.new(0, 60, 0, 2)

TextBox.Name = "TextBox"
TextBox.Parent = Frame_2
TextBox.Active = true
TextBox.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextBox.BorderColor3 = Color3.fromRGB(85, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0533653423, 0, 0.373193264, 0)
TextBox.Selectable = true
TextBox.Size = UDim2.new(0, 267, 0, 26)

KeyInput.Name = "KeyInput"
KeyInput.Parent = TextBox
KeyInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.BackgroundTransparency = 1.000
KeyInput.BorderColor3 = Color3.fromRGB(27, 42, 53)
KeyInput.ClipsDescendants = true
KeyInput.Position = UDim2.new(0.0209792927, 0, 0, 0)
KeyInput.Size = UDim2.new(0, 261, 0, 22)
KeyInput.ClearTextOnFocus = false
KeyInput.Font = Enum.Font.SourceSansSemibold
KeyInput.PlaceholderText = "Paste Key"
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 13.000
KeyInput.TextXAlignment = Enum.TextXAlignment.Left

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = TextBox

Frame_5.Parent = TextBox
Frame_5.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_5.BorderSizePixel = 0
Frame_5.Position = UDim2.new(0, 0, 0.923076928, 0)
Frame_5.Size = UDim2.new(0, 267, 0, 2)

CheckKey.Name = "Check Key"
CheckKey.Parent = Frame_2
CheckKey.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
CheckKey.BorderColor3 = Color3.fromRGB(85, 0, 0)
CheckKey.BorderSizePixel = 0
CheckKey.Position = UDim2.new(0.0533653423, 0, 0.587152421, 0)
CheckKey.Size = UDim2.new(0, 267, 0, 24)
CheckKey.Font = Enum.Font.SourceSansBold
CheckKey.Text = "Check Key"
CheckKey.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKey.TextSize = 12.000

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = CheckKey

CopyWebsite.Name = "CopyWebsite"
CopyWebsite.Parent = Frame_2
CopyWebsite.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
CopyWebsite.BorderColor3 = Color3.fromRGB(85, 0, 0)
CopyWebsite.BorderSizePixel = 0
CopyWebsite.Position = UDim2.new(0.618729115, 0, 0.780996442, 0)
CopyWebsite.Size = UDim2.new(0, 97, 0, 25)
CopyWebsite.Font = Enum.Font.SourceSansSemibold
CopyWebsite.Text = "Copy Key Link"
CopyWebsite.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyWebsite.TextSize = 12.000

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = CopyWebsite

TextLabel_3.Parent = Frame_2
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.0801211968, 0, 0.791060865, 0)
TextLabel_3.Size = UDim2.new(0, 161, 0, 23)
TextLabel_3.Font = Enum.Font.SourceSansBold
TextLabel_3.Text = "Paste Link Into Discord --->"
TextLabel_3.TextColor3 = Color3.fromRGB(152, 152, 152)
TextLabel_3.TextSize = 12.000
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

TextLabel_4.Parent = Frame_2
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.879452288, 0, 1.30854344, 0)
TextLabel_4.Size = UDim2.new(0, 112, 0, 23)
TextLabel_4.Font = Enum.Font.SourceSansBold
TextLabel_4.Text = "discord.gg/3mrasRydM2"
TextLabel_4.TextColor3 = Color3.fromRGB(152, 152, 152)
TextLabel_4.TextSize = 12.000
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = Frame
DropShadowHolder.BackgroundTransparency = 1.000
DropShadowHolder.BorderColor3 = Color3.fromRGB(27, 42, 53)
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0

DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderColor3 = Color3.fromRGB(27, 42, 53)
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6014261993"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

UICorner_5.CornerRadius = UDim.new(0, 5)
UICorner_5.Parent = Frame

Close.Name = "Close"
Close.Parent = Frame
Close.Active = false
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(27, 42, 53)
Close.Position = UDim2.new(0.937359333, 0, 0.0315438956, 0)
Close.Selectable = false
Close.Size = UDim2.new(0, 21, 0, 21)
Close.Image = "http://www.roblox.com/asset/?id=12707060750"


Frame.AnchorPoint = Vector2.new(0.5, 0.5) -- Adjusts anchor to the center
Frame.Position = UDim2.new(0.5, 0, 0.5, 0) -- Centered based on Scale
pcall(function() local a=game:GetService("UserInputService")local b=game:GetService("RunService")local c=Frame;local d;local e;local f;local g;function Lerp(h,i,j)return h+(i-h)*j end;local k;local l;local m=8;function Update(n)if not g then return end;if not d and l then c.Position=UDim2.new(g.X.Scale,Lerp(c.Position.X.Offset,l.X.Offset,n*m),g.Y.Scale,Lerp(c.Position.Y.Offset,l.Y.Offset,n*m))return end;local o=k-a:GetMouseLocation()local p=g.X.Offset-o.X;local q=g.Y.Offset-o.Y;l=UDim2.new(g.X.Scale,p,g.Y.Scale,q)c.Position=UDim2.new(g.X.Scale,Lerp(c.Position.X.Offset,p,n*m),g.Y.Scale,Lerp(c.Position.Y.Offset,q,n*m))end;c.InputBegan:Connect(function(r)if r.UserInputType==Enum.UserInputType.MouseButton1 or r.UserInputType==Enum.UserInputType.Touch then d=true;f=r.Position;g=c.Position;k=a:GetMouseLocation()r.Changed:Connect(function()if r.UserInputState==Enum.UserInputState.End then d=false end end)end end)c.InputChanged:Connect(function(r)if r.UserInputType==Enum.UserInputType.MouseMovement or r.UserInputType==Enum.UserInputType.Touch then e=r end end)b.Heartbeat:Connect(Update) end)
---
CopyWebsite.MouseButton1Click:Connect(function()
	NotificationLoad:NewNotification({

		["Mode"] = "success",
		["Title"] = "Copied to clipboard",
		["Description"] = "You must follow the copied link in order to get the key",
		["Timeout"] = 10,
		["Audio"] = true 
	})
	setclipboard(Links[GameId].KeyLink)
end)

CheckKey.MouseButton1Click:Connect(function()
	script_key=KeyInput.Text;
	task.delay(2, function()
	    KEYSYSTEM:Destroy()
	end)
	loadstring(game:HttpGet(Links[GameId].ScriptLink))()
end)


Close.MouseButton1Click:Connect(function()
	KEYSYSTEM:Destroy()
end)
