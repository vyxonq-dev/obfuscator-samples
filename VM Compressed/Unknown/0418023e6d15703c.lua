loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()

if game.GameId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game search: [UP] Just a baseplate. - creator: the local maze")
end

if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui")b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ResetOnSpawn=false b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: [UP] Just a baseplate. /  Green baseplate., game creator: the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer) return end


local G2l={}

G2l["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
G2l["ScreenGui_1"].IgnoreGuiInset=true
G2l["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling
G2l["ScreenGui_1"].ResetOnSpawn=false

G2l["Frame_2"]=Instance.new("Frame",G2l["ScreenGui_1"])
G2l["Frame_2"].BorderSizePixel=0
G2l["Frame_2"].BackgroundColor3=Color3.fromRGB(25,25,25)
G2l["Frame_2"].AnchorPoint=Vector2.new(.5,.5)
G2l["Frame_2"].Size=UDim2.new(.18,0,.55,0)
G2l["Frame_2"].Position=UDim2.new(.5,0,.5,0)

Instance.new("UICorner",G2l["Frame_2"]).CornerRadius=UDim.new(.06,0)
Instance.new("UIStroke",G2l["Frame_2"]).Color=Color3.fromRGB(255,60,60)
Instance.new("UIDragDetector",G2l["Frame_2"])

G2l["Top"]=Instance.new("Frame",G2l["Frame_2"])
G2l["Top"].BorderSizePixel=0
G2l["Top"].BackgroundColor3=Color3.fromRGB(40,40,40)
G2l["Top"].Size=UDim2.new(1,0,.08,0)

G2l["Title"]=Instance.new("TextLabel",G2l["Top"])
G2l["Title"].BackgroundTransparency=1
G2l["Title"].Size=UDim2.new(.8,0,1,0)
G2l["Title"].Position=UDim2.new(.05,0,0,0)
G2l["Title"].Text="red hub"
G2l["Title"].TextScaled=true
G2l["Title"].TextColor3=Color3.fromRGB(255,80,80)
G2l["Title"].FontFace=Font.new("rbxasset://fonts/families/Oswald.json")

G2l["Close"]=Instance.new("TextButton",G2l["Top"])
G2l["Close"].Text="X"
G2l["Close"].TextScaled=true
G2l["Close"].Size=UDim2.new(.12,0,.8,0)
G2l["Close"].Position=UDim2.new(.86,0,.1,0)
G2l["Close"].BackgroundColor3=Color3.fromRGB(150,0,0)
G2l["Close"].TextColor3=Color3.fromRGB(255,255,255)

G2l["ScrollingFrame"]=Instance.new("ScrollingFrame",G2l["Frame_2"])
G2l["ScrollingFrame"].BorderSizePixel=0
G2l["ScrollingFrame"].BackgroundTransparency=1
G2l["ScrollingFrame"].AutomaticCanvasSize=Enum.AutomaticSize.Y
G2l["ScrollingFrame"].ScrollBarThickness=4
G2l["ScrollingFrame"].Size=UDim2.new(.95,0,.88,0)
G2l["ScrollingFrame"].Position=UDim2.new(.025,0,.1,0)

local layout=Instance.new("UIListLayout",G2l["ScrollingFrame"])
layout.Padding=UDim.new(.03,0)

local template=Instance.new("TextButton",G2l["ScrollingFrame"])
template.Visible=false
template.Size=UDim2.new(1,0,.1,0)
template.TextScaled=true
template.BorderSizePixel=0
template.BackgroundColor3=Color3.fromRGB(120,0,0)
template.TextColor3=Color3.fromRGB(255,255,255)

local function create(name,call)
	local b=template:Clone()
	b.Parent=G2l["ScrollingFrame"]
	b.Text=name
	b.Visible=true
	b.MouseButton1Click:Connect(function()
		pcall(call)
	end)
end
create("achromatix", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/achromatix.luau"))()
end)

create("acromatic", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/acromatic.luau"))()
end)

create("anyhub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/anyhub.luau"))()
end)

create("banhammer", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/banhammer.luau"))()
end)

create("blockcar", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/blockcar.luau"))()
end)

create("burger blood", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/burgerblood.luau"))()
end)

create("chill", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/chill.luau"))()
end)

create("combine", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/combine.luau"))()
end)

create("cop", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/cop.luau"))()
end)

create("cursor dog", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/cursordog.luau"))()
end)

create("fake vr", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/fakrvr.luau"))()
end)

create("flame", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/flame.luau"))()
end)

create("friend", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/friend.luau"))()
end)

create("grass hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/grasshub.luau"))()
end)

create("holiday", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/holiday.luau"))()
end)

create("holi hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/holihub.luau"))()
end)

create("jabhub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/jabhubth.luau"))()
end)

create("laser", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/laser.luau"))()
end)

create("minions", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/minions.luau"))()
end)

create("rebel", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/rebel.luau"))()
end)

create("ruinx", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/ruinx.luau"))()
end)

create("vr", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/vr.luau"))()
end)

create("warden", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/warden.luau"))()
end)

create("xr", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/xr.luau"))()
end)

create("zerox", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/zerox.luau"))()
end)


G2l["Close"].MouseButton1Click:Connect(function()
	G2l["ScreenGui_1"]:Destroy()
end)

return G2l["ScreenGui_1"],require
