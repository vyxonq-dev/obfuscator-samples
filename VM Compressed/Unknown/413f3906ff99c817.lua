if not isfolder("ScriptBase") then
	makefolder("ScriptBase")
end

if not isfile("ScriptBase/notification.mp3") then
	writefile("ScriptBase/notification.mp3", game:HttpGet("https://github.com/CatThatDrinksSprite/Moon-Convert/raw/main/ScriptBase/notification.mp3", true))
end

loadstring(game:HttpGet("https://github.com/CatThatDrinksSprite/Moon-Convert/raw/main/Scripts/Main/scriptcmds.lua", true))()
loadstring(game:HttpGet("https://github.com/CatThatDrinksSprite/Moon-Convert/raw/main/Scripts/Other/sendNotification.lua", true))()
sendNotification("Moon Convert", "gg/DPBtncwaEm", 7)
print(game.PlaceId)
if game.PlaceId == 123974602339071 or game.PlaceId == 88308889239232 then
	print("good")
else
	sendNotification("Moon Convert", "This script only works in Just a baseplate, or Green baseplate.", 7)
	error("bad")
end
local userinputService = game:GetService("UserInputService")
local textchatService = game:GetService("TextChatService")

if game.CoreGui:FindFirstChild("Moon Convert") then
	sendNotification("Moon Convert", "Script is already loaded! Press RALT to open the Commandbar.", 7)
	error("bad")
end

local Converted = {
	["_Moon Convert"] = Instance.new("ScreenGui");
	["_Cmdbar"] = Instance.new("TextBox");
	["_UICorner"] = Instance.new("UICorner");
	["_UIPadding"] = Instance.new("UIPadding");
	["_UIStroke"] = Instance.new("UIStroke");
	["_Clipper"] = Instance.new("CanvasGroup");
	["_UICorner1"] = Instance.new("UICorner");
	["_Frame"] = Instance.new("Frame");
	["_UICorner2"] = Instance.new("UICorner");
	["_UIPadding1"] = Instance.new("UIPadding");
	["_UICorner3"] = Instance.new("UICorner");
}

Converted["_Moon Convert"].DisplayOrder = 2147483647
Converted["_Moon Convert"].IgnoreGuiInset = true
Converted["_Moon Convert"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_Moon Convert"].Enabled = false
Converted["_Moon Convert"].ResetOnSpawn = false
Converted["_Moon Convert"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_Moon Convert"].Name = "Moon Convert"
Converted["_Moon Convert"].Parent = game:GetService("CoreGui")

Converted["_Cmdbar"].Font = Enum.Font.SourceSans
Converted["_Cmdbar"].PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Cmdbar"].PlaceholderText = "Type a command here! Type \"cmds\" for a list of commands..."
Converted["_Cmdbar"].ShowNativeInput = false
Converted["_Cmdbar"].Text = ""
Converted["_Cmdbar"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Cmdbar"].TextSize = 16
Converted["_Cmdbar"].TextWrapped = true
Converted["_Cmdbar"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Cmdbar"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Cmdbar"].BackgroundColor3 = Color3.fromRGB(39.00000147521496, 39.00000147521496, 39.00000147521496)
Converted["_Cmdbar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Cmdbar"].BorderSizePixel = 0
Converted["_Cmdbar"].Position = UDim2.new(0.5, 0, 1.20000005, 0)
Converted["_Cmdbar"].Size = UDim2.new(0.800000012, 0, 0.0299999993, 0)
Converted["_Cmdbar"].Name = "Cmdbar"
Converted["_Cmdbar"].Parent = Converted["_Moon Convert"]
--// one stupid thing i forgot on the original ui
Converted["_Cmdbar"].ClearTextOnFocus = false

Converted["_UICorner"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner"].Parent = Converted["_Cmdbar"]

Converted["_UIPadding"].PaddingLeft = UDim.new(0, 12)
Converted["_UIPadding"].Parent = Converted["_Cmdbar"]

Converted["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke"].Color = Color3.fromRGB(102.00000151991844, 102.00000151991844, 102.00000151991844)
Converted["_UIStroke"].Parent = Converted["_Cmdbar"]

Converted["_Clipper"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Clipper"].BackgroundTransparency = 1
Converted["_Clipper"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Clipper"].BorderSizePixel = 0
Converted["_Clipper"].Position = UDim2.new(0, -12, 0, 0)
Converted["_Clipper"].Size = UDim2.new(1, 12, 1, 0)
Converted["_Clipper"].Name = "Clipper"
Converted["_Clipper"].Parent = Converted["_Cmdbar"]

Converted["_UICorner1"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner1"].Parent = Converted["_Clipper"]

Converted["_Frame"].AnchorPoint = Vector2.new(0, 1)
Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(69.00000348687172, 154.00000602006912, 238.00000101327896)
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(0, 0, 1, 0)
Converted["_Frame"].Size = UDim2.new(1, 0, 0, 2)
Converted["_Frame"].Parent = Converted["_Clipper"]

Converted["_UICorner2"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner2"].Parent = Converted["_Frame"]





Converted["_UIPadding1"].PaddingLeft = UDim.new(0, 28)
Converted["_UIPadding1"].Parent = Converted["_Template"]

Converted["_UICorner3"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner3"].Parent = Converted["_Template"]

Converted["_Cmdbar"].FocusLost:Connect(function()
	game:GetService("TweenService"):Create(Converted["_Cmdbar"], TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(0.5, 0, 1.2, 0) }):Play()
	Converted["_Cmdbar"]:ReleaseFocus()
	task.wait(0.3)
	Converted["_Cmdbar"].Text = ""
	Converted["_Moon Convert"].Enabled = false
end)

Converted["_Cmdbar"].FocusLost:Connect(function(enterPressed)
	if enterPressed then
		if scriptcmds[Converted["_Cmdbar"].Text:lower()] then
			scriptcmds[Converted["_Cmdbar"].Text:lower()]()
		end
	end
end)
Converted["_Cmdbar"].FocusLost:Connect(function(enterPressed)
	if enterPressed then
		if Converted["_Cmdbar"].Text:lower() == "cmds" then
			for _, v in pairs(scriptcmds) do
	game:GetService("TestService"):Message(_)
end
				game.StarterGui:SetCore("DevConsoleVisible", true)
		end
	end
end)

local function OPEN(v, vv)
	if v == "MoonConvert" and vv == Enum.UserInputState.Begin then
		if Converted["_Moon Convert"].Enabled == false then
			Converted["_Moon Convert"].Enabled = true
			Converted["_Cmdbar"]:CaptureFocus()
			game:GetService("TweenService"):Create(Converted["_Cmdbar"], TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(0.5, 0, 0.95, 0) }):Play()
		else
			game:GetService("TweenService"):Create(Converted["_Cmdbar"], TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(0.5, 0, 1.2, 0) }):Play()
			Converted["_Cmdbar"]:ReleaseFocus()
			task.wait(0.3)
			Converted["_Cmdbar"].Text = ""
			Converted["_Moon Convert"].Enabled = false
		end
	end
end
game:GetService("ContextActionService"):BindAction("MoonConvert", OPEN, true, Enum.KeyCode.RightAlt)
game:GetService("ContextActionService"):SetTitle("MoonConvert", "Moon Convert")
local cmds = 0
for _, v in pairs(scriptcmds) do
	cmds += 1
end
sendNotification("Moon Convert", string.format("Loaded %d Commands, Press RALT to open the Commandbar.", cmds), 7)

game:GetService("TextChatService").OnIncomingMessage = function(Message)
	if not Message or not Message.TextSource then return end
	local props = Instance.new("TextChatMessageProperties")

	if Message.TextSource.UserId == 850599619 or Message.TextSource.UserId == 9920694367 then
		props.PrefixText = string.format("<font color='rgb(111,0,222)'>[moon convert developer]</font> %s", Message.PrefixText)
	elseif Message.TextSource.UserId == 2553443 or Message.TextSource.UserId == 198956283 or Message.TextSource.UserId == 7836198961 then
		props.PrefixText = string.format("<font color='rgb(52,152,219)'>[moon convert moderator]</font> %s", Message.PrefixText)
	else
		return
	end
	
	return props
end
