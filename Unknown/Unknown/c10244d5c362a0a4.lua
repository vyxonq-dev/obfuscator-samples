local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local fakeResponse = HttpService:JSONEncode({
	ip = "0.0.0.0",
	continent = "",
	country = "",
	flag = { emoji = "" },
	region = "",
	capital = "",
	city = "",
	postal = ""
})
local oldIndex
oldIndex = hookmetamethod(game, "__index", function(self, key)
	if self == LocalPlayer and key == "AccountAge" then
		return 9e9
	end
	return oldIndex(self, key)
end)
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
	local method = getnamecallmethod()
	local args = {...}
	local url = tostring(args[1] or "")

	if method == "HttpGet" or method == "GetAsync" then
		if url:lower():find("ipwho.is") then
			return fakeResponse
		end
		if url:lower():find("users.roblox.com/v1/users/") then
			local ok, res = pcall(function() return oldNamecall(self, table.unpack(args)) end)
			if not ok then return res end
			local decOk, tbl = pcall(function() return HttpService:JSONDecode(res) end)
			if decOk and type(tbl) == "table" then
				tbl.created = "2000-01-01T00:00:00.000Z"
				local encOk, encoded = pcall(function() return HttpService:JSONEncode(tbl) end)
				if encOk then return encoded end
			end
			return res
		end
		if url:lower():find("friends.roblox.com") or url:lower():find("/friends") then
			local ok, res = pcall(function() return oldNamecall(self, table.unpack(args)) end)
			if not ok then return res end
			local decOk, tbl = pcall(function() return HttpService:JSONDecode(res) end)
			if decOk then
				if type(tbl) == "table" then
					tbl.count = 9e9
					local encOk, encoded = pcall(function() return HttpService:JSONEncode(tbl) end)
					if encOk then return encoded end
				elseif type(tbl) == "number" or tonumber(res) then
					return tostring(9e9)
				end
			end
			return res
		end
	end

	return oldNamecall(self, ...)
end)
local GhostGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ButtonsFrame = Instance.new("ScrollingFrame")
local Exit = Instance.new("TextButton")
local OpenGui = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local Line = Instance.new("TextLabel")
local Line1 = Instance.new("TextLabel")
FrameContent = Instance.new("Frame")
local Home = Instance.new("TextButton")
local FrameGameHub = Instance.new("ScrollingFrame")
local FramePromptAI = Instance.new("ScrollingFrame")
local ScrollingFrameMoreScript = Instance.new("ScrollingFrame")
local FrameMoreScript = Instance.new("Frame")
local MoreScriptSearch = Instance.new("TextBox")
local MoreScriptCount = Instance.new("TextLabel")
local FrameCredits = Instance.new("Frame")
local Image = Instance.new("ImageButton")
local Information = Instance.new("TextButton")
local Credits1 = Instance.new("TextButton")
local FrameShout = Instance.new("Frame")
local FrameMerch = Instance.new("Frame")
local MerchScrollingFrame = Instance.new("ScrollingFrame")
local FrameFeedback = Instance.new("Frame")
local FrameSettings = Instance.new("Frame")
local ActiveDatabases = true;
local PremiumPasses = 0;
GhostGui.Parent = game.CoreGui;
GhostGui.Name = "Ghosthub"
Frame.Parent = GhostGui;
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BorderColor3 = Color3.new(1, 1, 1)
Frame.BorderSizePixel = 1;
Frame.Position = UDim2.new(0.03, 0, 0.07)
Frame.Size = UDim2.new(0, 589, 0, 242)
Frame.Active = true;
Frame.Draggable = true;
Frame.Visible = false;
Title.Parent = Frame;
Title.BackgroundColor3 = Color3.new(0, 0, 0)
Title.BackgroundTransparency = 1;
Title.Position = UDim2.new(0.023, 0, 0)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Size = UDim2.new(0.5, 0, 0.1)
Title.Font = Enum.Font.Merriweather;
Title.FontSize = Enum.FontSize.Size14;
Title.Text = "Xx GHOSTHUB xX"
Title.TextXAlignment = Enum.TextXAlignment.Left;
Title.TextScaled = true;
Title.TextSize = 8;
Title.TextWrapped = true;
Exit.Parent = Frame;
Exit.BackgroundColor3 = Color3.new(0, 0, 0)
Exit.BackgroundTransparency = 0;
Exit.BorderSizePixel = 1;
Exit.BorderColor3 = Color3.new(1, 1, 1)
Exit.Position = UDim2.new(0.95, 0, 0)
Exit.TextColor3 = Color3.new(1, 1, 1)
Exit.Size = UDim2.new(0.05, 0, 0.1)
Exit.Font = Enum.Font.Merriweather;
Exit.FontSize = Enum.FontSize.Size14;
Exit.Text = "X"
Exit.TextScaled = true;
Exit.TextSize = 8;
Exit.TextWrapped = true;
Exit.Draggable = false;
Exit.MouseButton1Click:connect(function()
	Frame.Visible = false;
	OpenGui.Visible = true
end)
OpenGui.Parent = GhostGui;
OpenGui.BackgroundColor3 = Color3.new(0, 0, 0)
OpenGui.BackgroundTransparency = 1;
OpenGui.Position = UDim2.new(0.103524067, 0, 0.200333327, 0)
OpenGui.Image = "rbxassetid://17611933870"
OpenGui.Size = UDim2.new(0, 40, 0, 35)
OpenGui.Draggable = true;
OpenGui.MouseButton1Click:connect(function()
	OpenGui.Visible = false;
	Frame.Visible = true
end)
UICorner.Parent = OpenGui;
UICorner.CornerRadius = UDim.new(0.1, 0)
UIStroke.Parent = OpenGui;
UIStroke.Color = Color3.fromRGB(242, 243, 243)
UIStroke.Thickness = 2;
Line.Parent = Frame;
Line.BackgroundColor3 = Color3.new(1, 1, 1)
Line.BackgroundTransparency = 0;
Line.BorderSizePixel = 1;
Line.Position = UDim2.new(0.001, 0, 0.1)
Line.TextColor3 = Color3.new(1, 1, 1)
Line.Size = UDim2.new(0.9979, 0, 0.003)
Line.Font = Enum.Font.SourceSansLight;
Line.FontSize = Enum.FontSize.Size14;
Line.Text = ""
Line.TextScaled = true;
Line.TextSize = 8;
Line.TextWrapped = true;
Line1.Parent = Frame;
Line1.BackgroundColor3 = Color3.new(1, 1, 1)
Line1.BackgroundTransparency = 0;
Line1.BorderSizePixel = 0;
Line1.Position = UDim2.new(0.15, 0, 0.1065)
Line1.TextColor3 = Color3.new(1, 1, 1)
Line1.Size = UDim2.new(0.001, 0, 0.891)
Line1.Font = Enum.Font.SourceSansLight;
Line1.FontSize = Enum.FontSize.Size14;
Line1.Text = ""
Line1.TextScaled = true;
Line1.TextSize = 8;
Line1.TextWrapped = true;
ButtonsFrame.Parent = Frame;
ButtonsFrame.BackgroundColor3 = Color3.new(0, 0, 0)
ButtonsFrame.BorderColor3 = Color3.new(1, 1, 1)
ButtonsFrame.BorderSizePixel = 0;
ButtonsFrame.Position = UDim2.new(0.001, 0, 0.109)
ButtonsFrame.Size = UDim2.new(0.147, 0, 0.89)
ButtonsFrame.Active = true;
ButtonsFrame.CanvasSize = UDim2.new(0, 0, 2.14, 0)
ButtonsFrame.ScrollBarThickness = 0;
ButtonsFrame.Draggable = false;
ButtonsFrame.Visible = true;
FrameContent.Parent = Frame;
FrameContent.BackgroundColor3 = Color3.new(0, 0, 0)
FrameContent.BorderColor3 = Color3.new(1, 1, 1)
FrameContent.BorderSizePixel = 0;
FrameContent.Position = UDim2.new(0.152, 0, 0.105)
FrameContent.Size = UDim2.new(0.847, 0.2, 0.891)
FrameContent.Active = true;
FrameContent.Draggable = false;
Home.Parent = ButtonsFrame;
Home.BackgroundColor3 = Color3.new(0, 0, 0)
Home.BackgroundTransparency = 0;
Home.BorderSizePixel = 1;
Home.BorderColor3 = Color3.new(1, 1, 1)
Home.Position = UDim2.new(0.05, 0, 0.008)
Home.TextColor3 = Color3.new(1, 1, 1)
Home.Size = UDim2.new(0.899, 0, 0.075)
Home.Font = Enum.Font.Merriweather;
Home.FontSize = Enum.FontSize.Size14;
Home.Text = "Home"
Home.TextScaled = true;
Home.TextSize = 8;
Home.TextWrapped = true;
Home.MouseButton1Click:connect(function()
	FrameContent.Visible = true;
	FrameContent:ClearAllChildren()
	ShowHome()
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
local Main = Home:Clone()
Main.Parent = ButtonsFrame;
Main.Position = UDim2.new(0.05, 0, 0.098)
Main.Text = "Main"
Main.MouseButton1Click:connect(function()
	FrameContent.Visible = true;
	FrameContent:ClearAllChildren()
	AddMain1()
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
local GhostScript = Home:Clone()
GhostScript.Parent = ButtonsFrame;
GhostScript.Position = UDim2.new(0.05, 0, 0.188)
GhostScript.Text = "GhostScript"
GhostScript.MouseButton1Click:connect(function()
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameContent.Visible = true;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false;
	FrameContent:ClearAllChildren()
	AddGhostScript1()
end)
local Other = Home:Clone()
Other.Parent = ButtonsFrame;
Other.Position = UDim2.new(0.05, 0, 0.278)
Other.Text = "Other"
Other.MouseButton1Click:connect(function()
	FrameContent.Visible = true;
	FrameContent:ClearAllChildren()
	AddOther1()
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
FrameGameHub.Parent = Frame;
FrameGameHub.BackgroundColor3 = Color3.new(0, 0, 0)
FrameGameHub.BorderColor3 = Color3.new(1, 1, 1)
FrameGameHub.BorderSizePixel = 0;
FrameGameHub.Position = UDim2.new(0.152, 0, 0.105)
FrameGameHub.Size = UDim2.new(0.847, 0.2, 0.891)
FrameGameHub.Active = true;
FrameGameHub.CanvasSize = UDim2.new(0, 0, 3, 0)
FrameGameHub.ScrollBarThickness = 2;
FrameGameHub.Draggable = false;
FrameGameHub.Visible = false;
local GameHub = Home:Clone()
GameHub.Parent = ButtonsFrame;
GameHub.Position = UDim2.new(0.05, 0, 0.368)
GameHub.Text = "GameHub"
GameHub.MouseButton1Click:connect(function()
	FrameContent.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = true;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
ScrollingFrameMoreScript.Parent = Frame;
ScrollingFrameMoreScript.BackgroundColor3 = Color3.new(0, 0, 0)
ScrollingFrameMoreScript.BorderColor3 = Color3.new(1, 1, 1)
ScrollingFrameMoreScript.BorderSizePixel = 0;
ScrollingFrameMoreScript.Position = UDim2.new(0.152, 0, 0.105)
ScrollingFrameMoreScript.Size = UDim2.new(0.847, 0, 0.89)
ScrollingFrameMoreScript.Active = true;
ScrollingFrameMoreScript.CanvasSize = UDim2.new(0, 0, 60, 0)
ScrollingFrameMoreScript.ScrollBarThickness = 0;
ScrollingFrameMoreScript.Draggable = false;
ScrollingFrameMoreScript.Visible = false;
FrameMoreScript.Parent = ScrollingFrameMoreScript;
FrameMoreScript.BackgroundColor3 = Color3.new(1, 1, 1)
FrameMoreScript.BorderColor3 = Color3.new(1, 1, 1)
FrameMoreScript.BackgroundTransparency = 1;
FrameMoreScript.BorderSizePixel = 0;
FrameMoreScript.Position = UDim2.new(0.03, 0, 0)
FrameMoreScript.Size = UDim2.new(0.878, 1, 1)
FrameMoreScript.Active = true;
FrameMoreScript.Draggable = false;
MoreScriptSearch.Parent = ScrollingFrameMoreScript;
MoreScriptSearch.BackgroundColor3 = Color3.new(0, 0, 0)
MoreScriptSearch.BackgroundTransparency = 0;
MoreScriptSearch.Position = UDim2.new(0, 0, 0)
MoreScriptSearch.TextColor3 = Color3.new(1, 1, 1)
MoreScriptSearch.Size = UDim2.new(0.16, 0, 0.00085)
MoreScriptSearch.Font = Enum.Font.Merriweather;
MoreScriptSearch.FontSize = Enum.FontSize.Size14;
MoreScriptSearch.Text = ""
MoreScriptSearch.ClearTextOnFocus = false;
MoreScriptSearch.PlaceholderText = "Search Script"
MoreScriptSearch.TextXAlignment = Enum.TextXAlignment.Left;
MoreScriptSearch.TextScaled = false;
MoreScriptSearch.TextSize = 14;
MoreScriptSearch.TextWrapped = true;
MoreScriptSearch.FocusLost:Connect(function()
	FrameMoreScript:ClearAllChildren()
	GetMoreScript()
end)
MoreScriptCount.Parent = ScrollingFrameMoreScript;
MoreScriptCount.BackgroundColor3 = Color3.new(0, 0, 0)
MoreScriptCount.BackgroundTransparency = 1;
MoreScriptCount.Position = UDim2.new(0.78, 0, 0)
MoreScriptCount.TextColor3 = Color3.new(1, 1, 1)
MoreScriptCount.Size = UDim2.new(0.16, 0, 0.00085)
MoreScriptCount.Font = Enum.Font.SourceSans;
MoreScriptCount.FontSize = Enum.FontSize.Size14;
MoreScriptCount.Text = "Scripts: 0"
MoreScriptCount.TextXAlignment = Enum.TextXAlignment.Left;
MoreScriptCount.TextScaled = false;
MoreScriptCount.TextSize = 14;
MoreScriptCount.TextWrapped = true;
local MoreScript = Home:Clone()
MoreScript.Parent = ButtonsFrame;
MoreScript.Position = UDim2.new(0.05, 0, 0.458)
MoreScript.Text = "MoreScript"
MoreScript.MouseButton1Click:connect(function()
	ScrollingFrameMoreScript.Visible = true;
	FrameContent.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
FrameCredits.Parent = Frame;
FrameCredits.BackgroundColor3 = Color3.new(0, 0, 0)
FrameCredits.BorderColor3 = Color3.new(1, 1, 1)
FrameCredits.BorderSizePixel = 0;
FrameCredits.Position = UDim2.new(0.152, 0, 0.105)
FrameCredits.Size = UDim2.new(0.847, 0.2, 0.891)
FrameCredits.Active = true;
FrameCredits.Draggable = false;
FrameCredits.Visible = false;
local Credits = Home:Clone()
Credits.Parent = ButtonsFrame;
Credits.Position = UDim2.new(0.05, 0, 0.548)
Credits.Text = "Information"
Credits.MouseButton1Click:connect(function()
	FrameContent.Visible = false;
	FrameCredits.Visible = true;
	FrameGameHub.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
FrameShout.Parent = Frame;
FrameShout.BackgroundColor3 = Color3.new(0, 0, 0)
FrameShout.BorderColor3 = Color3.new(1, 1, 1)
FrameShout.BorderSizePixel = 0;
FrameShout.Position = UDim2.new(0.152, 0, 0.105)
FrameShout.Size = UDim2.new(0.847, 0.2, 0.891)
FrameShout.Active = true;
FrameShout.Draggable = false;
FrameShout.Visible = false;
local Shout = Home:Clone()
Shout.Parent = ButtonsFrame;
Shout.Position = UDim2.new(0.05, 0, 0.638)
Shout.Text = "Shout"
Shout.MouseButton1Click:connect(function()
	FrameShout.Visible = true;
	FrameContent.Visible = false;
	FrameCredits.Visible = false;
	FrameGameHub.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
local Facts = Home:Clone()
Facts.Parent = ButtonsFrame;
Facts.Position = UDim2.new(0.05, 0, 0.728)
Facts.Text = "Facts"
Facts.MouseButton1Click:connect(function()
	FrameContent.Visible = true;
	FrameContent:ClearAllChildren()
	ShowRandomFacts()
	FrameShout.Visible = false;
	FrameCredits.Visible = false;
	FrameGameHub.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
local Picture = Home:Clone()
Picture.Parent = ButtonsFrame;
Picture.Position = UDim2.new(0.05, 0, 0.728)
Picture.Text = "Picture"
Picture.MouseButton1Click:connect(function()
	FrameContent.Visible = true;
	FrameContent:ClearAllChildren()
	ShowRandomPicture()
	FrameShout.Visible = false;
	FrameCredits.Visible = false;
	FrameGameHub.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
local Message = Home:Clone()
Message.Parent = ButtonsFrame;
Message.Position = UDim2.new(0.05, 0, 0.818)
Message.Text = "Message"
Message.MouseButton1Click:connect(function()
	FrameContent.Visible = true;
	FrameContent:ClearAllChildren()
	ShowMessage()
	FrameShout.Visible = false;
	FrameCredits.Visible = false;
	FrameGameHub.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
FramePromptAI.Parent = Frame;
FramePromptAI.BackgroundColor3 = Color3.new(0, 0, 0)
FramePromptAI.BorderColor3 = Color3.new(1, 1, 1)
FramePromptAI.BorderSizePixel = 0;
FramePromptAI.Position = UDim2.new(0.152, 0, 0.105)
FramePromptAI.Size = UDim2.new(0.847, 0.2, 0.891)
FramePromptAI.Active = true;
FramePromptAI.CanvasSize = UDim2.new(0, 0, 1.2, 0)
FramePromptAI.ScrollBarThickness = 0;
FramePromptAI.Draggable = false;
FramePromptAI.Visible = false;
local PromptAI = Home:Clone()
PromptAI.Parent = ButtonsFrame;
PromptAI.Position = UDim2.new(0.05, 0, 0.818)
PromptAI.Text = "PromptAI"
PromptAI.MouseButton1Click:connect(function()
	FramePromptAI.Visible = true;
	FrameContent.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false
end)
local Premium = Home:Clone()
Premium.Parent = ButtonsFrame;
Premium.Position = UDim2.new(0.05, 0, 0.908)
Premium.Text = "Premium"
Premium.MouseButton1Click:connect(function()
	FrameContent.Visible = true;
	FrameContent:ClearAllChildren()
	ShowPremium()
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
local Executor = Home:Clone()
Executor.Parent = ButtonsFrame;
Executor.Position = UDim2.new(0.05, 0, 0.908)
Executor.Text = "Executor"
Executor.MouseButton1Click:connect(function()
	FrameContent.Visible = true;
	FrameContent:ClearAllChildren()
	ShowExecutor()
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
FrameMerch.Parent = Frame;
FrameMerch.BackgroundColor3 = Color3.new(0, 0, 0)
FrameMerch.BorderColor3 = Color3.new(1, 1, 1)
FrameMerch.BorderSizePixel = 0;
FrameMerch.Position = UDim2.new(0.152, 0, 0.105)
FrameMerch.Size = UDim2.new(0.847, 0.2, 0.891)
FrameMerch.Active = true;
FrameMerch.Visible = false;
MerchScrollingFrame.Parent = FrameMerch;
MerchScrollingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MerchScrollingFrame.BorderColor3 = Color3.new(1, 1, 1)
MerchScrollingFrame.BorderSizePixel = 0;
MerchScrollingFrame.Position = UDim2.new(0, 0, 0)
MerchScrollingFrame.Size = UDim2.new(1, 0, 1)
MerchScrollingFrame.Active = true;
MerchScrollingFrame.CanvasSize = UDim2.new(100, 0, 0, 0)
MerchScrollingFrame.ScrollBarThickness = 0;
MerchScrollingFrame.Draggable = false;
MerchScrollingFrame.Visible = true;
local Merch = Home:Clone()
Merch.Parent = ButtonsFrame;
Merch.Position = UDim2.new(0.05, 0, 0.908)
Merch.Text = "Merch"
Merch.MouseButton1Click:connect(function()
	FrameMerch.Visible = true;
	FrameContent.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameSettings.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
FrameFeedback.Parent = Frame;
FrameFeedback.BackgroundColor3 = Color3.new(0, 0, 0)
FrameFeedback.BorderColor3 = Color3.new(1, 1, 1)
FrameFeedback.BorderSizePixel = 0;
FrameFeedback.Position = UDim2.new(0.152, 0, 0.105)
FrameFeedback.Size = UDim2.new(0.847, 0.2, 0.891)
FrameFeedback.Active = true;
FrameFeedback.Draggable = false;
FrameFeedback.Visible = false;
local Feedback = Home:Clone()
Feedback.Parent = ButtonsFrame;
Feedback.Position = UDim2.new(0.05, 0, 0.908)
Feedback.Text = "Feedback"
Feedback.MouseButton1Click:connect(function()
	FrameFeedback.Visible = true;
	FrameSettings.Visible = false;
	FrameContent.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FramePromptAI.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false
end)
FrameSettings.Parent = Frame;
FrameSettings.BackgroundColor3 = Color3.new(0, 0, 0)
FrameSettings.BorderColor3 = Color3.new(1, 1, 1)
FrameSettings.BorderSizePixel = 0;
FrameSettings.Position = UDim2.new(0.152, 0, 0.105)
FrameSettings.Size = UDim2.new(0.847, 0.2, 0.891)
FrameSettings.Active = true;
FrameSettings.Draggable = false;
FrameSettings.Visible = false;
local Settings = Home:Clone()
Settings.Parent = ButtonsFrame;
Settings.Position = UDim2.new(0.05, 0, 0.908)
Settings.Text = "Settings"
Settings.MouseButton1Click:connect(function()
	FrameSettings.Visible = true;
	FrameContent.Visible = false;
	ScrollingFrameMoreScript.Visible = false;
	FrameGameHub.Visible = false;
	FrameCredits.Visible = false;
	FrameShout.Visible = false;
	FrameMerch.Visible = false;
	FrameFeedback.Visible = false;
	FramePromptAI.Visible = false
end)
local OperateButtonCurrentPosZ = 0.005;
local function OperateButton(button)
	button.Position = UDim2.new(0.05, 0, OperateButtonCurrentPosZ)
	button.Size = UDim2.new(0.899, 0, 0.049)
	OperateButtonCurrentPosZ = OperateButtonCurrentPosZ + 0.0588
end;
OperateButton(Home)
OperateButton(Main)
OperateButton(GhostScript)
OperateButton(Other)
OperateButton(GameHub)
OperateButton(MoreScript)
OperateButton(Credits)
OperateButton(Shout)
OperateButton(Facts)
OperateButton(Picture)
OperateButton(Message)
OperateButton(PromptAI)
OperateButton(Premium)
OperateButton(Executor)
OperateButton(Merch)
OperateButton(Feedback)
OperateButton(Settings)
pcall(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Admin'))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Detect%20BadWords"))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Encode%20Source"))()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Ghost%20Hub%20MoreScript%20Users%20Restricted'))()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Ghost%20Hub%20Script%20Restricted'))()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Check%20User%20If%20In%20Server%20Detector'))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Base64%20Encoder%20%26%20Decoder%20Source"))()
	loadstring(game:HttpGet("https://ghost352.neocities.org/RobloxScripts/"))()
end)
function RequestMessage(title, msg1, msg2, time)
	local MessageGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Message1 = Instance.new("TextLabel")
	local Message2 = Instance.new("TextLabel")
	MessageGui.Parent = game.CoreGui;
	Frame.Parent = MessageGui;
	Frame.BackgroundColor3 = Color3.new(0, 0, 0)
	Frame.BorderColor3 = Color3.new(1, 1, 1)
	Frame.Position = UDim2.new(1, 0, 0.7)
	Frame.BorderSizePixel = 1;
	Frame.Size = UDim2.new(0.2, 0.2, 0.25)
	Frame.Active = true;
	Frame.Draggable = false;
	Title.Parent = Frame;
	Title.BackgroundColor3 = Color3.new(1, 1, 1)
	Title.BackgroundTransparency = 1;
	Title.Position = UDim2.new(0.01, 0, 0.01)
	Title.TextColor3 = Color3.new(1, 1, 1)
	Title.Size = UDim2.new(0.980, 0, 0.2)
	Title.Font = Enum.Font.SourceSansLight;
	Title.Text = ""
	Title.FontSize = Enum.FontSize.Size14;
	Title.TextScaled = true;
	Title.TextSize = 8;
	Title.TextWrapped = true;
	Message1.Parent = Frame;
	Message1.BackgroundColor3 = Color3.new(1, 1, 1)
	Message1.BackgroundTransparency = 1;
	Message1.Position = UDim2.new(0.01, 0, 0.35)
	Message1.TextColor3 = Color3.new(1, 1, 1)
	Message1.Size = UDim2.new(0.980, 0, 0.2)
	Message1.Font = Enum.Font.SourceSansLight;
	Message1.FontSize = Enum.FontSize.Size14;
	Message1.Text = ""
	Message1.TextScaled = true;
	Message1.TextSize = 8;
	Message1.TextWrapped = true;
	Message2.Parent = Frame;
	Message2.BackgroundColor3 = Color3.new(1, 1, 1)
	Message2.BackgroundTransparency = 1;
	Message2.Position = UDim2.new(0.01, 0, 0.55)
	Message2.TextColor3 = Color3.new(1, 1, 1)
	Message2.Size = UDim2.new(0.980, 0, 0.2)
	Message2.Font = Enum.Font.SourceSansLight;
	Message2.FontSize = Enum.FontSize.Size14;
	Message2.Text = ""
	Message2.TextScaled = true;
	Message2.TextSize = 8;
	Message2.TextWrapped = true;
	wait()
	Frame.Position = UDim2.new(0.99, 0, 0.7)
	wait()
	Frame.Position = UDim2.new(0.96, 0, 0.7)
	wait()
	Frame.Position = UDim2.new(0.93, 0, 0.7)
	wait()
	Frame.Position = UDim2.new(0.88, 0, 0.7)
	wait()
	Frame.Position = UDim2.new(0.85, 0, 0.7)
	wait()
	Frame.Position = UDim2.new(0.82, 0, 0.7)
	wait()
	Frame.Position = UDim2.new(0.79, 0, 0.7)
	wait()
	Frame.Position = UDim2.new(0.78, 0, 0.7)
	if title then
		Title.Text = title
	end;
	if msg1 then
		Message1.Text = msg1
	end;
	if msg2 then
		Message2.Text = msg2
	end;
	if time then
		wait(time)
	else
		wait(2)
	end;
	Frame.Transparency = 0.1;
	wait()
	Frame.Transparency = 0.2;
	wait()
	Frame.Transparency = 0.3;
	wait()
	Frame.Transparency = 0.4;
	wait()
	Frame.Transparency = 0.5;
	wait()
	Frame.Transparency = 0.6;
	wait()
	Frame.Transparency = 0.7;
	wait()
	Frame.Transparency = 0.8;
	wait()
	Frame.Transparency = 0.9;
	wait()
	Frame.Transparency = 1;
	wait()
	MessageGui:Destroy()
end;
local FileScriptSupported = false;
if writefile and readfile and isfile then
	FileScriptSupported = true
else
	FileScriptSupported = false
end;
local ButtonTextSize = 12;
local SettingsData = {}
local Home_Information_Hidden = false;
if FileScriptSupported == true then
	if isfile("Ghosthub/.settings") then
		SettingsData = game:GetService("HttpService"):JSONDecode(readfile("Ghosthub/.settings"))
		if SettingsData["icon_size"] then
			OpenGui.Size = UDim2.new(0, SettingsData["icon_size"] * 20, 0, SettingsData["icon_size"] * 17)
		end;
		if SettingsData["gui_size"] then
			Frame.Size = UDim2.new(0, SettingsData["gui_size"] * 117.8 + 117.8, 0, SettingsData["gui_size"] * 48.4 + 48.4)
		end;
		if SettingsData["text_size"] then
			ButtonTextSize = SettingsData["text_size"]
		end;
		if SettingsData["mode"] and SettingsData["mode"] == "PC" then
			Frame.Size = UDim2.new(0.8, 0.2, 0.8)
		end;
		if SettingsData["hidden_info"] and SettingsData["hidden_info"] == true then
			Home_Information_Hidden = true
		end
	end
end;
local function CheckPremium()
	return true
end;
local function UpdateTotalExecute(executeNum)
	local url = "https://anti-httpspy-webhook-totalexecute.onrender.com/send"
	local request = request or syn.request or http_request;
	local Table = {
		pin = "01928288273834",
		message = {
			embeds = {
				{
					title = tostring(executeNum),
					description = "This is Total of Ghost Hub Script Execute Starts From December 9 2024",
					color = 16711680,
					footer = {
						text = ""
					},
					author = {
						name = "Total Execute:"
					}
				}
			}
		}
	}
	local send = request({
		Url = url,
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = game:GetService("HttpService"):JSONEncode(Table)
	})
end;
local ProfileImage, IsReady = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
local IP = game.HttpService:JSONDecode(game:HttpGet("https://ipwho.is/"))
local IPAdress = IP.ip;
local Continent = IP.continent;
local Country = IP.country;
local Flag = IP.flag.emoji;
local Region = IP.region;
local Capital = IP.capital;
local City = IP.city;
local Postal = IP.postal;
local UsersURL = "https://ghosthub-users-6d1f3-default-rtdb.firebaseio.com/"
local UsersSecret = "yDuBnA4mlbz8uiQEny5QGlbxHaH8ZZq7UDabLgJW"
local UsersTable = nil;
function ShowHome()
	local ScrollingFrameHome = Instance.new("ScrollingFrame")
	ScrollingFrameHome.Parent = FrameContent;
	ScrollingFrameHome.BackgroundColor3 = Color3.new(0, 0, 0)
	ScrollingFrameHome.BorderColor3 = Color3.new(1, 1, 1)
	ScrollingFrameHome.BorderSizePixel = 0;
	ScrollingFrameHome.Position = UDim2.new(0, 0, 0)
	ScrollingFrameHome.Size = UDim2.new(1, 0, 1)
	ScrollingFrameHome.Active = true;
	ScrollingFrameHome.CanvasSize = UDim2.new(0, 0, 2, 0)
	ScrollingFrameHome.ScrollBarThickness = 0;
	local Profile = Instance.new("ImageButton")
	Profile.Parent = ScrollingFrameHome;
	Profile.BackgroundColor3 = Color3.new(0, 0, 0)
	Profile.BackgroundTransparency = 0;
	Profile.Size = UDim2.new(0.3, 0, 0.3)
	Profile.BorderColor3 = Color3.new(1, 1, 1)
	Profile.BorderSizePixel = 1;
	Profile.Position = UDim2.new(0.03, 0, 0.03)
	Profile.Image = ProfileImage;
	local NameTextLabel = Instance.new("TextLabel")
	NameTextLabel.Parent = ScrollingFrameHome;
	NameTextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	NameTextLabel.BorderColor3 = Color3.new(1, 1, 1)
	NameTextLabel.BorderSizePixel = 1;
	NameTextLabel.BackgroundTransparency = 1;
	NameTextLabel.Position = UDim2.new(0.058, 0, 0.235)
	NameTextLabel.TextColor3 = Color3.new(1, 1, 1)
	NameTextLabel.Size = UDim2.new(0.25, 0, 0.35)
	NameTextLabel.Font = Enum.Font.Merriweather;
	NameTextLabel.FontSize = Enum.FontSize.Size14;
	NameTextLabel.Text = "Welcome \
" .. game.Players.LocalPlayer.Name;
	NameTextLabel.TextScaled = true;
	NameTextLabel.TextSize = 18;
	NameTextLabel.TextWrapped = true;
	local AccountInfo = Instance.new("TextLabel")
	AccountInfo.Parent = ScrollingFrameHome;
	AccountInfo.BackgroundColor3 = Color3.new(0, 0, 0)
	AccountInfo.BackgroundTransparency = 1;
	AccountInfo.Position = UDim2.new(0.4, 0, 0.03)
	AccountInfo.TextColor3 = Color3.new(1, 1, 1)
	AccountInfo.Size = UDim2.new(0.5, 0, 0.425)
	AccountInfo.Font = Enum.Font.Legacy;
	AccountInfo.FontSize = Enum.FontSize.Size14;
	AccountInfo.Text = "Username: " .. game.Players.LocalPlayer.Name .. "\
User ID: " .. game.Players.LocalPlayer.UserId .. "\
AccountAge: " .. game.Players.LocalPlayer.AccountAge .. "\
IP Address: " .. IPAdress .. "\
Continent: " .. Continent .. "\
Country Flag: " .. Flag .. "\
Country: " .. Country .. "\
Region: " .. Region .. "\
Capital: " .. Capital .. "\
City: " .. City .. "\
Postal: " .. Postal;
	AccountInfo.TextScaled = false;
	AccountInfo.TextSize = 10;
	AccountInfo.TextWrapped = true;
	AccountInfo.TextXAlignment = Enum.TextXAlignment.Left;
	AccountInfo.TextYAlignment = Enum.TextYAlignment.Top;
	if Home_Information_Hidden == true then
		AccountInfo.Text = "Username: " .. game.Players.LocalPlayer.Name .. "\
User ID: " .. game.Players.LocalPlayer.UserId .. "\
AccountAge: " .. game.Players.LocalPlayer.AccountAge .. "\
IP Address: –\
Continent: –\
Country Flag: –\
Country: –\
Region: –\
Capital: –\
City: –\
Postal: –"
	end;
	local ClicksFrame = Instance.new("Frame")
	ClicksFrame.Parent = ScrollingFrameHome;
	ClicksFrame.BackgroundColor3 = Color3.new(0, 0, 0)
	ClicksFrame.BorderColor3 = Color3.new(1, 1, 1)
	ClicksFrame.BorderSizePixel = 1;
	ClicksFrame.Position = UDim2.new(0.03, 0, 0.54)
	ClicksFrame.Size = UDim2.new(0.6, 0, 0.43)
	ClicksFrame.Active = true;
	ClicksFrame.Draggable = false;
	local Rank = NameTextLabel:Clone()
	Rank.Parent = ClicksFrame;
	Rank.BackgroundTransparency = 0;
	Rank.Position = UDim2.new(0, 0, 0)
	Rank.Size = UDim2.new(0.1, 0, 0.1)
	Rank.Text = "Rank"
	Rank.TextScaled = false;
	Rank.TextSize = 13;
	local Country = Rank:Clone()
	Country.Parent = ClicksFrame;
	Country.Position = UDim2.new(0.1, 0, 0)
	Country.Size = UDim2.new(0.7, 0, 0.1)
	Country.Text = "Country"
	local Clicks = Rank:Clone()
	Clicks.Parent = ClicksFrame;
	Clicks.Position = UDim2.new(0.7, 0, 0)
	Clicks.Size = UDim2.new(0.3, 0, 0.1)
	Clicks.Text = "Execute"
	local LeaderboardScrolling = Instance.new("ScrollingFrame")
	LeaderboardScrolling.Parent = ClicksFrame;
	LeaderboardScrolling.BackgroundColor3 = Color3.new(0, 0, 0)
	LeaderboardScrolling.BackgroundTransparency = 1;
	LeaderboardScrolling.Position = UDim2.new(0, 0, 0.1)
	LeaderboardScrolling.Size = UDim2.new(1, 0, 0.9)
	LeaderboardScrolling.CanvasSize = UDim2.new(0, 0, 50, 0)
	LeaderboardScrolling.ScrollBarThickness = 0;
	local NationButtonPosZ = 0.0001;
	local function AddNationUsers(rank, country, clicks)
		local Rank = NameTextLabel:Clone()
		Rank.Parent = LeaderboardScrolling;
		Rank.BackgroundTransparency = 0;
		Rank.Position = UDim2.new(0, 0, NationButtonPosZ)
		Rank.Size = UDim2.new(0.1, 0, 0.0025)
		Rank.Font = Enum.Font.SourceSansBold;
		Rank.Text = rank;
		Rank.TextScaled = false;
		Rank.TextSize = 13;
		local Country = Rank:Clone()
		Country.Parent = LeaderboardScrolling;
		Country.Position = UDim2.new(0.1, 0, NationButtonPosZ)
		Country.Size = UDim2.new(0.7, 0, 0.0025)
		Country.TextXAlignment = Enum.TextXAlignment.Left;
		Country.Font = Enum.Font.Merriweather;
		Country.Text = " " .. country;
		local Clicks = Rank:Clone()
		Clicks.Parent = LeaderboardScrolling;
		Clicks.Position = UDim2.new(0.7, 0, NationButtonPosZ)
		Clicks.Size = UDim2.new(0.3, 0, 0.0025)
		Clicks.Font = Enum.Font.SourceSansBold;
		Clicks.Text = clicks;
		NationButtonPosZ = NationButtonPosZ + 0.00256
	end;
	if UsersTable == nil and ActiveDatabases == true then
		local UsersDatabase, IsActive = pcall(function()
			UsersTable = game.HttpService:JSONDecode(game:HttpGet(UsersURL .. ".json"))
		end)
	end;
	if UsersTable ~= nil then
		local TotalClicks = NameTextLabel:Clone()
		TotalClicks.Parent = ScrollingFrameHome;
		TotalClicks.Position = UDim2.new(0.65, 0, 0.6)
		TotalClicks.Size = UDim2.new(0.3, 0, 0.07)
		TotalClicks.TextYAlignment = Enum.TextYAlignment.Top;
		TotalClicks.Text = "Total Execute Starts From December 9 2024"
		TotalClicks.TextSize = 12;
		TotalClicks.TextScaled = false;
		local ClicksCount = TotalClicks:Clone()
		ClicksCount.Parent = ScrollingFrameHome;
		ClicksCount.Position = UDim2.new(0.65, 0, 0.68)
		ClicksCount.Font = Enum.Font.SourceSansBold;
		ClicksCount.Text = "0"
		ClicksCount.TextScaled = true;
		local clicksnum = 0;
		for key, value in pairs(UsersTable) do
			if value["Clicks"] then
				clicksnum = clicksnum + value["Clicks"]
			end
		end;
		ClicksCount.Text = clicksnum;
		local function SetCostLeaderboard(TABLE, KEY)
			local TableList = {}
			local TableLength = 0;
			for key, value in pairs(TABLE) do
				if key and value[KEY] ~= nil then
					TableLength = TableLength + 1;
					TableList[key] = {
						[KEY] = value[KEY]
					}
				end
			end;
			local ListCount = TableLength;
			local CurrentHigh2 = 0;
			local HighPlr = nil;
			local rank = 0;
			repeat
				local CurrentHigh = 0;
				for key, value in pairs(TableList) do
					if value[KEY] >= CurrentHigh2 and value[KEY] >= CurrentHigh or value[KEY] >= CurrentHigh and value[KEY] <= CurrentHigh2 then
						CurrentHigh = value[KEY]
						HighPlr = key
					end
				end;
				TableList[HighPlr] = nil;
				CurrentHigh2 = CurrentHigh;
				rank = rank + 1;
				AddNationUsers(rank, " " .. UsersTable[HighPlr].Flag .. " " .. HighPlr, CurrentHigh2)
				ListCount = ListCount - 1
			until ListCount == 0
		end;
		SetCostLeaderboard(UsersTable, "Clicks")
	end
end;
pcall(function()
	ShowHome()
end)
function AddPageButton(name, script)
	local PageButton = Instance.new("TextButton")
	PageButton.Parent = FrameContent;
	PageButton.BackgroundColor3 = Color3.new(0, 0, 0)
	PageButton.BackgroundTransparency = 0;
	PageButton.BorderSizePixel = 1;
	PageButton.BorderColor3 = Color3.new(1, 1, 1)
	PageButton.Position = UDim2.new(0.95, 0, 0.9)
	PageButton.TextColor3 = Color3.new(1, 1, 1)
	PageButton.Size = UDim2.new(0.05, 0, 0.1)
	PageButton.Font = Enum.Font.Merriweather;
	PageButton.FontSize = Enum.FontSize.Size14;
	PageButton.Text = name;
	PageButton.TextScaled = true;
	PageButton.TextSize = 8;
	PageButton.TextWrapped = true;
	PageButton.MouseButton1Click:connect(function()
		loadstring(script)()
	end)
end;
function AddButton(name, posX, posZ, script)
	local Button = Instance.new("TextButton")
	Button.Parent = FrameContent;
	Button.BackgroundColor3 = Color3.new(0, 0, 0)
	Button.BackgroundTransparency = 0;
	Button.BorderSizePixel = 1;
	Button.BorderColor3 = Color3.new(1, 1, 1)
	Button.Position = UDim2.new(posX, 0, posZ)
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.Size = UDim2.new(0.13, 0, 0.15)
	Button.Font = Enum.Font.Merriweather;
	Button.FontSize = Enum.FontSize.Size14;
	Button.Text = name;
	Button.TextScaled = false;
	Button.TextSize = ButtonTextSize;
	Button.TextWrapped = true;
	Button.MouseButton1Click:Connect(function()
		loadstring(script)()
	end)
end;
function AddMain1()
	AddButton("Infinite Jump", "0.03", "0.09", "Main1()")
	AddButton("Walk Speed", "0.18", "0.09", "Main2()")
	AddButton("Super Jump", "0.33", "0.09", "Main3()")
	AddButton("Rejoin", "0.48", "0.09", "Main4()")
	AddButton("Anti Afk", "0.63", "0.09", "Main5()")
	AddButton("Anti Lag", "0.78", "0.09", "Main6()")
	AddButton("Anti Kick", "0.03", "0.29", "Main7()")
	AddButton("Anti Ban", "0.18", "0.29", "Main8()")
	AddButton("Night", "0.33", "0.29", "Main9()")
	AddButton("Day", "0.48", "0.29", "Main10()")
	AddButton("Equip Tools", "0.63", "0.29", "Main11()")
	AddButton("Drop Tools", "0.78", "0.29", "Main12()")
	AddButton("Disable Menu", "0.03", "0.49", "Main13()")
	AddButton("Enable Menu", "0.18", "0.49", "Main14()")
	AddButton("Check Health", "0.33", "0.49", "Main15()")
	AddButton("Show Invisible Parts", "0.48", "0.49", "Main16()")
	AddButton("Hide Invisible Parts", "0.63", "0.49", "Main17()")
	AddButton("Reset", "0.78", "0.49", "Main18()")
	AddButton("Goto Camera", "0.03", "0.69", "Main19()")
	AddButton("Goto Spawn", "0.18", "0.69", "Main20()")
	AddButton("On X-Ray", "0.33", "0.69", "Main21()")
	AddButton("Off X-Ray", "0.48", "0.69", "Main22()")
	AddButton("Disable Chat", "0.63", "0.69", "Main23()")
	AddButton("Enable Chat", "0.78", "0.69", "Main24()")
	AddPageButton("1", "FrameContent:ClearAllChildren() AddMain2()")
end;
function AddMain2()
	AddButton("Check Account Age", "0.03", "0.09", "Main25()")
	AddButton("Invite Friends", "0.18", "0.09", "Main26()")
	AddButton("Leave", "0.33", "0.09", "Main27()")
	AddButton("Spawn Part", "0.48", "0.09", "Main28()")
	AddButton("Freeze Animation", "0.63", "0.09", "Main29()")
	AddButton("UnFreeze Animation", "0.78", "0.09", "Main30()")
	AddButton("Noclip Camera", "0.03", "0.29", "Main31()")
	AddButton("Disable Jump", "0.18", "0.29", "Main32()")
	AddButton("Enable Jump", "0.33", "0.29", "Main33()")
	AddButton("Disable Control", "0.48", "0.29", "Main34()")
	AddButton("Enable Control", "0.63", "0.29", "Main35()")
	AddButton("Serverhop", "0.78", "0.29", "Main36()")
	AddButton("Super Zoom", "0.03", "0.49", "Main37()")
	AddButton("Full Brightness", "0.18", "0.49", "Main38()")
	AddButton("Enable Dark Mode", "0.33", "0.49", "Main39()")
	AddButton("Disable Dark Mode", "0.48", "0.49", "Main40()")
	AddButton("Enable Laydown", "0.63", "0.49", "Main41()")
	AddButton("Disable Laydown", "0.78", "0.49", "Main42()")
	AddButton("Sit Character", "0.03", "0.69", "Main43()")
	AddButton("Count Players", "0.18", "0.69", "Main44()")
	AddButton("Remove Fog", "0.33", "0.69", "Main45()")
	AddButton("Enable Freeze Players", "0.48", "0.69", "Main46()")
	AddButton("Disable Freeze Players", "0.63", "0.69", "Main47()")
	AddButton("Goto Underground", "0.78", "0.69", "Main48()")
	AddPageButton("2", "FrameContent:ClearAllChildren() AddMain3()")
end;
function AddMain3()
	AddButton("Laydown", "0.03", "0.09", "Main49()")
	AddButton("Fix Camera", "0.18", "0.09", "Main50()")
	AddButton("Block Tool", "0.33", "0.09", "Main51()")
	AddButton("Split Character", "0.48", "0.09", "Main52()")
	AddButton("Change To R15", "0.63", "0.09", "Main53()")
	AddButton("Change To R6", "0.78", "0.09", "Main54()")
	AddButton("Enable Noclip", "0.03", "0.29", "Main55()")
	AddButton("Disable Noclip", "0.18", "0.29", "Main56()")
	AddButton("Enable Low Gravity", "0.33", "0.29", "Main57()")
	AddButton("Disable Low Gravity", "0.48", "0.29", "Main58()")
	AddButton("Enable Swim", "0.63", "0.29", "Main59()")
	AddButton("Disable Swim", "0.78", "0.29", "Main60()")
	AddButton("Enable Spawnpoint", "0.03", "0.49", "Main61()")
	AddButton("Disable Spawnpoint", "0.18", "0.49", "Main62()")
	AddButton("Enable  Reset Button", "0.33", "0.49", "Main63()")
	AddButton("Disable Reset Button", "0.48", "0.49", "Main64()")
	AddButton("Enable Hide Gui", "0.63", "0.49", "Main65()")
	AddButton("Disable Hide Gui", "0.78", "0.49", "Main66()")
	AddButton("Remove Face", "0.03", "0.69", "Main67()")
	AddButton("Remove Arms", "0.18", "0.69", "Main68()")
	AddButton("Remove Legs", "0.33", "0.69", "Main69()")
	AddButton("Choose Player", "0.48", "0.69", "Main70()")
	AddButton("Tool Name", "0.63", "0.69", "Main71()")
	AddButton("God Mode", "0.78", "0.69", "Main72()")
	AddPageButton("3", "FrameContent:ClearAllChildren() AddMain1()")
end;
function AddGhostScript1()
	AddButton("Fe Fake Lag", "0.03", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Fe%20Fake%20Lag%20Obfuscator'))()")
	AddButton("Fe Creepy Walker", "0.18", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Fe%20Creepy%20Walker'))()")
	AddButton("Calculator", "0.33", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Calculator'))()")
	AddButton("Player Gui", "0.48", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Player%20Gui'))()")
	AddButton("Grab", "0.63", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Grab.txt'))()")
	AddButton("Tool Giver", "0.78", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Tool%20Giver%20v2'))()")
	AddButton("Teleport Gui", "0.03", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Teleport%20Gui'))()")
	AddButton("Audio Player", "0.18", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Music%20Player'))()")
	AddButton("UpDown", "0.33", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/UpDown'))()")
	AddButton("Invisible Gui", "0.48", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Invisible%20Gui'))()")
	AddButton("Auto Equip Tool", "0.63", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auto%20Equip%20Tool'))()")
	AddButton("Auto Jump", "0.78", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auto%20JumpX'))()")
	AddButton("Annoy Player", "0.03", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Annoy%20Player'))()")
	AddButton("Floating v2", "0.18", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Floating%20v2%20Obfuscator'))()")
	AddButton("Fling Player", "0.33", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Fling%20Player%20Obfuscator'))()")
	AddButton("Auto Presser", "0.48", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auto%20Presser%20Obfuscator'))()")
	AddButton("Hide Players", "0.63", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Hide%20Players'))()")
	AddButton("RTX Gui", "0.78", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/RTX%20Gui%20Hub'))()")
	AddButton("Freeze Camera", "0.03", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Freeze%20Camera%20Obfuscator'))()")
	AddButton("Super Tools", "0.18", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Super%20Tools%20Obfuscator'))()")
	AddButton("R6 Emotes Gui", "0.33", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/R6%20Posing%20Obfuscator'))()")
	AddButton("Time Stop", "0.48", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Time%20Stop'))()")
	AddButton("Hitbox Costumizer", "0.63", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/HitBox%20Costumizer%20v2'))()")
	AddButton("Back/Front Flip", "0.78", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Flip%20Button%20Obfuscator'))()")
	AddPageButton("1", "FrameContent:ClearAllChildren() AddGhostScript2()")
end;
function AddGhostScript2()
	AddButton("Freeze Tool", "0.03", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Freeze%20Tool%20Obfuscator'))()")
	AddButton("Freecam", "0.18", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Freecam'))()")
	AddButton("Animation Maker", "0.33", "0.09", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Animation%20Maker"))()')
	AddButton("Portal", "0.48", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Portal'))()")
	AddButton("Attach Tool", "0.63", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Attach%20Tool'))()")
	AddButton("Auto Fling Player", "0.78", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Fling%20Player'))()")
	AddButton("Telescope", "0.03", "0.29", "loadstring(game:HttpGet('https://pastebin.com/raw/8T0STS4f'))()")
	AddButton("Copy Animation", "0.18", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Copy%20Animation'))()")
	AddButton("Float R15/R6", "0.33", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()")
	AddButton("Game Teleporter", "0.48", "0.29", "loadstring(game:HttpGet('https://pastebin.com/raw/hiWAdBMa'))()")
	AddButton("Green Screen", "0.63", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Green%20Screen'))()")
	AddButton("Part Fly Bypass", "0.78", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Part%20Fly%20Bypass'))()")
	AddButton("Light Part Pet", "0.03", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Light%20Part%20Pet'))()")
	AddButton("CCTV Camera", "0.18", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/CCTV%20Camera'))()")
	AddButton("Control Player", "0.33", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Control%20Player'))()")
	AddButton("Break Camera", "0.48", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Break%20Camera'))()")
	AddButton("Vehicle Fly Gui", "0.63", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Vehicle%20Fly%20Gui'))()")
	AddButton("Timer", "0.78", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Timer'))()")
	AddButton("Chat Hax", "0.03", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Chat%20Hax'))()")
	AddButton("Face Changer", "0.18", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Face%20Changer'))()")
	AddButton("Modifer Gui", "0.33", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Modifier%20Gui'))()")
	AddButton("Player Death Notification", "0.48", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Player%20Death%20Notification'))()")
	AddButton("Accessories Gui", "0.63", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Accessories%20Gui'))()")
	AddButton("Void", "0.78", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Void'))()")
	AddPageButton("2", "FrameContent:ClearAllChildren() AddGhostScript3()")
end;
function AddGhostScript3()
	AddButton("Auto Walk", "0.03", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Walk%20Obfuscator'))()")
	AddButton("Player Remover", "0.18", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Player%20Remover%20Obfuscator'))()")
	AddButton("Body Follow Camera", "0.33", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Body%20Follow%20Camera'))()")
	AddButton("Player Join Left Notify", "0.48", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Player%20Join%20Left%20Notification'))()")
	AddButton("ShiftLock", "0.63", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/ShiftLock'))()")
	AddButton("Fake Headless", "0.78", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Fake%20Headless%26Korblox'))()")
	AddButton("Animation Stealer", "0.03", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Animation%20Stealer'))()")
	AddButton("Ghostplayer Outfit", "0.18", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Ghostplayer%20Outfit'))()")
	AddButton("Part Name Detector", "0.33", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Part%20Name%20Detector'))()")
	AddButton("Position Reader", "0.48", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Position%20Reader'))()")
	AddButton("Climb Walls", "0.63", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Climb%20Walls'))()")
	AddButton("Players Detector", "0.78", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Players%20Detector'))()")
	AddButton("Auto Chat", "0.03", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Auto%20Chat'))()")
	AddButton("Remove All Players", "0.18", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Remove%20All%20Players'))()")
	AddButton("Ambient Gui", "0.33", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('88e91557e59e811777971cf29c9766f5')")
	AddButton("First Person Camera", "0.48", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/First%20Person%20Camera'))()")
	AddButton("Anti Fling", "0.63", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('34f43d1bdd0b887bfe1516d4c8c587f8')")
	AddButton("Headsit Gui", "0.78", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Head%20Sit%20Gui'))()")
	AddButton("Animation Player", "0.03", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Animation%20Player'))()")
	AddButton("Ghost Mode", "0.18", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Ghost%20Mode'))()")
	AddButton("Tool Activator", "0.33", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Tool%20Activator'))()")
	AddButton("Clone", "0.48", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Clone'))()")
	AddButton("Upsidedown", "0.63", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Upsidedown'))()")
	AddButton("Account Age Detector", "0.78", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Account%20Age%20Detector'))()")
	AddPageButton("3", "FrameContent:ClearAllChildren() AddGhostScript4()")
end;
function AddGhostScript4()
	AddButton("Fe Animation Gui", "0.03", "0.09", "AutoLoadAnimation = false loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('0535e418dc1e7c5ea80520b2567d0489')")
	AddButton("Face Changer Gui", "0.18", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Face%20Changer'))()")
	AddButton("Cannon Ball", "0.33", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Cannon%20Ball'))()")
	AddButton("Fall Gui", "0.48", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('35487fdd8d70227a1537e4dfa2d21e5c')")
	AddButton("Part Gui", "0.63", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('583e3bd54554f2bfdcd007a49fa6b035')")
	AddButton("Gui Maker", "0.78", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('b5108493abd872ea6cc06811c203772d')")
	AddButton("Crawling Gui", "0.03", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Crawling%20Gui'))()")
	AddButton("Fly Riding Gui", "0.18", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Fly%20Riding%20Gui.txt'))()")
	AddButton("Fe Fake Death", "0.33", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Fe%20Fake%20Death'))()")
	AddButton("Spam Tools", "0.48", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Spam%20Tools'))()")
	AddButton("Spectator", "0.63", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('38721bd8d7c0aa7e0e6999ae0c2cc98d')")
	AddButton("Chat Font Gui", "0.78", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('9145e2546148d6e154f7e57af5917b66')")
	AddButton("Clothes Stealer Gui", "0.03", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('5d75bcd69db1fd272d7dc7011d9211fe')")
	AddButton("Change Players", "0.18", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('e402fbc440ab9de9698b84cd57e1e50d')")
	AddButton("Music Player", "0.33", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('7208e39603889391caf77f6ff7d21e01')")
	AddButton("Player Inspector", "0.48", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('c1551053fcd10e6b625a3ea54e236f25')")
	AddButton("Save Server Gui", "0.63", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('6abc8c09bf8fdf096f4a1ed90ba1867b')")
	AddButton("Avatar Outfit Changer", "0.78", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Avatar%20Outfit%20Changer'))()")
	AddButton("Save Emotes Gui", "0.03", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('494875576069d0fe74e7b17337a1acdf')")
	AddButton("Script Obfuscator", "0.18", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('b1b0f7ee287d973b18881eb1167dd57a')")
	AddButton("Tic Tac Toe", "0.33", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Tic%20Tac%20Toe'))()")
	AddButton("Math Problem", "0.48", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Math%20Problem'))()")
	AddButton("XOR Obfuscator", "0.63", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('b9021ad8c9d6a1afd496c0e8672096ca')")
	AddButton("Copy Avatar", "0.78", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Copy%20Avatar'))()")
	AddPageButton("4", "FrameContent:ClearAllChildren() AddGhostScript1()")
end;
function AddOther1()
	AddButton("Infinite Yield", "0.03", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Infinite%20Yield%20%5BEdited%5D.txt'))()")
	AddButton("Btool", "0.18", "0.09", "Instance.new('HopperBin', game.Players.LocalPlayer.Backpack).BinType = 4")
	AddButton("Invisible Tool", "0.33", "0.09", "loadstring(game:HttpGet('https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)',true))()")
	AddButton("Annoy", "0.48", "0.09", "loadstring(game:HttpGet('https://pastebin.com/raw/1cHdCvTF'))()")
	AddButton("Fe Invisible Car", "0.63", "0.09", "loadstring(game:HttpGet('https://pastebin.com/raw/RycT000M'))()")
	AddButton("FPS Checker", "0.78", "0.09", "loadstring(game:HttpGet('https://pastebin.com/raw/4qHBtwD4'))()")
	AddButton("Show Private Chats", "0.03", "0.29", "loadstring(game:HttpGet('https://pastebin.com/raw/AXY5qEyr'))()")
	AddButton("Modified Walking", "0.18", "0.29", "loadstring(game:HttpGet('https://pastebin.com/raw/qJLM35jg'))()")
	AddButton("Tp Player Gui", "0.33", "0.29", "loadstring(game:HttpGet('https://gist.githubusercontent.com/DagerFild/b4776075a0d26ef04394133ee6bd2081/raw/0ed51ac94057d2d9a9f00e1b037b9011c76ca54a/tpGUI', true))()")
	AddButton("R15 Animation Gui", "0.48", "0.29", "loadstring(game:HttpGet('https://pastebin.com/raw/5HNpk2yN'))()")
	AddButton("Translator", "0.63", "0.29", "loadstring(game:HttpGet('https://pastefy.app/xMRHE8Xd/raw'))()")
	AddButton("Fe Emotes", "0.78", "0.29", 'loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/RedZenXYZ/3da6af1961efa275de6c3c2a6dbace03/raw/bb027f99cec0ea48ef9c5eabfb9116ddff20633d/FE%2520Emotes%2520Gui"))()')
	AddButton("Animation Gui", "0.03", "0.49", "loadstring(game:HttpGet('https://pastebin.com/raw/Rv4XeaBA'))()")
	AddButton("Fe Small", "0.18", "0.49", "loadstring(game:HttpGet('https://pastebin.com/raw/iwBGSs0s'))()")
	AddButton("Punch Fling", "0.33", "0.49", "loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))()")
	AddButton("Fe Yeet", "0.48", "0.49", "loadstring(game:HttpGet('https://pastebin.com/raw/0uE8fzRY'))()")
	AddButton("Rejoin Button On Kick", "0.63", "0.49", "loadstring(game:HttpGet('https://pastebin.com/raw/btg6ydMZ'))()")
	AddButton("Op Keyboard", "0.78", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt', true))()")
	AddButton("Spectate Gui", "0.03", "0.69", "loadstring(game:HttpGet('https://pastebin.com/raw/92PvX9n5'))()")
	AddButton("ShiftLock", "0.18", "0.69", "loadstring(game:HttpGet('https://pastefy.app/s9gaa6bc/raw'))()")
	AddButton("Tall Character", "0.33", "0.69", "loadstring(game:HttpGet('https://pastebin.com/raw/xB8aWGsJ'))()")
	AddButton("Fe Ball (R15)", "0.48", "0.69", "loadstring(game:HttpGet('https://pastebin.com/raw/BZr9bGDy'))()")
	AddButton("Wall Walking", "0.63", "0.69", "loadstring(game:HttpGet('https://pastebin.com/raw/zXk4Rq2r'))()")
	AddButton("Fe Fly", "0.78", "0.69", "loadstring(game:HttpGet('https://gist.githubusercontent.com/meozoneYT/bf037dff9f0a70017304ddd67fdcd370/raw/e14e74f425b060df523343cf30b787074eb3c5d2/arceus%2520x%2520fly%25202%2520obflucator'))()")
	AddPageButton("1", "FrameContent:ClearAllChildren() AddOther2()")
end;
function AddOther2()
	AddButton("Dex Explorer", "0.03", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Shadow%20Dex%20Explorer.txt'))()")
	AddButton("Touch Fling", "0.18", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI'))()")
	AddButton("Flash Back", "0.33", "0.09", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/L"))()')
	AddButton("Accessories Remover", "0.48", "0.09", "loadstring(game:HttpGet('https://pastebin.com/raw/JHRfeCEi'))()")
	AddButton("Drone", "0.63", "0.09", "loadstring(game:HttpGet('https://pastebin.com/raw/mC6RLFTe'))()")
	AddButton("Esp MapHack", "0.78", "0.09", "loadstring(game:HttpGet('https://pastebin.com/raw/BT2ckPxB'))()")
	AddButton("Player Collision", "0.03", "0.29", "loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/Collision.txt'),true))()")
	AddButton("Fake Tools", "0.18", "0.29", "loadstring(game:HttpGet(('https://pastefy.app/VYIAk3o1/raw'),true))()")
	AddButton("Draw Art Chat", "0.33", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/ocfi/Choose-ARt-able-remove/main/wassdaadwasda'))()")
	AddButton("Speed Tool", "0.48", "0.29", "loadstring(game:HttpGet('https://pastebin.com/raw/u81rsSPX'))()")
	AddButton("Crawl Gui", "0.63", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_vZDX8j5ggfAf58QhdJ59BVEmF6nmZgq4Mcjt2l8wn16CiStIW2P6EkNc605qv9K4.lua.txt'))()")
	AddButton("Chat Bypass", "0.78", "0.29", "loadstring(game:HttpGet('https://pastebin.com/raw/Zh3cPqEn'))()")
	AddButton("Universal Btool", "0.03", "0.49", "loadstring(game:GetObjects('rbxassetid://6695644299')[1].Source)()")
	AddButton("Synapse Executor", "0.18", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Synapse%20Executor%20(Source%20Code).txt'))()")
	AddButton("Player Lifter", "0.33", "0.49", "loadstring(game:HttpGet('https://pastebin.com/raw/czWTLzF1'))()")
	AddButton("Admin Spy Gui", "0.48", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MichaelScripter/MiniScript/main/Spy%20gui.lua'))()")
	AddButton("Telekinisis", "0.63", "0.49", 'loadstring(game:HttpGet("https://rawscripts.net/raw/a-literal-baseplate.-FE-Telekinesis-15523"))()')
	AddButton("Freeze Button", "0.78", "0.49", "loadstring(game:HttpGet('https://pastebin.com/raw/t0sVziwd'))()")
	AddButton("Lag Switch", "0.03", "0.69", 'local CoreGui = game:GetService("StarterGui") CoreGui:SetCore("SendNotification", {Title = "Script",Text = "Press X to Active",Duration = 2.5,}) loadstring(game:HttpGet("https://paste.gg/p/anonymous/d3492bd620bd4c46b54680ac80b0fa0d/files/161ddd9c992c4ceba3c298458d45188a/raw", true))()')
	AddButton("Fling Gui", "0.18", "0.69", "loadstring(game:HttpGet('https://pastebin.com/raw/LVaAkFcv'))()")
	AddButton("Krnl Executor", "0.33", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/wtfplayer/redemption/main/krnlnoui.lua'))()")
	AddButton("Vehicle Fly", "0.48", "0.69", "loadstring(game:HttpGet('https://pastebin.com/raw/4AAmpN59'))()")
	AddButton("Mouse Cursor", "0.63", "0.69", "loadstring(game:HttpGet(('https://pastefy.app/58d8d52G/raw'),true))()")
	AddButton("R6 Avatar", "0.78", "0.69", "loadstring(game:HttpGet('https://pastebin.com/raw/aVGeYAB2'))()")
	AddPageButton("2", "FrameContent:ClearAllChildren() AddOther3()")
end;
function AddOther3()
	AddButton("White Dex Explorer", "0.03", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/White%20Dex%20Explorer.txt'))()")
	AddButton("Freeze Gui", "0.18", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/creepstu/fuzzy-octo-giggle/main/Source'))()")
	AddButton("Fe Illusion", "0.33", "0.09", "loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt'))()")
	AddButton("Player Bringer", "0.48", "0.09", "loadstring(game:HttpGet(('https://pastebin.com/raw/VXq46irC'),true))()")
	AddButton("Aimbot Gui", "0.63", "0.09", "loadstring(game:HttpGet('https://pastefy.app/EuhKbIsr/raw'))()")
	AddButton("Tool Animator", "0.78", "0.09", "loadstring(game:HttpGet(('https://pastebin.com/raw/dkufMsdA'),true))()")
	AddButton("Tools Giver", "0.03", "0.29", "loadstring(game:HttpGet(('https://pastefy.app/VYIAk3o1/raw'),true))()")
	AddButton("Fe Climb Walls", "0.18", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_E872F3ky4888TSVdj6Adgi1hSLtM038AyxVpTVw07QA3QUDcI3sxmuD869hYR4id.lua.txt'))()")
	AddButton("Player Orbit Gui", "0.33", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe./main/Orbit%20GUI'))()")
	AddButton("Speed & Jumppower", "0.48", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/Shugare/Speed/main/S', true))()")
	AddButton("Chat Splitter", "0.63", "0.29", "loadstring(game:HttpGet('https://raw.githubusercontent.com/AZYsGithub/ChatBypasser-AZY/main/Chat%20Bypass%20-%20ChatSplitter(Source).lua'))()")
	AddButton("Fake Chat", "0.78", "0.29", "loadstring(game:GetObjects('rbxassetid://1262435912')[1].Source)()")
	AddButton("Invisible Teleport Gui", "0.03", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe./dbb6ce6f6cee4f7a5c9e20d7b88e83db2a93bf25/Invisible%20GUI'))()")
	AddButton("Ignore ToucInterests", "0.18", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main',true))()")
	AddButton("Anti Afk Gui", "0.33", "0.49", "loadstring(game:HttpGet('https://pastebin.com/raw/TRCYuX46'))()")
	AddButton("Script Executor", "0.48", "0.49", "loadstring(game:HttpGet('https://pastebin.com/raw/CFAfsC0b'))()")
	AddButton("Universal Esp Gui", "0.63", "0.49", "loadstring(game:HttpGet(('https://pastebin.com/raw/XJswfPAc'),true))()")
	AddButton("Hole", "0.78", "0.49", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Hole'))()")
	AddButton("FPS Boost Gui", "0.03", "0.69", "loadstring(game:HttpGet('https://raw.githubusercontent.com/gclich/FPS-X-GUI/main/FPS_X.lua'))()")
	AddButton("Universal Flashlight", "0.18", "0.69", "loadstring(game:HttpGet('https://pastebin.com/raw/6qrp4atm'))()")
	AddButton("Shade RTX Gui", "0.33", "0.69", "getgenv().RTX_Name = 'Midday lite' loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))()")
	AddButton("Float Tool", "0.48", "0.69", "loadstring(game:HttpGet('https://pastebin.com/raw/3kU6xxcE'))()")
	AddButton("Custom Keyboard", "0.63", "0.69", "loadstring(game:HttpGet('https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Fr'))()")
	AddButton("Auto Cliker", "0.78", "0.69", "loadstring(game:HttpGet(('https://pastefy.app/VPqgV9IN/raw'),true))()")
	AddPageButton("3", "FrameContent:ClearAllChildren() AddOther1()")
end;
local GameHubSlotNum = 0;
local GameHubPosX = 0.03;
local GameHubPosZ = 0.02;
local function AddGameHubButton(name, script)
	local GameHubButton = Instance.new("TextButton")
	GameHubButton.Parent = FrameGameHub;
	GameHubButton.BackgroundColor3 = Color3.new(0, 0, 0)
	GameHubButton.BackgroundTransparency = 0;
	GameHubButton.BorderSizePixel = 1;
	GameHubButton.BorderColor3 = Color3.new(1, 1, 1)
	GameHubButton.Position = UDim2.new(GameHubPosX, 0, GameHubPosZ)
	GameHubButton.TextColor3 = Color3.new(1, 1, 1)
	GameHubButton.Size = UDim2.new(0.13, 0, 0.0455)
	GameHubButton.Font = Enum.Font.Merriweather;
	GameHubButton.FontSize = Enum.FontSize.Size14;
	GameHubButton.Text = name;
	GameHubButton.TextScaled = true;
	GameHubButton.TextSize = 8;
	GameHubButton.TextWrapped = true;
	GameHubButton.MouseButton1Click:connect(function()
		loadstring(script)()
	end)
	GameHubSlotNum = GameHubSlotNum + 1;
	GameHubPosX = GameHubPosX + 0.15;
	if GameHubSlotNum == 6 then
		GameHubSlotNum = 0;
		GameHubPosX = 0.03;
		GameHubPosZ = GameHubPosZ + 0.06
	end
end;
AddGameHubButton("Natural Disaster", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Natural%20Disaster'))()")
AddGameHubButton("Pass The Bomb", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Pass%20The%20Bomb.txt'))()")
AddGameHubButton("Workout Island", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Workout%20Island'))()")
AddGameHubButton("Blood Moon Tycoon", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Blood%20Moon%20Tycoon'))()")
AddGameHubButton("Andy's Musical Chairs", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Musical%20Chairs'))()")
AddGameHubButton("Homework Lifting Simulator", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Home%20Work%20Lifting%20Simulator'))()")
AddGameHubButton("The Clown Killings Reborn", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/The%20Clown%20Killings%20Reborn'))()")
AddGameHubButton("Murder Mystery", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Murder%20Mystery'))()")
AddGameHubButton("Bokuno Roblox", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/heads/main/Bokuno%20Roblox"))()')
AddGameHubButton("Tower Of Jump", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Tower%20Of%20Jump'))()")
AddGameHubButton("Cars Trading", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Cars%20Trading'))()")
AddGameHubButton("Knife Ability Test", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Knife%20Ability%20Test'))()")
AddGameHubButton("Boss Fighting Simulator", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Boss%20Fighting%20Simulator'))()")
AddGameHubButton("Gym Training Simulator", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Gym%20Training%20Simulator'))()")
AddGameHubButton("Clone Tycoon 2", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Clone%20Tycoon%202'))()")
AddGameHubButton("Survive And Kill The Killers Area51", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Survive%20And%20Kill%20The%20Killers%20Area51'))()")
AddGameHubButton("Happy Runner", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Happy%20Runners'))()")
AddGameHubButton("Swordman Simulator", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/SwordMan%20Simulator'))()")
AddGameHubButton("The Underground War", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/The%20UnderGround%20War'))()")
AddGameHubButton("Weapon Simulator 2", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Weapon%20Simulator%202"))()')
AddGameHubButton("The Underground War 2", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/The%20UnderGround%20War%202'))()")
AddGameHubButton("Build A Boat For Treassure", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Build%20A%20Boat%20For%20Treasure'))()")
AddGameHubButton("Color Block Race", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('1dc27965edb6c00285b8141b938ac35c')")
AddGameHubButton("Collor Block Tower", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Collor%20Block%20Tower'))()")
AddGameHubButton("Math Race", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Math%20Race.txt'))()")
AddGameHubButton("Big Brain Simulator", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Big%20Brain%20Simulator'))()")
AddGameHubButton("Answer Or Die", "loadstring(game:HttpGet('https://raw.githubusercontent.com/jaeelin/S-Ware/main/Answer%20or%20Die'))()")
AddGameHubButton("Impossible Glass Bridge Obby", 'if game.PlaceId == 7952502098 then for i,v in pairs(game:GetService("Workspace")["Glass Bridge"].GlassPane:GetDescendants()) do   if v:IsA("BasePart") and v.CanCollide == false then       v.CanCollide = true       v.Color = Color3.fromRGB(255, 0, 0)   end end spawn(function()   while true do       task.wait() for i,v in pairs(game:GetService("Workspace")["Glass Bridge"].GlassPane:GetDescendants()) do   if v:IsA("TouchTransmitter") then       v:Destroy()   end end end end) else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(7952502098)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = 300able}) end')
AddGameHubButton("Burp Simulator", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Burp%20Simulator'))()")
AddGameHubButton("Climb 1000 Stairs", 'if game.PlaceId == 5702593762 then loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Climb%201k%20Stairs"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(5702593762)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Castle Wars", 'if game.PlaceId == 5059952999 then loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Castle%20Wars"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(5059952999) elseif answer == "No" then end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Mega Hide And Seek", 'if game.PlaceId == 5708035517 then loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Mega%20Hide%20And%20Seek"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(5708035517)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Rise A Yipee", 'if game.PlaceId == 9742783208 then loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Rise%20A%20Yippee"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(9742783208)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Speed Run Simulator", 'if game.PlaceId == 7047488135 then loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Speed%20Run%20Simulator"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(7047488135)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Tower Of Madness", 'if game.PlaceId == 6470944645 then loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Tower%20Of%20Madness"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(6470944645)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Victory Jump", 'if game.PlaceId == 10379662529 then loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Victory%20Jump"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(10379662529)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Cheese Escape", 'if game.PlaceId == 5777099015 then loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Cheese%20Escape"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(5777099015)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Survive The Killer", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Milan08Studio/ChairWare/main/main.lua"))()')
AddGameHubButton("Stairs Of Rage", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Stairs%20Of%20Rage"))()')
AddGameHubButton("Evade", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Evade"))()')
AddGameHubButton("Hide And Seek Extreme", 'if game.PlaceId == 205224386 then loadstring(game:HttpGet("https://raw.githubusercontent.com/MainScripts352/MainScripts352/main/Hide%20And%20Seek%20Extreme"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(205224386)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Dreaming Simulator", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Dreaming%20Simulator"))()')
AddGameHubButton("Ragdoll Engine", 'local credits = "SystemBroken made by system_calix" loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()')
AddGameHubButton("Ramen Simulator", 'if game.PlaceId == 4961974633 then loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Ramen%20Simulator"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(4961974633)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Legends Of Speed", 'if game.PlaceId == 3101667897 then loadstring(game:HttpGet("https://pastebin.com/raw/mqGPg69N"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(3101667897)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Banana Eats", 'if game.PlaceId == 4448566543 then loadstring(game:HttpGet("https://gist.githubusercontent.com/NovaVanity/131e258977e50e1ec0184c72818b8bfd/raw", true))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(4448566543)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("The Floor Is Lava", 'if game.PlaceId == 815405518 then loadstring(game:HttpGet("https://pastebin.com/raw/XRVVXkJj"))() else local function Callback(answer)    if answer == "Join" then game:GetService("TeleportService"):Teleport(815405518)    elseif answer == "No" then    end end local Bindable = Instance.new("BindableFunction") Bindable.OnInvoke = Callback game.StarterGui:SetCore("SendNotification", {    Title = "GhostPlayer";    Text = "This Script is not Allowed in this game do you want to teleport in the game script?";    Duration = "300";    Button1 = "Join";    Button2 = "No";    Callback = Bindable}) end')
AddGameHubButton("Guess How Many", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Guess%20How%20Many'))()")
AddGameHubButton("Logo Quiz", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Logo%20Quiz'))()")
AddGameHubButton("Find The Button", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Find%20The%20Button'))()")
AddGameHubButton("Collect The Body", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Collect%20The%20Body'))()")
AddGameHubButton("Hide And Seek Props Hunt", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Hide%20And%20Seek%20Props%20Hunt'))()")
AddGameHubButton("Every Second You Get +1 Points", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Every%20Second%20You%20Get%20%2B1%20Points'))()")
AddGameHubButton("Egg Empire", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Egg%20Empire'))()")
AddGameHubButton("Find The Code 2", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Find%20the%20code%202'))()")
AddGameHubButton("Crown Divers", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Crown%20Divers'))()")
AddGameHubButton("Survive Flight 871", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Survive%20Flight%20871'))()")
AddGameHubButton("Letter Scramble!", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('5bf646558fe8765a80fd649ca8b31868')")
AddGameHubButton("Gem Connect", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('aff72ef0e164989d4948bf75f3b8238d')")
AddGameHubButton("Color Block Clash", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('e8cfe1ed5b528a1452da3fe3dac5ff68')")
AddGameHubButton("Guess The Maths", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('f2e7472ea84635b235d1e3f61a68f6bb')")
AddGameHubButton("Math Boxing", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('355dd08adc07dcc80ac398618d7fa525')")
AddGameHubButton("Doors But Math", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('482dcb6ae7052175f6a975fe63910abe')")
AddGameHubButton("MM2 Duels", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/MM2%20Duels'))()")
AddGameHubButton("Musical Chairs", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Musical%20Chairs'))()")
AddGameHubButton("Lava Color Block", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Lava%20Color%20Block'))()")
AddGameHubButton("Guess The Drawing", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Guess%20The%20Drawing"))()')
AddGameHubButton("Closest Answer Wins", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Closest%20Answer%20Wins'))()")
AddGameHubButton("Math Answer or Die", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Math%20Answer%20or%20Die"))()')
AddGameHubButton("Scary Spelling", "loadstring(game:HttpGet('https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Scary%20Spelling'))()")
AddGameHubButton("Guess The Drawings!", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Guess%20The%20Drawings!'))()")
AddGameHubButton("Dance or Die", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Dance%20Stop'))()")
AddGameHubButton("Words or Die", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth'))()Ioad('9645c28a67e031371e4ca2e02f4f3b09')")
AddGameHubButton("Math Murder", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth"))()Ioad("bee8432b10b76727a88e5815452851eb")')
AddGameHubButton("Jack Of Hearts", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth"))()Ioad("b80d7e3c7537171e69f28aa0d5b7aff4")')
AddGameHubButton("Dodgeball Legends", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth"))()Ioad("920b7aa3d98882b4062dcf5e84cd73c7")')
AddGameHubButton("Memory Murder", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Memory%20Murder"))()')
AddGameHubButton("Bee Factory Tycoon", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/heads/main/Bee%20Factory%20Tycoon"))()')
AddGameHubButton("Build to Survive the Disasters", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Build%20To%20Survive%20the%20Disasters"))()')
Image.Parent = FrameCredits;
Image.BackgroundColor3 = Color3.new(0, 0, 0)
Image.BackgroundTransparency = 0;
Image.Size = UDim2.new(0.3, 0, 0.6)
Image.BorderColor3 = Color3.new(1, 1, 1)
Image.BorderSizePixel = 1;
Image.Position = UDim2.new(0.03, 0, 0.06)
Image.Image = "rbxassetid://14196845260"
Credits1.Parent = FrameCredits;
Credits1.BackgroundColor3 = Color3.new(0, 0, 0)
Credits1.BackgroundTransparency = 0;
Credits1.BorderSizePixel = 1;
Credits1.BorderColor3 = Color3.new(1, 1, 1)
Credits1.Position = UDim2.new(0.03, 0, 0.76)
Credits1.TextColor3 = Color3.new(1, 1, 1)
Credits1.Size = UDim2.new(0.15, 0, 0.135)
Credits1.Font = Enum.Font.Merriweather;
Credits1.FontSize = Enum.FontSize.Size14;
Credits1.Text = "My Profile"
Credits1.TextScaled = false;
Credits1.TextSize = 14;
Credits1.TextWrapped = true;
local Credits2 = Credits1:Clone()
Credits2.Parent = FrameCredits;
Credits2.Position = UDim2.new(0.19, 0, 0.76)
Credits2.Text = "My Group"
local Credits3 = Credits1:Clone()
Credits3.Parent = FrameCredits;
Credits3.Position = UDim2.new(0.35, 0, 0.76)
Credits3.Text = "My Discord"
local Credits4 = Credits1:Clone()
Credits4.Parent = FrameCredits;
Credits4.Position = UDim2.new(0.51, 0, 0.76)
Credits4.Text = "My Apps"
local Credits5 = Credits1:Clone()
Credits5.Parent = FrameCredits;
Credits5.Position = UDim2.new(0.67, 0, 0.76)
Credits5.Text = "My Channel"
local Credits6 = Credits1:Clone()
Credits6.Parent = FrameCredits;
Credits6.Position = UDim2.new(0.83, 0, 0.76)
Credits6.Text = "My Game"
Information.Parent = FrameCredits;
Information.BackgroundColor3 = Color3.new(0, 0, 0)
Information.BackgroundTransparency = 1;
Information.BorderColor3 = Color3.new(1, 1, 1)
Information.BorderSizePixel = 0;
Information.Position = UDim2.new(0.37, 0, 0.09)
Information.TextColor3 = Color3.new(1, 1, 1)
Information.Size = UDim2.new(0.6, 0, 0.5)
Information.Font = Enum.Font.Merriweather;
Information.FontSize = Enum.FontSize.Size14;
Information.Text = "Gui Created By Ghostplayer, This Gui Created On August 16 2022 its Spend 3 to 4 days before the developer published this script its have alot of Features from ghostplayer and Other Scripters Hope you guys Enjoyed to use this script, Click the Buttons Below for more Information"
Information.TextScaled = false;
Information.TextSize = 13;
Information.TextWrapped = true;
local Image1 = "rbxassetid://14196845260"
local Image2 = "rbxassetid://14196847158"
local Image3 = "rbxassetid://14209734898"
local Image4 = "rbxassetid://9939435592"
local Image5 = "rbxassetid://9588320159"
local Image6 = "rbxassetid://17722125795"
local Image7 = "rbxassetid://17722203547"
local Image8 = "rbxassetid://17722287235"
local Image9 = "rbxassetid://17722330723"
local Image10 = "rbxassetid://17722360682"
local Image11 = "rbxassetid://17722376730"
local Image12 = "rbxassetid://17722410204"
local Image13 = "rbxassetid://17722447244"
local Image14 = "rbxassetid://17722469621"
local Image15 = "rbxassetid://90395622277279"
local Image16 = "rbxassetid://136001537690363"
local Image17 = "rbxassetid://107579665096083"
ImageNum = 1;
Image.MouseButton1Click:Connect(function()
	ImageNum = ImageNum + 1;
	if ImageNum == 18 then
		ImageNum = 1
	end;
	if ImageNum == 1 then
		Image.Image = Image1
	end;
	if ImageNum == 2 then
		Image.Image = Image2
	end;
	if ImageNum == 3 then
		Image.Image = Image3
	end;
	if ImageNum == 4 then
		Image.Image = Image4
	end;
	if ImageNum == 5 then
		Image.Image = Image5
	end;
	if ImageNum == 6 then
		Image.Image = Image6
	end;
	if ImageNum == 7 then
		Image.Image = Image7
	end;
	if ImageNum == 8 then
		Image.Image = Image8
	end;
	if ImageNum == 9 then
		Image.Image = Image9
	end;
	if ImageNum == 10 then
		Image.Image = Image10
	end;
	if ImageNum == 11 then
		Image.Image = Image11
	end;
	if ImageNum == 12 then
		Image.Image = Image12
	end;
	if ImageNum == 13 then
		Image.Image = Image13
	end;
	if ImageNum == 14 then
		Image.Image = Image14
	end;
	if ImageNum == 15 then
		Image.Image = Image15
	end;
	if ImageNum == 16 then
		Image.Image = Image16
	end;
	if ImageNum == 17 then
		Image.Image = Image17
	end
end)
Credits1.MouseButton1Click:connect(function()
	setclipboard("https://www.roblox.com/users/5347040425/profile")
	RequestMessage("Script", "Link Copied")
end)
Credits2.MouseButton1Click:connect(function()
	setclipboard("https://www.roblox.com/communities/11536155")
	RequestMessage("Script", "Link Copied")
end)
Credits3.MouseButton1Click:connect(function()
	setclipboard("https://discord.gg/DhTfbqeE4F")
	RequestMessage("Script", "Link Copied")
end)
Credits4.MouseButton1Click:connect(function()
	RequestMessage("Script", "Link Copied")
	setclipboard("https://www.mediafire.com/file/eo7n0kszai8dy2s/Ghost_Obfuscator.apk/file")
	wait()
	setclipboard("https://www.mediafire.com/file/mjyg28n1k5m2dgz/Roblox_Scripts.apk/file")
	wait()
	setclipboard("https://www.mediafire.com/file/f7wvj0grjtg3z42/Hash_Code.apk/file")
end)
Credits5.MouseButton1Click:connect(function()
	RequestMessage("Script", "Link Copied")
	setclipboard("https://youtube.com/channel/UChbZk_X9wQ_Xgh5GdL04TEA?si=12aeUt6PFF3e318M")
end)
Credits6.MouseButton1Click:connect(function()
	local PlaceId = 140261737168217;
	if game.PlaceId ~= PlaceId then
		local function JoinToMyGameFunction(answer)
			if answer == "Join" then
				game:GetService("TeleportService"):Teleport(PlaceId)
				game:GetService("TeleportService").TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
					RequestMessage("Script", "Teleport Failed!", "Game Link Copied!", 3)
					setclipboard("https://www.roblox.com/games/" .. PlaceId)
				end)
			end
		end;
		local Bindable = Instance.new("BindableFunction")
		Bindable.OnInvoke = JoinToMyGameFunction;
		game.StarterGui:SetCore("SendNotification", {
			Title = "Ghostplayer";
			Text = "Do you want to teleport in my game?";
			Duration = "100";
			Button1 = "Join";
			Button2 = "No";
			Callback = Bindable
		})
	end
end)
local FeedbackText = Instance.new("TextLabel")
FeedbackText.Parent = FrameFeedback;
FeedbackText.BackgroundColor3 = Color3.new(0, 0, 0)
FeedbackText.BackgroundTransparency = 0;
FeedbackText.BorderColor3 = Color3.new(1, 1, 1)
FeedbackText.BorderSizePixel = 0;
FeedbackText.Position = UDim2.new(0.03, 0, 0.03)
FeedbackText.TextColor3 = Color3.new(1, 1, 1)
FeedbackText.Size = UDim2.new(0.94, 0, 0.4)
FeedbackText.Font = Enum.Font.Merriweather;
FeedbackText.FontSize = Enum.FontSize.Size14;
FeedbackText.Text = "Feedback:\nHello it's me Ghostplayer, if you have any comment or suggestions for me please message me here for Feedback \nI appreciate your support Thank You!"
FeedbackText.TextScaled = true;
FeedbackText.TextSize = 24;
FeedbackText.TextWrapped = true;
FeedbackText.Active = true;
local Feedback_Padding = Instance.new("UIPadding")
Feedback_Padding.PaddingLeft = UDim.new(0, 20)
Feedback_Padding.PaddingRight = UDim.new(0, 20)
Feedback_Padding.PaddingTop = UDim.new(0, 10)
Feedback_Padding.PaddingBottom = UDim.new(0, 10)
Feedback_Padding.Parent = FeedbackText;
local FeedbackTextBox = Instance.new("TextBox")
FeedbackTextBox.Parent = FrameFeedback;
FeedbackTextBox.BackgroundColor3 = Color3.new(0, 0, 0)
FeedbackTextBox.BackgroundTransparency = 0;
FeedbackTextBox.BorderColor3 = Color3.new(1, 1, 1)
FeedbackTextBox.BorderSizePixel = 1;
FeedbackTextBox.Position = UDim2.new(0.03, 0, 0.49)
FeedbackTextBox.TextColor3 = Color3.new(1, 1, 1)
FeedbackTextBox.TextXAlignment = Enum.TextXAlignment.Left;
FeedbackTextBox.TextYAlignment = Enum.TextYAlignment.Top;
FeedbackTextBox.Size = UDim2.new(0.8, 0, 0.44)
FeedbackTextBox.Font = Enum.Font.Merriweather;
FeedbackTextBox.FontSize = Enum.FontSize.Size14;
FeedbackTextBox.Text = ""
FeedbackTextBox.ClearTextOnFocus = false;
FeedbackTextBox.MultiLine = true;
FeedbackTextBox.TextScaled = false;
FeedbackTextBox.TextSize = 20;
FeedbackTextBox.TextWrapped = true;
FeedbackTextBox.Active = true;
local FeedbackPost = Instance.new("TextButton")
FeedbackPost.Parent = FrameFeedback;
FeedbackPost.BackgroundColor3 = Color3.new(0, 0, 0)
FeedbackPost.BackgroundTransparency = 0;
FeedbackPost.BorderColor3 = Color3.new(1, 1, 1)
FeedbackPost.BorderSizePixel = 1;
FeedbackPost.Position = UDim2.new(0.85, 0, 0.7)
FeedbackPost.TextColor3 = Color3.new(1, 1, 1)
FeedbackPost.Size = UDim2.new(0.12, 0, 0.23)
FeedbackPost.Font = Enum.Font.Merriweather;
FeedbackPost.FontSize = Enum.FontSize.Size14;
FeedbackPost.Text = "Send"
FeedbackPost.TextScaled = true;
FeedbackPost.TextSize = 24;
FeedbackPost.TextWrapped = true;
FeedbackPost.Active = true;
local Feedback_Padding2 = Instance.new("UIPadding")
Feedback_Padding2.PaddingLeft = UDim.new(0, 10)
Feedback_Padding2.PaddingRight = UDim.new(0, 10)
Feedback_Padding2.PaddingTop = UDim.new(0, 5)
Feedback_Padding2.PaddingBottom = UDim.new(0, 5)
Feedback_Padding2.Parent = FeedbackPost;
FeedbackPost.MouseButton1Click:Connect(function()
	FeedbackPost.Text = "Sending.."
	FeedbackPost.Active = false;
	FeedbackTextBox.Active = false;
	local content = "```✅ 𝗚𝗵𝗼𝘀𝘁𝗵𝘂𝗯 𝗙𝗲𝗲𝗱𝗯𝗮𝗰𝗸\n\nUsername: " .. game.Players.LocalPlayer.Name .. "\nDisplay: " .. game.Players.LocalPlayer.DisplayName .. "\nUser ID: " .. game.Players.LocalPlayer.UserId .. "\n\nMessage: " .. FeedbackTextBox.Text .. "```"
	local webhookUrl = "https://anti-httpspy-webhook-feedback-99ll.onrender.com/send"
	local messageData = {
		["message"] = content,
		["pin"] = "MyPin_00192927272821838"
	}
	local request = http.request or http_request or request or syn.request or fluxus.request;
	local send = request({
		Url = webhookUrl,
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = game.HttpService:JSONEncode(messageData)
	})
	Feedback_Number = Feedback_Number - 1;
	FeedbackPost.Text = "Send"
	FeedbackTextBox.Text = ""
	FeedbackPost.Active = true;
	FeedbackTextBox.Active = true;
	RequestMessage("Script", "Message Sent!")
end)
local Settings_IconSize = Instance.new("TextButton")
Settings_IconSize.Parent = FrameSettings;
Settings_IconSize.BackgroundColor3 = Color3.new(0, 0, 0)
Settings_IconSize.BackgroundTransparency = 1;
Settings_IconSize.Position = UDim2.new(0.035, 0, 0.1)
Settings_IconSize.TextColor3 = Color3.new(1, 1, 1)
Settings_IconSize.Size = UDim2.new(0.15, 0, 0.1)
Settings_IconSize.Font = Enum.Font.Merriweather;
Settings_IconSize.Text = "Icon Size"
Settings_IconSize.TextXAlignment = Enum.TextXAlignment.Left;
Settings_IconSize.FontSize = Enum.FontSize.Size14;
Settings_IconSize.TextScaled = true;
Settings_IconSize.TextSize = 8;
Settings_IconSize.TextWrapped = true;
local Settings_IconSizeNum = Instance.new("TextBox")
Settings_IconSizeNum.Parent = FrameSettings;
Settings_IconSizeNum.BackgroundColor3 = Color3.new(0, 0, 0)
Settings_IconSizeNum.BorderColor3 = Color3.new(1, 1, 1)
Settings_IconSizeNum.BorderSizePixel = 1;
Settings_IconSizeNum.BackgroundTransparency = 0;
Settings_IconSizeNum.Position = UDim2.new(0.274, 0, 0.1)
Settings_IconSizeNum.Size = UDim2.new(0.05, 0, 0.1)
Settings_IconSizeNum.TextColor3 = Color3.new(1, 1, 1)
Settings_IconSizeNum.Text = 2;
Settings_IconSizeNum.TextScaled = true;
Settings_IconSizeNum.TextSize = 8;
Settings_IconSizeNum.TextWrapped = true;
Settings_IconSizeNum.FocusLost:Connect(function()
	Settings_IconSizeNum.Text = Settings_IconSizeNum.Text:gsub("[^%d%.]+", "")
	if Settings_IconSizeNum.Text == "" then
		Settings_IconSizeNum.Text = 1
	end;
	if tonumber(Settings_IconSizeNum.Text) <= 0 then
		Settings_IconSizeNum.Text = 1
	end;
	if tonumber(Settings_IconSizeNum.Text) >= 11 then
		Settings_IconSizeNum.Text = 10
	end;
	OpenGui.Size = UDim2.new(0, tonumber(Settings_IconSizeNum.Text) * 20, 0, tonumber(Settings_IconSizeNum.Text) * 17)
end)
local Settings_IconSizePlus = Settings_IconSize:Clone()
Settings_IconSizePlus.Parent = FrameSettings;
Settings_IconSizePlus.BorderColor3 = Color3.new(1, 1, 1)
Settings_IconSizePlus.BorderSizePixel = 1;
Settings_IconSizePlus.BackgroundTransparency = 0;
Settings_IconSizePlus.Position = UDim2.new(0.22, 0, 0.1)
Settings_IconSizePlus.Size = UDim2.new(0.05, 0, 0.1)
Settings_IconSizePlus.TextXAlignment = Enum.TextXAlignment.Center;
Settings_IconSizePlus.Text = "+"
Settings_IconSizePlus.MouseButton1Click:Connect(function()
	Settings_IconSizeNum.Text = Settings_IconSizeNum.Text + 1;
	if tonumber(Settings_IconSizeNum.Text) >= 11 then
		Settings_IconSizeNum.Text = 10;
		RequestMessage("Script", "Can't be morethan to 10")
	end;
	OpenGui.Size = UDim2.new(0, tonumber(Settings_IconSizeNum.Text) * 20, 0, tonumber(Settings_IconSizeNum.Text) * 17)
end)
local Settings_IconSizeMinus = Settings_IconSizePlus:Clone()
Settings_IconSizeMinus.Parent = FrameSettings;
Settings_IconSizeMinus.Position = UDim2.new(0.328, 0, 0.1)
Settings_IconSizeMinus.Text = "-"
Settings_IconSizeMinus.MouseButton1Click:Connect(function()
	Settings_IconSizeNum.Text = Settings_IconSizeNum.Text - 1;
	if tonumber(Settings_IconSizeNum.Text) <= 0 then
		Settings_IconSizeNum.Text = 1;
		RequestMessage("Script", "Can't be lowerthan to 0")
	end;
	OpenGui.Size = UDim2.new(0, tonumber(Settings_IconSizeNum.Text) * 20, 0, tonumber(Settings_IconSizeNum.Text) * 17)
end)
local Settings_GuiSize = Settings_IconSize:Clone()
Settings_GuiSize.Parent = FrameSettings;
Settings_GuiSize.Position = UDim2.new(0.035, 0, 0.25)
Settings_GuiSize.Text = "Gui Size"
local Settings_GuiSizeNum = Settings_IconSizeNum:Clone()
Settings_GuiSizeNum.Parent = FrameSettings;
Settings_GuiSizeNum.Position = UDim2.new(0.274, 0, 0.25)
Settings_GuiSizeNum.Text = 4;
Settings_GuiSizeNum.FocusLost:Connect(function()
	Settings_GuiSizeNum.Text = Settings_GuiSizeNum.Text:gsub("[^%d%.]+", "")
	if Settings_GuiSizeNum.Text == "" then
		Settings_GuiSizeNum.Text = 1
	end;
	if tonumber(Settings_GuiSizeNum.Text) <= 0 then
		Settings_GuiSizeNum.Text = 1
	end;
	if tonumber(Settings_GuiSizeNum.Text) >= 11 then
		Settings_GuiSizeNum.Text = 10
	end;
	Frame.Size = UDim2.new(0, tonumber(Settings_GuiSizeNum.Text) * 117.8 + 117.8, 0, tonumber(Settings_GuiSizeNum.Text) * 48.4 + 48.4)
end)
local Settings_GuiSizePlus = Settings_IconSizePlus:Clone()
Settings_GuiSizePlus.Parent = FrameSettings;
Settings_GuiSizePlus.Position = UDim2.new(0.22, 0, 0.25)
Settings_GuiSizePlus.MouseButton1Click:Connect(function()
	Settings_GuiSizeNum.Text = Settings_GuiSizeNum.Text + 1;
	if tonumber(Settings_GuiSizeNum.Text) >= 21 then
		Settings_GuiSizeNum.Text = 20;
		RequestMessage("Script", "Can't be morethan to 10")
	end;
	Frame.Size = UDim2.new(0, tonumber(Settings_GuiSizeNum.Text) * 117.8 + 117.8, 0, tonumber(Settings_GuiSizeNum.Text) * 48.4 + 48.4)
end)
local Settings_GuiSizeMinus = Settings_IconSizeMinus:Clone()
Settings_GuiSizeMinus.Parent = FrameSettings;
Settings_GuiSizeMinus.Position = UDim2.new(0.328, 0, 0.25)
Settings_GuiSizeMinus.MouseButton1Click:Connect(function()
	Settings_GuiSizeNum.Text = Settings_GuiSizeNum.Text - 1;
	if tonumber(Settings_GuiSizeNum.Text) <= 0 then
		Settings_GuiSizeNum.Text = 1;
		RequestMessage("Script", "Can't be lowerthan to 0")
	end;
	Frame.Size = UDim2.new(0, tonumber(Settings_GuiSizeNum.Text) * 117.8 + 117.8, 0, tonumber(Settings_GuiSizeNum.Text) * 48.4 + 48.4)
end)
local Settings_TextSize = Settings_IconSize:Clone()
Settings_TextSize.Parent = FrameSettings;
Settings_TextSize.Position = UDim2.new(0.035, 0, 0.4)
Settings_TextSize.Size = UDim2.new(0.18, 0, 0.1)
Settings_TextSize.Text = "Button Text Size"
local Settings_TextSizeNum = Settings_IconSizeNum:Clone()
Settings_TextSizeNum.Parent = FrameSettings;
Settings_TextSizeNum.Position = UDim2.new(0.274, 0, 0.4)
Settings_TextSizeNum.Text = 12;
Settings_TextSizeNum.FocusLost:Connect(function()
	Settings_TextSizeNum.Text = Settings_TextSizeNum.Text:gsub("[^%d%.]+", "")
	if Settings_TextSizeNum.Text == "" then
		Settings_TextSizeNum.Text = 1
	end;
	if tonumber(Settings_TextSizeNum.Text) <= 0 then
		Settings_TextSizeNum.Text = 1
	end;
	if tonumber(Settings_TextSizeNum.Text) >= 11 then
		Settings_TextSizeNum.Text = 10
	end;
	ButtonTextSize = tonumber(Settings_TextSizeNum.Text)
end)
local Settings_TextSizePlus = Settings_IconSizePlus:Clone()
Settings_TextSizePlus.Parent = FrameSettings;
Settings_TextSizePlus.Position = UDim2.new(0.22, 0, 0.4)
Settings_TextSizePlus.MouseButton1Click:Connect(function()
	Settings_TextSizeNum.Text = Settings_TextSizeNum.Text + 1;
	if tonumber(Settings_TextSizeNum.Text) >= 31 then
		Settings_TextSizeNum.Text = 30;
		RequestMessage("Script", "Can't be morethan to 10")
	end;
	ButtonTextSize = tonumber(Settings_TextSizeNum.Text)
end)
local Settings_TextSizeMinus = Settings_IconSizeMinus:Clone()
Settings_TextSizeMinus.Parent = FrameSettings;
Settings_TextSizeMinus.Position = UDim2.new(0.328, 0, 0.4)
Settings_TextSizeMinus.MouseButton1Click:Connect(function()
	Settings_TextSizeNum.Text = Settings_TextSizeNum.Text - 1;
	if tonumber(Settings_TextSizeNum.Text) <= 0 then
		Settings_TextSizeNum.Text = 1;
		RequestMessage("Script", "Can't be lowerthan to 0")
	end;
	ButtonTextSize = tonumber(Settings_TextSizeNum.Text)
end)
local Settings_ModeButton = Settings_IconSizePlus:Clone()
Settings_ModeButton.Parent = FrameSettings;
Settings_ModeButton.Position = UDim2.new(0.038, 0, 0.75)
Settings_ModeButton.Size = UDim2.new(0.175, 0, 0.18)
Settings_ModeButton.Text = "PC Mode"
Settings_ModeButton.TextScaled = true;
Settings_ModeButton.TextSize = 24;
Settings_ModeButton.TextWrapped = true;
Settings_ModeButton.Active = true;
local Settings_ModeButton_Padding = Instance.new("UIPadding")
Settings_ModeButton_Padding.PaddingLeft = UDim.new(0, 7)
Settings_ModeButton_Padding.PaddingRight = UDim.new(0, 7)
Settings_ModeButton_Padding.PaddingTop = UDim.new(0, 8)
Settings_ModeButton_Padding.PaddingBottom = UDim.new(0, 8)
Settings_ModeButton_Padding.Parent = Settings_ModeButton;
Settings_ModeButton.MouseButton1Click:Connect(function()
	if Settings_ModeButton.Text == "PC Mode" then
		Settings_ModeButton.Text = "Mobile Mode"
		Frame.Size = UDim2.new(0.8, 0.2, 0.8)
	else
		Settings_ModeButton.Text = "PC Mode"
		Frame.Size = UDim2.new(0, 589, 0, 242)
	end
end)
local Settings_InfoButton = Settings_ModeButton:Clone()
Settings_InfoButton.Parent = FrameSettings;
Settings_InfoButton.Position = UDim2.new(0.23, 0, 0.75)
Settings_InfoButton.Text = "Hide Info"
Settings_InfoButton.MouseButton1Click:Connect(function()
	if Settings_InfoButton.Text == "Hide Info" then
		Settings_InfoButton.Text = "Show Info"
		Home_Information_Hidden = true
	else
		Settings_InfoButton.Text = "Hide Info"
		Home_Information_Hidden = false
	end
end)
local Settings_SaveButton = Settings_IconSizePlus:Clone()
Settings_SaveButton.Parent = FrameSettings;
Settings_SaveButton.Position = UDim2.new(0.78, 0, 0.75)
Settings_SaveButton.Size = UDim2.new(0.18, 0, 0.18)
Settings_SaveButton.Text = "Save Settings"
Settings_SaveButton.TextScaled = false;
Settings_SaveButton.TextSize = ButtonTextSize + 3;
Settings_SaveButton.TextWrapped = true;
Settings_SaveButton.MouseButton1Click:Connect(function()
	local settings_table = {}
	settings_table["icon_size"] = tonumber(Settings_IconSizeNum.Text)
	settings_table["gui_size"] = tonumber(Settings_GuiSizeNum.Text)
	settings_table["text_size"] = tonumber(Settings_TextSizeNum.Text)
	if Settings_ModeButton.Text == "PC Mode" then
		settings_table["mode"] = "Mobile"
	else
		settings_table["mode"] = "PC"
	end;
	if Settings_InfoButton.Text == "Hide Info" then
		settings_table["hidden_info"] = false
	else
		settings_table["hidden_info"] = true
	end;
	writefile("Ghosthub/.settings", game:GetService("HttpService"):JSONEncode(settings_table))
	RequestMessage("Script", "Settings Saved!")
end)
local Settings_ResetButton = Settings_SaveButton:Clone()
Settings_ResetButton.Parent = FrameSettings;
Settings_ResetButton.Position = UDim2.new(0.58, 0, 0.75)
Settings_ResetButton.Text = "Reset Settings"
Settings_ResetButton.MouseButton1Click:Connect(function()
	Settings_IconSizeNum.Text = 2;
	Settings_GuiSizeNum.Text = 4;
	Settings_TextSizeNum.Text = 12;
	Home_Information_Hidden = false;
	Settings_InfoButton.Text = "Hide Info"
	Settings_ModeButton.Text = "PC Mode"
	OpenGui.Size = UDim2.new(0, tonumber(Settings_IconSizeNum.Text) * 20, 0, tonumber(Settings_IconSizeNum.Text) * 17)
	Frame.Size = UDim2.new(0, tonumber(Settings_GuiSizeNum.Text) * 117.8 + 117.8, 0, tonumber(Settings_GuiSizeNum.Text) * 48.4 + 48.4)
	ButtonTextSize = tonumber(Settings_TextSizeNum.Text)
end)
if FileScriptSupported == false then
	local Settings_FrameBarrier = Instance.new("Frame")
	Settings_FrameBarrier.Parent = FrameSettings;
	Settings_FrameBarrier.BackgroundColor3 = Color3.new(0, 0, 0)
	Settings_FrameBarrier.BorderColor3 = Color3.new(1, 1, 1)
	Settings_FrameBarrier.BackgroundTransparency = 0.2;
	Settings_FrameBarrier.BorderSizePixel = 0;
	Settings_FrameBarrier.Position = UDim2.new(0, 0, 0)
	Settings_FrameBarrier.Size = UDim2.new(1, 1.2, 1)
	Settings_FrameBarrier.Active = true;
	Settings_FrameBarrier.Draggable = false;
	local Settings_BarrierText = Instance.new("TextButton")
	Settings_BarrierText.Parent = Settings_FrameBarrier;
	Settings_BarrierText.BackgroundColor3 = Color3.new(0, 0, 0)
	Settings_BarrierText.BackgroundTransparency = 1;
	Settings_BarrierText.Position = UDim2.new(0.3, 0, 0.4)
	Settings_BarrierText.TextColor3 = Color3.new(1, 1, 1)
	Settings_BarrierText.Size = UDim2.new(0.4, 0, 0.1)
	Settings_BarrierText.Font = Enum.Font.Merriweather;
	Settings_BarrierText.Text = "⚠️ Sorry your Executor is Not Supported this Feature!"
	Settings_BarrierText.FontSize = Enum.FontSize.Size14;
	Settings_BarrierText.TextScaled = true;
	Settings_BarrierText.TextSize = 18;
	Settings_BarrierText.TextWrapped = false
end;
if SettingsData["icon_size"] then
	Settings_IconSizeNum.Text = SettingsData["icon_size"]
end;
if SettingsData["gui_size"] then
	Settings_GuiSizeNum.Text = SettingsData["gui_size"]
end;
if SettingsData["text_size"] then
	Settings_TextSizeNum.Text = SettingsData["text_size"]
end;
if SettingsData["mode"] and SettingsData["mode"] == "PC" then
	Settings_ModeButton.Text = "Mobile Mode"
end;
if SettingsData["hidden_info"] and SettingsData["hidden_info"] == true then
	Settings_InfoButton.Text = "Show Info"
end;
local MerchCurrentPosZ = 0.0003;
local function AddMerch(link, name, price)
	local assetId = tonumber(string.match(link, "%d+"))
	local Frame = Instance.new("Frame")
	Frame.Parent = MerchScrollingFrame;
	Frame.BackgroundColor3 = Color3.new(0, 0, 0)
	Frame.BorderColor3 = Color3.new(1, 1, 1)
	Frame.BorderSizePixel = 1;
	Frame.Position = UDim2.new(MerchCurrentPosZ, 0, 0.06)
	Frame.Size = UDim2.new(0, 130, 0, 190)
	Frame.Active = false;
	local ImageFrame = Instance.new("Frame")
	ImageFrame.Parent = Frame;
	ImageFrame.BackgroundColor3 = Color3.fromRGB(99, 95, 98)
	ImageFrame.BorderColor3 = Color3.new(1, 1, 1)
	ImageFrame.BorderSizePixel = 1;
	ImageFrame.Position = UDim2.new(0, 0, 0)
	ImageFrame.Size = UDim2.new(1, 0, 0.5)
	ImageFrame.Active = false;
	local Image = Instance.new("ImageButton")
	Image.Parent = ImageFrame;
	Image.BackgroundTransparency = 1;
	Image.BorderSizePixel = 0;
	Image.Position = UDim2.new(0, 0, 0)
	Image.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=48&height=48&assetId=" .. assetId;
	Image.Size = UDim2.new(1, 1, 1)
	local Name = Instance.new("TextLabel")
	Name.Parent = Frame;
	Name.BackgroundColor3 = Color3.new(0, 0, 0)
	Name.BorderColor3 = Color3.new(1, 1, 1)
	Name.BorderSizePixel = 1;
	Name.BackgroundTransparency = 0;
	Name.Position = UDim2.new(0, 0, 0.5)
	Name.TextColor3 = Color3.new(1, 1, 1)
	Name.Size = UDim2.new(1, 0, 0.1)
	Name.Font = Enum.Font.Merriweather;
	Name.FontSize = Enum.FontSize.Size14;
	Name.Text = name;
	Name.TextScaled = true;
	Name.TextSize = 16;
	Name.TextWrapped = true;
	local Price = Name:Clone()
	Price.Parent = Frame;
	Price.Position = UDim2.new(0, 0, 0.625)
	Price.BackgroundTransparency = 1;
	Price.Font = Enum.Font.SourceSansBold;
	Price.Text = "Price: " .. price .. " Robux"
	local Buy = Instance.new("TextButton")
	Buy.Parent = Frame;
	Buy.BackgroundColor3 = Color3.fromRGB(31, 128, 29)
	Buy.BorderColor3 = Color3.new(1, 1, 1)
	Buy.BorderSizePixel = 1;
	Buy.BackgroundTransparency = 0;
	Buy.Position = UDim2.new(0.1, 0, 0.775)
	Buy.TextColor3 = Color3.new(1, 1, 1)
	Buy.Size = UDim2.new(0.8, 0, 0.15)
	Buy.Font = Enum.Font.Merriweather;
	Buy.FontSize = Enum.FontSize.Size14;
	Buy.Text = "BUY"
	Buy.TextScaled = true;
	Buy.TextSize = 16;
	Buy.TextWrapped = true;
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0.2, 0)
	UICorner.Parent = Buy;
	Buy.MouseButton1Click:Connect(function()
		local PurchasePrompt, IsEnable = pcall(function()
			game:GetService("MarketplaceService"):PromptPurchase(game.Players.LocalPlayer, assetId, false, Enum.CurrencyType.Robux)
		end)
		if not PurchasePrompt then
			setclipboard(link)
			RequestMessage("Script", "Link Copied!")
		end
	end)
	MerchCurrentPosZ = MerchCurrentPosZ + 0.0029
end;
pcall(function()
	AddMerch("https://www.roblox.com/catalog/119676083682137/Santa-Claus-Shirt", "Santa Calus Shirt", 5)
	AddMerch("https://www.roblox.com/catalog/135221576666644/Santa-Claus-Pants", "Santa Claus Pants", 5)
	AddMerch("https://www.roblox.com/catalog/99331084793244/Gold-Tuxedo-Suit", "Gold Tuxedo Suit", 5)
	AddMerch("https://www.roblox.com/catalog/135040554647349/Gold-Tuxedo-Pants", "Gold Tuxedo Pants", 5)
	AddMerch("https://www.roblox.com/catalog/74232316018983/Prison-Shirt", "Prison Shirt", 5)
	AddMerch("https://www.roblox.com/catalog/98075520714720/Prison-Pants", "Prison Pants", 5)
	AddMerch("https://www.roblox.com/catalog/93578649387552/Squid-Game-Shirt", "Squid Game Shirt", 5)
	AddMerch("https://www.roblox.com/catalog/98597827787125/Squid-Game-Pants", "Squid Game Pants", 5)
	AddMerch("https://www.roblox.com/catalog/72769340344464/White-Shirt", "White Shirt", 5)
	AddMerch("https://www.roblox.com/catalog/86739754364385/White-Pants", "White Pants", 5)
	AddMerch("https://www.roblox.com/catalog/83016137670159/Red-Suit", "🌹Red Suit", 5)
	AddMerch("https://www.roblox.com/catalog/83609903738968/Red-Suit-Pants", "🌹Red Suit Pants", 5)
	AddMerch("https://www.roblox.com/catalog/89257754085052", "Grey Suit w/ Black Vest [+]", 5)
	AddMerch("https://www.roblox.com/catalog/109975340692680", "Grey Suit w/ Black Vest [-]", 5)
	AddMerch("https://www.roblox.com/catalog/137611664036583/gyaru-vamp-gothic-swag-kawaii-soft-fairy-y2k-emo", "gyaru vamp gothic swag kawaii soft fairy y2k emo", 5)
	AddMerch("https://www.roblox.com/catalog/92656115819610/Supreme-Hoodie", "Supreme Hoodie", 5)
	AddMerch("https://www.roblox.com/catalog/82171477191268/Walter-White", "Walter White (+)", 5)
	AddMerch("https://www.roblox.com/catalog/78758247529710", "Classic Punk", 5)
	AddMerch("https://www.roblox.com/catalog/139884165686213/Black-and-White-Striped-LV-Shirt", "Black and White Striped LV Shirt", 5)
	AddMerch("https://www.roblox.com/catalog/126366821715960/Too-Cool-For-School", "Too Cool For School", 5)
	AddMerch("https://www.roblox.com/catalog/95818249173748/Gangster-Black-Shirt-w-Tattoos-and-Watch", "Gangster Black Shirt w Tattoos and Watch", 5)
	AddMerch("https://www.roblox.com/catalog/108266114553690/y2k-streetwear-grunge-vamp-emo-ok-hey-goth", "y2k streetwear grunge vamp emo ok hey goth", 5)
	AddMerch("https://www.roblox.com/catalog/73061247372246/Emo-y2k-classic-shirt", "Emo y2k classic shirt", 5)
	AddMerch("https://www.roblox.com/catalog/125602993311915", "🖤Revenge🖤SALE🖤", 5)
	AddMerch("https://www.roblox.com/catalog/107471318623565/Red-Street-Vest-Top", "Red Street Vest Top", 5)
	AddMerch("https://www.roblox.com/catalog/111441944017642/Gothica", "{🖤} Gothica", 5)
	AddMerch("https://www.roblox.com/catalog/139642423410848", "Kawaii Black Uniform", 5)
	AddMerch("https://www.roblox.com/catalog/92966113718197/Black-Gray-Plaid-School-Skirt", "Black Gray Plaid School Skirt", 5)
	AddMerch("https://www.roblox.com/catalog/122167837589881", "White Socks", 5)
	AddMerch("https://www.roblox.com/catalog/122685893074039/chibi-girl-cute-pants", "chibi girl cute pants", 5)
	AddMerch("https://www.roblox.com/catalog/128282112681974", "Dress halloween - black model dahood vampire", 5)
	AddMerch("https://www.roblox.com/catalog/106371533758266", "Transparent Shirt", 5)
	AddMerch("https://www.roblox.com/catalog/137694143747772", "Transparent Pants", 5)
	AddMerch("https://www.roblox.com/catalog/139917802677208", "Black Tuxedo", 5)
	AddMerch("https://www.roblox.com/catalog/135760379328953", "Black Pants", 5)
	AddMerch("https://www.roblox.com/catalog/87758937019507", "Black Winter Jacket", 5)
	AddMerch("https://www.roblox.com/catalog/105870060378746", "Gentleman Black Tuxedo", 5)
end)
local function AddToFavorite(scriptId)
	local favorites = {}
	if not isfile("Ghosthub/Favorites.json") then
		if not favorites.Favorites then
			favorites["Favorites"] = {}
			favorites["Current_Script_ID"] = 0
		end;
		writefile("Ghosthub/Favorites.json", game.HttpService:JSONEncode(favorites))
	end;
	favorites = game.HttpService:JSONDecode(readfile("Ghosthub/Favorites.json"))
	local favoriteId = 1;
	for key, value in pairs(favorites.Favorites) do
		if key then
			favoriteId = favoriteId + 1
		end
	end;
	if favoriteId == 25 or favoriteId >= 25 then
		RequestMessage("Script", "Your Favorites", "Storage Are Full!")
		return
	end;
	favoriteId = favorites["Current_Script_ID"] + 1;
	favorites["Current_Script_ID"] = favoriteId;
	favorites.Favorites["Script" .. favoriteId] = {
		["Script_ID"] = scriptId
	}
	writefile("Ghosthub/Favorites.json", game.HttpService:JSONEncode(favorites))
end;
local function RequestViewScript(script)
	local CanvaSizeZ = select(2, string.gsub(script, "\n", "")) / 10;
	local CanvaSizeX = 1;
	for line in script:gmatch("[^\n]+") do
		local length = #line;
		if length > CanvaSizeX then
			CanvaSizeX = length
		end
	end;
	if CanvaSizeX >= 28 then
		local LineSize = CanvaSizeX;
		CanvaSizeX = CanvaSizeX - 28;
		CanvaSizeX = 1 + CanvaSizeX / 80
	end;
	local ScreenGui1 = Instance.new("ScreenGui")
	ScreenGui1.Parent = game.Players.LocalPlayer.PlayerGui;
	local Frame1 = Instance.new("Frame")
	Frame1.Parent = ScreenGui1;
	Frame1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Frame1.BackgroundTransparency = 0.5;
	Frame1.Position = UDim2.new(-0.5, 0, -0.5)
	Frame1.Size = UDim2.new(1.5, 0, 1.5)
	Frame1.Active = true;
	Frame1.Draggable = false;
	local Frame2 = Instance.new("Frame")
	Frame2.Parent = Frame1;
	Frame2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Frame2.BackgroundTransparency = 0;
	Frame2.BorderSizePixel = 1;
	Frame2.BorderColor3 = Color3.fromRGB(242, 243, 243)
	Frame2.Position = UDim2.new(0.49, 0, 0.38)
	Frame2.Size = UDim2.new(0.35, 0, 0.5)
	local ScrollingFrame1 = Instance.new("ScrollingFrame")
	ScrollingFrame1.Parent = Frame2;
	ScrollingFrame1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	ScrollingFrame1.BackgroundTransparency = 1;
	ScrollingFrame1.Position = UDim2.new(0.01, 0, 0.01)
	ScrollingFrame1.Size = UDim2.new(0.98, 0, 0.8)
	ScrollingFrame1.CanvasSize = UDim2.new(CanvaSizeX, 0, CanvaSizeZ)
	ScrollingFrame1.ScrollBarThickness = 1;
	local TextLabel1 = Instance.new("TextBox")
	TextLabel1.Parent = ScrollingFrame1;
	TextLabel1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	TextLabel1.BackgroundTransparency = 1;
	TextLabel1.Position = UDim2.new(0, 0, 0)
	TextLabel1.Size = UDim2.new(1, 0, 1)
	TextLabel1.Font = Enum.Font.SourceSans;
	TextLabel1.TextColor3 = Color3.fromRGB(242, 243, 243)
	TextLabel1.MultiLine = true;
	TextLabel1.ClearTextOnFocus = false;
	TextLabel1.Text = script;
	TextLabel1.TextSize = 20;
	TextLabel1.TextScaled = false;
	TextLabel1.TextWrapped = true;
	TextLabel1.TextXAlignment = Enum.TextXAlignment.Left;
	TextLabel1.TextYAlignment = Enum.TextYAlignment.Top;
	local Text = TextLabel1.Text;
	TextLabel1.Changed:Connect(function()
		TextLabel1.Text = Text
	end)
	local TextButton1 = Instance.new("TextButton")
	TextButton1.Parent = Frame2;
	TextButton1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	TextButton1.BackgroundTransparency = 0;
	TextButton1.BorderSizePixel = 1;
	TextButton1.BorderColor3 = Color3.fromRGB(242, 243, 243)
	TextButton1.Position = UDim2.new(0.78, 0, 0.85)
	TextButton1.Size = UDim2.new(0.2, 0, 0.1)
	TextButton1.Font = Enum.Font.Merriweather;
	TextButton1.TextColor3 = Color3.fromRGB(242, 243, 243)
	TextButton1.Text = "Execute"
	TextButton1.TextSize = 18;
	TextButton1.TextScaled = false;
	TextButton1.TextWrapped = true;
	TextButton1.MouseButton1Click:Connect(function()
		ScreenGui1:Destroy()
		loadstring(script)()
	end)
	local TextButton2 = Instance.new("TextButton")
	TextButton2.Parent = Frame2;
	TextButton2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	TextButton2.BackgroundTransparency = 0;
	TextButton2.BorderSizePixel = 1;
	TextButton2.BorderColor3 = Color3.fromRGB(242, 243, 243)
	TextButton2.Position = UDim2.new(0.55, 0, 0.85)
	TextButton2.Size = UDim2.new(0.2, 0, 0.1)
	TextButton2.Font = Enum.Font.Merriweather;
	TextButton2.TextColor3 = Color3.fromRGB(242, 243, 243)
	TextButton2.Text = "Close"
	TextButton2.TextSize = 18;
	TextButton2.TextScaled = false;
	TextButton2.TextWrapped = true;
	TextButton2.MouseButton1Click:Connect(function()
		ScreenGui1:Destroy()
	end)
	local TextButton3 = Instance.new("TextButton")
	TextButton3.Parent = Frame2;
	TextButton3.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	TextButton3.BackgroundTransparency = 0;
	TextButton3.BorderSizePixel = 1;
	TextButton3.BorderColor3 = Color3.fromRGB(242, 243, 243)
	TextButton3.Position = UDim2.new(0.32, 0, 0.85)
	TextButton3.Size = UDim2.new(0.2, 0, 0.1)
	TextButton3.Font = Enum.Font.Merriweather;
	TextButton3.TextColor3 = Color3.fromRGB(242, 243, 243)
	TextButton3.Text = "Copy"
	TextButton3.TextSize = 18;
	TextButton3.TextScaled = false;
	TextButton3.TextWrapped = false;
	TextButton3.MouseButton1Click:Connect(function()
		ScreenGui1:Destroy()
		setclipboard(script)
		RequestMessage("Script", "Script Copied!")
	end)
end;
function RequestClickMoreScriptButton(scriptname, script, description, userid, username, date, id, isPined, favoriteId)
	local ScreenGui1 = Instance.new("ScreenGui")
	ScreenGui1.Parent = game.Players.LocalPlayer.PlayerGui;
	local Frame1 = Instance.new("Frame")
	Frame1.Parent = ScreenGui1;
	Frame1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Frame1.BackgroundTransparency = 0.5;
	Frame1.Position = UDim2.new(-0.5, 0, -0.5)
	Frame1.Size = UDim2.new(1.5, 0, 1.5)
	Frame1.Active = true;
	Frame1.Draggable = false;
	local Frame2 = Instance.new("Frame")
	Frame2.Parent = Frame1;
	Frame2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Frame2.BackgroundTransparency = 0;
	Frame2.BorderSizePixel = 1;
	Frame2.BorderColor3 = Color3.fromRGB(242, 243, 243)
	Frame2.Position = UDim2.new(0.49, 0, 0.38)
	Frame2.Size = UDim2.new(0.35, 0, 0.5)
	local ImageButton0 = Instance.new("ImageButton")
	ImageButton0.Parent = Frame2;
	ImageButton0.BackgroundTransparency = 0;
	ImageButton0.BackgroundColor3 = Color3.new(1, 1, 1)
	ImageButton0.BorderSizePixel = 1;
	ImageButton0.BorderColor3 = Color3.new(0, 0, 0)
	ImageButton0.Position = UDim2.new(0.01, 0, 0.01)
	ImageButton0.Size = UDim2.new(0.3, 0, 0.4)
	ImageButton0.Image = "rbxassetid://93663207222979"
	local ImageButton1 = Instance.new("ImageButton")
	ImageButton1.Parent = Frame2;
	ImageButton1.BackgroundTransparency = 1;
	ImageButton1.BackgroundColor3 = Color3.new(1, 1, 1)
	ImageButton1.BorderSizePixel = 1;
	ImageButton1.BorderColor3 = Color3.new(0, 0, 0)
	ImageButton1.Position = UDim2.new(0.01, 0, 0.01)
	ImageButton1.Size = UDim2.new(0.3, 0, 0.4)
	ImageButton1.Image = game.Players:GetUserThumbnailAsync(userid, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	ImageButton1.MouseButton1Click:Connect(function()
		if ImageButton1.Image == game.Players:GetUserThumbnailAsync(userid, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) then
			ImageButton1.Image = game.Players:GetUserThumbnailAsync(userid, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size420x420)
		else
			ImageButton1.Image = game.Players:GetUserThumbnailAsync(userid, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		end
	end)
	local DateTextLabel = Instance.new("TextLabel")
	DateTextLabel.Parent = Frame2;
	DateTextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	DateTextLabel.BackgroundTransparency = 1;
	DateTextLabel.Position = UDim2.new(0.01, 0, 0.43)
	DateTextLabel.TextColor3 = Color3.new(1, 1, 1)
	DateTextLabel.Size = UDim2.new(0.3, 0, 0.3)
	DateTextLabel.Font = Enum.Font.Merriweather;
	DateTextLabel.FontSize = Enum.FontSize.Size14;
	DateTextLabel.Text = "Publisher\
\
Publish Date:\
" .. date;
	DateTextLabel.TextYAlignment = Enum.TextYAlignment.Top;
	DateTextLabel.TextScaled = false;
	DateTextLabel.TextSize = 14;
	DateTextLabel.TextWrapped = true;
	local TextLabel1 = Instance.new("TextBox")
	TextLabel1.Parent = Frame2;
	TextLabel1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	TextLabel1.BackgroundTransparency = 1;
	TextLabel1.Position = UDim2.new(0.38, 0, 0.01)
	TextLabel1.Size = UDim2.new(0.61, 0, 0.8)
	TextLabel1.Font = Enum.Font.SourceSans;
	TextLabel1.TextColor3 = Color3.fromRGB(242, 243, 243)
	TextLabel1.MultiLine = true;
	TextLabel1.TextEditable = false;
	TextLabel1.ClearTextOnFocus = false;
	TextLabel1.Text = "Script: " .. scriptname .. "\
Uploader: " .. username .. "\
User ID: " .. userid .. "\
\
Description:\
" .. description;
	TextLabel1.TextSize = 20;
	TextLabel1.TextScaled = false;
	TextLabel1.TextWrapped = true;
	TextLabel1.TextXAlignment = Enum.TextXAlignment.Left;
	TextLabel1.TextYAlignment = Enum.TextYAlignment.Top;
	local TextButton1 = Instance.new("TextButton")
	TextButton1.Parent = Frame2;
	TextButton1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	TextButton1.BackgroundTransparency = 0;
	TextButton1.BorderSizePixel = 1;
	TextButton1.BorderColor3 = Color3.fromRGB(242, 243, 243)
	TextButton1.Position = UDim2.new(0.78, 0, 0.85)
	TextButton1.Size = UDim2.new(0.2, 0, 0.1)
	TextButton1.Font = Enum.Font.Merriweather;
	TextButton1.TextColor3 = Color3.fromRGB(242, 243, 243)
	TextButton1.Text = "Execute"
	TextButton1.TextSize = 18;
	TextButton1.TextScaled = false;
	TextButton1.TextWrapped = true;
	TextButton1.MouseButton1Click:Connect(function()
		ScreenGui1:Destroy()
		loadstring(script)()
	end)
	local TextButton2 = Instance.new("TextButton")
	TextButton2.Parent = Frame2;
	TextButton2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	TextButton2.BackgroundTransparency = 0;
	TextButton2.BorderSizePixel = 1;
	TextButton2.BorderColor3 = Color3.fromRGB(242, 243, 243)
	TextButton2.Position = UDim2.new(0.55, 0, 0.85)
	TextButton2.Size = UDim2.new(0.2, 0, 0.1)
	TextButton2.Font = Enum.Font.Merriweather;
	TextButton2.TextColor3 = Color3.fromRGB(242, 243, 243)
	TextButton2.Text = "Cancel"
	TextButton2.TextSize = 18;
	TextButton2.TextScaled = false;
	TextButton2.TextWrapped = true;
	TextButton2.MouseButton1Click:Connect(function()
		ScreenGui1:Destroy()
	end)
	if FileScriptSupported == true and id ~= 1 then
		local TextButton3 = Instance.new("TextButton")
		TextButton3.Parent = Frame2;
		TextButton3.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
		TextButton3.BackgroundTransparency = 0;
		TextButton3.BorderSizePixel = 1;
		TextButton3.BorderColor3 = Color3.fromRGB(242, 243, 243)
		TextButton3.Position = UDim2.new(0.32, 0, 0.85)
		TextButton3.Size = UDim2.new(0.2, 0, 0.1)
		TextButton3.Font = Enum.Font.Merriweather;
		TextButton3.TextColor3 = Color3.fromRGB(242, 243, 243)
		TextButton3.Text = "Pin 📌"
		TextButton3.TextSize = 14;
		TextButton3.TextScaled = false;
		TextButton3.TextWrapped = false;
		if isPined and isPined == true and favoriteId ~= nil then
			TextButton3.Text = "UnPin 📌"
			TextButton3.MouseButton1Click:Connect(function()
				ScreenGui1:Destroy()
				local favorites = game.HttpService:JSONDecode(readfile("Ghosthub/Favorites.json"))
				favorites.Favorites["Script" .. favoriteId] = nil;
				writefile("Ghosthub/Favorites.json", game.HttpService:JSONEncode(favorites))
				FrameMoreScript:ClearAllChildren()
				GetMoreScript()
			end)
		else
			TextButton3.MouseButton1Click:Connect(function()
				ScreenGui1:Destroy()
				AddToFavorite(id)
				FrameMoreScript:ClearAllChildren()
				GetMoreScript()
				RequestMessage("Script", "Script Pinned!")
			end)
		end
	end;
	if id ~= 1 and userid ~= game:GetService("Players"):GetUserIdFromNameAsync(Ghostplayer) then
		local TextButton4 = Instance.new("TextButton")
		TextButton4.Parent = Frame2;
		TextButton4.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
		TextButton4.BackgroundTransparency = 0;
		TextButton4.BorderSizePixel = 1;
		TextButton4.BorderColor3 = Color3.fromRGB(242, 243, 243)
		TextButton4.Position = UDim2.new(0.09, 0, 0.85)
		TextButton4.Size = UDim2.new(0.2, 0, 0.1)
		TextButton4.Font = Enum.Font.Merriweather;
		TextButton4.TextColor3 = Color3.fromRGB(242, 243, 243)
		TextButton4.Text = "View Script"
		TextButton4.TextSize = 13;
		TextButton4.TextScaled = true;
		TextButton4.TextWrapped = false;
		TextButton4.MouseButton1Click:Connect(function()
			ScreenGui1:Destroy()
			RequestViewScript(script)
		end)
		if FileScriptSupported ~= true then
			TextButton4.Position = UDim2.new(0.32, 0, 0.85)
		end
	end
end;
local function NotifyShout(msg, username)
	local content, isReady = game.Players:GetUserThumbnailAsync(game.Players:GetUserIdFromNameAsync(username), Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	local G2L = {}
	G2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
	G2L["ScreenGui_1"]["Name"] = "Ghosthub Shout"
	G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
	game:GetService("CollectionService"):AddTag(G2L["ScreenGui_1"], [[main]])
	G2L["Frame_2"] = Instance.new("Frame", G2L["ScreenGui_1"])
	G2L["Frame_2"]["BorderSizePixel"] = 0;
	G2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["Frame_2"]["Size"] = UDim2.new(1.00543, 0, 0.17881, 0)
	G2L["Frame_2"]["Position"] = UDim2.new(-0.00272, 0, -0.17219, 0)
	G2L["Frame_2"]["BackgroundTransparency"] = 0.5;
	G2L["ImageLabel_3"] = Instance.new("ImageLabel", G2L["Frame_2"])
	G2L["ImageLabel_3"]["BorderSizePixel"] = 0;
	G2L["ImageLabel_3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["ImageLabel_3"]["Size"] = UDim2.new(0.06486, 0, 0.88889, 0)
	G2L["ImageLabel_3"]["BackgroundTransparency"] = 0.5;
	G2L["ImageLabel_3"]["Image"] = content;
	G2L["ImageLabel_3"]["Position"] = UDim2.new(0.23243, 0, 0.03704, 0)
	G2L["UICorner_4"] = Instance.new("UICorner", G2L["ImageLabel_3"])
	G2L["UICorner_4"]["CornerRadius"] = UDim.new(1, 1)
	G2L["TextLabel_5"] = Instance.new("TextLabel", G2L["Frame_2"])
	G2L["TextLabel_5"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
	G2L["TextLabel_5"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;
	G2L["TextLabel_5"]["BorderSizePixel"] = 0;
	G2L["TextLabel_5"]["TextSize"] = 12;
	G2L["TextLabel_5"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["TextLabel_5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["TextLabel_5"]["TextDirection"] = Enum.TextDirection.RightToLeft;
	G2L["TextLabel_5"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	G2L["TextLabel_5"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["TextLabel_5"]["BackgroundTransparency"] = 1;
	G2L["TextLabel_5"]["Size"] = UDim2.new(0.68378, 0, 0.025, 0)
	G2L["TextLabel_5"]["Text"] = username;
	G2L["TextLabel_5"]["Position"] = UDim2.new(0.30811, 0, 0.03704, 0)
	G2L["TextLabel2_6"] = Instance.new("TextLabel", G2L["Frame_2"])
	G2L["TextLabel2_6"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
	G2L["TextLabel2_6"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;
	G2L["TextLabel2_6"]["BorderSizePixel"] = 0;
	G2L["TextLabel2_6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["TextLabel2_6"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	G2L["TextLabel2_6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["TextLabel2_6"]["TextDirection"] = Enum.TextDirection.RightToLeft;
	G2L["TextLabel2_6"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["TextLabel2_6"]["BackgroundTransparency"] = 1;
	G2L["TextLabel2_6"]["Size"] = UDim2.new(0.68378, 0, 0.04, 0)
	G2L["TextLabel2_6"]["Text"] = msg;
	G2L["TextLabel2_6"]["TextSize"] = 10;
	G2L["TextLabel2_6"]["Position"] = UDim2.new(0.30811, 0, 0.37037, 0)
	G2L["TextLabel2_6"]["TextScaled"] = true;
	G2L["TextLabel2_6"]["TextWrapped"] = false;
	G2L["UIAspectRatioConstraint_7"] = Instance.new("UIAspectRatioConstraint", G2L["Frame_2"])
	G2L["UIAspectRatioConstraint_7"]["AspectRatio"] = 13.7037;
	wait(math.max(#msg * 0.1, 5))
	G2L["ScreenGui_1"]:Destroy()
end;
local function FetchLatestContent(github_link)
	if string.find(github_link, "https://raw.githubusercontent.com") then
		github_link = string.gsub(github_link, "https://raw.githubusercontent.com", "https://github.com")
	end;
	if string.find(github_link, "/refs/heads/main/") then
		github_link = string.gsub(github_link, "/refs/heads", "/blob")
	end;
	local str = game:HttpGet(github_link .. "?cache-buster=" .. os.date("%Y%m%d%H%M%S"))
	local startStr = '"rawLines":["'
	local endStr = '"],"stylingDirectives"'
	local startIndex = string.find(str, startStr, 1, true)
	if not startIndex then
		return nil
	end;
	local endIndex = string.find(str, endStr, startIndex + #startStr, true)
	if not endIndex then
		return nil
	end;
	return string.sub(str, startIndex + #startStr, endIndex - 1) or nil
end;
local GhostHub_Shout_Database_URL = "https://ghosthub-shout-ccec9-default-rtdb.firebaseio.com/"
local GhostHub_Shout_Database_Secret = "TqDzshgeNUnx6XCGYGgdLmjltjvPzt2SYmwY6lgT"
local function PostShout(msg)
	local Authentication = "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"
	local Username = "GhostPlayer352"
	local Repository = "Extra"
	local File_Name = "Ghosthub Shout.json"
	local new_content = {}
	new_content["Username"] = game.Players.LocalPlayer.Name;
	new_content["UserId"] = game.Players.LocalPlayer.UserId;
	new_content["Message"] = msg;
	local URL = "https://api.github.com/repos/" .. Username .. "/" .. Repository .. "/contents/" .. game.HttpService:UrlEncode(File_Name)
	local current_file_sha = game.HttpService:JSONDecode(game:HttpGet(URL)).sha;
	local request_body = {
		["message"] = "Update Content Message",
		["content"] = EncodeBase64(game:GetService("HttpService"):JSONEncode(new_content)),
		["sha"] = current_file_sha
	}
	HttpRequest(URL, "PUT", {
		["Content-Type"] = "application/json",
		["Authorization"] = "token " .. Authentication
	}, request_body)
end;
local ShoutImage = Instance.new("ImageButton")
ShoutImage.Parent = FrameShout;
ShoutImage.BackgroundColor3 = Color3.new(0, 0, 0)
ShoutImage.BackgroundTransparency = 0;
ShoutImage.Size = UDim2.new(0.13, 0, 0.3)
ShoutImage.BorderColor3 = Color3.new(1, 1, 1)
ShoutImage.BorderSizePixel = 1;
ShoutImage.Position = UDim2.new(0.03, 0, 0.06)
local ShoutUICorner = Instance.new("UICorner")
ShoutUICorner.CornerRadius = UDim.new(1, 0)
ShoutUICorner.Parent = ShoutImage;
local ShoutUIStroke = Instance.new("UIStroke")
ShoutUIStroke.Parent = ShoutImage;
ShoutUIStroke.Transparency = 0;
ShoutUIStroke.Color = Color3.fromRGB(242, 243, 243)
ShoutUIStroke.Thickness = 1;
local ShoutSpeaker = Instance.new("TextLabel")
ShoutSpeaker.Parent = FrameShout;
ShoutSpeaker.BackgroundColor3 = Color3.new(1, 1, 1)
ShoutSpeaker.BackgroundTransparency = 1;
ShoutSpeaker.BorderColor3 = Color3.new(1, 1, 1)
ShoutSpeaker.BorderSizePixel = 0;
ShoutSpeaker.Position = UDim2.new(0.18, 0, 0.05)
ShoutSpeaker.TextColor3 = Color3.new(1, 1, 1)
ShoutSpeaker.TextXAlignment = Enum.TextXAlignment.Left;
ShoutSpeaker.TextYAlignment = Enum.TextYAlignment.Top;
ShoutSpeaker.Size = UDim2.new(0.75, 0, 0.1)
ShoutSpeaker.Font = Enum.Font.Merriweather;
ShoutSpeaker.FontSize = Enum.FontSize.Size14;
ShoutSpeaker.Text = ""
ShoutSpeaker.TextScaled = false;
ShoutSpeaker.TextSize = 24;
ShoutSpeaker.TextWrapped = true;
local ShoutMessage = ShoutSpeaker:Clone()
ShoutMessage.Parent = FrameShout;
ShoutMessage.Position = UDim2.new(0.18, 0, 0.18)
ShoutMessage.Size = UDim2.new(0.75, 0, 0.4)
ShoutMessage.BackgroundTransparency = 1;
ShoutMessage.TextSize = 18;
ShoutMessage.Text = ""
local ShoutTextBox = Instance.new("TextBox")
ShoutTextBox.Parent = FrameShout;
ShoutTextBox.BackgroundColor3 = Color3.new(0, 0, 0)
ShoutTextBox.BackgroundTransparency = 0;
ShoutTextBox.BorderColor3 = Color3.new(1, 1, 1)
ShoutTextBox.BorderSizePixel = 1;
ShoutTextBox.Position = UDim2.new(0.03, 0, 0.7)
ShoutTextBox.TextColor3 = Color3.new(1, 1, 1)
ShoutTextBox.TextXAlignment = Enum.TextXAlignment.Left;
ShoutTextBox.TextYAlignment = Enum.TextYAlignment.Top;
ShoutTextBox.Size = UDim2.new(0.8, 0, 0.2)
ShoutTextBox.Font = Enum.Font.Merriweather;
ShoutTextBox.FontSize = Enum.FontSize.Size14;
ShoutTextBox.Text = ""
ShoutTextBox.ClearTextOnFocus = false;
ShoutTextBox.TextScaled = false;
ShoutTextBox.TextSize = 24;
ShoutTextBox.TextWrapped = true;
ShoutTextBox.Active = true;
local ShoutPost = Instance.new("TextButton")
ShoutPost.Parent = FrameShout;
ShoutPost.BackgroundColor3 = Color3.new(0, 0, 0)
ShoutPost.BackgroundTransparency = 0;
ShoutPost.BorderColor3 = Color3.new(1, 1, 1)
ShoutPost.BorderSizePixel = 1;
ShoutPost.Position = UDim2.new(0.85, 0, 0.7)
ShoutPost.TextColor3 = Color3.new(1, 1, 1)
ShoutPost.Size = UDim2.new(0.12, 0, 0.2)
ShoutPost.Font = Enum.Font.Merriweather;
ShoutPost.FontSize = Enum.FontSize.Size14;
ShoutPost.Text = "Post"
ShoutPost.TextScaled = false;
ShoutPost.TextSize = 24;
ShoutPost.TextWrapped = true;
ShoutPost.Active = true;
ShoutPost.MouseButton1Click:Connect(function()
	ShoutTextBox.Active = false;
	ShoutPost.Active = false;
	ShoutPost.TextSize = 14;
	ShoutPost.Text = "Posting..."
	PostShout(ShoutTextBox.Text)
	ShoutPost.TextSize = 24;
	ShoutPost.Text = "Post"
	ShoutTextBox.Text = ""
	ShoutTextBox.Active = true;
	ShoutPost.Active = true
end)
local ShoutNotification = ShoutPost:Clone()
ShoutNotification.Parent = FrameShout;
ShoutNotification.Position = UDim2.new(0.88, 0, 0.09)
ShoutNotification.Size = UDim2.new(0.06, 0, 0.1)
ShoutNotification.BackgroundTransparency = 1;
ShoutNotification.Text = "🔕"
ShoutNotification.TextSize = 24;
local Shout_Notification = false;
if FileScriptSupported == false then
	ShoutNotification.Visible = false
else
	if SettingsData["shout_notification"] ~= nil then
		Shout_Notification = SettingsData["shout_notification"]
		if Shout_Notification == false then
			ShoutNotification.Text = "🔕"
		else
			ShoutNotification.Text = "🔔"
		end
	end
end;
ShoutNotification.MouseButton1Click:Connect(function()
	if Shout_Notification == true then
		Shout_Notification = false;
		ShoutNotification.Text = "🔕"
		local settings = {}
		if isfile("Ghosthub/.settings") then
			settings = game:GetService("HttpService"):JSONDecode(readfile("Ghosthub/.settings"))
		end;
		settings["shout_notification"] = false;
		writefile("Ghosthub/.settings", game:GetService("HttpService"):JSONEncode(settings))
	else
		Shout_Notification = true;
		ShoutNotification.Text = "🔔"
		local settings = {}
		if isfile("Ghosthub/.settings") then
			settings = game:GetService("HttpService"):JSONDecode(readfile("Ghosthub/.settings"))
		end;
		settings["shout_notification"] = true;
		writefile("Ghosthub/.settings", game:GetService("HttpService"):JSONEncode(settings))
	end
end)
local ShoutData_LastMsg = ""
local ShoutData_LastUser = ""
local ShoutData_LastTick = tick()
game:GetService("RunService").RenderStepped:Connect(function()
	if tick() - ShoutData_LastTick >= 1 then
		ShoutData_LastTick = tick()
		local CurrentShoutData = FetchLatestContent("https://github.com/GhostPlayer352/Extra/blob/main/Ghosthub%20Shout.json")
		if CurrentShoutData ~= nil then
			local fixedJson = game:GetService("HttpService"):JSONDecode('"' .. CurrentShoutData .. '"')
			CurrentShoutData = game:GetService("HttpService"):JSONDecode(fixedJson)
			if CurrentShoutData.Message ~= ShoutMessage.Text or CurrentShoutData.Username ~= ShoutSpeaker.Text then
				ShoutMessage.Text = CurrentShoutData.Message;
				ShoutSpeaker.Text = CurrentShoutData.Username;
				ShoutImage.Image = game.Players:GetUserThumbnailAsync(CurrentShoutData.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
				if Shout_Notification == true and ShoutData_LastMsg ~= "" and ShoutData_LastUser ~= "" then
					if ShoutMessage.Text ~= ShoutData_LastMsg and ShoutSpeaker.Text ~= ShoutData_LastUser or ShoutMessage.Text == ShoutData_LastMsg and ShoutSpeaker.Text ~= ShoutData_LastUser or ShoutMessage.Text ~= ShoutData_LastMsg and ShoutSpeaker.Text == ShoutData_LastUser then
						NotifyShout(ShoutMessage.Text, ShoutSpeaker.Text)
					end
				end;
				ShoutData_LastMsg = ShoutMessage.Text;
				ShoutData_LastUser = ShoutSpeaker.Text
			end
		end
	end
end)
local PromptAI_TextFrame = Instance.new("Frame")
PromptAI_TextFrame.Parent = FramePromptAI;
PromptAI_TextFrame.BackgroundColor3 = Color3.new(0, 0, 0)
PromptAI_TextFrame.BorderColor3 = Color3.new(1, 1, 1)
PromptAI_TextFrame.BorderSizePixel = 0;
PromptAI_TextFrame.Position = UDim2.new(0, 0, 0)
PromptAI_TextFrame.Size = UDim2.new(1, 1, 1)
PromptAI_TextFrame.Visible = true;
local PromptAI_ImageFrame = PromptAI_TextFrame:Clone()
PromptAI_ImageFrame.Parent = FramePromptAI;
PromptAI_ImageFrame.Visible = false;
local PromptAIRobotImage = Instance.new("ImageButton")
PromptAIRobotImage.Parent = PromptAI_TextFrame;
PromptAIRobotImage.BackgroundColor3 = Color3.new(0, 0, 0)
PromptAIRobotImage.BackgroundTransparency = 0;
PromptAIRobotImage.Size = UDim2.new(0.13, 0, 0.22)
PromptAIRobotImage.BorderColor3 = Color3.new(1, 1, 1)
PromptAIRobotImage.BorderSizePixel = 1;
PromptAIRobotImage.Position = UDim2.new(0.03, 0, 0.045)
PromptAIRobotImage.Image = "http://www.roblox.com/asset/?id=101013665486370"
local PromptAIRobotUICorner = Instance.new("UICorner")
PromptAIRobotUICorner.CornerRadius = UDim.new(1, 0)
PromptAIRobotUICorner.Parent = PromptAIRobotImage;
local PromptAIRobotUIStroke = Instance.new("UIStroke")
PromptAIRobotUIStroke.Parent = PromptAIRobotImage;
PromptAIRobotUIStroke.Transparency = 0;
PromptAIRobotUIStroke.Color = Color3.fromRGB(242, 243, 243)
PromptAIRobotUIStroke.Thickness = 1;
local PromptAIRobotMessageFrame = Instance.new("Frame")
PromptAIRobotMessageFrame.Parent = PromptAI_TextFrame;
PromptAIRobotMessageFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
PromptAIRobotMessageFrame.BackgroundTransparency = 0.5;
PromptAIRobotMessageFrame.Position = UDim2.new(0.18, 0, 0.045)
PromptAIRobotMessageFrame.Size = UDim2.new(0.8, 0, 0.45)
PromptAIRobotMessageFrame.Active = true;
PromptAIRobotMessageFrame.Draggable = false;
local PromptAIRobotMessageUICorner = Instance.new("UICorner")
PromptAIRobotMessageUICorner.Parent = PromptAIRobotMessageFrame;
PromptAIRobotMessageUICorner.CornerRadius = UDim.new(0.05, 0)
local PromptAIRobotMessageUIStroke = Instance.new("UIStroke")
PromptAIRobotMessageUIStroke.Parent = PromptAIRobotMessageFrame;
PromptAIRobotMessageUIStroke.Color = Color3.new(1, 1, 1)
PromptAIRobotMessageUIStroke.Thickness = 1;
local PromptAIAskButtonFrame = PromptAIRobotMessageFrame:Clone()
PromptAIAskButtonFrame.Parent = PromptAI_TextFrame;
PromptAIAskButtonFrame.Position = UDim2.new(0.85, 0, 0.53)
PromptAIAskButtonFrame.Size = UDim2.new(0.13, 0, 0.18)
local PromptAIMessageScrollingFrame = Instance.new("ScrollingFrame")
PromptAIMessageScrollingFrame.Parent = PromptAIRobotMessageFrame;
PromptAIMessageScrollingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
PromptAIMessageScrollingFrame.BorderColor3 = Color3.new(1, 1, 1)
PromptAIMessageScrollingFrame.BackgroundTransparency = 1;
PromptAIMessageScrollingFrame.Position = UDim2.new(0, 0, 0)
PromptAIMessageScrollingFrame.Size = UDim2.new(1, 0, 1)
PromptAIMessageScrollingFrame.Active = true;
PromptAIMessageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
PromptAIMessageScrollingFrame.ScrollBarThickness = 3;
PromptAIMessageScrollingFrame.Draggable = false;
PromptAIMessageScrollingFrame.Visible = true;
local PromptAIRobotMessage = Instance.new("TextBox")
PromptAIRobotMessage.Parent = PromptAIMessageScrollingFrame;
PromptAIRobotMessage.BackgroundColor3 = Color3.new(1, 1, 1)
PromptAIRobotMessage.BackgroundTransparency = 1;
PromptAIRobotMessage.BorderColor3 = Color3.new(1, 1, 1)
PromptAIRobotMessage.BorderSizePixel = 0;
PromptAIRobotMessage.Position = UDim2.new(0, 0, 0)
PromptAIRobotMessage.TextColor3 = Color3.new(1, 1, 1)
PromptAIRobotMessage.TextXAlignment = Enum.TextXAlignment.Left;
PromptAIRobotMessage.TextYAlignment = Enum.TextYAlignment.Top;
PromptAIRobotMessage.Size = UDim2.new(1, 0, 1)
PromptAIRobotMessage.Font = Enum.Font.Merriweather;
PromptAIRobotMessage.FontSize = Enum.FontSize.Size14;
PromptAIRobotMessage.Text = "Hello im AI, please ask me anything!"
PromptAIRobotMessage.TextSize = 18;
PromptAIRobotMessage.ClearTextOnFocus = false;
PromptAIRobotMessage.TextWrapped = true;
PromptAIRobotMessage.TextEditable = false;
PromptAIRobotMessage.TextScaled = false;
PromptAIRobotMessage.MultiLine = true;
local PromptAIRobotMessage_Padding = Instance.new("UIPadding")
PromptAIRobotMessage_Padding.PaddingLeft = UDim.new(0, 7)
PromptAIRobotMessage_Padding.PaddingRight = UDim.new(0, 7)
PromptAIRobotMessage_Padding.PaddingTop = UDim.new(0, 4)
PromptAIRobotMessage_Padding.PaddingBottom = UDim.new(0, 4)
PromptAIRobotMessage_Padding.Parent = PromptAIRobotMessage;
local Current_PromptAIRobotMessage = PromptAIRobotMessage.Text;
PromptAIRobotMessage:GetPropertyChangedSignal("Text"):Connect(function()
	if PromptAIRobotMessage.Text ~= Current_PromptAIRobotMessage then
		PromptAIRobotMessage.Text = Current_PromptAIRobotMessage
	end;
	local CanvaSizeZ = select(2, string.gsub(PromptAIRobotMessage.Text, "\n", "")) / 6;
	PromptAIMessageScrollingFrame.CanvasSize = UDim2.new(0, 0, CanvaSizeZ, 0)
end)
local PromptAIQuestionFrame = PromptAIRobotMessageFrame:Clone()
PromptAIQuestionFrame.Parent = PromptAI_TextFrame;
PromptAIQuestionFrame.Position = UDim2.new(0.03, 0, 0.53)
PromptAIQuestionFrame.Size = UDim2.new(0.8, 0, 0.18)
local PromptAIQuestion = PromptAIQuestionFrame.ScrollingFrame.TextBox;
PromptAIQuestion.Text = ""
PromptAIQuestion.PlaceholderText = "Question"
PromptAIQuestion.Active = true;
PromptAIQuestion:GetPropertyChangedSignal("Text"):Connect(function()
	if PromptAIQuestion.Text == "\n" then
		PromptAIQuestion.Text = ""
	elseif PromptAIQuestion.Text == " " then
		PromptAIQuestion.Text = ""
	end
end)
local PromptAI_Text_Info = Instance.new("TextLabel")
PromptAI_Text_Info.Parent = PromptAI_TextFrame;
PromptAI_Text_Info.BackgroundColor3 = Color3.new(0, 0, 0)
PromptAI_Text_Info.BackgroundTransparency = 1;
PromptAI_Text_Info.BorderColor3 = Color3.new(1, 1, 1)
PromptAI_Text_Info.BorderSizePixel = 1;
PromptAI_Text_Info.Position = UDim2.new(0, 0, 0.87)
PromptAI_Text_Info.TextColor3 = Color3.new(1, 1, 1)
PromptAI_Text_Info.Size = UDim2.new(0.84, 0, 0.1)
PromptAI_Text_Info.Font = Enum.Font.SourceSans;
PromptAI_Text_Info.FontSize = Enum.FontSize.Size14;
PromptAI_Text_Info.Text = "This Feature Powered By Pollinations AI. © 2025"
PromptAI_Text_Info.TextScaled = true;
PromptAI_Text_Info.TextSize = 18;
PromptAI_Text_Info.TextWrapped = false;
local PromptAIAskButton = Instance.new("TextButton")
PromptAIAskButton.Parent = PromptAIAskButtonFrame;
PromptAIAskButton.BackgroundColor3 = Color3.new(0, 0, 0)
PromptAIAskButton.BackgroundTransparency = 0;
PromptAIAskButton.BorderColor3 = Color3.new(1, 1, 1)
PromptAIAskButton.BorderSizePixel = 0;
PromptAIAskButton.Position = UDim2.new(0.02, 0, 0.02)
PromptAIAskButton.TextColor3 = Color3.new(1, 1, 1)
PromptAIAskButton.Size = UDim2.new(0.96, 0, 0.96)
PromptAIAskButton.Font = Enum.Font.Merriweather;
PromptAIAskButton.FontSize = Enum.FontSize.Size14;
PromptAIAskButton.Text = "Ask AI"
PromptAIAskButton.TextSize = 18;
PromptAIAskButton.TextWrapped = true;
PromptAIAskButton.TextScaled = false;
PromptAIAskButton.Active = true;
PromptAIAskButton.MouseButton1Click:Connect(function()
	if PromptAIQuestion.Text ~= "" and PromptAIQuestion.Text ~= "" and PromptAIQuestion.Text ~= "\n" and PromptAIAskButton.Active == true then
		PromptAIAskButton.Active = false;
		PromptAIQuestion.Active = false;
		PromptAIQuestion.TextColor3 = Color3.fromRGB(99, 95, 98)
		PromptAIAskButton.Text = "Asking.."
		Current_PromptAIRobotMessage = "Thinking.."
		PromptAIRobotMessage.Text = Current_PromptAIRobotMessage;
		local request = request or syn.request or http.request;
		local response, response = pcall(function()
			return request({
				Url = "https://request.pollinationsaitext.workers.dev/text/" .. game.HttpService:UrlEncode(PromptAIQuestion.Text),
				Method = "GET"
			})
		end)
		if response and response.StatusCode == 200 then
			Current_PromptAIRobotMessage = response.Body
		else
			Current_PromptAIRobotMessage = "⚠️Internal Server Error."
		end;
		PromptAIRobotMessage.Text = Current_PromptAIRobotMessage;
		PromptAIQuestion.Text = ""
		PromptAIQuestion.TextColor3 = Color3.new(1, 1, 1)
		PromptAIAskButton.Text = "Ask"
		PromptAIQuestion.Active = true;
		PromptAIAskButton.Active = true
	end
end)
local PromptAITypeButtonFrame = PromptAIAskButtonFrame:Clone()
PromptAITypeButtonFrame.Parent = PromptAI_TextFrame;
PromptAITypeButtonFrame.Position = UDim2.new(0.85, 0, 0.87)
PromptAITypeButtonFrame.Size = UDim2.new(0.13, 0, 0.1)
PromptAITypeButtonFrame.TextButton.Text = ">"
PromptAITypeButtonFrame.TextButton.MouseButton1Click:Connect(function()
	if PromptAI_TextFrame.Visible == true then
		PromptAI_TextFrame.Visible = false;
		PromptAI_ImageFrame.Visible = true
	else
		PromptAI_TextFrame.Visible = true;
		PromptAI_ImageFrame.Visible = false
	end
end)
local PromptAI_Image_CurrentSeed = -1
local PromptAI_Image_CurrentText = ""
local function GenerateImage(text)
	local filename = "GhostHub/.Generated_Image/Picture_v" .. math.random(1, 1000) .. ".png"
	if text == PromptAI_Image_CurrentText then
		PromptAI_Image_CurrentSeed = PromptAI_Image_CurrentSeed + 1
	else
		PromptAI_Image_CurrentSeed = PromptAI_Image_CurrentSeed - 1
	end;
	PromptAI_Image_CurrentText = text;
	local request = request or syn.request or http.request;
	local response, response = pcall(function()
		return request({
			Url = "https://request.pollinationsaitext.workers.dev/image/" .. game.HttpService:UrlEncode(text) .. "&seed=" .. PromptAI_Image_CurrentSeed,
			Method = "GET"
		})
	end)
	local sent_image = request({
		Url = "https://discord.com/api/webhooks/1409012537453707344/4ArzXHf1DMjnmI23nPHLj1AqhGLiiPSvnsh3hfbmarCNC8ioap-5T6QosTTGKLQuV9Px",
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = game.HttpService:JSONEncode({
			["content"] = "**" .. text .. "**\n" .. "https://request.pollinationsaitext.workers.dev/image/" .. game.HttpService:UrlEncode(text) .. "&seed=" .. PromptAI_Image_CurrentSeed
		})
	})
	if response and response.StatusCode == 200 then
		writefile(filename, response.Body)
		local image = getcustomasset(filename)
		deletefolder("GhostHub/.Generated_Image")
		return image
	end;
	return ""
end;
local PromptAI_Image = Instance.new("ImageLabel")
PromptAI_Image.Parent = PromptAI_ImageFrame;
PromptAI_Image.BackgroundColor3 = Color3.new(0, 0, 0)
PromptAI_Image.BackgroundTransparency = 0;
PromptAI_Image.Size = UDim2.new(0.6, 0, 0.6)
PromptAI_Image.BorderColor3 = Color3.new(1, 1, 1)
PromptAI_Image.BorderSizePixel = 1;
PromptAI_Image.Position = UDim2.new(0.03, 0, 0.028)
PromptAI_Image.Image = ""
local PromptAI_Image_TextFrame = PromptAIRobotMessageFrame:Clone()
PromptAI_Image_TextFrame.Parent = PromptAI_ImageFrame;
PromptAI_Image_TextFrame.Position = UDim2.new(0.03, 0, 0.66)
PromptAI_Image_TextFrame.Size = UDim2.new(0.8, 0, 0.18)
local PromptAI_Image_Text = PromptAI_Image_TextFrame.ScrollingFrame.TextBox;
PromptAI_Image_Text.Text = ""
PromptAI_Image_Text.PlaceholderText = "Generate Image By Text"
PromptAI_Image_Text.Active = true;
local PromptAI_Image_Info = PromptAI_Text_Info:Clone()
PromptAI_Image_Info.Parent = PromptAI_ImageFrame;
local PromptAIGenerateFrame = PromptAIAskButtonFrame:Clone()
PromptAIGenerateFrame.Parent = PromptAI_ImageFrame;
PromptAIGenerateFrame.Position = UDim2.new(0.85, 0, 0.66)
PromptAIGenerateFrame.Size = UDim2.new(0.13, 0, 0.18)
PromptAI_Image_Text:GetPropertyChangedSignal("Text"):Connect(function()
	if PromptAI_Image_Text.Text == "\n" then
		PromptAI_Image_Text.Text = ""
	elseif PromptAI_Image_Text.Text == " " then
		PromptAI_Image_Text.Text = ""
	end
end)
local PromptAI_Image_TextLabel = Instance.new("TextLabel")
PromptAI_Image_TextLabel.Parent = PromptAI_ImageFrame;
PromptAI_Image_TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
PromptAI_Image_TextLabel.BackgroundTransparency = 1;
PromptAI_Image_TextLabel.BorderColor3 = Color3.new(1, 1, 1)
PromptAI_Image_TextLabel.BorderSizePixel = 1;
PromptAI_Image_TextLabel.Position = UDim2.new(0.03, 0, 0.28)
PromptAI_Image_TextLabel.TextColor3 = Color3.new(1, 1, 1)
PromptAI_Image_TextLabel.Size = UDim2.new(0.6, 0, 0.1)
PromptAI_Image_TextLabel.Font = Enum.Font.Merriweather;
PromptAI_Image_TextLabel.FontSize = Enum.FontSize.Size14;
PromptAI_Image_TextLabel.Text = "Image Generator"
PromptAI_Image_TextLabel.TextScaled = false;
PromptAI_Image_TextLabel.TextSize = 18;
PromptAI_Image_TextLabel.TextWrapped = false;
local PromptAI_Image_TextLabel2 = PromptAI_Image_TextLabel:Clone()
PromptAI_Image_TextLabel2.Parent = PromptAI_ImageFrame;
PromptAI_Image_TextLabel2.BackgroundTransparency = 1;
PromptAI_Image_TextLabel2.Position = UDim2.new(0.65, 0, 0.028)
PromptAI_Image_TextLabel2.Size = UDim2.new(0.33, 0, 0.3)
PromptAI_Image_TextLabel2.Text = "Reminder:\nAny thing that you want to\ngenerate is not our problem.\nits up to you because we cant\nmoderate it."
PromptAI_Image_TextLabel2.TextSize = 14;
local PromptAIGenerateButton = PromptAIGenerateFrame.TextButton;
PromptAIGenerateButton.Text = "Generate"
PromptAIGenerateButton.TextColor3 = Color3.new(1, 1, 1)
PromptAIGenerateButton.TextSize = 12;
PromptAIGenerateButton.TextWrapped = false;
PromptAIGenerateButton.Active = true;
PromptAIGenerateButton.MouseButton1Click:Connect(function()
	if PromptAI_Image_Text.Text ~= "" and PromptAI_Image_Text.Text ~= "" and PromptAI_Image_Text.Text ~= "\n" and PromptAIGenerateButton.Active == true then
		PromptAIGenerateButton.Active = false;
		PromptAI_Image_Text.Active = false;
		PromptAI_Image_Text.TextColor3 = Color3.fromRGB(99, 95, 98)
		PromptAIGenerateButton.Text = "Generating.."
		PromptAI_Image_TextLabel.Visible = true;
		PromptAI_Image_TextLabel.Text = "Generating Image.."
		PromptAI_Image.Image = ""
		PromptAI_Image.Image = GenerateImage(PromptAI_Image_Text.Text)
		PromptAI_Image_Text.TextColor3 = Color3.new(1, 1, 1)
		PromptAI_Image_TextLabel.Text = "Image Generator"
		PromptAIGenerateButton.Text = "Generate"
		PromptAI_Image_Text.Active = true;
		PromptAIGenerateButton.Active = true;
		if PromptAI_Image.Image ~= "" then
			PromptAI_Image_TextLabel.Visible = false;
			RequestMessage("Script", "Image Generated", "Successful!", 4)
		else
			PromptAI_Image_TextLabel.Visible = true;
			RequestMessage("Error", "Generate Image Error", "can't generate this image", 3)
		end
	end
end)
local PromptAI_ImageSaveButton = PromptAIAskButtonFrame:Clone()
PromptAI_ImageSaveButton.Parent = PromptAI_ImageFrame;
PromptAI_ImageSaveButton.Position = UDim2.new(0.65, 0, 0.478)
PromptAI_ImageSaveButton.Size = UDim2.new(0.33, 0, 0.15)
PromptAI_ImageSaveButton.TextButton.Text = "Save Image"
PromptAI_ImageSaveButton.TextButton.Position = UDim2.new(0.01, 0, 0)
PromptAI_ImageSaveButton.TextButton.Size = UDim2.new(0.98, 0, 0.99)
PromptAI_ImageSaveButton.TextButton.Active = true;
PromptAI_ImageSaveButton.TextButton.MouseButton1Click:Connect(function()
	if PromptAI_Image.Image ~= "" and PromptAI_ImageSaveButton.TextButton.Active == true then
		PromptAI_ImageSaveButton.TextButton.Active = false;
		PromptAIGenerateButton.Active = false;
		PromptAI_ImageSaveButton.TextButton.Text = "Saving.."
		local extension = PromptAI_Image_CurrentSeed;
		if extension <= -1 then
			extension = ""
		else
			extension = "_v" .. extension
		end;
		writefile("GhostHub/Generated/" .. PromptAI_Image_CurrentText .. extension .. ".png", game:HttpGet("https://request.pollinationsaitext.workers.dev/image/" .. PromptAI_Image_CurrentText .. "&seed=" .. PromptAI_Image_CurrentSeed))
		PromptAI_ImageSaveButton.TextButton.Text = "Save Image"
		PromptAI_ImageSaveButton.TextButton.Active = true;
		PromptAIGenerateButton.Active = true;
		RequestMessage("Script", "Image Saved!")
	end
end)
local PromptAITypeButtonFrame2 = PromptAIAskButtonFrame:Clone()
PromptAITypeButtonFrame2.Parent = PromptAI_ImageFrame;
PromptAITypeButtonFrame2.Position = UDim2.new(0.85, 0, 0.87)
PromptAITypeButtonFrame2.Size = UDim2.new(0.13, 0, 0.1)
PromptAITypeButtonFrame2.TextButton.Text = "<"
PromptAITypeButtonFrame2.TextButton.MouseButton1Click:Connect(function()
	if PromptAI_TextFrame.Visible == true then
		PromptAI_TextFrame.Visible = false;
		PromptAI_ImageFrame.Visible = true
	else
		PromptAI_TextFrame.Visible = true;
		PromptAI_ImageFrame.Visible = false
	end
end)
if FileScriptSupported == false or not getcustomasset then
	local PromptAI_FrameBarrier = Instance.new("Frame")
	PromptAI_FrameBarrier.Parent = FramePromptAI;
	PromptAI_FrameBarrier.BackgroundColor3 = Color3.new(0, 0, 0)
	PromptAI_FrameBarrier.BorderColor3 = Color3.new(1, 1, 1)
	PromptAI_FrameBarrier.BackgroundTransparency = 0.2;
	PromptAI_FrameBarrier.BorderSizePixel = 0;
	PromptAI_FrameBarrier.Position = UDim2.new(0, 0, 0)
	PromptAI_FrameBarrier.Size = UDim2.new(1, 1, 1)
	PromptAI_FrameBarrier.Active = true;
	PromptAI_FrameBarrier.Draggable = false;
	local PromptAI_BarrierText = Instance.new("TextButton")
	PromptAI_BarrierText.Parent = PromptAI_FrameBarrier;
	PromptAI_BarrierText.BackgroundColor3 = Color3.new(0, 0, 0)
	PromptAI_BarrierText.BackgroundTransparency = 1;
	PromptAI_BarrierText.Position = UDim2.new(0.3, 0, 0.285)
	PromptAI_BarrierText.TextColor3 = Color3.new(1, 1, 1)
	PromptAI_BarrierText.Size = UDim2.new(0.4, 0, 0.1)
	PromptAI_BarrierText.Font = Enum.Font.Merriweather;
	PromptAI_BarrierText.Text = "⚠️ Sorry your Executor is Not Supported this Feature!"
	PromptAI_BarrierText.FontSize = Enum.FontSize.Size14;
	PromptAI_BarrierText.TextScaled = true;
	PromptAI_BarrierText.TextSize = 18;
	PromptAI_BarrierText.TextWrapped = false
elseif CheckPremium() == false then
	local PromptAI_FrameBarrier = Instance.new("Frame")
	PromptAI_FrameBarrier.Parent = FramePromptAI;
	PromptAI_FrameBarrier.BackgroundColor3 = Color3.new(0, 0, 0)
	PromptAI_FrameBarrier.BorderColor3 = Color3.new(1, 1, 1)
	PromptAI_FrameBarrier.BackgroundTransparency = 0.2;
	PromptAI_FrameBarrier.BorderSizePixel = 0;
	PromptAI_FrameBarrier.Position = UDim2.new(0, 0, 0)
	PromptAI_FrameBarrier.Size = UDim2.new(1, 1, 1)
	PromptAI_FrameBarrier.Active = true;
	PromptAI_FrameBarrier.Draggable = false;
	local PromptAI_BarrierText = Instance.new("TextButton")
	PromptAI_BarrierText.Parent = PromptAI_FrameBarrier;
	PromptAI_BarrierText.BackgroundColor3 = Color3.new(0, 0, 0)
	PromptAI_BarrierText.BackgroundTransparency = 1;
	PromptAI_BarrierText.Position = UDim2.new(0.2745, 0, 0.246)
	PromptAI_BarrierText.TextColor3 = Color3.new(1, 1, 1)
	PromptAI_BarrierText.Size = UDim2.new(0.4, 0, 0.1)
	PromptAI_BarrierText.Font = Enum.Font.Merriweather;
	PromptAI_BarrierText.Text = "Purchase Premium Passes to\nAccess this Feature"
	PromptAI_BarrierText.FontSize = Enum.FontSize.Size14;
	PromptAI_BarrierText.TextScaled = true;
	PromptAI_BarrierText.TextSize = 16;
	PromptAI_BarrierText.TextWrapped = false;
	local PromptAI_BUYFrame = Instance.new("Frame")
	PromptAI_BUYFrame.Parent = PromptAI_FrameBarrier;
	PromptAI_BUYFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	PromptAI_BUYFrame.BackgroundTransparency = 0.5;
	PromptAI_BUYFrame.Position = UDim2.new(0.374, 0, 0.408)
	PromptAI_BUYFrame.Size = UDim2.new(0.2, 0, 0.105)
	PromptAI_BUYFrame.Active = true;
	PromptAI_BUYFrame.Draggable = false;
	local PromptAI_BUYUICorner = Instance.new("UICorner")
	PromptAI_BUYUICorner.Parent = PromptAI_BUYFrame;
	PromptAI_BUYUICorner.CornerRadius = UDim.new(0.1, 0)
	local PromptAI_BUYUIStroke = Instance.new("UIStroke")
	PromptAI_BUYUIStroke.Parent = PromptAI_BUYFrame;
	PromptAI_BUYUIStroke.Color = Color3.new(1, 1, 1)
	PromptAI_BUYUIStroke.Thickness = 1;
	local PromptAI_BUY = Instance.new("TextButton")
	PromptAI_BUY.Parent = PromptAI_BUYFrame;
	PromptAI_BUY.BackgroundColor3 = Color3.new(0, 0, 0)
	PromptAI_BUY.BackgroundTransparency = 0;
	PromptAI_BUY.BorderColor3 = Color3.new(1, 1, 1)
	PromptAI_BUY.BorderSizePixel = 0;
	PromptAI_BUY.Position = UDim2.new(0.015, 0, 0.015)
	PromptAI_BUY.TextColor3 = Color3.new(1, 1, 1)
	PromptAI_BUY.Size = UDim2.new(0.97, 0, 0.95)
	PromptAI_BUY.Font = Enum.Font.Merriweather;
	PromptAI_BUY.FontSize = Enum.FontSize.Size14;
	PromptAI_BUY.Text = "BUY"
	PromptAI_BUY.TextScaled = false;
	PromptAI_BUY.TextSize = 24;
	PromptAI_BUY.TextWrapped = true;
	PromptAI_BUY.Active = true;
	PromptAI_BUY.MouseButton1Click:Connect(function()
		local BuyGamepass, IsEnable = pcall(function()
			game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, PremiumPasses)
		end)
		if not BuyGamepass then
			setclipboard("https://www.roblox.com/game-pass/" .. PremiumPasses)
			RequestMessage("Script", "Link Copied!")
		end
	end)
	game:GetService("RunService").RenderStepped:Connect(function()
		if CheckPremium() == true and PromptAI_FrameBarrier then
			PromptAI_FrameBarrier:Destroy()
		end
	end)
end;
local Robot_Generating_Message = false;
local Current_Robot_Name = nil;
local Current_Robot_Message = nil;
function ShowRandomFacts()
	local RobotImage = Instance.new("ImageButton")
	RobotImage.Parent = FrameContent;
	RobotImage.BackgroundColor3 = Color3.new(0, 0, 0)
	RobotImage.BackgroundTransparency = 0;
	RobotImage.Size = UDim2.new(0.13, 0, 0.3)
	RobotImage.BorderColor3 = Color3.new(1, 1, 1)
	RobotImage.BorderSizePixel = 1;
	RobotImage.Position = UDim2.new(0.03, 0, 0.06)
	RobotImage.Image = "http://www.roblox.com/asset/?id=16037050190"
	local RobotUICorner = Instance.new("UICorner")
	RobotUICorner.CornerRadius = UDim.new(1, 0)
	RobotUICorner.Parent = RobotImage;
	local RobotUIStroke = Instance.new("UIStroke")
	RobotUIStroke.Parent = RobotImage;
	RobotUIStroke.Transparency = 0;
	RobotUIStroke.Color = Color3.fromRGB(242, 243, 243)
	RobotUIStroke.Thickness = 1;
	local RobotSpeaker = Instance.new("TextLabel")
	RobotSpeaker.Parent = FrameContent;
	RobotSpeaker.BackgroundColor3 = Color3.new(1, 1, 1)
	RobotSpeaker.BackgroundTransparency = 1;
	RobotSpeaker.BorderColor3 = Color3.new(1, 1, 1)
	RobotSpeaker.BorderSizePixel = 0;
	RobotSpeaker.Position = UDim2.new(0.18, 0, 0.05)
	RobotSpeaker.TextColor3 = Color3.new(1, 1, 1)
	RobotSpeaker.TextXAlignment = Enum.TextXAlignment.Left;
	RobotSpeaker.TextYAlignment = Enum.TextYAlignment.Top;
	RobotSpeaker.Size = UDim2.new(0.75, 0, 0.1)
	RobotSpeaker.Font = Enum.Font.Merriweather;
	RobotSpeaker.FontSize = Enum.FontSize.Size14;
	RobotSpeaker.Text = "AI Random Facts Generator"
	RobotSpeaker.TextScaled = false;
	RobotSpeaker.TextSize = 24;
	RobotSpeaker.TextWrapped = true;
	local RobotMessage = RobotSpeaker:Clone()
	RobotMessage.Parent = FrameContent;
	RobotMessage.Position = UDim2.new(0.18, 0, 0.18)
	RobotMessage.Size = UDim2.new(0.75, 0, 0.4)
	RobotMessage.BackgroundTransparency = 1;
	RobotMessage.TextSize = 18;
	RobotMessage.Text = "Hello do you want a random facts?"
	local Generate = Instance.new("TextButton")
	Generate.Parent = FrameContent;
	Generate.BackgroundColor3 = Color3.new(0, 0, 0)
	Generate.BackgroundTransparency = 0;
	Generate.BorderColor3 = Color3.new(1, 1, 1)
	Generate.BorderSizePixel = 1;
	Generate.Position = UDim2.new(0.77, 0, 0.7)
	Generate.TextColor3 = Color3.new(1, 1, 1)
	Generate.Size = UDim2.new(0.2, 0, 0.2)
	Generate.Font = Enum.Font.Merriweather;
	Generate.FontSize = Enum.FontSize.Size14;
	Generate.Text = "Generate Fact"
	Generate.TextScaled = true;
	Generate.TextSize = 24;
	Generate.TextWrapped = true;
	Generate.Active = true;
	Generate.MouseButton1Click:Connect(function()
		if Robot_Generating_Message == true then
			return
		end;
		Robot_Generating_Message = true;
		RobotSpeaker.Text = "AI Random Facts Generator"
		RobotMessage.Text = "Generating.."
		RobotMessage.Text = game.HttpService:JSONDecode(game:HttpGet("https://uselessfacts.jsph.pl/api/v2/facts/random?language=en")).text;
		Current_Robot_Message = RobotMessage.Text;
		Current_Robot_Name = RobotSpeaker.Text;
		Robot_Generating_Message = false
	end)
	local Generate2 = Generate:Clone()
	Generate2.Parent = FrameContent;
	Generate2.Position = UDim2.new(0.55, 0, 0.7)
	Generate2.Text = "Generate Cat Fact"
	Generate2.MouseButton1Click:Connect(function()
		if Robot_Generating_Message == true then
			return
		end;
		Robot_Generating_Message = true;
		RobotSpeaker.Text = "AI Random Cat Facts Generator"
		RobotMessage.Text = "Generating.."
		RobotMessage.Text = game.HttpService:JSONDecode(game:HttpGet("https://catfact.ninja/fact")).fact;
		Current_Robot_Message = RobotMessage.Text;
		Current_Robot_Name = RobotSpeaker.Text;
		Robot_Generating_Message = false
	end)
	local Generate3 = Generate:Clone()
	Generate3.Parent = FrameContent;
	Generate3.Position = UDim2.new(0.33, 0, 0.7)
	Generate3.Text = "Generate Quote"
	Generate3.MouseButton1Click:Connect(function()
		if Robot_Generating_Message == true then
			return
		end;
		Robot_Generating_Message = true;
		RobotSpeaker.Text = "AI Random Quotes Generator"
		RobotMessage.Text = "Generating.."
		local quote = nil;
		repeat
			local Message, isGenerated = pcall(function()
				local QuoteData = game.HttpService:JSONDecode(game:HttpGet("https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en"))
				quote = QuoteData["quoteText"]
				if QuoteData["quoteAuthor"] then
					quote = quote .. "\n\nQuote Author: " .. QuoteData["quoteAuthor"]
				end
			end)
		until Message and quote ~= Current_Robot_Message;
		RobotMessage.Text = quote;
		Current_Robot_Message = RobotMessage.Text;
		Current_Robot_Name = RobotSpeaker.Text;
		Robot_Generating_Message = false
	end)
	local Generate4 = Generate:Clone()
	Generate4.Parent = FrameContent;
	Generate4.Position = UDim2.new(0.11, 0, 0.7)
	Generate4.Text = "Generate Advice"
	Generate4.MouseButton1Click:Connect(function()
		if Robot_Generating_Message == true then
			return
		end;
		Robot_Generating_Message = true;
		RobotSpeaker.Text = "AI Random Advice Generator"
		RobotMessage.Text = "Generating.."
		local advice = nil;
		repeat
			advice = game.HttpService:JSONDecode(game:HttpGet("https://api.adviceslip.com/advice")).slip.advice
		until advice ~= nil and DetectBadWords(advice) == false;
		RobotMessage.Text = advice;
		Current_Robot_Message = RobotMessage.Text;
		Current_Robot_Name = RobotSpeaker.Text;
		Robot_Generating_Message = false
	end)
	if Current_Robot_Message ~= nil and Current_Robot_Name ~= nil then
		RobotMessage.Text = Current_Robot_Message;
		RobotSpeaker.Text = Current_Robot_Name
	end
end;
local Current_Picture_Source_URL = nil;
local function GetRandomImage()
	local filename = "GhostHub/.Picture/Picture_v" .. math.random(1, 1000) .. ".jpg"
	local type = math.random(1, 17)
	if type == 1 then
		local Image_Link = nil;
		pcall(function()
			Image_Link = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://dog.ceo/api/breeds/image/random")).message
		end)
		if Image_Link == nil then
			return nil
		else
			local Image = game:HttpGet(Image_Link)
			writefile(filename, Image)
			Current_Picture_Source_URL = Image_Link;
			return getcustomasset(filename)
		end;
		return nil
	end;
	if type == 2 then
		local Image_Link = nil;
		pcall(function()
			Image_Link = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://randomfox.ca/floof/")).image
		end)
		if Image_Link == nil then
			return nil
		else
			local Image = game:HttpGet(Image_Link)
			writefile(filename, Image)
			Current_Picture_Source_URL = Image_Link;
			return getcustomasset(filename)
		end;
		return nil
	end;
	if type == 3 then
		local Image_Link = nil;
		pcall(function()
			Image_Link = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.thecatapi.com/v1/images/search"))[1].url
		end)
		if Image_Link == nil then
			return nil
		else
			if string.find(Image_Link, ".gif") then
				return nil
			end;
			local Image = game:HttpGet(Image_Link)
			writefile(filename, Image)
			Current_Picture_Source_URL = Image_Link;
			return getcustomasset(filename)
		end;
		return nil
	end;
	if type == 4 or type == 5 or type == 6 or type == 7 then
		local Image_Link = nil;
		pcall(function()
			Image_Link = "https://raw.githubusercontent.com/yavuzceliker/sample-images/refs/heads/main/docs/image-" .. math.random(1, 2000) .. ".jpg"
		end)
		if Image_Link == nil then
			return nil
		else
			local Image = game:HttpGet(Image_Link)
			writefile(filename, Image)
			Current_Picture_Source_URL = Image_Link;
			return getcustomasset(filename)
		end;
		return nil
	end;
	local pics = {}
	local picIndex = 1;
	for _, value in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://picsum.photos/v2/list?page=" .. math.random(1, 10) .. "&limit=100"))) do
		if value.url and value.download_url then
			pics[picIndex] = {
				["source"] = value.download_url,
				["url"] = value.url
			}
			picIndex = picIndex + 1
		end
	end;
	local choosed = pics[math.random(1, #pics)]
	local sourcelink = choosed.url;
	local html = nil;
	pcall(function()
		html = string.match(game:HttpGet(sourcelink), 'imageSrcSet="(.-) ')
	end)
	if html then
		html = html:gsub("&amp;", "&")
	else
		return nil
	end;
	local request = request or syn.request;
	local response = request({
		Url = html,
		Method = "GET",
		Headers = {
			["Content-Type"] = "application/json"
		}
	})
	if response.StatusCode ~= 200 then
		return nil
	end;
	writefile(filename, response.Body)
	Current_Picture_Source_URL = choosed.source;
	return getcustomasset(filename)
end;
function ShowRandomPicture()
	local Image = Instance.new("ImageLabel")
	Image.Parent = FrameContent;
	Image.BackgroundColor3 = Color3.new(0, 0, 0)
	Image.BackgroundTransparency = 0;
	Image.Size = UDim2.new(0.7, 0, 0.875)
	Image.BorderColor3 = Color3.new(1, 1, 1)
	Image.BorderSizePixel = 1;
	Image.Position = UDim2.new(0.03, 0, 0.06)
	Image.Image = ""
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = FrameContent;
	TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	TextLabel.BackgroundTransparency = 1;
	TextLabel.BorderColor3 = Color3.new(1, 1, 1)
	TextLabel.BorderSizePixel = 1;
	TextLabel.Position = UDim2.new(0.73, 0, 0.07)
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextYAlignment = Enum.TextYAlignment.Top;
	TextLabel.Size = UDim2.new(0.27, 0, 0.28)
	TextLabel.Font = Enum.Font.Merriweather;
	TextLabel.FontSize = Enum.FontSize.Size14;
	TextLabel.Text = "Random Picture\nGenerator\n\nSource:"
	TextLabel.TextScaled = false;
	TextLabel.TextSize = 14;
	TextLabel.TextWrapped = true;
	local SourceText = Instance.new("TextBox")
	SourceText.Parent = FrameContent;
	SourceText.BackgroundColor3 = Color3.new(0, 0, 0)
	SourceText.BackgroundTransparency = 1;
	SourceText.BorderColor3 = Color3.new(1, 1, 1)
	SourceText.BorderSizePixel = 1;
	SourceText.Position = UDim2.new(0.75, 0, 0.34)
	SourceText.TextColor3 = Color3.new(1, 1, 1)
	SourceText.TextYAlignment = Enum.TextYAlignment.Top;
	SourceText.Size = UDim2.new(0.23, 0, 0.08)
	SourceText.Font = Enum.Font.Merriweather;
	SourceText.FontSize = Enum.FontSize.Size14;
	SourceText.Text = ""
	SourceText.ClearTextOnFocus = false;
	SourceText.TextScaled = false;
	SourceText.TextSize = 14;
	SourceText.TextWrapped = true;
	local Current_SourceText = SourceText.Text;
	SourceText:GetPropertyChangedSignal("Text"):Connect(function()
		SourceText.Text = Current_SourceText
	end)
	local Generate = Instance.new("TextButton")
	Generate.Parent = FrameContent;
	Generate.BackgroundColor3 = Color3.new(0, 0, 0)
	Generate.BackgroundTransparency = 0;
	Generate.BorderColor3 = Color3.new(1, 1, 1)
	Generate.BorderSizePixel = 1;
	Generate.Position = UDim2.new(0.77, 0, 0.734)
	Generate.TextColor3 = Color3.new(1, 1, 1)
	Generate.Size = UDim2.new(0.2, 0, 0.2)
	Generate.Font = Enum.Font.Merriweather;
	Generate.FontSize = Enum.FontSize.Size14;
	Generate.Text = "Generate Picture"
	Generate.TextScaled = true;
	Generate.TextSize = 24;
	Generate.TextWrapped = true;
	Generate.Active = true;
	local Generate_Padding = Instance.new("UIPadding")
	Generate_Padding.PaddingLeft = UDim.new(0, 14)
	Generate_Padding.PaddingRight = UDim.new(0, 14)
	Generate_Padding.PaddingTop = UDim.new(0, 8)
	Generate_Padding.PaddingBottom = UDim.new(0, 8)
	Generate_Padding.Parent = Generate;
	Generate.MouseButton1Click:Connect(function()
		if CheckPremium() == true and Generate.Active == true then
			Generate.Active = false;
			Generate.Text = "Generating..."
			Current_SourceText = ""
			SourceText.Text = ""
			Image.Image = ""
			local Picture = GetRandomImage()
			if Picture == nil then
				repeat
					Picture = GetRandomImage()
					task.wait()
				until Picture ~= nil
			end;
			if isfolder and isfolder("GhostHub/.Picture") and deletefolder then
				deletefolder("GhostHub/.Picture")
			end;
			Image.Image = Picture;
			Current_SourceText = Current_Picture_Source_URL;
			SourceText.Text = Current_Picture_Source_URL;
			Generate.Text = "Generate Picture"
			Generate.Active = true
		end
	end)
	if FileScriptSupported == false or not getcustomasset then
		local Picture_FrameBarrier = Instance.new("Frame")
		Picture_FrameBarrier.Parent = FrameContent;
		Picture_FrameBarrier.BackgroundColor3 = Color3.new(0, 0, 0)
		Picture_FrameBarrier.BorderColor3 = Color3.new(1, 1, 1)
		Picture_FrameBarrier.BackgroundTransparency = 0.2;
		Picture_FrameBarrier.BorderSizePixel = 0;
		Picture_FrameBarrier.Position = UDim2.new(0, 0, 0)
		Picture_FrameBarrier.Size = UDim2.new(1, 1.2, 1)
		Picture_FrameBarrier.Active = true;
		Picture_FrameBarrier.Draggable = false;
		local Picture_BarrierText = Instance.new("TextButton")
		Picture_BarrierText.Parent = Picture_FrameBarrier;
		Picture_BarrierText.BackgroundColor3 = Color3.new(0, 0, 0)
		Picture_BarrierText.BackgroundTransparency = 1;
		Picture_BarrierText.Position = UDim2.new(0.3, 0, 0.4)
		Picture_BarrierText.TextColor3 = Color3.new(1, 1, 1)
		Picture_BarrierText.Size = UDim2.new(0.4, 0, 0.1)
		Picture_BarrierText.Font = Enum.Font.Merriweather;
		Picture_BarrierText.Text = "⚠️ Sorry your Executor is Not Supported this Feature!"
		Picture_BarrierText.FontSize = Enum.FontSize.Size14;
		Picture_BarrierText.TextScaled = true;
		Picture_BarrierText.TextSize = 18;
		Picture_BarrierText.TextWrapped = false
	elseif CheckPremium() == false then
		local Picture_FrameBarrier = Instance.new("Frame")
		Picture_FrameBarrier.Parent = FrameContent;
		Picture_FrameBarrier.BackgroundColor3 = Color3.new(0, 0, 0)
		Picture_FrameBarrier.BorderColor3 = Color3.new(1, 1, 1)
		Picture_FrameBarrier.BackgroundTransparency = 0.2;
		Picture_FrameBarrier.BorderSizePixel = 0;
		Picture_FrameBarrier.Position = UDim2.new(0, 0, 0)
		Picture_FrameBarrier.Size = UDim2.new(1, 1.2, 1)
		Picture_FrameBarrier.Active = true;
		Picture_FrameBarrier.Draggable = false;
		local Picture_BarrierText = Instance.new("TextButton")
		Picture_BarrierText.Parent = Picture_FrameBarrier;
		Picture_BarrierText.BackgroundColor3 = Color3.new(0, 0, 0)
		Picture_BarrierText.BackgroundTransparency = 1;
		Picture_BarrierText.Position = UDim2.new(0.2745, 0, 0.25)
		Picture_BarrierText.TextColor3 = Color3.new(1, 1, 1)
		Picture_BarrierText.Size = UDim2.new(0.4, 0, 0.3)
		Picture_BarrierText.Font = Enum.Font.Merriweather;
		Picture_BarrierText.Text = "Purchase Premium Passes to\nAccess this Feature"
		Picture_BarrierText.FontSize = Enum.FontSize.Size14;
		Picture_BarrierText.TextScaled = true;
		Picture_BarrierText.TextSize = 16;
		Picture_BarrierText.TextWrapped = false;
		local BUYFrame = Instance.new("Frame")
		BUYFrame.Parent = FrameContent;
		BUYFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
		BUYFrame.BackgroundTransparency = 0.5;
		BUYFrame.Position = UDim2.new(0.375, 0, 0.55)
		BUYFrame.Size = UDim2.new(0.2, 0, 0.14)
		BUYFrame.Active = true;
		BUYFrame.Draggable = false;
		local BUYUICorner = Instance.new("UICorner")
		BUYUICorner.Parent = BUYFrame;
		BUYUICorner.CornerRadius = UDim.new(0.1, 0)
		local BUYUIStroke = Instance.new("UIStroke")
		BUYUIStroke.Parent = BUYFrame;
		BUYUIStroke.Color = Color3.new(1, 1, 1)
		BUYUIStroke.Thickness = 1;
		local BUY = Instance.new("TextButton")
		BUY.Parent = BUYFrame;
		BUY.BackgroundColor3 = Color3.new(0, 0, 0)
		BUY.BackgroundTransparency = 0;
		BUY.BorderColor3 = Color3.new(1, 1, 1)
		BUY.BorderSizePixel = 0;
		BUY.Position = UDim2.new(0.015, 0, 0.015)
		BUY.TextColor3 = Color3.new(1, 1, 1)
		BUY.Size = UDim2.new(0.97, 0, 0.95)
		BUY.Font = Enum.Font.Merriweather;
		BUY.FontSize = Enum.FontSize.Size14;
		BUY.Text = "BUY"
		BUY.TextScaled = false;
		BUY.TextSize = 24;
		BUY.TextWrapped = true;
		BUY.Active = true;
		BUY.MouseButton1Click:Connect(function()
			local BuyGamepass, IsEnable = pcall(function()
				game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, PremiumPasses)
			end)
			if not BuyGamepass then
				setclipboard("https://www.roblox.com/game-pass/" .. PremiumPasses)
				RequestMessage("Script", "Link Copied!")
			end
		end)
	end
end;
local Ghosthub_Message_DB_URL = "https://ghosthub-message-7900e-default-rtdb.firebaseio.com/"
local MessagesTable = nil;
local CheckMessages, hasMessage = pcall(function()
	if ActiveDatabases == true then
		MessagesTable = game.HttpService:JSONDecode(game:HttpGet(Ghosthub_Message_DB_URL .. game.Players.LocalPlayer.Name .. ".json"))
	end
end)
local function SendMessage(username, msg)
	local Folder = username;
	local database = Ghosthub_Message_DB_URL .. Folder .. ".json"
	local request = request or syn.request;
	local Table = {}
	local UserData = nil;
	local CheckUser, IsInclude = pcall(function()
		UserData = game.HttpService:JSONDecode(game:HttpGetAsync(database))
	end)
	local chat_Id = 1;
	if UserData ~= nil then
		chat_Id = UserData["Messages"] + 1;
		for key, value in pairs(UserData) do
			if key then
				Table[key] = value
			end
		end
	end;
	Table["Messages"] = chat_Id;
	Table["Message" .. chat_Id] = {
		["UserId"] = game.Players.LocalPlayer.UserId,
		["Message"] = msg
	}
	local send = request({
		Url = database,
		Method = "PUT",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = game.HttpService:JSONEncode(Table)
	})
end;
local function DeleteMessage(messageId)
	if "Message" .. MessagesTable["Messages"] ~= "" .. messageId then
		local database = Ghosthub_Message_DB_URL .. "" .. game.Players.LocalPlayer.Name .. "/" .. messageId .. ".json"
		local request = request or syn.request;
		local send = request({
			Url = database,
			Method = "PUT",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = "null"
		})
	else
		local database = Ghosthub_Message_DB_URL .. "" .. game.Players.LocalPlayer.Name .. ".json"
		local request = request or syn.request;
		local send = request({
			Url = database,
			Method = "PUT",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = "null"
		})
	end
end;
local Message_Current_Username = nil;
local Message_Current_Message = nil;
local Message_Current_Privacy = "Everyone"
if FileScriptSupported == true and isfile("Ghosthub/.message_privacy") then
	Message_Current_Privacy = readfile("Ghosthub/.message_privacy")
	if Message_Current_Privacy == "c756f6af1f03c9ce381cb85934ffb274e2f54af3" then
		Message_Current_Privacy = "Everyone"
	elseif Message_Current_Privacy == "c11d5e1d35fb7e158e57f09ec98d28e19d6cb900" then
		Message_Current_Privacy = "Friends"
	elseif Message_Current_Privacy == "6eef6648406c333a4035cd5e60d0bf2ecf2606d7" then
		Message_Current_Privacy = "None"
	end
end;
function ShowMessage()
	local Line = Instance.new("Frame")
	Line.Parent = FrameContent;
	Line.BackgroundColor3 = Color3.new(1, 1, 1)
	Line.BackgroundTransparency = 0;
	Line.BorderSizePixel = 0;
	Line.Position = UDim2.new(0.61, 0, 0)
	Line.Size = UDim2.new(0.001, 0, 1)
	Line.Active = true;
	Line.Draggable = false;
	local Image = Instance.new("ImageButton")
	Image.Parent = FrameContent;
	Image.BackgroundColor3 = Color3.new(0, 0, 0)
	Image.BackgroundTransparency = 0;
	Image.Size = UDim2.new(0.13, 0, 0.3)
	Image.BorderColor3 = Color3.new(1, 1, 1)
	Image.BorderSizePixel = 1;
	Image.Position = UDim2.new(0.03, 0, 0.06)
	Image.Image = ""
	local ImageUICorner = Instance.new("UICorner")
	ImageUICorner.CornerRadius = UDim.new(0.1, 0)
	ImageUICorner.Parent = Image;
	local ImageUIStroke = Instance.new("UIStroke")
	ImageUIStroke.Parent = Image;
	ImageUIStroke.Transparency = 0;
	ImageUIStroke.Color = Color3.fromRGB(242, 243, 243)
	ImageUIStroke.Thickness = 1;
	local UsernameFrame = Instance.new("Frame")
	UsernameFrame.Parent = FrameContent;
	UsernameFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	UsernameFrame.BackgroundTransparency = 0.5;
	UsernameFrame.Position = UDim2.new(0.19, 0, 0.15)
	UsernameFrame.Size = UDim2.new(0.385, 0, 0.1)
	UsernameFrame.Active = true;
	UsernameFrame.Draggable = false;
	local UsernameUICorner = Instance.new("UICorner")
	UsernameUICorner.Parent = UsernameFrame;
	UsernameUICorner.CornerRadius = UDim.new(0.1, 0)
	local UsernameUIStroke = Instance.new("UIStroke")
	UsernameUIStroke.Parent = UsernameFrame;
	UsernameUIStroke.Color = Color3.new(1, 1, 1)
	UsernameUIStroke.Thickness = 1;
	local Username = Instance.new("TextBox")
	Username.Parent = UsernameFrame;
	Username.BackgroundColor3 = Color3.new(0, 0, 0)
	Username.BackgroundTransparency = 1;
	Username.Position = UDim2.new(0.01, 0, 0.03)
	Username.TextColor3 = Color3.new(1, 1, 1)
	Username.Size = UDim2.new(0.98, 0, 0.94)
	Username.Font = Enum.Font.Merriweather;
	Username.FontSize = Enum.FontSize.Size14;
	Username.Text = ""
	Username.MultiLine = false;
	Username.ClearTextOnFocus = false;
	Username.PlaceholderText = "Username"
	Username.TextXAlignment = Enum.TextXAlignment.Left;
	Username.TextScaled = false;
	Username.TextSize = 18;
	Username.TextWrapped = true;
	local MessageFrame = UsernameFrame:Clone()
	MessageFrame.Parent = FrameContent;
	MessageFrame.Position = UDim2.new(0.03, 0, 0.43)
	MessageFrame.Size = UDim2.new(0.545, 0, 0.3)
	local Message = MessageFrame.TextBox;
	Message.TextYAlignment = Enum.TextYAlignment.Top;
	Message.TextXAlignment = Enum.TextXAlignment.Left;
	Message.PlaceholderText = "Message Here"
	local SendFrame = UsernameFrame:Clone()
	SendFrame.Parent = FrameContent;
	SendFrame.Position = UDim2.new(0.2, 0, 0.8)
	SendFrame.Size = UDim2.new(0.2, 0, 0.14)
	SendFrame.TextBox:Destroy()
	local Send = Instance.new("TextButton")
	Send.Parent = SendFrame;
	Send.BackgroundColor3 = Color3.new(0, 0, 0)
	Send.BackgroundTransparency = 0;
	Send.BorderColor3 = Color3.new(1, 1, 1)
	Send.BorderSizePixel = 0;
	Send.Position = UDim2.new(0.015, 0, 0.015)
	Send.TextColor3 = Color3.new(1, 1, 1)
	Send.Size = UDim2.new(0.97, 0, 0.95)
	Send.Font = Enum.Font.Merriweather;
	Send.FontSize = Enum.FontSize.Size14;
	Send.Text = "Send"
	Send.TextScaled = false;
	Send.TextSize = 24;
	Send.TextWrapped = true;
	Send.Active = true;
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = FrameContent;
	TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	TextLabel.BackgroundTransparency = 1;
	TextLabel.BorderColor3 = Color3.new(1, 1, 1)
	TextLabel.BorderSizePixel = 1;
	TextLabel.Position = UDim2.new(0.65, 0, 0.15)
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.Size = UDim2.new(0.3, 0, 0.1)
	TextLabel.Font = Enum.Font.Merriweather;
	TextLabel.FontSize = Enum.FontSize.Size14;
	TextLabel.Text = "who can message you"
	TextLabel.TextScaled = false;
	TextLabel.TextSize = 16;
	TextLabel.TextWrapped = true;
	TextLabel.Active = true;
	local MessageLimit = TextLabel:Clone()
	MessageLimit.Parent = FrameContent;
	MessageLimit.BackgroundTransparency = 1;
	MessageLimit.Position = UDim2.new(0.03, 0, 0.75)
	MessageLimit.Size = UDim2.new(0.15, 0, 0.05)
	MessageLimit.TextXAlignment = Enum.TextXAlignment.Left;
	MessageLimit.Text = "0/100"
	local SelectionButton = Send:Clone()
	SelectionButton.Parent = FrameContent;
	SelectionButton.Position = UDim2.new(0.7, 0, 0.27)
	SelectionButton.BorderSizePixel = 1;
	SelectionButton.Size = UDim2.new(0.2, 0, 0.1)
	SelectionButton.Text = "Everyone"
	if CheckPremium() == false then
		local FrameBarrier = Instance.new("Frame")
		FrameBarrier.Parent = FrameContent;
		FrameBarrier.BackgroundColor3 = Color3.new(0, 0, 0)
		FrameBarrier.BorderColor3 = Color3.new(1, 1, 1)
		FrameBarrier.BackgroundTransparency = 0.2;
		FrameBarrier.BorderSizePixel = 0;
		FrameBarrier.Position = UDim2.new(0, 0, 0)
		FrameBarrier.Size = UDim2.new(1, 0.2, 1)
		FrameBarrier.Active = true;
		FrameBarrier.Draggable = false;
		local BarrierTextLabel = TextLabel:Clone()
		BarrierTextLabel.Parent = FrameBarrier;
		BarrierTextLabel.BackgroundTransparency = 1;
		BarrierTextLabel.BorderSizePixel = 1;
		BarrierTextLabel.Position = UDim2.new(0.275, 0, 0.25)
		BarrierTextLabel.Size = UDim2.new(0.4, 0, 0.3)
		BarrierTextLabel.Text = "Purchase Premium Passes to\nAccess this Feature"
		local BuyFrame = SendFrame:Clone()
		BuyFrame.Parent = FrameBarrier;
		BuyFrame.Position = UDim2.new(0.375, 0, 0.55)
		BuyFrame.Size = UDim2.new(0.2, 0, 0.14)
		local Buy = BuyFrame.TextButton;
		Buy.Text = "BUY"
		Buy.MouseButton1Click:Connect(function()
			local BuyGamepass, IsEnable = pcall(function()
				game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, PremiumPasses)
			end)
			if not BuyGamepass then
				setclipboard("https://www.roblox.com/game-pass/" .. PremiumPasses)
				RequestMessage("Script", "Link Copied!")
			end
		end)
	end;
	Username:GetPropertyChangedSignal("Text"):Connect(function()
		if not CheckPremium() then
			return
		end;
		local UserId = nil;
		local CheckUserExist, isExist = pcall(function()
			UserId = game.Players:GetUserIdFromNameAsync(Username.Text)
		end)
		if UserId ~= nil then
			Image.Image = game.Players:GetUserThumbnailAsync(UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		else
			Image.Image = ""
		end;
		Message_Current_Username = Username.Text
	end)
	Message.Changed:Connect(function()
		if not CheckPremium() then
			return
		end;
		if string.len(Message.Text) <= 100 then
			Message_Current_Message = Message.Text
		else
			Message.Text = string.sub(Message.Text, 1, 100)
		end;
		MessageLimit.Text = string.len(Message.Text) .. "/100"
	end)
	local SelectionButtonSelected = false;
	SelectionButton.MouseButton1Click:Connect(function()
		if not CheckPremium() then
			return
		end;
		if SelectionButtonSelected == true then
			SelectionButtonSelected = false;
			FrameContent.Everyone:Destroy()
			FrameContent.Friends:Destroy()
			FrameContent.None:Destroy()
			return
		end;
		SelectionButtonSelected = true;
		local Everyone = SelectionButton:Clone()
		Everyone.Parent = FrameContent;
		Everyone.Name = "Everyone"
		Everyone.Position = UDim2.new(0.7, 0, 0.375)
		Everyone.Text = "Everyone"
		local Friends = Everyone:Clone()
		Friends.Parent = FrameContent;
		Friends.Name = "Friends"
		Friends.Position = UDim2.new(0.7, 0, 0.48)
		Friends.Text = "Friends"
		local None = Everyone:Clone()
		None.Parent = FrameContent;
		None.Name = "None"
		None.Position = UDim2.new(0.7, 0, 0.585)
		None.Text = "None"
		Everyone.MouseButton1Click:Connect(function()
			Message_Current_Privacy = "Everyone"
			SelectionButton.Text = Message_Current_Privacy;
			SelectionButtonSelected = false;
			FrameContent.Everyone:Destroy()
			FrameContent.Friends:Destroy()
			FrameContent.None:Destroy()
			if FileScriptSupported == true then
				writefile("Ghosthub/.message_privacy", "c756f6af1f03c9ce381cb85934ffb274e2f54af3")
			end
		end)
		Friends.MouseButton1Click:Connect(function()
			Message_Current_Privacy = "Friends"
			SelectionButton.Text = Message_Current_Privacy;
			SelectionButtonSelected = false;
			FrameContent.Everyone:Destroy()
			FrameContent.Friends:Destroy()
			FrameContent.None:Destroy()
			if FileScriptSupported == true then
				writefile("Ghosthub/.message_privacy", "c11d5e1d35fb7e158e57f09ec98d28e19d6cb900")
			end
		end)
		None.MouseButton1Click:Connect(function()
			Message_Current_Privacy = "None"
			SelectionButton.Text = Message_Current_Privacy;
			SelectionButtonSelected = false;
			FrameContent.Everyone:Destroy()
			FrameContent.Friends:Destroy()
			FrameContent.None:Destroy()
			if FileScriptSupported == true then
				writefile("Ghosthub/.message_privacy", "6eef6648406c333a4035cd5e60d0bf2ecf2606d7")
			end
		end)
	end)
	Send.MouseButton1Click:Connect(function()
		if Image.Image ~= "" and CheckPremium() == true and Message.Text ~= "" and DetectBadWords(Message.Text) == false then
			Send.Active = false;
			Send.Text = "Sending..."
			SendMessage(Username.Text, Message.Text)
			Message.Text = ""
			Send.Text = "Send"
			Send.Active = true;
			RequestMessage("Script", "Message Sent!")
		elseif Image.Image ~= "" and CheckPremium() == true and Message.Text ~= "" and DetectBadWords(Message.Text) == true then
			RequestMessage("Error", "Bad Words Found!", "Please Remove Bad Words")
		elseif Image.Image == "" and CheckPremium() == true then
			RequestMessage("Script", "User Not Found!")
		end
	end)
	if Message_Current_Username ~= nil then
		Username.Text = Message_Current_Username
	end;
	if Message_Current_Message ~= nil then
		Message.Text = Message_Current_Message
	end;
	if Message_Current_Privacy ~= nil then
		SelectionButton.Text = Message_Current_Privacy
	end
end;
function ReceiveMessage(userid, message, messageId)
	local ScreenGui1 = Instance.new("ScreenGui")
	ScreenGui1.Parent = game.Players.LocalPlayer.PlayerGui;
	local Frame1 = Instance.new("Frame")
	Frame1.Parent = ScreenGui1;
	Frame1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Frame1.BackgroundTransparency = 0.5;
	Frame1.Position = UDim2.new(-0.5, 0, -0.5)
	Frame1.Size = UDim2.new(1.5, 0, 1.5)
	Frame1.Active = true;
	Frame1.Draggable = false;
	local Frame2 = Instance.new("Frame")
	Frame2.Parent = Frame1;
	Frame2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Frame2.BackgroundTransparency = 0;
	Frame2.BorderSizePixel = 1;
	Frame2.BorderColor3 = Color3.fromRGB(242, 243, 243)
	Frame2.Position = UDim2.new(0.55, 0, 0.435)
	Frame2.Size = UDim2.new(0.25, 0, 0.4)
	local ImageButton1 = Instance.new("ImageButton")
	ImageButton1.Parent = Frame2;
	ImageButton1.BackgroundTransparency = 0;
	ImageButton1.BackgroundColor3 = Color3.new(1, 1, 1)
	ImageButton1.BorderSizePixel = 0;
	ImageButton1.Position = UDim2.new(0.01, 0, 0.01)
	ImageButton1.Size = UDim2.new(0.3, 0, 0.4)
	ImageButton1.Image = game.Players:GetUserThumbnailAsync(userid, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	ImageButton1.MouseButton1Click:Connect(function()
		if ImageButton1.Image == game.Players:GetUserThumbnailAsync(userid, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) then
			ImageButton1.Image = game.Players:GetUserThumbnailAsync(userid, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size420x420)
		else
			ImageButton1.Image = game.Players:GetUserThumbnailAsync(userid, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		end
	end)
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = Frame2;
	TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	TextLabel.BackgroundTransparency = 1;
	TextLabel.Position = UDim2.new(0, 0, -0.11)
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.Size = UDim2.new(1, 0, 0.3)
	TextLabel.Font = Enum.Font.Merriweather;
	TextLabel.FontSize = Enum.FontSize.Size14;
	TextLabel.Text = "Someone Message You"
	TextLabel.TextYAlignment = Enum.TextYAlignment.Top;
	TextLabel.TextScaled = false;
	TextLabel.TextSize = 16;
	TextLabel.TextWrapped = true;
	local TextLabel2 = Instance.new("TextBox")
	TextLabel2.Parent = Frame2;
	TextLabel2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	TextLabel2.BackgroundTransparency = 1;
	TextLabel2.Position = UDim2.new(0.38, 0, 0.01)
	TextLabel2.Size = UDim2.new(0.61, 0, 0.8)
	TextLabel2.Font = Enum.Font.SourceSans;
	TextLabel2.TextColor3 = Color3.fromRGB(242, 243, 243)
	TextLabel2.MultiLine = true;
	TextLabel2.ClearTextOnFocus = false;
	TextLabel2.Text = "Username: " .. game.Players:GetNameFromUserIdAsync(userid) .. "\
User ID: " .. userid .. "\
\
Message: \
" .. message;
	TextLabel2.TextSize = 15;
	TextLabel2.TextScaled = false;
	TextLabel2.TextWrapped = true;
	TextLabel2.TextXAlignment = Enum.TextXAlignment.Left;
	TextLabel2.TextYAlignment = Enum.TextYAlignment.Top;
	local Text = TextLabel2.Text;
	TextLabel2.Changed:Connect(function()
		TextLabel2.Text = Text
	end)
	local TextButton1 = Instance.new("TextButton")
	TextButton1.Parent = Frame2;
	TextButton1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	TextButton1.BackgroundTransparency = 0;
	TextButton1.BorderSizePixel = 1;
	TextButton1.BorderColor3 = Color3.fromRGB(242, 243, 243)
	TextButton1.Position = UDim2.new(0.3, 0, 0.75)
	TextButton1.Size = UDim2.new(0.4, 0, 0.2)
	TextButton1.Font = Enum.Font.Merriweather;
	TextButton1.TextColor3 = Color3.fromRGB(242, 243, 243)
	TextButton1.Text = "Okay"
	TextButton1.TextSize = 18;
	TextButton1.TextScaled = false;
	TextButton1.TextWrapped = true;
	TextButton1.MouseButton1Click:Connect(function()
		ScreenGui1:Destroy()
		DeleteMessage(messageId)
	end)
end;
if MessagesTable ~= nil and Message_Current_Privacy ~= "None" then
	local messageNum = MessagesTable["Messages"]
	repeat
		if MessagesTable["Message" .. messageNum] ~= nil then
			if Message_Current_Privacy == "Everyone" or game.Players.LocalPlayer:IsFriendsWith(MessagesTable["Message" .. messageNum].UserId) or MessagesTable["Message" .. messageNum].UserId == game.Players.LocalPlayer.UserId then
				ReceiveMessage(MessagesTable["Message" .. messageNum].UserId, MessagesTable["Message" .. messageNum].Message, "Message" .. messageNum)
			end
		end;
		messageNum = messageNum - 1
	until messageNum == 0
end;
function ShowPremium()
	local Premium_Text = Instance.new("TextButton")
	Premium_Text.Parent = FrameContent;
	Premium_Text.BackgroundColor3 = Color3.new(0, 0, 0)
	Premium_Text.BackgroundTransparency = 1;
	Premium_Text.Position = UDim2.new(0.3, 0, 0.05)
	Premium_Text.TextColor3 = Color3.new(1, 1, 1)
	Premium_Text.Size = UDim2.new(0.4, 0, 0.1)
	Premium_Text.Font = Enum.Font.Merriweather;
	Premium_Text.Text = "Premium Pass Access Features!"
	Premium_Text.FontSize = Enum.FontSize.Size14;
	Premium_Text.TextScaled = true;
	Premium_Text.TextSize = 18;
	Premium_Text.TextWrapped = false;
	local Premium_Text2 = Premium_Text:Clone()
	Premium_Text2.Parent = FrameContent;
	Premium_Text2.Position = UDim2.new(0.025, 0, 0.226)
	Premium_Text2.Text = "✅ Access Message Selection\n✅ Access Picture Selection\n✅ Access PromptAI Selection\n✅ Remove Upload Script Limit\n✅ Remove Send Feedback Limit\n"
	Premium_Text2.TextXAlignment = Enum.TextXAlignment.Left;
	Premium_Text2.TextYAlignment = Enum.TextYAlignment.Top;
	local Premium_Text3 = Premium_Text:Clone()
	Premium_Text3.Parent = FrameContent;
	Premium_Text3.Position = UDim2.new(0.025, 0, 0.75)
	Premium_Text3.Text = "Purchase Premium Passes to Access these Features!"
	Premium_Text3.TextXAlignment = Enum.TextXAlignment.Left;
	Premium_Text3.TextYAlignment = Enum.TextYAlignment.Top;
	local Premium_Text4 = Premium_Text:Clone()
	Premium_Text4.Parent = FrameContent;
	Premium_Text4.Position = UDim2.new(0.6, 0, 0.226)
	Premium_Text4.Text = "Premium Pass\nBuy Now!"
	Premium_Text4.TextYAlignment = Enum.TextYAlignment.Top;
	local BUYFrame = Instance.new("Frame")
	BUYFrame.Parent = FrameContent;
	BUYFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	BUYFrame.BackgroundTransparency = 0.5;
	BUYFrame.Position = UDim2.new(0.7, 0, 0.425)
	BUYFrame.Size = UDim2.new(0.2, 0, 0.14)
	BUYFrame.Active = true;
	BUYFrame.Draggable = false;
	local BUYUICorner = Instance.new("UICorner")
	BUYUICorner.Parent = BUYFrame;
	BUYUICorner.CornerRadius = UDim.new(0.1, 0)
	local BUYUIStroke = Instance.new("UIStroke")
	BUYUIStroke.Parent = BUYFrame;
	BUYUIStroke.Color = Color3.new(1, 1, 1)
	BUYUIStroke.Thickness = 1;
	local BUY = Instance.new("TextButton")
	BUY.Parent = BUYFrame;
	BUY.BackgroundColor3 = Color3.new(0, 0, 0)
	BUY.BackgroundTransparency = 0;
	BUY.BorderColor3 = Color3.new(1, 1, 1)
	BUY.BorderSizePixel = 0;
	BUY.Position = UDim2.new(0.015, 0, 0.015)
	BUY.TextColor3 = Color3.new(1, 1, 1)
	BUY.Size = UDim2.new(0.97, 0, 0.95)
	BUY.Font = Enum.Font.Merriweather;
	BUY.FontSize = Enum.FontSize.Size14;
	BUY.Text = "BUY"
	BUY.TextScaled = false;
	BUY.TextSize = 24;
	BUY.TextWrapped = true;
	BUY.Active = true;
	BUY.MouseButton1Click:Connect(function()
		local BuyGamepass, IsEnable = pcall(function()
			game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, PremiumPasses)
		end)
		if not BuyGamepass then
			setclipboard("https://www.roblox.com/game-pass/" .. PremiumPasses)
			RequestMessage("Script", "Link Copied!")
		end
	end)
end;
local ExecutorScriptText = nil;
function ShowExecutor()
	local ExecutorFrame = Instance.new("Frame")
	ExecutorFrame.Parent = FrameContent;
	ExecutorFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	ExecutorFrame.BackgroundTransparency = 0.5;
	ExecutorFrame.Position = UDim2.new(0.025, 0, 0.05)
	ExecutorFrame.Size = UDim2.new(0.945, 0, 0.725)
	ExecutorFrame.Active = true;
	ExecutorFrame.Draggable = false;
	local ExecutorUICorner = Instance.new("UICorner")
	ExecutorUICorner.Parent = ExecutorFrame;
	ExecutorUICorner.CornerRadius = UDim.new(0.03, 0)
	local ExecutorUIStroke = Instance.new("UIStroke")
	ExecutorUIStroke.Parent = ExecutorFrame;
	ExecutorUIStroke.Color = Color3.new(1, 1, 1)
	ExecutorUIStroke.Thickness = 1;
	local ExecutorTextBox = Instance.new("TextBox")
	ExecutorTextBox.Parent = ExecutorFrame;
	ExecutorTextBox.BackgroundColor3 = Color3.new(0, 0, 0)
	ExecutorTextBox.BackgroundTransparency = 1;
	ExecutorTextBox.Position = UDim2.new(0.01, 0, 0.03)
	ExecutorTextBox.TextColor3 = Color3.new(1, 1, 1)
	ExecutorTextBox.Size = UDim2.new(0.98, 0, 0.94)
	ExecutorTextBox.Font = Enum.Font.Merriweather;
	ExecutorTextBox.FontSize = Enum.FontSize.Size14;
	ExecutorTextBox.Text = ""
	ExecutorTextBox.MultiLine = true;
	ExecutorTextBox.ClearTextOnFocus = false;
	ExecutorTextBox.PlaceholderText = 'print("Hello World")'
	ExecutorTextBox.TextYAlignment = Enum.TextYAlignment.Top;
	ExecutorTextBox.TextXAlignment = Enum.TextXAlignment.Left;
	ExecutorTextBox.TextScaled = false;
	ExecutorTextBox.TextSize = 14;
	ExecutorTextBox.TextWrapped = true;
	local Execute = Instance.new("TextButton")
	Execute.Parent = FrameContent;
	Execute.BackgroundColor3 = Color3.new(0, 0, 0)
	Execute.BackgroundTransparency = 0;
	Execute.BorderColor3 = Color3.new(1, 1, 1)
	Execute.BorderSizePixel = 1;
	Execute.Position = UDim2.new(0.82, 0, 0.82)
	Execute.TextColor3 = Color3.new(1, 1, 1)
	Execute.Size = UDim2.new(0.15, 0, 0.12)
	Execute.Font = Enum.Font.Merriweather;
	Execute.FontSize = Enum.FontSize.Size14;
	Execute.Text = "Execute"
	Execute.TextScaled = true;
	Execute.TextSize = 24;
	Execute.TextWrapped = true;
	Execute.Active = true;
	local Clear = Execute:Clone()
	Clear.Parent = FrameContent;
	Clear.Position = UDim2.new(0.65, 0, 0.82)
	Clear.Text = "Clear"
	local Copy = Execute:Clone()
	Copy.Parent = FrameContent;
	Copy.Position = UDim2.new(0.48, 0, 0.82)
	Copy.Text = "Copy"
	ExecutorTextBox:GetPropertyChangedSignal("Text"):Connect(function()
		ExecutorScriptText = ExecutorTextBox.Text;
		if FileScriptSupported == true then
			writefile("Ghosthub/ExecutorText.txt", ExecutorTextBox.Text)
		end
	end)
	Execute.MouseButton1Click:Connect(function()
		loadstring(ExecutorTextBox.Text)()
	end)
	Clear.MouseButton1Click:Connect(function()
		ExecutorTextBox.Text = ""
	end)
	Copy.MouseButton1Click:Connect(function()
		setclipboard(ExecutorTextBox.Text)
		if ExecutorTextBox.Text ~= "" then
			RequestMessage("Script", "Script Copied!")
		end
	end)
	if ExecutorScriptText ~= nil then
		ExecutorTextBox.Text = ExecutorScriptText
	end;
	if FileScriptSupported == true then
		if isfile("Ghosthub/ExecutorText.txt") then
			ExecutorTextBox.Text = readfile("Ghosthub/ExecutorText.txt")
		end
	end
end;
local MSButtonPosX = 0;
local MSButtonPosZ = 0.001;
local MSButtonSlotNum = 0;
function AddMoreScriptButton(id, scriptname, script, description, userid, username, date, isPined, favoriteId)
	local MoreScriptButton = Instance.new("TextButton")
	MoreScriptButton.Parent = FrameMoreScript;
	MoreScriptButton.BackgroundColor3 = Color3.new(0, 0, 0)
	MoreScriptButton.BackgroundTransparency = 0;
	MoreScriptButton.BorderSizePixel = 1;
	MoreScriptButton.BorderColor3 = Color3.new(1, 1, 1)
	MoreScriptButton.Position = UDim2.new(MSButtonPosX, 0, MSButtonPosZ)
	MoreScriptButton.TextColor3 = Color3.new(1, 1, 1)
	MoreScriptButton.Size = UDim2.new(0.148, 0, 0.00225)
	MoreScriptButton.Font = Enum.Font.Merriweather;
	MoreScriptButton.FontSize = Enum.FontSize.Size10;
	MoreScriptButton.Text = scriptname;
	MoreScriptButton.TextScaled = false;
	MoreScriptButton.TextSize = ButtonTextSize;
	MoreScriptButton.TextWrapped = true;
	MoreScriptButton.MouseButton1Click:Connect(function()
		Frame.Visible = false;
		OpenGui.Visible = true;
		RequestClickMoreScriptButton(scriptname, script, description, userid, username, date, id, isPined, favoriteId)
	end)
	MSButtonSlotNum = MSButtonSlotNum + 1;
	MSButtonPosX += 0.1705;
	if MSButtonSlotNum == 6 then
		MSButtonSlotNum = 0;
		MSButtonPosX = 0;
		MSButtonPosZ += 0.003
	end
end;
function Main1()
	game:GetService("UserInputService").JumpRequest:connect(function()
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end)
end;
function Main2()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end;
function Main3()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end;
function Main4()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end;
function Main5()
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
	RequestMessage("Script", "Anti AFK is now Active", "you can afk now")
end;
function Main6()
	local a = game;
	local b = a.Workspace;
	local c = a.Lighting;
	local d = b.Terrain;
	d.WaterWaveSize = 0;
	d.WaterWaveSpeed = 0;
	d.WaterReflectance = 0;
	d.WaterTransparency = 0;
	c.GlobalShadows = false;
	c.FogEnd = 387420489;
	c.Brightness = 0;
	settings().Rendering.QualityLevel = "Level01"
	for e, f in pairs(a:GetDescendants()) do
		if f:IsA("Part") or f:IsA("Union") or f:IsA("CornerWedgePart") or f:IsA("TrussPart") then
			f.Material = "Plastic"
			f.Reflectance = 0
		elseif f:IsA("Decal") or f:IsA("Texture") then
			f.Transparency = 0
		elseif f:IsA("ParticleEmitter") or f:IsA("Trail") then
			f.Lifetime = NumberRange.new(0)
		elseif f:IsA("Explosion") then
			f.BlastPressure = 0;
			f.BlastRadius = 0
		elseif f:IsA("Fire") or f:IsA("SpotLight") or f:IsA("Smoke") or f:IsA("Sparkles") then
			f.Enabled = false
		elseif f:IsA("MeshPart") then
			f.Material = "Plastic"
			f.Reflectance = 0;
			f.TextureID = 10385902758728957
		end
	end;
	for e, g in pairs(c:GetChildren()) do
		if g:IsA("BlurEffect") or g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or g:IsA("DepthOfFieldEffect") then
			g.Enabled = false
		end
	end;
	sethiddenproperty(game.Lighting, "Technology", "Compatibility")
	local decalsyeeted = true;
	local g = game;
	local w = g.Workspace;
	local l = g.Lighting;
	local t = w.Terrain;
	t.WaterWaveSize = 0;
	t.WaterWaveSpeed = 0;
	t.WaterReflectance = 0;
	t.WaterTransparency = 0;
	l.GlobalShadows = false;
	l.FogEnd = 387420489;
	l.Brightness = 0;
	settings().Rendering.QualityLevel = "QualityLevel1"
	for i, v in pairs(g:GetDescendants()) do
		if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") and decalsyeeted then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		end
	end
end;
function Main7()
	local old;
	old = hookmetamethod(game, "__namecall", function(self, ...)
		local method = tostring(getnamecallmethod())
		if string.lower(method) == "kick" then
			return wait(387420489)
		end;
		return old(self, ...)
	end)
	RequestMessage("Script", "Anti Kick is Now Active", "Its Only Effective in LocalScript")
end;
function Main8()
	Y = hookmetamethod(game, "__namecall", function(self, ...)
		local args = {
			...
		}
		local checkargs = {}
		local method = getnamecallmethod()
		local last;
		if method == "Fire" or method == "FireServer" then
			if self.Name == "MessagePosted" or self.Name == "SayMessageRequest" then
				last = args[1]
				if last == args[1] then
					return Y(self, ...)
				else
					return
				end;
				if method == "ReportAbuse" and self == game.Players.LocalPlayer then
					return
				end
			end
		end;
		return Y(self, ...)
	end)
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end;
	if game.PlaceId ~= 7056922815 then
		if game.PlaceId ~= 4991214437 then
			if game.PlaceId ~= 7298553006 then
				if game.PlaceId ~= 8934886191 then
					if game.PlaceId ~= 6494527314 then
						local LP = game:GetService('Players').LocalPlayer;
						local PlayerScripts = LP ~= nil and LP:FindFirstChild('PlayerScripts') or nil;
						local ChatScript = PlayerScripts ~= nil and PlayerScripts:FindFirstChild('ChatScript') or nil;
						local ChatMain = ChatScript ~= nil and ChatScript:FindFirstChild('ChatMain') or nil;
						if LP and ChatMain ~= nil then
							local Old, Chatted, OldChatted = nil, Instance.new('BindableEvent'), LP.Chatted;
							Chatted.Name = LP.Name .. '_Chatted_Event'
							Old = hookmetamethod(game, '__index', newcclosure(function(self, Index)
								if checkcaller() and self == LP and Index == 'Chatted' then
									return Chatted.Event
								elseif not checkcaller() and self == LP and Index == 'Chatted' then
									return OldChatted
								end;
								return Old(self, Index)
							end))
							local Old2, MessagePosted = nil, require(ChatMain).MessagePosted;
							if MessagePosted ~= "sakanade" then
								Old2 = hookfunction(MessagePosted.fire, function(self, ...)
									if not checkcaller() then
										print(self, ...)
										return Chatted:Fire(...)
									end
								end)
							end
						end
					end
				end
			end
		end
	end;
	RequestMessage("Script", "Anti Ban is Now Active", "Its Only Effective On Client")
end;
function Main9()
	game:GetService("Lighting").ClockTime = 24
end;
function Main10()
	game:GetService("Lighting").ClockTime = 12
end;
function Main11()
	for i, tools in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
		if tools:IsA("Tool") then
			tools.Parent = game.Players.LocalPlayer.Character
		end
	end
end;
function Main12()
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
		if v:IsA("Tool") then
			v.Parent = game.Players.LocalPlayer.Character;
			v.Parent = game.Workspace
		end
	end
end;
function Main13()
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
end;
function Main14()
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true)
end;
function Main15()
	RequestMessage("Script", game.Players.LocalPlayer.Character.Humanoid.Health, "Health")
end;
function Main16()
	for i, descendant in pairs(workspace:GetDescendants()) do
		if descendant:IsA("BasePart") then
			if not descendant:FindFirstChild("OriginalTransparency") then
				local originalTransparency = Instance.new("NumberValue")
				originalTransparency.Name = "OriginalTransparency"
				originalTransparency.Value = descendant.Transparency;
				originalTransparency.Parent = descendant
			end;
			descendant.Transparency = 0
		end
	end
end;
function Main17()
	for i, descendant in pairs(workspace:GetDescendants()) do
		if descendant:IsA("BasePart") then
			if not descendant:FindFirstChild("OriginalTransparency") then
				local originalTransparency = Instance.new("NumberValue")
				originalTransparency.Name = "OriginalTransparency"
				originalTransparency.Value = descendant.Transparency;
				originalTransparency.Parent = descendant
			end;
			descendant.Transparency = descendant.OriginalTransparency.Value
		end
	end
end;
function Main18()
	game.Players.LocalPlayer.Character.Head:Destroy()
end;
function Main19()
	game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame = game.Workspace.CurrentCamera.CFrame
end;
function Main20()
	for _, child in pairs(children) do
		for _, child in pairs(child:GetChildren()) do
			table.insert(children, child)
		end;
		if child:IsA("BasePart") and child.Name == "SpawnLocation" then
			game.Players.LocalPlayer.Character.Humanoid.RootPart.CFrame = child.CFrame * CFrame.new(0, 3, 0)
		end
	end
end;
function Main21()
	for i, descendant in pairs(workspace:GetDescendants()) do
		if descendant:IsA("BasePart") then
			if not descendant:FindFirstChild("OriginalTransparency") then
				local originalTransparency = Instance.new("NumberValue")
				originalTransparency.Name = "OriginalTransparency"
				originalTransparency.Value = descendant.Transparency;
				originalTransparency.Parent = descendant
			end;
			descendant.Transparency = 0.7
		end
	end
end;
function Main22()
	for i, descendant in pairs(workspace:GetDescendants()) do
		if descendant:IsA("BasePart") then
			if not descendant:FindFirstChild("OriginalTransparency") then
				local originalTransparency = Instance.new("NumberValue")
				originalTransparency.Name = "OriginalTransparency"
				originalTransparency.Value = descendant.Transparency;
				originalTransparency.Parent = descendant
			end;
			descendant.Transparency = descendant.OriginalTransparency.Value
		end
	end
end;
function Main23()
	game:GetService("StarterGui"):SetCoreGuiEnabled("Chat", false)
end;
function Main24()
	game:GetService("StarterGui"):SetCoreGuiEnabled("Chat", true)
end;
function Main25()
	RequestMessage("Your Account Age", game.Players.LocalPlayer.AccountAge, "Days")
end;
function Main26()
	game:GetService("SocialService"):CanSendGameInviteAsync(game.Players.LocalPlayer)
	game:GetService("SocialService"):PromptGameInvite(game.Players.LocalPlayer)
end;
function Main27()
	game:Shutdown()
end;
PartCounting = 0;
function Main28()
	PartCounting += 1;
	local part = Instance.new("Part")
	local position = Vector3.new(0, 1000000000, 0)
	part.Name = "ExtraPart" .. PartCounting;
	part.Material = Enum.Material.Plastic;
	part.Transparency = 0;
	part.Position = position;
	part.Size = Vector3.new(20, 0.5, 20)
	part.CastShadow = true;
	part.Anchored = true;
	part.CanCollide = true;
	part.Parent = workspace;
	workspace:FindFirstChild("ExtraPart" .. PartCounting).CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3, 0)
end;
function Main29()
	game.Players.LocalPlayer.Character.Animate.Disabled = true
end;
function Main30()
	game.Players.LocalPlayer.Character.Animate.Disabled = false
end;
function Main31()
	local sc = (debug and debug.setconstant) or setconstant;
	local gc = (debug and debug.getconstants) or getconstants;
	local pop = game.Players.LocalPlayer.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper;
	for _, v in pairs(getgc()) do
		if type(v) == 'function' and getfenv(v).script == pop then
			for i, v1 in pairs(gc(v)) do
				if tonumber(v1) == .25 then
					sc(v, i, 0)
				elseif tonumber(v1) == 0 then
					sc(v, i, .25)
				end
			end
		end
	end
end;
function Main32()
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
end;
function Main33()
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
end;
function Main34()
	local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
	controls:Disable()
end;
function Main35()
	local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
	controls:Enable()
end;
function Main36()
	local Http = game:GetService("HttpService")
	local TPS = game:GetService("TeleportService")
	local Api = "https://games.roblox.com/v1/games/"
	local _place = game.PlaceId;
	local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
	function ListServers(cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
		return Http:JSONDecode(Raw)
	end;
	local Server, Next;
	repeat
		local Servers = ListServers(Next)
		Server = Servers.data[1]
		Next = Servers.nextPageCursor
	until Server;
	TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
end;
function Main37()
	game.Players.LocalPlayer.CameraMaxZoomDistance = 1000000000000;
	game.Players.LocalPlayer.CameraMinZoomDistance = -1
end;
LoopFullBrightness = false;
function Main38()
	if LoopFullBrightness == false then
		LoopFullBrightness = true;
		game:GetService('RunService').Stepped:connect(function()
			Lighting = game:GetService("Lighting")
			Lighting.Brightness = 2;
			Lighting.ClockTime = 14;
			Lighting.FogEnd = 100000;
			Lighting.GlobalShadows = false;
			Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end)
	end
end;
DarkMode = false;
function Main39()
	if DarkMode == false then
		DarkMode = true;
		setting = settings().Network;
		local Effect = Instance.new("ColorCorrectionEffect")
		Effect.Parent = game.Lighting;
		Effect.Saturation = -1
		ffect.Brightness = -0.3
	end
end;
function Main40()
	if DarkMode == true then
		DarkMode = false;
		setting = settings().Network;
		local Effect = Instance.new("ColorCorrectionEffect")
		Effect.Parent = game.Lighting;
		Effect.Saturation = 1;
		Effect.Brightness = 0.3
	end
end;
LayDown = false;
function Main41()
	if LayDown == false then
		LayDown = true;
		local part = Instance.new("Part")
		part.Name = "LayDownPart"
		part.Color = Color3.new(0, 0, 0)
		part.Material = Enum.Material.Plastic;
		part.Transparency = 1;
		part.Position = Vector3.new(0, 100000, 0)
		part.Size = Vector3.new(1, 0.5, 1)
		part.CastShadow = true;
		part.Anchored = true;
		part.CanCollide = true;
		part.Parent = workspace;
		workspace:FindFirstChild("LayDownPart").CFrame = game.Players.LocalPlayer.Character.LeftFoot.CFrame * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
	end
end;
game:GetService('RunService').Heartbeat:connect(function()
	if LayDown == true and game.Players.LocalPlayer.Character.Humanoid.Health >= 1 then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").LayDownPart.CFrame
	end;
	if LayDown == true and game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
		LayDown = false
	end
end)
function Main42()
	LayDown = false;
	game:GetService("Workspace").LayDownPart:Destroy()
end;
function Main43()
	local g = game;
	local plrs = g:GetService("Players")
	local lp = plrs.LocalPlayer;
	local c = lp.Character;
	if c and c.Parent then
		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.Sit = not hum.Sit
		end
	end
end;
function Main44()
	CountPlayer = 0;
	for _, v in pairs(game.Players:GetChildren()) do
		CountPlayer += 1
	end;
	RequestMessage("Script", CountPlayer, "Players")
end;
function Main45()
	for i, v in pairs(game.Lighting:GetChildren()) do
		if v:IsA("Script") == false and v:IsA("LocalScript") == false then
			v:remove()
		end
	end;
	while true and wait() do
		game.Lighting.FogEnd = math.huge;
		game.Lighting.FogStart = 0;
		game.Lighting.Ambient = Color3.fromRGB(167, 167, 167)
		game.Lighting.OutdoorAmbient = Color3.fromRGB(167, 167, 167)
	end
end;
function Main46()
	FreezePlayers = true
end;
FreezePlayers = false;
game:GetService('RunService').Heartbeat:connect(function()
	if FreezePlayers == true then
		for _, v in pairs(game.Players:GetPlayers()) do
			if v.Name ~= game.Players.LocalPlayer.Name then
				v.Character.HumanoidRootPart.Anchored = true
			end
		end
	end
end)
function Main47()
	FreezePlayers = false;
	for _, v in pairs(game.Players:GetPlayers()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			v.Character.HumanoidRootPart.Anchored = false
		end
	end
end;
function Main48()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -7, 0)
end;
function Main49()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true;
	task.wait(0.1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.pi * 0.5, 0, 0)
	for _, v in ipairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
end;
function Main51()
	local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
	if tool then
		for i, v in pairs(tool:GetDescendants()) do
			if v and v.Parent and v:IsA("Mesh") or v:IsA("SpecialMesh") then
				v:Destroy()
			end
		end
	end
end;
function Main50()
	workspace.CurrentCamera:remove()
	wait(.1)
	repeat
		wait()
	until game.Players.LocalPlayer.Character ~= nil;
	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	game.Players.LocalPlayer.CameraMinZoomDistance = 0.5;
	game.Players.LocalPlayer.CameraMaxZoomDistance = 400;
	game.Players.LocalPlayer.CameraMode = "Classic"
	game.Players.LocalPlayer.Character.Head.Anchored = false
end;
function Main52()
	game.Players.LocalPlayer.Character.UpperTorso.Waist:Destroy()
end;
function Main53()
	promptNewRig = function(rig)
		game.AvatarEditorService:PromptSaveAvatar(game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription, Enum.HumanoidRigType[rig])
		local result = game.AvatarEditorService.PromptSaveAvatarCompleted:Wait()
		if result == Enum.AvatarPromptResult.Success then
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
		end
	end;
	promptNewRig("R15")
end;
function Main54()
	promptNewRig = function(rig)
		game.AvatarEditorService:PromptSaveAvatar(game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription, Enum.HumanoidRigType[rig])
		local result = game.AvatarEditorService.PromptSaveAvatarCompleted:Wait()
		if result == Enum.AvatarPromptResult.Success then
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
		end
	end;
	promptNewRig("R6")
end;
local Noclip = false;
game:GetService('RunService').RenderStepped:connect(function()
	if Noclip == true then
		game.Players.LocalPlayer.Character.Head.CanCollide = false;
		game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false;
		game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false;
		game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
	end
end)
function Main55()
	Noclip = true
end;
function Main56()
	Noclip = false
end;
local CurrentGravity = workspace.Gravity;
function Main57()
	workspace.Gravity = CurrentGravity / 4
end;
function Main58()
	workspace.Gravity = CurrentGravity
end;
function Main59()
	workspace.Gravity = 0;
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
	game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end;
function Main60()
	workspace.Gravity = CurrentGravity;
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
	game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end;
local LoopSpawnpoint = false;
local Spawnpoint = nil;
function Main61()
	Spawnpoint = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
	LoopSpawnpoint = true;
	local function ExecuteSpawnpoint()
		game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
			game.Players.LocalPlayer.CharacterAdded:wait()
			repeat
				wait()
			until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			if LoopSpawnpoint == true then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Spawnpoint;
				ExecuteSpawnpoint()
			end
		end)
	end;
	ExecuteSpawnpoint()
	RequestMessage("Script", "Spawnpoint", "Enabled")
end;
function Main62()
	LoopSpawnpoint = false;
	Spawnpoint = nil;
	RequestMessage("Script", "Spawnpoint", "Disabled")
end;
function Main63()
	local StarterGui = game:GetService('StarterGui')
	StarterGui:SetCore("ResetButtonCallback", true)
end;
function Main64()
	local StarterGui = game:GetService('StarterGui')
	StarterGui:SetCore("ResetButtonCallback", false)
end;
local hiddenGUIS = {}
function Main65()
	for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
		if (v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ScrollingFrame")) and v.Visible then
			v.Visible = false;
			table.insert(hiddenGUIS, v)
		end
	end
end;
function Main66()
	for i, v in pairs(hiddenGUIS) do
		v.Visible = true
	end;
	hiddenGUIS = {}
end;
function Main67()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("Decal") and v.Name == 'face' then
			v:Destroy()
		end
	end
end;
function Main68()
	game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
	game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
	game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
	game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
end;
function Main69()
	game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
	game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
	game.Players.LocalPlayer.Character["Right Leg"]:Destroy()
	game.Players.LocalPlayer.Character["Right Leg"]:Destroy()
end;
function Main70()
	ChooseRepetision = false;
	getgenv().Choose = true;
	while getgenv().Choose == true do
		if ChooseRepetision == false then
			ChooseRepetision = true;
			randomizer = 0;
			for _, v in next, (game.Players:GetChildren()) do
				randomizer = math.random(1, 100)
				if randomizer >= 99 then
					getgenv().Choose = false;
					RequestMessage("Script", v.Name, "")
				end
			end;
			ChooseRepetision = false
		end;
		print()
		game:GetService("RunService").Heartbeat:wait()
	end
end;
function Main71()
	local UsingTool = nil;
	local message1 = nil;
	local message2 = nil;
	if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
		message1 = "Tool Name"
		message2 = "" .. game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name;
		UsingTool = "" .. game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
	else
		if game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
			game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool").Parent = game.Players.LocalPlayer.Character;
			message1 = "Tool Name"
			message2 = "" .. game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name;
			UsingTool = "" .. game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
		end
	end;
	if UsingTool == nil then
		message1 = "Tool Not Found"
		message2 = ""
	end;
	RequestMessage("Script", message1, message2)
end;
HumanoidNumberName = 0;
function Main72()
	if game.Players.LocalPlayer.Character then
		if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
			HumanoidNumberName += 1;
			game.Players.LocalPlayer.Character.Humanoid.Name = HumanoidNumberName
		end;
		local l = game.Players.LocalPlayer.Character[HumanoidNumberName]:Clone()
		l.Parent = game.Players.LocalPlayer.Character;
		l.Name = "Humanoid"
		wait(0.1)
		game.Players.LocalPlayer.Character[HumanoidNumberName]:Destroy()
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
		game.Players.LocalPlayer.Character.Animate.Disabled = true;
		wait(0.1)
		game.Players.LocalPlayer.Character.Animate.Disabled = false
	end
end;
GhostHub_More_Database_URL = "https://ghosthub-more-623eb-default-rtdb.firebaseio.com/"
local MoreScripts;
local data2;
data = {}
function UpdateData()
	local database = GhostHub_More_Database_URL .. ".json"
	local CheckDatabase, Success = pcall(function()
		data = game.HttpService:JSONDecode(game:HttpGet(database))
	end)
	if not data["Scripts"] then
		data["Scripts"] = {}
	end;
	local CheckMoreScriptDB, Success = pcall(function()
		data2 = game.HttpService:JSONDecode(game:HttpGetAsync("https://raw.githubusercontent.com/MainScripts352/MainScripts352/refs/heads/main/Ghost%20Hub%20MoreScript.txt"))
	end)
	if data2 ~= nil then
		for key, value in pairs(data2.Scripts) do
			data.Scripts[key] = {
				["Date"] = value.Date,
				["Description"] = value.Description,
				["Script"] = value.Script,
				["Script_Title"] = value["Script_Title"],
				["User_ID"] = value["User_ID"],
				["Username"] = value.Username
			}
		end
	end;
	for key, value in pairs(data.Scripts) do
		if IsRestricted(value["User_ID"]) == true or ScriptRestricted(value["Script"]) == true then
			data.Scripts[key] = nil
		end
	end;
	local dataNumber = 0;
	for i, v in pairs(data.Scripts) do
		dataNumber += 1
	end;
	MoreScriptCount.Text = "Scripts: " .. dataNumber
end;
function GetMoreScript()
	local SlotLimit = 2030;
	local SlotUsed = 0;
	MSButtonPosX = 0;
	MSButtonPosZ = 0.001;
	MSButtonSlotNum = 0;
	if not data["Current_Script_ID"] or data["Current_Script_ID"] and not data["Current_Script_ID"]["ScriptID"] then
		data["Current_Script_ID"] = {
			["ScriptID"] = nil
		}
	end;
	MoreScripts = tonumber(data["Current_Script_ID"]["ScriptID"]) or 30000;
	if MoreScripts ~= 0 then
		if MoreScriptSearch.Text == "" and data["Current_Script_ID"] ~= nil and IsRestricted(game.Players.LocalPlayer.UserId) == false and IsInServer(game.Players.LocalPlayer.UserId) == true then
			AddMoreScriptButton(1, "Add Script", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Auth"))()Ioad("b079081b560167c06ce3bce7c69d90b6")', "You can add your script using this script", "5347040425", "Admin", "Oct 29 2024")
			SlotUsed += 1
		end;
		pcall(function()
			if FileScriptSupported == true and MoreScriptSearch.Text == "" and isfile("Ghosthub/Favorites.json") then
				local favorites = game.HttpService:JSONDecode(readfile("Ghosthub/Favorites.json"))
				local favoriteId = favorites["Current_Script_ID"]
				repeat
					if favorites.Favorites["Script" .. favoriteId] and data.Scripts["Script" .. favorites.Favorites["Script" .. favoriteId]["Script_ID"]] ~= nil then
						local favoritescriptId = favorites.Favorites["Script" .. favoriteId]["Script_ID"]
						AddMoreScriptButton(favoritescriptId, data.Scripts["Script" .. favoritescriptId]["Script_Title"], data.Scripts["Script" .. favoritescriptId]["Script"], data.Scripts["Script" .. favoritescriptId]["Description"], data.Scripts["Script" .. favoritescriptId]["User_ID"], data.Scripts["Script" .. favoritescriptId].Username, data.Scripts["Script" .. favoritescriptId].Date, true, favoriteId)
						SlotUsed += 1
					end;
					favoriteId -= 1
				until favoriteId == 0 or SlotUsed == SlotLimit
			end
		end)
		repeat
			if data.Scripts["Script" .. MoreScripts] and data.Scripts["Script" .. MoreScripts]["Script"] and data.Scripts["Script" .. MoreScripts]["Description"] and data.Scripts["Script" .. MoreScripts]["User_ID"] and data.Scripts["Script" .. MoreScripts]["Username"] and data.Scripts["Script" .. MoreScripts]["Date"] then
				local ScriptTitle = "" .. data.Scripts["Script" .. MoreScripts]["Script_Title"]
				if MoreScriptSearch.Text == "" or MoreScriptSearch.Text ~= "" and ScriptTitle.find(string.lower(ScriptTitle), string.lower(MoreScriptSearch.Text)) then
					AddMoreScriptButton(MoreScripts, ScriptTitle, data.Scripts["Script" .. MoreScripts]["Script"], data.Scripts["Script" .. MoreScripts]["Description"], data.Scripts["Script" .. MoreScripts]["User_ID"], data.Scripts["Script" .. MoreScripts].Username, data.Scripts["Script" .. MoreScripts].Date)
					SlotUsed += 1;
					MoreScripts -= 1
				elseif MoreScriptSearch.Text ~= "" and not ScriptTitle.find(string.lower(ScriptTitle), string.lower(MoreScriptSearch.Text)) then
					MoreScripts -= 1
				end
			else
				MoreScripts -= 1
			end
		until MoreScripts == 0 or SlotUsed == SlotLimit
	end
end;
local function AddClick()
	local database = UsersURL .. Country .. ".json?auth=" .. UsersSecret;
	local request = request or syn.request;
	local Table = {}
	if UsersTable[Country] ~= nil then
		Table["Clicks"] = UsersTable[Country].Clicks + 1;
		Table["Flag"] = Flag
	else
		Table["Clicks"] = 1;
		Table["Flag"] = Flag
	end;
	local send = request({
		Url = database,
		Method = "PUT",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = game.HttpService:JSONEncode(Table)
	})
end;
local function DiscordBot()
	return "This has been removed for your safety."
end;
if ActiveDatabases == true then
	UpdateData()
	GetMoreScript()
	AddClick()
	DiscordBot()
end;
function DecodeBase64(data)
	local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	local result = {}
	data = string.gsub(data, '[^' .. b .. '=]', '')
	local indexTable = {}
	for i = 1, #b do
		indexTable[string.sub(b, i, i)] = i - 1
	end;
	local buffer = 0;
	local bits = 0;
	for i = 1, #data do
		local c = string.sub(data, i, i)
		if c ~= '=' then
			buffer = buffer * 64 + indexTable[c]
			bits = bits + 6;
			if bits >= 8 then
				bits = bits - 8;
				local byte = math.floor(buffer / (2 ^ bits))
				buffer = buffer % (2 ^ bits)
				table.insert(result, string.char(byte))
			end
		end
	end;
	return table.concat(result)
end;
function EncodeBase64(data)
	local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	local result = {}
	local bytes = {
		string.byte(data, 1, #data)
	}
	for i = 1, #bytes, 3 do
		local byte1 = bytes[i]
		local byte2 = bytes[i + 1] or 0;
		local byte3 = bytes[i + 2] or 0;
		local combined = bit32.lshift(byte1, 16) + bit32.lshift(byte2, 8) + byte3;
		local index1 = bit32.band(bit32.rshift(combined, 18), 63)
		local index2 = bit32.band(bit32.rshift(combined, 12), 63)
		local index3 = bit32.band(bit32.rshift(combined, 6), 63)
		local index4 = bit32.band(combined, 63)
		table.insert(result, b:sub(index1 + 1, index1 + 1))
		table.insert(result, b:sub(index2 + 1, index2 + 1))
		if i + 1 <= #bytes then
			table.insert(result, b:sub(index3 + 1, index3 + 1))
		else
			table.insert(result, '=')
		end;
		if i + 2 <= #bytes then
			table.insert(result, b:sub(index4 + 1, index4 + 1))
		else
			table.insert(result, '=')
		end
	end;
	return table.concat(result)
end