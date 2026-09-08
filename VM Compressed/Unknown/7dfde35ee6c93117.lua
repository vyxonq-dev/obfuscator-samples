--[[

Scripts by ._.kinzin 👻  
UI by deusferrinho 👑  
(All Discord usernames)
Converted by G2L by @uniquadev  

]]

local INJECTION_METHOD = getgenv().InjectionMethod or "CoreGui"

--[[^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Methods:
"CoreGui" (Create Gui on CoreGui)
"PlayerGui" (Create Gui on PlayerGui)
"Bypass" (Bypass most Gui AntiCheats)

local INJECTION_METHOD = "CoreGui"
local INJECTION_METHOD = "PlayerGui"
local INJECTION_METHOD = "Bypass"
]]


if _G.Stelly == true then
	local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
	local Notify = AkaliNotif.Notify;

	Notify({
		Description = "StellySpy V3 Already Executed!";
		Title = "StellySpy V3";
		Duration = 10;
	});
else
_G.Stelly = true
	_G.InjectMethod = INJECTION_METHOD
	local G2L = {};
	if INJECTION_METHOD == "Bypass" then
		local p=game.Players.LocalPlayer
		local g=p:WaitForChild("PlayerGui")

		local f=function() 
			local t={}
			for _,v in pairs(g:GetChildren()) do
				if v:IsA("ScreenGui") then table.insert(t,v) end
			end
			if #t>0 then return t[math.random(1,#t)] end
		end

		local s=f()
		if s then
			s.ResetOnSpawn=false
			s.Enabled=true
			G2L["1"] = s
		end
	else
		G2L["1"] = Instance.new("ScreenGui");
		G2L["1"]["Name"] = [[AAGGXENOSS]];
		G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
		G2L["1"]["ResetOnSpawn"] = false;
		if INJECTION_METHOD == "PlayerGui" then
			G2L["1"]["Parent"] =  game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
		elseif INJECTION_METHOD == "CoreGui" then
			G2L["1"]["Parent"] =  game:GetService("CoreGui")
		end
	end

	-- StarterGui.AAGGXENOSS.Client
	G2L["2"] = Instance.new("Folder", G2L["1"]);
	G2L["2"]["Name"] = [[Client]];


	-- StarterGui.AAGGXENOSS.Client.Name
	G2L["3"] = Instance.new("LocalScript", G2L["2"]);
	G2L["3"]["Name"] = [[Name]];


	-- StarterGui.AAGGXENOSS.Client.[Old] Notify
	G2L["4"] = Instance.new("ModuleScript", G2L["2"]);
	G2L["4"]["Name"] = [[[Old] Notify]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2
	G2L["5"] = Instance.new("ModuleScript", G2L["2"]);
	G2L["5"]["Name"] = [[StellyNotifyV2]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2
	G2L["6"] = Instance.new("ScreenGui", G2L["5"]);
	G2L["6"]["SafeAreaCompatibility"] = Enum.SafeAreaCompatibility.None;
	G2L["6"]["IgnoreGuiInset"] = true;
	G2L["6"]["ScreenInsets"] = Enum.ScreenInsets.None;
	G2L["6"]["Name"] = [[StellyNotificationV2]];
	G2L["6"]["ResetOnSpawn"] = false;


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Holder
	G2L["7"] = Instance.new("ScrollingFrame", G2L["6"]);
	G2L["7"]["Active"] = true;
	G2L["7"]["BorderSizePixel"] = 0;
	G2L["7"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["7"]["Name"] = [[Holder]];
	G2L["7"]["BottomImage"] = [[rbxassetid://0]];
	G2L["7"]["AnchorPoint"] = Vector2.new(1, 1);
	G2L["7"]["Size"] = UDim2.new(0, 249, 0, 379);
	G2L["7"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["7"]["Position"] = UDim2.new(0.99, 0, 0.97, 0);
	G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["7"]["ScrollBarThickness"] = 0;
	G2L["7"]["BackgroundTransparency"] = 1;


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Holder.UIListLayout
	G2L["8"] = Instance.new("UIListLayout", G2L["7"]);
	G2L["8"]["Padding"] = UDim.new(0, 6);
	G2L["8"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
	G2L["8"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates
	G2L["9"] = Instance.new("Folder", G2L["6"]);
	G2L["9"]["Name"] = [[Templates]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification
	G2L["a"] = Instance.new("Frame", G2L["9"]);
	G2L["a"]["Visible"] = false;
	G2L["a"]["BorderSizePixel"] = 0;
	G2L["a"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60);
	G2L["a"]["AnchorPoint"] = Vector2.new(1, 1);
	G2L["a"]["Size"] = UDim2.new(0, 252, 0, 99);
	G2L["a"]["Position"] = UDim2.new(0.99, 0, 0.98, 0);
	G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["a"]["Name"] = [[Notification]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.UICorner
	G2L["b"] = Instance.new("UICorner", G2L["a"]);
	G2L["b"]["CornerRadius"] = UDim.new(0, 6);


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.UIAspectRatioConstraint
	G2L["c"] = Instance.new("UIAspectRatioConstraint", G2L["a"]);
	G2L["c"]["AspectRatio"] = 2.52;


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.ImageLabel
	G2L["d"] = Instance.new("ImageLabel", G2L["a"]);
	G2L["d"]["BorderSizePixel"] = 0;
	G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["d"]["ImageColor3"] = Color3.fromRGB(174, 174, 174);
	G2L["d"]["Image"] = [[http://www.roblox.com/asset/?id=119934197296539]];
	G2L["d"]["Size"] = UDim2.new(0, 249, 0, 99);
	G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["d"]["BackgroundTransparency"] = 1;
	G2L["d"]["Position"] = UDim2.new(0, 0, -0.00572, 0);


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.ImageLabel.UICorner
	G2L["e"] = Instance.new("UICorner", G2L["d"]);
	G2L["e"]["CornerRadius"] = UDim.new(0, 6);


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.ImageLabel.UIAspectRatioConstraint
	G2L["f"] = Instance.new("UIAspectRatioConstraint", G2L["d"]);
	G2L["f"]["AspectRatio"] = 2.52;


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Title
	G2L["10"] = Instance.new("TextLabel", G2L["a"]);
	G2L["10"]["BorderSizePixel"] = 0;
	G2L["10"]["TextSize"] = 18;
	G2L["10"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["10"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["10"]["BackgroundTransparency"] = 1;
	G2L["10"]["Size"] = UDim2.new(0, 214, 0, 19);
	G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["10"]["Text"] = [[TITLE]];
	G2L["10"]["Name"] = [[Title]];
	G2L["10"]["Position"] = UDim2.new(0.03608, 0, 0.04, 0);


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Desc
	G2L["11"] = Instance.new("TextLabel", G2L["a"]);
	G2L["11"]["TextWrapped"] = true;
	G2L["11"]["BorderSizePixel"] = 0;
	G2L["11"]["TextSize"] = 15;
	G2L["11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["11"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	G2L["11"]["BackgroundColor3"] = Color3.fromRGB(198, 198, 198);
	G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["11"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
	G2L["11"]["BackgroundTransparency"] = 1;
	G2L["11"]["Size"] = UDim2.new(0, 233, 0, 65);
	G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["11"]["Text"] = [[Description]];
	G2L["11"]["Name"] = [[Desc]];
	G2L["11"]["Position"] = UDim2.new(0.03207, 0, 0.27252, 0);


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Misc
	G2L["12"] = Instance.new("Folder", G2L["a"]);
	G2L["12"]["Name"] = [[Misc]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Misc.lClose
	G2L["13"] = Instance.new("LocalScript", G2L["12"]);
	G2L["13"]["Enabled"] = false;
	G2L["13"]["Name"] = [[lClose]];
	G2L["13"]["Disabled"] = true;


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Misc.UIAnimationScript
	G2L["14"] = Instance.new("LocalScript", G2L["12"]);
	G2L["14"]["Enabled"] = false;
	G2L["14"]["Name"] = [[UIAnimationScript]];
	G2L["14"]["Disabled"] = true;


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close
	G2L["15"] = Instance.new("TextButton", G2L["a"]);
	G2L["15"]["BorderSizePixel"] = 0;
	G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["15"]["Size"] = UDim2.new(0, 34, 0, 27);
	G2L["15"]["BackgroundTransparency"] = 1;
	G2L["15"]["Name"] = [[Close]];
	G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["15"]["Text"] = [[]];
	G2L["15"]["Visible"] = false;
	G2L["15"]["Position"] = UDim2.new(0.85378, 0, -0.0101, 0);


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close.Hover
	G2L["16"] = Instance.new("LocalScript", G2L["15"]);
	G2L["16"]["Name"] = [[Hover]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close.Hover.Hover
	G2L["17"] = Instance.new("Sound", G2L["16"]);
	G2L["17"]["Name"] = [[Hover]];
	G2L["17"]["SoundId"] = [[rbxassetid://10066931761]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close.Hover.Click
	G2L["18"] = Instance.new("Sound", G2L["16"]);
	G2L["18"]["Name"] = [[Click]];
	G2L["18"]["SoundId"] = [[rbxassetid://6895079853]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close.Hover.Temp
	G2L["19"] = Instance.new("Folder", G2L["16"]);
	G2L["19"]["Name"] = [[Temp]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close.Hover.Misc
	G2L["1a"] = Instance.new("Folder", G2L["16"]);
	G2L["1a"]["Name"] = [[Misc]];


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close.Hover.Misc.Close.Misc
	G2L["1b"] = Instance.new("LocalScript", G2L["1a"]);
	G2L["1b"]["Enabled"] = false;
	G2L["1b"]["Name"] = [[Close.Misc]];
	G2L["1b"]["Disabled"] = true;


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close.Hover.Misc.Open.Misc
	G2L["1c"] = Instance.new("LocalScript", G2L["1a"]);
	G2L["1c"]["Enabled"] = false;
	G2L["1c"]["Name"] = [[Open.Misc]];
	G2L["1c"]["Disabled"] = true;


	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close.ImageLabel
	G2L["1d"] = Instance.new("ImageLabel", G2L["15"]);
	G2L["1d"]["BorderSizePixel"] = 0;
	G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1d"]["ScaleType"] = Enum.ScaleType.Fit;
	G2L["1d"]["Image"] = [[rbxassetid://16884179279]];
	G2L["1d"]["ImageRectSize"] = Vector2.new(48, 48);
	G2L["1d"]["Size"] = UDim2.new(0, 34, 0, 27);
	G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["1d"]["BackgroundTransparency"] = 1;
	G2L["1d"]["ImageRectOffset"] = Vector2.new(690, 752);
	G2L["1d"]["Position"] = UDim2.new(0.04, 0, 0.05, 0);


	-- StarterGui.AAGGXENOSS.	
	G2L["1e"] = Instance.new("Frame", G2L["1"]);
	G2L["1e"]["Visible"] = true;
	G2L["1e"]["BorderSizePixel"] = 0;
	G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58);
	G2L["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["1e"]["Size"] = UDim2.new(0, 378, 0, 228);
	G2L["1e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["1e"]["Name"] = [[	]];


	-- StarterGui.AAGGXENOSS.	.UITween
	G2L["1f"] = Instance.new("LocalScript", G2L["1e"]);
	G2L["1f"]["Name"] = [[UITween]];


	-- StarterGui.AAGGXENOSS.	.Load
	G2L["20"] = Instance.new("LocalScript", G2L["1e"]);
	G2L["20"]["Name"] = [[Load]];


	-- StarterGui.AAGGXENOSS.	.UIAspectRatioConstraint
	G2L["21"] = Instance.new("UIAspectRatioConstraint", G2L["1e"]);
	G2L["21"]["AspectRatio"] = 1.65789;


	-- StarterGui.AAGGXENOSS.	.UIStroke
	G2L["22"] = Instance.new("UIStroke", G2L["1e"]);
	G2L["22"]["Transparency"] = 0.56;
	G2L["22"]["Thickness"] = 2.5;
	G2L["22"]["Color"] = Color3.fromRGB(110, 110, 110);


	-- StarterGui.AAGGXENOSS.	.ImageLabel
	G2L["23"] = Instance.new("ImageLabel", G2L["1e"]);
	G2L["23"]["BorderSizePixel"] = 0;
	G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["23"]["ImageTransparency"] = 0.7;
	G2L["23"]["Image"] = [[http://www.roblox.com/asset/?id=119934197296539]];
	G2L["23"]["Size"] = UDim2.new(0, 378, 0, 227);
	G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["23"]["BackgroundTransparency"] = 1;
	G2L["23"]["Position"] = UDim2.new(-0, 0, 0.00439, 0);


	-- StarterGui.AAGGXENOSS.	.Name
	G2L["24"] = Instance.new("TextLabel", G2L["1e"]);
	G2L["24"]["TextWrapped"] = true;
	G2L["24"]["ZIndex"] = 2;
	G2L["24"]["BorderSizePixel"] = 0;
	G2L["24"]["TextSize"] = 22;
	G2L["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["24"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["24"]["BackgroundTransparency"] = 1;
	G2L["24"]["RichText"] = true;
	G2L["24"]["Size"] = UDim2.new(0, 378, 0, 22);
	G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["24"]["Text"] = [[STELLY]];
	G2L["24"]["Name"] = [[Name]];
	G2L["24"]["Position"] = UDim2.new(0, 0, 0.03316, 0);


	-- StarterGui.AAGGXENOSS.	.Name.TextLabel
	G2L["25"] = Instance.new("TextLabel", G2L["24"]);
	G2L["25"]["TextWrapped"] = true;
	G2L["25"]["ZIndex"] = 2;
	G2L["25"]["BorderSizePixel"] = 0;
	G2L["25"]["TextSize"] = 22;
	G2L["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["25"]["TextColor3"] = Color3.fromRGB(242, 0, 0);
	G2L["25"]["BackgroundTransparency"] = 1;
	G2L["25"]["RichText"] = true;
	G2L["25"]["Size"] = UDim2.new(0, 78, 0, 22);
	G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["25"]["Text"] = [[SPY]];
	G2L["25"]["Position"] = UDim2.new(-1.903, 0, 0.7, 0);


	-- StarterGui.AAGGXENOSS.	.Name.TextLabel.UIAnimationScript
	G2L["26"] = Instance.new("LocalScript", G2L["25"]);
	G2L["26"]["Name"] = [[UIAnimationScript]];


	-- StarterGui.AAGGXENOSS.	.Loading
	G2L["27"] = Instance.new("TextLabel", G2L["1e"]);
	G2L["27"]["TextWrapped"] = true;
	G2L["27"]["BorderSizePixel"] = 0;
	G2L["27"]["TextSize"] = 14;
	G2L["27"]["TextScaled"] = true;
	G2L["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["27"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["27"]["TextColor3"] = Color3.fromRGB(245, 245, 245);
	G2L["27"]["BackgroundTransparency"] = 1;
	G2L["27"]["Size"] = UDim2.new(0, 200, 0, 11);
	G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["27"]["Text"] = [[Loading Dependencies...]];
	G2L["27"]["Name"] = [[Loading]];
	G2L["27"]["Position"] = UDim2.new(0.23545, 0, 0.80386, 0);


	-- StarterGui.AAGGXENOSS.	.Loading.Frame-UI
	G2L["28"] = Instance.new("Folder", G2L["27"]);
	G2L["28"]["Name"] = [[Frame-UI]];


	-- StarterGui.AAGGXENOSS.	.Loading.Frame-UI.UI-Shadow
	G2L["29"] = Instance.new("Frame", G2L["28"]);
	G2L["29"]["ZIndex"] = -999999999;
	G2L["29"]["Size"] = UDim2.new(0, 345, 0, 10);
	G2L["29"]["Position"] = UDim2.new(-0.36, 0, 1.72727, 0);
	G2L["29"]["Name"] = [[UI-Shadow]];
	G2L["29"]["BackgroundTransparency"] = 1;


	-- StarterGui.AAGGXENOSS.	.Loading.Frame-UI.UI-Shadow.umbraShadow
	G2L["2a"] = Instance.new("ImageLabel", G2L["29"]);
	G2L["2a"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
	G2L["2a"]["ScaleType"] = Enum.ScaleType.Slice;
	G2L["2a"]["ImageTransparency"] = 0.86;
	G2L["2a"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["2a"]["Image"] = [[rbxassetid://1316045217]];
	G2L["2a"]["Size"] = UDim2.new(1, 5, 1, 5);
	G2L["2a"]["BackgroundTransparency"] = 1;
	G2L["2a"]["Name"] = [[umbraShadow]];
	G2L["2a"]["Position"] = UDim2.new(0.5, 0, 0.5, 4);


	-- StarterGui.AAGGXENOSS.	.Loading.Frame-UI.UI-Shadow.penumbraShadow
	G2L["2b"] = Instance.new("ImageLabel", G2L["29"]);
	G2L["2b"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
	G2L["2b"]["ScaleType"] = Enum.ScaleType.Slice;
	G2L["2b"]["ImageTransparency"] = 0.88;
	G2L["2b"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["2b"]["Image"] = [[rbxassetid://1316045217]];
	G2L["2b"]["Size"] = UDim2.new(1, 5, 1, 5);
	G2L["2b"]["BackgroundTransparency"] = 1;
	G2L["2b"]["Name"] = [[penumbraShadow]];
	G2L["2b"]["Position"] = UDim2.new(0.5, 0, 0.5, 4);


	-- StarterGui.AAGGXENOSS.	.Loading.Frame-UI.UI-Shadow.ambientShadow
	G2L["2c"] = Instance.new("ImageLabel", G2L["29"]);
	G2L["2c"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
	G2L["2c"]["ScaleType"] = Enum.ScaleType.Slice;
	G2L["2c"]["ImageTransparency"] = 0.88;
	G2L["2c"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["2c"]["Image"] = [[rbxassetid://1316045217]];
	G2L["2c"]["Size"] = UDim2.new(1, 5, 1, 5);
	G2L["2c"]["BackgroundTransparency"] = 1;
	G2L["2c"]["Name"] = [[ambientShadow]];
	G2L["2c"]["Position"] = UDim2.new(0.5, 0, 0.5, 4);


	-- StarterGui.AAGGXENOSS.	.Loading.Frame
	G2L["2d"] = Instance.new("Frame", G2L["27"]);
	G2L["2d"]["BorderSizePixel"] = 0;
	G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
	G2L["2d"]["Size"] = UDim2.new(0, 345, 0, 10);
	G2L["2d"]["Position"] = UDim2.new(-0.36, 0, 1.72727, 0);
	G2L["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


	-- StarterGui.AAGGXENOSS.	.Loading.Frame.UICorner
	G2L["2e"] = Instance.new("UICorner", G2L["2d"]);
	G2L["2e"]["CornerRadius"] = UDim.new(0, 3);


	-- StarterGui.AAGGXENOSS.	.Loading.Frame.m
	G2L["2f"] = Instance.new("Frame", G2L["2d"]);
	G2L["2f"]["BorderSizePixel"] = 0;
	G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(8, 140, 255);
	G2L["2f"]["Size"] = UDim2.new(0, 0, 0, 10);
	G2L["2f"]["Position"] = UDim2.new(0.00047, 0, 0, 0);
	G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2f"]["Name"] = [[m]];
	G2L["2f"]["BackgroundTransparency"] = 0.05;


	-- StarterGui.AAGGXENOSS.	.Loading.Frame.m.UICorner
	G2L["30"] = Instance.new("UICorner", G2L["2f"]);
	G2L["30"]["CornerRadius"] = UDim.new(0, 3);


	-- StarterGui.AAGGXENOSS.	.Loading.UITextSizeConstraint
	G2L["31"] = Instance.new("UITextSizeConstraint", G2L["27"]);
	G2L["31"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.	.dvao
	G2L["32"] = Instance.new("TextLabel", G2L["1e"]);
	G2L["32"]["TextWrapped"] = true;
	G2L["32"]["BorderSizePixel"] = 0;
	G2L["32"]["TextSize"] = 12;
	G2L["32"]["TextTransparency"] = 0.33;
	G2L["32"]["BackgroundColor3"] = Color3.fromRGB(255, 2, 2);
	G2L["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["32"]["TextColor3"] = Color3.fromRGB(255, 0, 5);
	G2L["32"]["BackgroundTransparency"] = 1;
	G2L["32"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["32"]["Size"] = UDim2.new(0, 230, 0, 16);
	G2L["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["32"]["Text"] = [[Developed and owned by Kinzin]];
	G2L["32"]["Rotation"] = -90;
	G2L["32"]["Name"] = [[dvao]];
	G2L["32"]["Position"] = UDim2.new(0.02116, 0, 0.51096, 0);


	-- StarterGui.AAGGXENOSS.Frame
	G2L["33"] = Instance.new("Frame", G2L["1"]);
	G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["Visible"] = false;
	G2L["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["33"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["33"]["Size"] = UDim2.new(0, 425, 0, 250);
	G2L["33"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["33"]["BackgroundTransparency"] = 1;


	-- StarterGui.AAGGXENOSS.Frame.reziserMain
	G2L["34"] = Instance.new("LocalScript", G2L["33"]);
	G2L["34"]["Name"] = [[reziserMain]];


	-- StarterGui.AAGGXENOSS.Frame.resizerModule
	G2L["35"] = Instance.new("ModuleScript", G2L["33"]);
	G2L["35"]["Name"] = [[resizerModule]];


	-- StarterGui.AAGGXENOSS.Frame.CDrag
	G2L["36"] = Instance.new("LocalScript", G2L["33"]);
	G2L["36"]["Name"] = [[CDrag]];


	-- StarterGui.AAGGXENOSS.Frame.Main
	G2L["37"] = Instance.new("LocalScript", G2L["33"]);
	G2L["37"]["Name"] = [[Main]];


	-- StarterGui.AAGGXENOSS.Frame.Name
	G2L["38"] = Instance.new("LocalScript", G2L["33"]);
	G2L["38"]["Name"] = [[Name]];


	-- StarterGui.AAGGXENOSS.Frame.Syntax
	G2L["39"] = Instance.new("ModuleScript", G2L["33"]);
	G2L["39"]["Name"] = [[Syntax]];


	-- StarterGui.AAGGXENOSS.Frame.Syntax.lexer
	G2L["3a"] = Instance.new("ModuleScript", G2L["39"]);
	G2L["3a"]["Name"] = [[lexer]];


	-- StarterGui.AAGGXENOSS.Frame.Syntax.lexer.language
	G2L["3b"] = Instance.new("ModuleScript", G2L["3a"]);
	G2L["3b"]["Name"] = [[language]];


	-- StarterGui.AAGGXENOSS.Frame.wI0nil
	G2L["3c"] = Instance.new("ModuleScript", G2L["33"]);
	G2L["3c"]["Name"] = [[wI0nil]];


	-- StarterGui.AAGGXENOSS.Frame.Syntax ~ client
	G2L["3d"] = Instance.new("LocalScript", G2L["33"]);
	G2L["3d"]["Name"] = [[Syntax ~ client]];


	-- StarterGui.AAGGXENOSS.Frame.SDTools Launcher
	G2L["3e"] = Instance.new("ModuleScript", G2L["33"]);
	G2L["3e"]["Name"] = [[SDTools Launcher]];


	-- StarterGui.AAGGXENOSS.Frame.TopBar
	G2L["3f"] = Instance.new("Frame", G2L["33"]);
	G2L["3f"]["BorderSizePixel"] = 0;
	G2L["3f"]["BackgroundColor3"] = Color3.fromRGB(39, 37, 40);
	G2L["3f"]["AnchorPoint"] = Vector2.new(0.5, 0);
	G2L["3f"]["Size"] = UDim2.new(1, 0, 0.08, 0);
	G2L["3f"]["Position"] = UDim2.new(0.5, 0, 0, 0);
	G2L["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["3f"]["Name"] = [[TopBar]];


	-- StarterGui.AAGGXENOSS.Frame.TopBar.X
	G2L["40"] = Instance.new("ImageButton", G2L["3f"]);
	G2L["40"]["BorderSizePixel"] = 0;
	G2L["40"]["ScaleType"] = Enum.ScaleType.Fit;
	G2L["40"]["BackgroundColor3"] = Color3.fromRGB(38, 36, 39);
	G2L["40"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["40"]["Image"] = [[rbxassetid://10002373478]];
	G2L["40"]["Size"] = UDim2.new(0.04706, 0, 1, 0);
	G2L["40"]["BackgroundTransparency"] = 1;
	G2L["40"]["Name"] = [[X]];
	G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["40"]["Position"] = UDim2.new(1, -10, 0.5, 0);


	-- StarterGui.AAGGXENOSS.Frame.TopBar.X.LocalScript
	G2L["41"] = Instance.new("LocalScript", G2L["40"]);



	-- StarterGui.AAGGXENOSS.Frame.TopBar.X.2
	G2L["42"] = Instance.new("LocalScript", G2L["40"]);
	G2L["42"]["Name"] = [[2]];


	-- StarterGui.AAGGXENOSS.Frame.TopBar.V3
	G2L["43"] = Instance.new("TextLabel", G2L["3f"]);
	G2L["43"]["TextWrapped"] = true;
	G2L["43"]["BorderSizePixel"] = 0;
	G2L["43"]["TextSize"] = 12;
	G2L["43"]["TextScaled"] = true;
	G2L["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["43"]["BackgroundTransparency"] = 1;
	G2L["43"]["Size"] = UDim2.new(0.06059, 0, 1, 0);
	G2L["43"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["43"]["Text"] = [[V3]];
	G2L["43"]["AutomaticSize"] = Enum.AutomaticSize.X;
	G2L["43"]["Name"] = [[V3]];
	G2L["43"]["Position"] = UDim2.new(0.15294, 0, 0, 0);


	-- StarterGui.AAGGXENOSS.Frame.TopBar.V3.LocalScript
	G2L["44"] = Instance.new("LocalScript", G2L["43"]);



	-- StarterGui.AAGGXENOSS.Frame.TopBar.V3.mobile
	G2L["45"] = Instance.new("LocalScript", G2L["43"]);
	G2L["45"]["Name"] = [[mobile]];


	-- StarterGui.AAGGXENOSS.Frame.TopBar.V3.2
	G2L["46"] = Instance.new("LocalScript", G2L["43"]);
	G2L["46"]["Name"] = [[2]];


	-- StarterGui.AAGGXENOSS.Frame.TopBar.V3.UITextSizeConstraint
	G2L["47"] = Instance.new("UITextSizeConstraint", G2L["43"]);
	G2L["47"]["MaxTextSize"] = 15;
	G2L["47"]["MinTextSize"] = 15;


	-- StarterGui.AAGGXENOSS.Frame.TopBar.Name
	G2L["48"] = Instance.new("TextLabel", G2L["3f"]);
	G2L["48"]["TextWrapped"] = true;
	G2L["48"]["BorderSizePixel"] = 0;
	G2L["48"]["TextSize"] = 12;
	G2L["48"]["TextScaled"] = true;
	G2L["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["48"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["48"]["BackgroundTransparency"] = 1;
	G2L["48"]["Size"] = UDim2.new(0.16933, 0, 1, 0);
	G2L["48"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["48"]["Text"] = [[StellySpy]];
	G2L["48"]["AutomaticSize"] = Enum.AutomaticSize.X;
	G2L["48"]["Name"] = [[Name]];
	G2L["48"]["Position"] = UDim2.new(-0.00227, 0, 0, 0);


	-- StarterGui.AAGGXENOSS.Frame.TopBar.Name.LocalScript
	G2L["49"] = Instance.new("LocalScript", G2L["48"]);



	-- StarterGui.AAGGXENOSS.Frame.TopBar.Name.2
	G2L["4a"] = Instance.new("LocalScript", G2L["48"]);
	G2L["4a"]["Name"] = [[2]];


	-- StarterGui.AAGGXENOSS.Frame.TopBar.Name.UITextSizeConstraint
	G2L["4b"] = Instance.new("UITextSizeConstraint", G2L["48"]);
	G2L["4b"]["MaxTextSize"] = 15;
	G2L["4b"]["MinTextSize"] = 15;


	-- StarterGui.AAGGXENOSS.Frame.resizer
	G2L["4c"] = Instance.new("Frame", G2L["33"]);
	G2L["4c"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;
	G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["4c"]["ClipsDescendants"] = true;
	G2L["4c"]["Size"] = UDim2.new(0.07059, 0, 24.064, 0);
	G2L["4c"]["Position"] = UDim2.new(0.92941, 0, 0.872, 0);
	G2L["4c"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
	G2L["4c"]["Name"] = [[resizer]];
	G2L["4c"]["BackgroundTransparency"] = 1;


	-- StarterGui.AAGGXENOSS.Frame.resizer.dragger
	G2L["4d"] = Instance.new("ImageButton", G2L["4c"]);
	G2L["4d"]["BorderSizePixel"] = 0;
	G2L["4d"]["BackgroundColor3"] = Color3.fromRGB(255, 86, 0);
	G2L["4d"]["ZIndex"] = 2;
	G2L["4d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["4d"]["Size"] = UDim2.new(1.9, 0, 0.04338, 0);
	G2L["4d"]["BackgroundTransparency"] = 1;
	G2L["4d"]["Name"] = [[dragger]];
	G2L["4d"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
	G2L["4d"]["Position"] = UDim2.new(0, 28, 0, 221);


	-- StarterGui.AAGGXENOSS.Frame.resizer.dragger.UICorner
	G2L["4e"] = Instance.new("UICorner", G2L["4d"]);
	G2L["4e"]["CornerRadius"] = UDim.new(0.5, 0);


	-- StarterGui.AAGGXENOSS.Frame.Remotes
	G2L["4f"] = Instance.new("ScrollingFrame", G2L["33"]);
	G2L["4f"]["Active"] = true;
	G2L["4f"]["ZIndex"] = 10;
	G2L["4f"]["BorderSizePixel"] = 0;
	G2L["4f"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["4f"]["ElasticBehavior"] = Enum.ElasticBehavior.Always;
	G2L["4f"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
	G2L["4f"]["Name"] = [[Remotes]];
	G2L["4f"]["ScrollBarImageTransparency"] = 1;
	G2L["4f"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.Always;
	G2L["4f"]["AnchorPoint"] = Vector2.new(0, 0.5);
	G2L["4f"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
	G2L["4f"]["Size"] = UDim2.new(0.29412, 0, 0.82127, 0);
	G2L["4f"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["4f"]["Position"] = UDim2.new(0, 0, 0.59436, 0);
	G2L["4f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["4f"]["ScrollBarThickness"] = 0;
	G2L["4f"]["LayoutOrder"] = 1;


	-- StarterGui.AAGGXENOSS.Frame.Remotes.CanvasSize
	G2L["50"] = Instance.new("LocalScript", G2L["4f"]);
	G2L["50"]["Name"] = [[CanvasSize]];


	-- StarterGui.AAGGXENOSS.Frame.Remotes.UIPadding
	G2L["51"] = Instance.new("UIPadding", G2L["4f"]);
	G2L["51"]["PaddingTop"] = UDim.new(0, 10);
	G2L["51"]["PaddingLeft"] = UDim.new(0, 13);


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Remote1
	G2L["52"] = Instance.new("TextButton", G2L["4f"]);
	G2L["52"]["TextWrapped"] = true;
	G2L["52"]["BorderSizePixel"] = 0;
	G2L["52"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["52"]["TextSize"] = 14;
	G2L["52"]["TextScaled"] = true;
	G2L["52"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
	G2L["52"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
	G2L["52"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["52"]["Size"] = UDim2.new(0, 100, 0, 22);
	G2L["52"]["BackgroundTransparency"] = 0.8;
	G2L["52"]["Name"] = [[Remote1]];
	G2L["52"]["BorderColor3"] = Color3.fromRGB(94, 97, 103);
	G2L["52"]["Text"] = [[RemoteName]];
	G2L["52"]["Visible"] = false;
	G2L["52"]["Position"] = UDim2.new(2.328, 0, 0.81304, 0);


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Remote1.Animate
	G2L["53"] = Instance.new("LocalScript", G2L["52"]);
	G2L["53"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Remote1.border
	G2L["54"] = Instance.new("Frame", G2L["52"]);
	G2L["54"]["BorderSizePixel"] = 0;
	G2L["54"]["BackgroundColor3"] = Color3.fromRGB(0, 171, 255);
	G2L["54"]["Size"] = UDim2.new(0.04, 0, 1, 0);
	G2L["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["54"]["Name"] = [[border]];


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Remote1.UITextSizeConstraint
	G2L["55"] = Instance.new("UITextSizeConstraint", G2L["52"]);
	G2L["55"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Remote1.UIStroke
	G2L["56"] = Instance.new("UIStroke", G2L["52"]);
	G2L["56"]["Transparency"] = 0.5;
	G2L["56"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["56"]["Color"] = Color3.fromRGB(224, 224, 224);


	-- StarterGui.AAGGXENOSS.Frame.Remotes.UIListLayout
	G2L["57"] = Instance.new("UIListLayout", G2L["4f"]);
	G2L["57"]["Padding"] = UDim.new(0, 5);
	G2L["57"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Infoupdts
	G2L["58"] = Instance.new("TextButton", G2L["4f"]);
	G2L["58"]["TextWrapped"] = true;
	G2L["58"]["BorderSizePixel"] = 0;
	G2L["58"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["58"]["TextSize"] = 14;
	G2L["58"]["TextScaled"] = true;
	G2L["58"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
	G2L["58"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
	G2L["58"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["58"]["Size"] = UDim2.new(0, 100, 0, 22);
	G2L["58"]["BackgroundTransparency"] = 0.8;
	G2L["58"]["Name"] = [[Infoupdts]];
	G2L["58"]["BorderColor3"] = Color3.fromRGB(94, 97, 103);
	G2L["58"]["Text"] = [[Info & updts]];
	G2L["58"]["Position"] = UDim2.new(0.45248, 0, 0.32273, 0);


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Infoupdts.Function
	G2L["59"] = Instance.new("LocalScript", G2L["58"]);
	G2L["59"]["Name"] = [[Function]];


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Infoupdts.Animate
	G2L["5a"] = Instance.new("LocalScript", G2L["58"]);
	G2L["5a"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Infoupdts.border
	G2L["5b"] = Instance.new("Frame", G2L["58"]);
	G2L["5b"]["BorderSizePixel"] = 0;
	G2L["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["5b"]["Size"] = UDim2.new(0.04, 0, 1, 0);
	G2L["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["5b"]["Name"] = [[border]];


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Infoupdts.UITextSizeConstraint
	G2L["5c"] = Instance.new("UITextSizeConstraint", G2L["58"]);
	G2L["5c"]["MaxTextSize"] = 17;


	-- StarterGui.AAGGXENOSS.Frame.Remotes.Infoupdts.UIStroke
	G2L["5d"] = Instance.new("UIStroke", G2L["58"]);
	G2L["5d"]["Transparency"] = 0.5;
	G2L["5d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["5d"]["Color"] = Color3.fromRGB(224, 224, 224);


	-- StarterGui.AAGGXENOSS.Frame.Assets
	G2L["5e"] = Instance.new("Folder", G2L["33"]);
	G2L["5e"]["Name"] = [[Assets]];


	-- StarterGui.AAGGXENOSS.Frame.Background
	G2L["5f"] = Instance.new("Frame", G2L["33"]);
	G2L["5f"]["BorderSizePixel"] = 0;
	G2L["5f"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
	G2L["5f"]["Size"] = UDim2.new(0, 425, 0, 228);
	G2L["5f"]["Position"] = UDim2.new(0, 0, 0.08, 0);
	G2L["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["5f"]["Name"] = [[Background]];


	-- StarterGui.AAGGXENOSS.Frame.CodeHolder
	G2L["60"] = Instance.new("ScrollingFrame", G2L["33"]);
	G2L["60"]["Active"] = true;
	G2L["60"]["ZIndex"] = 11;
	G2L["60"]["BorderSizePixel"] = 0;
	G2L["60"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["60"]["TopImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
	G2L["60"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["60"]["Name"] = [[CodeHolder]];
	G2L["60"]["BottomImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
	G2L["60"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
	G2L["60"]["Size"] = UDim2.new(0, 297, 0, 145);
	G2L["60"]["Position"] = UDim2.new(0.29924, 0, 0.0791, 0);
	G2L["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["60"]["ScrollBarThickness"] = 4;
	G2L["60"]["BackgroundTransparency"] = 1;


	-- StarterGui.AAGGXENOSS.Frame.CodeHolder.UIListLayout
	G2L["61"] = Instance.new("UIListLayout", G2L["60"]);
	G2L["61"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


	-- StarterGui.AAGGXENOSS.Frame.CodeHolder.CodeSample
	G2L["62"] = Instance.new("TextBox", G2L["60"]);
	G2L["62"]["Interactable"] = false;
	G2L["62"]["Name"] = [[CodeSample]];
	G2L["62"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["62"]["ZIndex"] = 10;
	G2L["62"]["BorderSizePixel"] = 0;
	G2L["62"]["TextTransparency"] = 1;
	G2L["62"]["TextSize"] = 11;
	G2L["62"]["TextColor3"] = Color3.fromRGB(236, 236, 236);
	G2L["62"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	G2L["62"]["BackgroundColor3"] = Color3.fromRGB(19, 19, 28);
	G2L["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["62"]["MultiLine"] = true;
	G2L["62"]["ClearTextOnFocus"] = false;
	G2L["62"]["Size"] = UDim2.new(1.0101, 0, 1.03603, 0);
	G2L["62"]["Position"] = UDim2.new(-0.00732, 0, -0, 0);
	G2L["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["62"]["Text"] = [[]];


	-- StarterGui.AAGGXENOSS.Frame.CodeHolder.CodeSample.Anim
	G2L["63"] = Instance.new("LocalScript", G2L["62"]);
	G2L["63"]["Name"] = [[Anim]];


	-- StarterGui.AAGGXENOSS.Frame.CodeHolder.CodeSample.Color
	G2L["64"] = Instance.new("LocalScript", G2L["62"]);
	G2L["64"]["Enabled"] = false;
	G2L["64"]["Name"] = [[Color]];
	G2L["64"]["Disabled"] = true;


	-- StarterGui.AAGGXENOSS.Frame.CodeHolder.CodeSample.Resize
	G2L["65"] = Instance.new("LocalScript", G2L["62"]);
	G2L["65"]["Name"] = [[Resize]];


	-- StarterGui.AAGGXENOSS.Frame.CodeHolder.CodeSample.UITextSizeConstraint
	G2L["66"] = Instance.new("UITextSizeConstraint", G2L["62"]);
	G2L["66"]["MaxTextSize"] = 16;
	G2L["66"]["MinTextSize"] = 15;


	-- StarterGui.AAGGXENOSS.Frame.CodeHolder.CodeSample.Lines
	G2L["67"] = Instance.new("TextLabel", G2L["62"]);
	G2L["67"]["BorderSizePixel"] = 0;
	G2L["67"]["TextSize"] = 1;
	G2L["67"]["TextTransparency"] = 1;
	G2L["67"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["67"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["67"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["67"]["BackgroundTransparency"] = 1;
	G2L["67"]["Size"] = UDim2.new(0, 200, 0, 50);
	G2L["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["67"]["Name"] = [[Lines]];


	-- StarterGui.AAGGXENOSS.Frame.UIAspectRatioConstraint
	G2L["68"] = Instance.new("UIAspectRatioConstraint", G2L["33"]);
	G2L["68"]["AspectRatio"] = 1.7;


	-- StarterGui.AAGGXENOSS.Frame.Buttons
	G2L["69"] = Instance.new("ScrollingFrame", G2L["33"]);
	G2L["69"]["Active"] = true;
	G2L["69"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
	G2L["69"]["ZIndex"] = 12;
	G2L["69"]["BorderSizePixel"] = 0;
	G2L["69"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["69"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
	G2L["69"]["Name"] = [[Buttons]];
	G2L["69"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
	G2L["69"]["Size"] = UDim2.new(0, 300, -0.007, 85);
	G2L["69"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["69"]["Position"] = UDim2.new(0.29412, 0, 0.667, 0);
	G2L["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["69"]["ScrollBarThickness"] = 0;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.UIPadding
	G2L["6a"] = Instance.new("UIPadding", G2L["69"]);
	G2L["6a"]["PaddingTop"] = UDim.new(0, 5);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear
	G2L["6b"] = Instance.new("TextButton", G2L["69"]);
	G2L["6b"]["TextWrapped"] = true;
	G2L["6b"]["BorderSizePixel"] = 0;
	G2L["6b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["6b"]["TextSize"] = 14;
	G2L["6b"]["TextScaled"] = true;
	G2L["6b"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["6b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["6b"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["6b"]["Name"] = [[Clear]];
	G2L["6b"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["6b"]["Text"] = [[]];
	G2L["6b"]["Position"] = UDim2.new(0, 0, 0.32941, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear.Animate
	G2L["6c"] = Instance.new("LocalScript", G2L["6b"]);
	G2L["6c"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear.LocalScript
	G2L["6d"] = Instance.new("LocalScript", G2L["6b"]);



	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear.Border
	G2L["6e"] = Instance.new("Frame", G2L["6b"]);
	G2L["6e"]["BorderSizePixel"] = 0;
	G2L["6e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["6e"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["6e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["6e"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear.TextLabel
	G2L["6f"] = Instance.new("TextLabel", G2L["6b"]);
	G2L["6f"]["TextWrapped"] = true;
	G2L["6f"]["BorderSizePixel"] = 0;
	G2L["6f"]["TextSize"] = 14;
	G2L["6f"]["TextScaled"] = true;
	G2L["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["6f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["6f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["6f"]["BackgroundTransparency"] = 1;
	G2L["6f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["6f"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["6f"]["Text"] = [[Clear Output]];
	G2L["6f"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear.TextLabel.UITextSizeConstraint
	G2L["70"] = Instance.new("UITextSizeConstraint", G2L["6f"]);
	G2L["70"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear.UITextSizeConstraint
	G2L["71"] = Instance.new("UITextSizeConstraint", G2L["6b"]);
	G2L["71"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear.UIStroke
	G2L["72"] = Instance.new("UIStroke", G2L["6b"]);
	G2L["72"]["Transparency"] = 0.5;
	G2L["72"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["72"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ClearL
	G2L["73"] = Instance.new("TextButton", G2L["69"]);
	G2L["73"]["TextWrapped"] = true;
	G2L["73"]["BorderSizePixel"] = 0;
	G2L["73"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["73"]["TextSize"] = 14;
	G2L["73"]["TextScaled"] = true;
	G2L["73"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["73"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["73"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["73"]["Name"] = [[ClearL]];
	G2L["73"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["73"]["Text"] = [[]];
	G2L["73"]["Position"] = UDim2.new(0, 0, 0.32941, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ClearL.Animate
	G2L["74"] = Instance.new("LocalScript", G2L["73"]);
	G2L["74"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ClearL.Border
	G2L["75"] = Instance.new("Frame", G2L["73"]);
	G2L["75"]["BorderSizePixel"] = 0;
	G2L["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["75"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["75"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ClearL.TextLabel
	G2L["76"] = Instance.new("TextLabel", G2L["73"]);
	G2L["76"]["TextWrapped"] = true;
	G2L["76"]["BorderSizePixel"] = 0;
	G2L["76"]["TextSize"] = 14;
	G2L["76"]["TextScaled"] = true;
	G2L["76"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["76"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["76"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["76"]["BackgroundTransparency"] = 1;
	G2L["76"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["76"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["76"]["Text"] = [[Clear Log]];
	G2L["76"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ClearL.TextLabel.UITextSizeConstraint
	G2L["77"] = Instance.new("UITextSizeConstraint", G2L["76"]);
	G2L["77"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ClearL.UITextSizeConstraint
	G2L["78"] = Instance.new("UITextSizeConstraint", G2L["73"]);
	G2L["78"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ClearL.UIStroke
	G2L["79"] = Instance.new("UIStroke", G2L["73"]);
	G2L["79"]["Transparency"] = 0.5;
	G2L["79"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["79"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC
	G2L["7a"] = Instance.new("TextButton", G2L["69"]);
	G2L["7a"]["TextWrapped"] = true;
	G2L["7a"]["BorderSizePixel"] = 0;
	G2L["7a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["7a"]["TextSize"] = 14;
	G2L["7a"]["TextScaled"] = true;
	G2L["7a"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["7a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["7a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["7a"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["7a"]["Name"] = [[CopyC]];
	G2L["7a"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["7a"]["Text"] = [[]];
	G2L["7a"]["Position"] = UDim2.new(0, 0, 0.08235, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC.Animate
	G2L["7b"] = Instance.new("LocalScript", G2L["7a"]);
	G2L["7b"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC.LocalScript
	G2L["7c"] = Instance.new("LocalScript", G2L["7a"]);



	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC.Border
	G2L["7d"] = Instance.new("Frame", G2L["7a"]);
	G2L["7d"]["BorderSizePixel"] = 0;
	G2L["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["7d"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["7d"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC.TextLabel
	G2L["7e"] = Instance.new("TextLabel", G2L["7a"]);
	G2L["7e"]["TextWrapped"] = true;
	G2L["7e"]["BorderSizePixel"] = 0;
	G2L["7e"]["TextSize"] = 14;
	G2L["7e"]["TextScaled"] = true;
	G2L["7e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["7e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["7e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["7e"]["BackgroundTransparency"] = 1;
	G2L["7e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["7e"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["7e"]["Text"] = [[Copy Code]];
	G2L["7e"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC.TextLabel.UITextSizeConstraint
	G2L["7f"] = Instance.new("UITextSizeConstraint", G2L["7e"]);
	G2L["7f"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC.UITextSizeConstraint
	G2L["80"] = Instance.new("UITextSizeConstraint", G2L["7a"]);
	G2L["80"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC.UIStroke
	G2L["81"] = Instance.new("UIStroke", G2L["7a"]);
	G2L["81"]["Transparency"] = 0.5;
	G2L["81"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["81"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyR
	G2L["82"] = Instance.new("TextButton", G2L["69"]);
	G2L["82"]["TextWrapped"] = true;
	G2L["82"]["BorderSizePixel"] = 0;
	G2L["82"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["82"]["TextSize"] = 14;
	G2L["82"]["TextScaled"] = true;
	G2L["82"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["82"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["82"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["82"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["82"]["Name"] = [[CopyR]];
	G2L["82"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["82"]["Text"] = [[]];
	G2L["82"]["Position"] = UDim2.new(0.32, 0, 0.08235, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyR.Animate
	G2L["83"] = Instance.new("LocalScript", G2L["82"]);
	G2L["83"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyR.Border
	G2L["84"] = Instance.new("Frame", G2L["82"]);
	G2L["84"]["BorderSizePixel"] = 0;
	G2L["84"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["84"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["84"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["84"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyR.TextLabel
	G2L["85"] = Instance.new("TextLabel", G2L["82"]);
	G2L["85"]["TextWrapped"] = true;
	G2L["85"]["BorderSizePixel"] = 0;
	G2L["85"]["TextSize"] = 14;
	G2L["85"]["TextScaled"] = true;
	G2L["85"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["85"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["85"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["85"]["BackgroundTransparency"] = 1;
	G2L["85"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["85"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["85"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["85"]["Text"] = [[Copy Remote]];
	G2L["85"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyR.TextLabel.UITextSizeConstraint
	G2L["86"] = Instance.new("UITextSizeConstraint", G2L["85"]);
	G2L["86"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyR.UITextSizeConstraint
	G2L["87"] = Instance.new("UITextSizeConstraint", G2L["82"]);
	G2L["87"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyR.UIStroke
	G2L["88"] = Instance.new("UIStroke", G2L["82"]);
	G2L["88"]["Transparency"] = 0.5;
	G2L["88"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["88"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ExL
	G2L["89"] = Instance.new("TextButton", G2L["69"]);
	G2L["89"]["TextWrapped"] = true;
	G2L["89"]["BorderSizePixel"] = 0;
	G2L["89"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["89"]["TextSize"] = 14;
	G2L["89"]["TextScaled"] = true;
	G2L["89"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["89"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["89"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["89"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["89"]["Name"] = [[ExL]];
	G2L["89"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["89"]["Text"] = [[]];
	G2L["89"]["Position"] = UDim2.new(0, 0, 0.32941, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ExL.Animate
	G2L["8a"] = Instance.new("LocalScript", G2L["89"]);
	G2L["8a"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ExL.Border
	G2L["8b"] = Instance.new("Frame", G2L["89"]);
	G2L["8b"]["BorderSizePixel"] = 0;
	G2L["8b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["8b"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["8b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["8b"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ExL.
	G2L["8c"] = Instance.new("TextLabel", G2L["89"]);
	G2L["8c"]["TextWrapped"] = true;
	G2L["8c"]["BorderSizePixel"] = 0;
	G2L["8c"]["TextSize"] = 14;
	G2L["8c"]["TextScaled"] = true;
	G2L["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["8c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["8c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["8c"]["BackgroundTransparency"] = 1;
	G2L["8c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["8c"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["8c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["8c"]["Text"] = [[Exclude Remote]];
	G2L["8c"]["Name"] = [[]];
	G2L["8c"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ExL..UITextSizeConstraint
	G2L["8d"] = Instance.new("UITextSizeConstraint", G2L["8c"]);
	G2L["8d"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ExL.UITextSizeConstraint
	G2L["8e"] = Instance.new("UITextSizeConstraint", G2L["89"]);
	G2L["8e"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.ExL.UIStroke
	G2L["8f"] = Instance.new("UIStroke", G2L["89"]);
	G2L["8f"]["Transparency"] = 0.5;
	G2L["8f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["8f"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Run
	G2L["90"] = Instance.new("TextButton", G2L["69"]);
	G2L["90"]["TextWrapped"] = true;
	G2L["90"]["BorderSizePixel"] = 0;
	G2L["90"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["90"]["TextSize"] = 14;
	G2L["90"]["TextScaled"] = true;
	G2L["90"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["90"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["90"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["90"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["90"]["Name"] = [[Run]];
	G2L["90"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["90"]["Text"] = [[]];
	G2L["90"]["Position"] = UDim2.new(0.69333, 0, 0.08235, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Run.Animate
	G2L["91"] = Instance.new("LocalScript", G2L["90"]);
	G2L["91"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Run.Border
	G2L["92"] = Instance.new("Frame", G2L["90"]);
	G2L["92"]["BorderSizePixel"] = 0;
	G2L["92"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["92"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["92"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["92"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Run.TextLabel
	G2L["93"] = Instance.new("TextLabel", G2L["90"]);
	G2L["93"]["TextWrapped"] = true;
	G2L["93"]["BorderSizePixel"] = 0;
	G2L["93"]["TextSize"] = 14;
	G2L["93"]["TextScaled"] = true;
	G2L["93"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["93"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["93"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["93"]["BackgroundTransparency"] = 1;
	G2L["93"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["93"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["93"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["93"]["Text"] = [[Fire or Invoke]];
	G2L["93"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Run.TextLabel.UITextSizeConstraint
	G2L["94"] = Instance.new("UITextSizeConstraint", G2L["93"]);
	G2L["94"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Run.UITextSizeConstraint
	G2L["95"] = Instance.new("UITextSizeConstraint", G2L["90"]);
	G2L["95"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Run.UIStroke
	G2L["96"] = Instance.new("UIStroke", G2L["90"]);
	G2L["96"]["Transparency"] = 0.5;
	G2L["96"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["96"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS
	G2L["97"] = Instance.new("TextButton", G2L["69"]);
	G2L["97"]["TextWrapped"] = true;
	G2L["97"]["BorderSizePixel"] = 0;
	G2L["97"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["97"]["TextSize"] = 14;
	G2L["97"]["TextScaled"] = true;
	G2L["97"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["97"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["97"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["97"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["97"]["Name"] = [[RunS]];
	G2L["97"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["97"]["Text"] = [[]];
	G2L["97"]["Position"] = UDim2.new(0.69333, 0, 0.08235, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS.Animate
	G2L["98"] = Instance.new("LocalScript", G2L["97"]);
	G2L["98"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS.LocalScript
	G2L["99"] = Instance.new("LocalScript", G2L["97"]);



	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS.Border
	G2L["9a"] = Instance.new("Frame", G2L["97"]);
	G2L["9a"]["BorderSizePixel"] = 0;
	G2L["9a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["9a"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["9a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["9a"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS.TextLabel
	G2L["9b"] = Instance.new("TextLabel", G2L["97"]);
	G2L["9b"]["TextWrapped"] = true;
	G2L["9b"]["BorderSizePixel"] = 0;
	G2L["9b"]["TextSize"] = 14;
	G2L["9b"]["TextScaled"] = true;
	G2L["9b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["9b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["9b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["9b"]["BackgroundTransparency"] = 1;
	G2L["9b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["9b"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["9b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["9b"]["Text"] = [[Run Code]];
	G2L["9b"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS.TextLabel.UITextSizeConstraint
	G2L["9c"] = Instance.new("UITextSizeConstraint", G2L["9b"]);
	G2L["9c"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS.UITextSizeConstraint
	G2L["9d"] = Instance.new("UITextSizeConstraint", G2L["97"]);
	G2L["9d"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS.UIStroke
	G2L["9e"] = Instance.new("UIStroke", G2L["97"]);
	G2L["9e"]["Transparency"] = 0.5;
	G2L["9e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["9e"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc
	G2L["9f"] = Instance.new("TextButton", G2L["69"]);
	G2L["9f"]["TextWrapped"] = true;
	G2L["9f"]["BorderSizePixel"] = 0;
	G2L["9f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["9f"]["TextSize"] = 14;
	G2L["9f"]["TextScaled"] = true;
	G2L["9f"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["9f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["9f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["9f"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["9f"]["Name"] = [[dc]];
	G2L["9f"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["9f"]["Text"] = [[]];
	G2L["9f"]["Position"] = UDim2.new(0.69333, 0, 0.08235, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc.Animate
	G2L["a0"] = Instance.new("LocalScript", G2L["9f"]);
	G2L["a0"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc.LocalScript
	G2L["a1"] = Instance.new("LocalScript", G2L["9f"]);



	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc.Border
	G2L["a2"] = Instance.new("Frame", G2L["9f"]);
	G2L["a2"]["BorderSizePixel"] = 0;
	G2L["a2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["a2"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["a2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["a2"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc.TextLabel
	G2L["a3"] = Instance.new("TextLabel", G2L["9f"]);
	G2L["a3"]["TextWrapped"] = true;
	G2L["a3"]["BorderSizePixel"] = 0;
	G2L["a3"]["TextSize"] = 14;
	G2L["a3"]["TextScaled"] = true;
	G2L["a3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["a3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["a3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["a3"]["BackgroundTransparency"] = 1;
	G2L["a3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["a3"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["a3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["a3"]["Text"] = [[Discord]];
	G2L["a3"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc.TextLabel.UITextSizeConstraint
	G2L["a4"] = Instance.new("UITextSizeConstraint", G2L["a3"]);
	G2L["a4"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc.UITextSizeConstraint
	G2L["a5"] = Instance.new("UITextSizeConstraint", G2L["9f"]);
	G2L["a5"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc.UIStroke
	G2L["a6"] = Instance.new("UIStroke", G2L["9f"]);
	G2L["a6"]["Transparency"] = 0.5;
	G2L["a6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["a6"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt
	G2L["a7"] = Instance.new("TextButton", G2L["69"]);
	G2L["a7"]["TextWrapped"] = true;
	G2L["a7"]["BorderSizePixel"] = 0;
	G2L["a7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["a7"]["TextSize"] = 14;
	G2L["a7"]["TextScaled"] = true;
	G2L["a7"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["a7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["a7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["a7"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["a7"]["Name"] = [[yt]];
	G2L["a7"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["a7"]["Text"] = [[]];
	G2L["a7"]["Position"] = UDim2.new(0.69333, 0, 0.08235, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt.Animate
	G2L["a8"] = Instance.new("LocalScript", G2L["a7"]);
	G2L["a8"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt.LocalScript
	G2L["a9"] = Instance.new("LocalScript", G2L["a7"]);



	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt.Border
	G2L["aa"] = Instance.new("Frame", G2L["a7"]);
	G2L["aa"]["BorderSizePixel"] = 0;
	G2L["aa"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["aa"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["aa"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["aa"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt.TextLabel
	G2L["ab"] = Instance.new("TextLabel", G2L["a7"]);
	G2L["ab"]["TextWrapped"] = true;
	G2L["ab"]["BorderSizePixel"] = 0;
	G2L["ab"]["TextSize"] = 14;
	G2L["ab"]["TextScaled"] = true;
	G2L["ab"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["ab"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["ab"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["ab"]["BackgroundTransparency"] = 1;
	G2L["ab"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["ab"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["ab"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["ab"]["Text"] = [[Youtube]];
	G2L["ab"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt.TextLabel.UITextSizeConstraint
	G2L["ac"] = Instance.new("UITextSizeConstraint", G2L["ab"]);
	G2L["ac"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt.UITextSizeConstraint
	G2L["ad"] = Instance.new("UITextSizeConstraint", G2L["a7"]);
	G2L["ad"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt.UIStroke
	G2L["ae"] = Instance.new("UIStroke", G2L["a7"]);
	G2L["ae"]["Transparency"] = 0.5;
	G2L["ae"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["ae"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.UIListLayout
	G2L["af"] = Instance.new("UIListLayout", G2L["69"]);
	G2L["af"]["Wraps"] = true;
	G2L["af"]["Padding"] = UDim.new(0, 5);
	G2L["af"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	G2L["af"]["FillDirection"] = Enum.FillDirection.Horizontal;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL
	G2L["b0"] = Instance.new("TextButton", G2L["69"]);
	G2L["b0"]["TextWrapped"] = true;
	G2L["b0"]["BorderSizePixel"] = 0;
	G2L["b0"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["b0"]["TextSize"] = 14;
	G2L["b0"]["TextScaled"] = true;
	G2L["b0"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["b0"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["b0"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["b0"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["b0"]["Name"] = [[FireALL]];
	G2L["b0"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["b0"]["Text"] = [[]];
	G2L["b0"]["Position"] = UDim2.new(0, 0, 0.32941, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL.Function
	G2L["b1"] = Instance.new("LocalScript", G2L["b0"]);
	G2L["b1"]["Name"] = [[Function]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL.Animate
	G2L["b2"] = Instance.new("LocalScript", G2L["b0"]);
	G2L["b2"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL.Border
	G2L["b3"] = Instance.new("Frame", G2L["b0"]);
	G2L["b3"]["BorderSizePixel"] = 0;
	G2L["b3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["b3"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["b3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["b3"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL.TextLabel
	G2L["b4"] = Instance.new("TextLabel", G2L["b0"]);
	G2L["b4"]["TextWrapped"] = true;
	G2L["b4"]["BorderSizePixel"] = 0;
	G2L["b4"]["TextSize"] = 14;
	G2L["b4"]["TextScaled"] = true;
	G2L["b4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["b4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["b4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["b4"]["BackgroundTransparency"] = 1;
	G2L["b4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["b4"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["b4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["b4"]["Text"] = [[Fire all remotes]];
	G2L["b4"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL.TextLabel.UITextSizeConstraint
	G2L["b5"] = Instance.new("UITextSizeConstraint", G2L["b4"]);
	G2L["b5"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL.UIStroke
	G2L["b6"] = Instance.new("UIStroke", G2L["b0"]);
	G2L["b6"]["Transparency"] = 0.5;
	G2L["b6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["b6"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL.UITextSizeConstraint
	G2L["b7"] = Instance.new("UITextSizeConstraint", G2L["b0"]);
	G2L["b7"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Spam
	G2L["b8"] = Instance.new("TextButton", G2L["69"]);
	G2L["b8"]["TextWrapped"] = true;
	G2L["b8"]["BorderSizePixel"] = 0;
	G2L["b8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["b8"]["TextSize"] = 14;
	G2L["b8"]["TextScaled"] = true;
	G2L["b8"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["b8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["b8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["b8"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["b8"]["Name"] = [[Spam]];
	G2L["b8"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["b8"]["Text"] = [[]];
	G2L["b8"]["Position"] = UDim2.new(0, 0, 0.32941, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Spam.Animate
	G2L["b9"] = Instance.new("LocalScript", G2L["b8"]);
	G2L["b9"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Spam.Border
	G2L["ba"] = Instance.new("Frame", G2L["b8"]);
	G2L["ba"]["BorderSizePixel"] = 0;
	G2L["ba"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["ba"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["ba"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["ba"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Spam.TextLabel
	G2L["bb"] = Instance.new("TextLabel", G2L["b8"]);
	G2L["bb"]["TextWrapped"] = true;
	G2L["bb"]["BorderSizePixel"] = 0;
	G2L["bb"]["TextSize"] = 14;
	G2L["bb"]["TextScaled"] = true;
	G2L["bb"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["bb"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["bb"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["bb"]["BackgroundTransparency"] = 1;
	G2L["bb"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["bb"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["bb"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["bb"]["Text"] = [[Spam]];
	G2L["bb"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Spam.TextLabel.UITextSizeConstraint
	G2L["bc"] = Instance.new("UITextSizeConstraint", G2L["bb"]);
	G2L["bc"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Spam.UIStroke
	G2L["bd"] = Instance.new("UIStroke", G2L["b8"]);
	G2L["bd"]["Transparency"] = 0.5;
	G2L["bd"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["bd"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.Spam.UITextSizeConstraint
	G2L["be"] = Instance.new("UITextSizeConstraint", G2L["b8"]);
	G2L["be"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.UpList
	G2L["bf"] = Instance.new("TextButton", G2L["69"]);
	G2L["bf"]["TextWrapped"] = true;
	G2L["bf"]["BorderSizePixel"] = 0;
	G2L["bf"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["bf"]["TextSize"] = 14;
	G2L["bf"]["TextScaled"] = true;
	G2L["bf"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 30);
	G2L["bf"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["bf"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["bf"]["Size"] = UDim2.new(0, 95, 0, 18);
	G2L["bf"]["Name"] = [[UpList]];
	G2L["bf"]["BorderColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["bf"]["Text"] = [[]];
	G2L["bf"]["Position"] = UDim2.new(0.69333, 0, 0.08235, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.UpList.Animate
	G2L["c0"] = Instance.new("LocalScript", G2L["bf"]);
	G2L["c0"]["Name"] = [[Animate]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.UpList.Border
	G2L["c1"] = Instance.new("Frame", G2L["bf"]);
	G2L["c1"]["BorderSizePixel"] = 0;
	G2L["c1"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["c1"]["Size"] = UDim2.new(0.05, 0, 1, 0);
	G2L["c1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["c1"]["Name"] = [[Border]];


	-- StarterGui.AAGGXENOSS.Frame.Buttons.UpList.TextLabel
	G2L["c2"] = Instance.new("TextLabel", G2L["bf"]);
	G2L["c2"]["TextWrapped"] = true;
	G2L["c2"]["BorderSizePixel"] = 0;
	G2L["c2"]["TextSize"] = 14;
	G2L["c2"]["TextScaled"] = true;
	G2L["c2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["c2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["c2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["c2"]["BackgroundTransparency"] = 1;
	G2L["c2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["c2"]["Size"] = UDim2.new(0.89474, 0, 1, 0);
	G2L["c2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["c2"]["Text"] = [[Update Remotes]];
	G2L["c2"]["Position"] = UDim2.new(0.53684, 0, 0.48382, 0);


	-- StarterGui.AAGGXENOSS.Frame.Buttons.UpList.TextLabel.UITextSizeConstraint
	G2L["c3"] = Instance.new("UITextSizeConstraint", G2L["c2"]);
	G2L["c3"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.UpList.UITextSizeConstraint
	G2L["c4"] = Instance.new("UITextSizeConstraint", G2L["bf"]);
	G2L["c4"]["MaxTextSize"] = 14;


	-- StarterGui.AAGGXENOSS.Frame.Buttons.UpList.UIStroke
	G2L["c5"] = Instance.new("UIStroke", G2L["bf"]);
	G2L["c5"]["Transparency"] = 0.5;
	G2L["c5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["c5"]["Color"] = Color3.fromRGB(151, 151, 151);


	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder
	G2L["c6"] = Instance.new("ScrollingFrame", G2L["33"]);
	G2L["c6"]["Active"] = true;
	G2L["c6"]["ZIndex"] = 999;
	G2L["c6"]["BorderSizePixel"] = 0;
	G2L["c6"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["c6"]["ScrollingEnabled"] = false;
	G2L["c6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["c6"]["Name"] = [[SearchBar Holder]];
	G2L["c6"]["ScrollBarImageTransparency"] = 1;
	G2L["c6"]["Size"] = UDim2.new(0, 125, 0, 35);
	G2L["c6"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["c6"]["Position"] = UDim2.new(0, 0, 0.08, 0);
	G2L["c6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["c6"]["BackgroundTransparency"] = 1;


	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder.SearchBar
	G2L["c7"] = Instance.new("Frame", G2L["c6"]);
	G2L["c7"]["Active"] = true;
	G2L["c7"]["ZIndex"] = 90000000;
	G2L["c7"]["BorderSizePixel"] = 0;
	G2L["c7"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
	G2L["c7"]["Selectable"] = true;
	G2L["c7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["c7"]["Size"] = UDim2.new(0.023, 106, 0, 22);
	G2L["c7"]["Position"] = UDim2.new(0.1329, 0, 0.15173, 0);
	G2L["c7"]["BorderColor3"] = Color3.fromRGB(94, 97, 103);
	G2L["c7"]["Name"] = [[SearchBar]];
	G2L["c7"]["BackgroundTransparency"] = 0.8;


	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder.SearchBar.Function
	G2L["c8"] = Instance.new("LocalScript", G2L["c7"]);
	G2L["c8"]["Name"] = [[Function]];


	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder.SearchBar.UIStroke
	G2L["c9"] = Instance.new("UIStroke", G2L["c7"]);
	G2L["c9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["c9"]["Color"] = Color3.fromRGB(224, 224, 224);


	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder.SearchBar.TextBox
	G2L["ca"] = Instance.new("TextBox", G2L["c7"]);
	G2L["ca"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["ca"]["BorderSizePixel"] = 0;
	G2L["ca"]["TextWrapped"] = true;
	G2L["ca"]["TextSize"] = 14;
	G2L["ca"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["ca"]["TextScaled"] = true;
	G2L["ca"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["ca"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["ca"]["PlaceholderText"] = [[Filter remotes]];
	G2L["ca"]["Size"] = UDim2.new(0.02341, 82, -0.017, 16);
	G2L["ca"]["Position"] = UDim2.new(0.19, 0, 0.13636, 0);
	G2L["ca"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["ca"]["Text"] = [[]];
	G2L["ca"]["BackgroundTransparency"] = 1;


	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder.SearchBar.ImageLabel
	G2L["cb"] = Instance.new("ImageLabel", G2L["c7"]);
	G2L["cb"]["BorderSizePixel"] = 0;
	G2L["cb"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["cb"]["Image"] = [[rbxassetid://2804603863]];
	G2L["cb"]["Size"] = UDim2.new(-0.02, 15, 0, 16);
	G2L["cb"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["cb"]["BackgroundTransparency"] = 1;
	G2L["cb"]["Position"] = UDim2.new(0.04844, 0, 0.23636, 0);


	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder.SearchBar.ImageLabel.UIAspectRatioConstraint
	G2L["cc"] = Instance.new("UIAspectRatioConstraint", G2L["cb"]);



	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder.SearchBar.UICorner
	G2L["cd"] = Instance.new("UICorner", G2L["c7"]);
	G2L["cd"]["CornerRadius"] = UDim.new(0, 3);


	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder.UIPadding
	G2L["ce"] = Instance.new("UIPadding", G2L["c6"]);
	G2L["ce"]["PaddingTop"] = UDim.new(0, 14);
	G2L["ce"]["PaddingLeft"] = UDim.new(0, 54);


	-- Require G2L wrapper
	local G2L_REQUIRE = require;
	local G2L_MODULES = {};
	local function require(Module:ModuleScript)
		local ModuleState = G2L_MODULES[Module];
		if ModuleState then
			if not ModuleState.Required then
				ModuleState.Required = true;
				ModuleState.Value = ModuleState.Closure();
			end
			return ModuleState.Value;
		end;
		return G2L_REQUIRE(Module);
	end

	G2L_MODULES[G2L["4"]] = {
		Closure = function()
			local script = G2L["4"];local Module = {}

			local mx = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").GXnilNotify
			local ii = mx.holder

			function Module.Notify(Title, Description, Duration)
				local nss = Instance.new("Frame", ii)
				nss.BorderSizePixel = 0
				nss.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
				nss.Size = UDim2.new(0, 229, 0, 67)
				nss.Position = UDim2.new(0.00475, 0, 0.43964, 0)
				nss.BorderColor3 = Color3.fromRGB(0, 0, 0)

				local xvfffff = Instance.new("UICorner", nss)
				xvfffff.CornerRadius = UDim.new(0, 6)
				local mn = Instance.new("UIStroke", nss)
				mn.Color = Color3.fromRGB(0, 213, 255)

				local mb = Instance.new("TextLabel", nss)
				mb.TextWrapped = true
				mb.BorderSizePixel = 0
				mb.TextSize = 14
				mb.TextXAlignment = Enum.TextXAlignment.Left
				mb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				mb.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				mb.TextColor3 = Color3.fromRGB(245, 245, 245)
				mb.BackgroundTransparency = 1
				mb.Size = UDim2.new(0, 200, 0, 24)
				mb.BorderColor3 = Color3.fromRGB(0, 0, 0)
				mb.Text = Title
				mb.Name = "tt"
				mb.Position = UDim2.new(0.03493, 0, 0, 0)

				local ppee = Instance.new("TextLabel", nss)
				ppee.TextWrapped = true
				ppee.BorderSizePixel = 0
				ppee.TextSize = 14
				ppee.TextXAlignment = Enum.TextXAlignment.Left
				ppee.TextYAlignment = Enum.TextYAlignment.Top
				ppee.BackgroundColor3 = Color3.fromRGB(255, 36, 36)
				ppee.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				ppee.TextColor3 = Color3.fromRGB(226, 226, 226)
				ppee.BackgroundTransparency = 1
				ppee.Size = UDim2.new(0, 221, 0, 43)
				ppee.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ppee.Text = Description
				ppee.Name = "Desc"
				ppee.Position = UDim2.new(0.03493, 0, 0.35821, 0)

				local minhabostica = Instance.new("ImageButton", nss)
				minhabostica.BorderSizePixel = 0
				minhabostica.ScaleType = Enum.ScaleType.Fit
				minhabostica.BackgroundColor3 = Color3.fromRGB(38, 36, 39)
				minhabostica.AnchorPoint = Vector2.new(1, 0.5)
				minhabostica.Image = [[rbxassetid://10002373478]]
				minhabostica.Size = UDim2.new(0.08199, 0, 0.26866, 0)
				minhabostica.BackgroundTransparency = 1
				minhabostica.Name = "X"
				minhabostica.BorderColor3 = Color3.fromRGB(0, 0, 0)
				minhabostica.Position = UDim2.new(1, -2, 0.18, 0)

				local ls = Instance.new("LocalScript", nss)
				local function C_b()
					local T = game:GetService("TweenService")
					local F = ls.Parent
					local function a()
						local b = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
						local c = {BackgroundTransparency = 0}
						local d = T:Create(F, b, c)
						d:Play()

						for _, e in pairs(F:GetChildren()) do
							if e:IsA("TextLabel") or e:IsA("TextButton") then
								local f = {TextTransparency = 0}
								local g = T:Create(e, b, f)
								g:Play()
							elseif e:IsA("UIStroke") then
								local h = {Transparency = 0}
								local i = T:Create(e, b, h)
								i:Play()
							elseif e:IsA("ImageLabel") or e:IsA("ImageButton") then
								local j = {ImageTransparency = 0}
								local k = T:Create(e, b, j)
								k:Play()
							end
						end
					end

					local function l()
						local m = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
						local n = {BackgroundTransparency = 1}
						local o = T:Create(F, m, n)
						o:Play()

						for _, p in pairs(F:GetChildren()) do
							if p:IsA("TextLabel") or p:IsA("TextButton") then
								local q = {TextTransparency = 1}
								local r = T:Create(p, m, q)
								r:Play()
							elseif p:IsA("UIStroke") then
								local s = {Transparency = 1}
								local t = T:Create(p, m, s)
								t:Play()
							elseif p:IsA("ImageLabel") or p:IsA("ImageButton") then
								local u = {ImageTransparency = 1}
								local v = T:Create(p, m, u)
								v:Play()
							end
						end

						o.Completed:Connect(function()
							nss.Visible = false
						end)
					end
					local function w()
						local x = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
						local y = {BackgroundTransparency = 1}
						local z = T:Create(F, x, y)
						z:Play()

						for _, A in pairs(F:GetChildren()) do
							if A:IsA("TextLabel") or A:IsA("TextButton") then
								local B = {TextTransparency = 1}
								local C = T:Create(A, x, B)
								C:Play()
							elseif A:IsA("UIStroke") then
								local D = {Transparency = 1}
								local E = T:Create(A, x, D)
								E:Play()
							elseif A:IsA("ImageLabel") or A:IsA("ImageButton") then
								local F = {ImageTransparency = 1}
								local G = T:Create(A, x, F)
								G:Play()
							end
						end
						z.Completed:Connect(function()
							nss.Visible = false
						end)
					end
					F.X.MouseButton1Click:Connect(function()
						w()
					end)
					a()
					wait(tonumber(Duration))
					l()
				end

				task.spawn(C_b)
			end

			return Module
		end;
	};
	G2L_MODULES[G2L["5"]] = {
		Closure = function()
			local script = G2L["5"];--[[

                StellyNotifyV2
  Made by Kinzin (._.kinzin) - contact: Discord
  
]]

			local gui = script:WaitForChild("StellyNotificationV2")
			local TweenService = game:GetService("TweenService")

			local DEFAULT_DURATION = 4 -- Default duration for notifications

			local Notify = {
				BaseColor   = Color3.fromRGB(59, 59, 59),
				SecondColor = Color3.fromRGB(173, 173, 173),
				TitleColor  = Color3.fromRGB(255, 255, 255),
				DescColor   = Color3.fromRGB(203, 203, 203),
				CloseColor  = Color3.fromRGB(255, 255, 255),
				Debug       = false,
				Duration    = DEFAULT_DURATION
			}

			function Notify:Notify(config)
				local ntf = gui.Templates.Notification:Clone()
				ntf.Parent = gui.Holder
				ntf.Visible = true

				ntf.Size = UDim2.new(0, 113, 0, 6)
				ntf.Position = UDim2.new(0.99, 0, 0.98, 0)

				ntf.Title.Text = config.Title or ""
				ntf.Desc.Text = config.Description or ""

				ntf.BackgroundColor3 = config.BaseColor or self.BaseColor
				ntf.ImageLabel.ImageColor3 = config.SecondColor or self.SecondColor
				ntf.Title.TextColor3 = config.TitleColor or self.TitleColor
				ntf.Desc.TextColor3 = config.DescriptionColor or self.DescColor
				ntf.Close.ImageLabel.ImageColor3 = config.CloseColor or self.CloseColor

				ntf.Title.Visible = false
				ntf.Desc.Visible = false
				ntf.Close.Visible = false

				local function TweenNotification(targetSize, duration)
					local tween = TweenService:Create(ntf, TweenInfo.new(duration), { Size = targetSize })
					tween:Play()
					tween.Completed:Wait()
				end

				local function Open()
					TweenNotification(UDim2.new(0, 252, 0, 99), 0.6)
				end

				local function Close()
					TweenNotification(UDim2.new(0, 113, 0, 6), 0.6)
					ntf:Destroy()
				end

				ntf.Close.MouseButton1Click:Connect(Close)

				Open()

				ntf.Title.Visible = true
				ntf.Desc.Visible = true
				ntf.Close.Visible = false

				task.delay(config.Duration or self.Duration, function()
					if ntf and ntf.Parent then
						ntf.Title.Visible = false
						ntf.Desc.Visible = false
						ntf.Close.Visible = false
						Close()
					end
				end)
			end

			return Notify
		end;
	};
	G2L_MODULES[G2L["35"]] = {
		Closure = function()
			local script = G2L["35"];local module = {}

			local mouse = game.Players.LocalPlayer:GetMouse()

			local DRAGGER_SIZE = 30
			local DRAGGER_TRANSPARENCY = .5

			local dragging = false

			function module.makeResizable(obj:GuiObject, minSize)

				local resizer = script.Parent.resizer:Clone()
				local dragger = resizer.dragger

				resizer.Size = UDim2.fromOffset(DRAGGER_SIZE, DRAGGER_SIZE)
				resizer.Position = UDim2.new(1, -DRAGGER_SIZE, 1, -DRAGGER_SIZE)

				local duic = dragger.UICorner
				minSize = minSize or Vector2.new(160, 90)

				local startDrag, startSize
				local gui = obj:FindFirstAncestorWhichIsA("ScreenGui")
				resizer.Parent = obj

				local function finishResize(tr)
					dragger.Position = UDim2.new(0,0,0,0)
					dragger.Size = UDim2.new(2,0,2,0)
					dragger.Parent = resizer
					dragger.BackgroundTransparency = tr
					duic.Parent = dragger
					startDrag = nil
				end
				dragger.MouseButton1Down:Connect(function()
					if not startDrag then
						startSize = obj.AbsoluteSize			
						startDrag = Vector2.new(mouse.X, mouse.Y)
						dragger.BackgroundTransparency = 1
						dragger.Size = UDim2.fromOffset(gui.AbsoluteSize.X, gui.AbsoluteSize.Y)
						dragger.Position = UDim2.new(0,0,0,0)
						duic.Parent = nil
						dragger.Parent = gui
					end
				end)	
				dragger.MouseMoved:Connect(function()
					local TweenService = game:GetService("TweenService")
					local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

					if startDrag then
						local m = Vector2.new(mouse.X, mouse.Y)
						local mouseMoved = Vector2.new(m.X - startDrag.X, m.Y - startDrag.Y)

						local s = startSize + mouseMoved
						local sx = math.max(minSize.X, s.X)
						local sy = math.max(minSize.Y, s.Y)

						local targetSize = UDim2.fromOffset(sx, sy)

						-- Cria e executa o Tween para suavizar o ajuste de tamanho
						local tween = TweenService:Create(obj, tweenInfo, { Size = targetSize })
						tween:Play()
					end
				end)
				dragger.MouseEnter:Connect(function()
					finishResize(DRAGGER_TRANSPARENCY)				
				end)
				dragger.MouseLeave:Connect(function()
					finishResize(1)
				end)		
				dragger.MouseButton1Up:Connect(function()
					finishResize(DRAGGER_TRANSPARENCY)
				end)	
			end

			function module.makeDraggable(obj)
				local UIS = game:GetService("UserInputService")
				local dragInput, dragStart
				local startPos = obj.Position 
				local dragger = obj	
				local function updateInput(input)
					local offset = input.Position - dragStart
					local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + offset.X, startPos.Y.Scale, startPos.Y.Offset + offset.Y)
					game:GetService("TweenService"):Create(obj, TweenInfo.new(.50, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = Position}):Play()
				end
				dragger.InputBegan:Connect(function(input)
					if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not UIS:GetFocusedTextBox() then
						dragging = true
						dragStart = input.Position
						startPos = obj.Position
						module.dragged = obj
						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								dragging = false
							end
						end)
					end
				end)
				dragger.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						dragInput = input
					end
				end)
				UIS.InputChanged:Connect(function(input)
					if input == dragInput and dragging then
						updateInput(input)
					end
				end)
			end

			return module

		end;
	};
	G2L_MODULES[G2L["39"]] = {
		Closure = function()
			local script = G2L["39"];export type HighlighterColors = { [string]: Color3 }

			export type TextObject = TextLabel | TextBox

			export type Lexer = {
				scan: (src: string) -> () -> (string, string),
				navigator: () -> any,
				finished: boolean?,
			}

			export type Highlighter = {
				defaultLexer: Lexer,
				setTokenColors: (colors: HighlighterColors?) -> (),
				refresh: () -> (),
			}

			export type ObjectData = {
				Text: string,
				Labels: { TextLabel },
				Lines: { string },
				Lexer: Lexer?,
				CustomLang: { [string]: string }?,
			}

			local function SanitizeRichText(s: string): string
				return string.gsub(
					string.gsub(string.gsub(string.gsub(string.gsub(s, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), '"', "&quot;"),
					"'",
					"&apos;"
				)
			end

			local function SanitizeTabs(s: string): string
				return string.gsub(s, "\t", "    ")
			end

			local function SanitizeControl(s: string): string
				return string.gsub(s, "[\0\1\2\3\4\5\6\7\8\11\12\13\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
			end

			local TokenColors: HighlighterColors = {
				["background"] = Color3.fromRGB(47, 47, 47),
				["iden"] = Color3.fromRGB(234, 234, 234),
				["keyword"] = Color3.fromRGB(248, 109, 124),
				["builtin"] = Color3.fromRGB(132, 214, 247),
				["string"] = Color3.fromRGB(196, 255, 193),
				["number"] = Color3.fromRGB(255, 198, 0),
				["comment"] = Color3.fromRGB(140, 140, 155),
				["operator"] = Color3.fromRGB(255, 239, 148),
				["custom"] = Color3.fromRGB(255, 249, 71),
			}

			local ColorFormatter: { [Color3]: string } = {}
			local LastData: { [TextObject]: ObjectData } = {}
			local Cleanups: { [TextObject]: () -> () } = {}

			local Highlighter = {
				defaultLexer = require(script.lexer),
				defaultLang = require(script.lexer.language)
			}

			function Highlighter.highlight()
				local Code = script.Parent.CodeHolder.CodeSample
				local lines = Code.Lines
				local textObject:TextBox = Code
				local src = SanitizeTabs(SanitizeControl(textObject.Text))
				local lexer = Highlighter.defaultLexer
				local customLang = Highlighter.defaultLang
				local forceUpdate = true
				local Lines = 1
				src:gsub("\n",function() Lines = ' ' ..Lines+1 end)
				local LinesText = ""
				for i = 1,Lines do
					LinesText = LinesText..i.."\n"
				end 
				lines.Text = LinesText
				-- Avoid updating when unnecessary
				local data = LastData[textObject]
				if data == nil then
					data = {
						Text = "",
						Labels = {},
						Lines = {},
						Lexer = lexer,
						CustomLang = customLang,
					}
					LastData[textObject] = data
				elseif forceUpdate ~= true and data.Text == src then
					return
				end

				local lineLabels = data.Labels
				local previousLines = data.Lines

				data.Lines = lines
				data.Text = src
				data.Lexer = lexer
				data.CustomLang = customLang

				-- Ensure valid object properties
				textObject.RichText = false
				textObject.Text = src
				textObject.TextXAlignment = Enum.TextXAlignment.Left
				textObject.TextYAlignment = Enum.TextYAlignment.Top
				-- textObject.BackgroundColor3 = TokenColors.background
				textObject.TextColor3 = TokenColors.iden
				textObject.TextTransparency = 1

				-- Build the highlight labels
				local lineFolder = textObject:FindFirstChild("SyntaxHighlights")
				if lineFolder == nil then
					local newLineFolder = Instance.new("Folder")
					newLineFolder.Name = "SyntaxHighlights"
					newLineFolder.Parent = textObject

					lineFolder = newLineFolder
				end

				-- Add a cleanup handler for this textObject
				local cleanup = Cleanups[textObject]
				if not cleanup then
					local connections: { RBXScriptConnection } = {}
					local function newCleanup()
						for _, label in ipairs(lineLabels) do
							label:Destroy()
						end
						table.clear(lineLabels)
						lineLabels = nil

						LastData[textObject] = nil
						Cleanups[textObject] = nil

						for _, connection in connections do
							connection:Disconnect()
						end
						table.clear(connections)
						connections = nil
					end
					Cleanups[textObject] = newCleanup
					cleanup = newCleanup

					table.insert(
						connections,
						textObject.AncestryChanged:Connect(function()
							if textObject.Parent then
								return
							end

							cleanup()
						end)
					)
					table.insert(
						connections,
						textObject:GetPropertyChangedSignal("TextBounds"):Connect(function()
							Highlighter.highlight({
								textObject = textObject,
								forceUpdate = true,
								lexer = lexer,
								customLang = customLang,
							})
						end)
					)
					table.insert(
						connections,
						textObject:GetPropertyChangedSignal("Text"):Connect(function()
							Highlighter.highlight({
								textObject = textObject,
								lexer = lexer,
								customLang = customLang,
							})
						end)
					)
					table.insert(
						connections,
						textObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							Highlighter.highlight({
								textObject = textObject,
								forceUpdate = true,
								lexer = lexer,
								customLang = customLang,
							})
						end)
					)
				end

				-- Shortcut empty labels
				if src == "" then
					for l=1, #lineLabels do
						if lineLabels[l].Text == "" then continue end
						lineLabels[l].Text = ""
					end
					return cleanup
				end

				-- Wait for TextBounds to be non-NaN and non-zero because Roblox
				local textBounds = textObject.TextBounds
				while (textBounds.Y ~= textBounds.Y) or (textBounds.Y < 1) do
					task.wait()
					textBounds = textObject.TextBounds
				end

				if LastData[textObject] == nil then
					-- Got cleaned up while we were waiting
					return cleanup
				end

				local textHeight = textBounds.Y / Lines * textObject.LineHeight

				local richText, index, lineNumber = table.create(5), 0, 1
				for token: string, content: string in lexer.scan(src) do
					local Color =
						if customLang and customLang[content] then
						TokenColors["custom"]
						else
						TokenColors[token] or TokenColors["iden"]

					local tokenLines = string.split(SanitizeRichText(content), "\n")

					for l, line in ipairs(tokenLines) do
						-- Find line label
						local lineLabel = lineLabels[lineNumber]
						if not lineLabel then
							local newLabel = Instance.new("TextLabel")
							newLabel.Name = "Line_" .. lineNumber
							newLabel.RichText = true
							newLabel.BackgroundTransparency = 1
							newLabel.Text = ""
							newLabel.TextXAlignment = Enum.TextXAlignment.Left
							newLabel.TextYAlignment = Enum.TextYAlignment.Top
							newLabel.Parent = lineFolder
							lineLabels[lineNumber] = newLabel
							lineLabel = newLabel
						end

						-- Align line label
						lineLabel.TextColor3 = TokenColors["iden"]
						lineLabel.Font = textObject.Font
						lineLabel.TextSize = textObject.TextSize
						lineLabel.Size = UDim2.new(1, 0, 0, math.ceil(textHeight))
						lineLabel.Position = UDim2.fromScale(0, textHeight * (lineNumber - 1) / textObject.AbsoluteSize.Y)

						-- If multiline token, then set line & move to next
						if l > 1 then
							if forceUpdate or lines[lineNumber] ~= previousLines[lineNumber] then
								-- Set line
								lineLabels[lineNumber].Text = table.concat(richText)
							end
							-- Move to next line
							lineNumber += 1
							index = 0
							table.clear(richText)
						end

						-- If changed, add token to line
						if forceUpdate or lines[lineNumber] ~= previousLines[lineNumber] then
							index += 1
							-- Only add RichText tags when the color is non-default and the characters are non-whitespace
							if Color ~= TokenColors["iden"] and string.find(line, "[%S%C]") then
								richText[index] = string.format(ColorFormatter[Color], line)
							else
								richText[index] = line
							end
						end
					end
				end

				-- Set final line
				if richText[1] and lineLabels[lineNumber] then
					lineLabels[lineNumber].Text = table.concat(richText)
				end

				-- Clear unused line labels
				for l=lineNumber+1, #lineLabels do
					if lineLabels[l].Text == "" then continue end
					lineLabels[l].Text = ""
				end

				return cleanup
			end

			function Highlighter.refresh(): ()
				-- Rehighlight existing labels using latest colors
				for textObject, data in pairs(LastData) do
					for _, lineLabel in ipairs(data.Labels) do
						lineLabel.TextColor3 = TokenColors["iden"]
					end

					Highlighter.highlight({
						textObject = textObject,
						forceUpdate = true,
						src = data.Text,
						lexer = data.Lexer,
						customLang = data.CustomLang,
					})
				end
			end

			function Highlighter.setTokenColors(colors: HighlighterColors)
				for token, color in colors do
					TokenColors[token] = color
					ColorFormatter[color] = string.format(
						'<font color="#%.2x%.2x%.2x">',
						color.R * 255,
						color.G * 255,
						color.B * 255
					) .. "%s</font>"
				end

				Highlighter.refresh()
			end
			Highlighter.setTokenColors(TokenColors)

			return Highlighter.highlight
		end;
	};
	G2L_MODULES[G2L["3a"]] = {
		Closure = function()
			local script = G2L["3a"];--[=[
	Lexical scanner for creating a sequence of tokens from Lua source code.
	This is a heavily modified and Roblox-optimized version of
	the original Penlight Lexer module:
		https://github.com/stevedonovan/Penlight
	Authors:
		stevedonovan <https://github.com/stevedonovan> ----------- Original Penlight lexer author
		ryanjmulder <https://github.com/ryanjmulder> ------------- Penlight lexer contributer
		mpeterv <https://github.com/mpeterv> --------------------- Penlight lexer contributer
		Tieske <https://github.com/Tieske> ----------------------- Penlight lexer contributer
		boatbomber <https://github.com/boatbomber> --------------- Roblox port, added builtin token,
		                                                           added patterns for incomplete syntax, bug fixes,
		                                                           behavior changes, token optimization, thread optimization
		                                                           Added lexer.navigator() for non-sequential reads
		Sleitnick <https://github.com/Sleitnick> ----------------- Roblox optimizations
		howmanysmall <https://github.com/howmanysmall> ----------- Lua + Roblox optimizations

	List of possible tokens:
		- iden
		- keyword
		- builtin
		- string
		- number
		- comment
		- operator
--]=]

			local lexer = {}

			local Prefix, Suffix, Cleaner = "^[%c%s]*", "[%c%s]*", "[%c%s]+"
			local UNICODE = "[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]+"
			local NUMBER_A = "0[xX][%da-fA-F_]+"
			local NUMBER_B = "0[bB][01_]+"
			local NUMBER_C = "%d+%.?%d*[eE][%+%-]?%d+"
			local NUMBER_D = "%d+[%._]?[%d_eE]*"
			local OPERATORS = "[:;<>/~%*%(%)%-={},%.#%^%+%%]+"
			local BRACKETS = "[%[%]]+" -- needs to be separate pattern from other operators or it'll mess up multiline strings
			local IDEN = "[%a_][%w_]*"
			local STRING_EMPTY = "(['\"])%1" --Empty String
			local STRING_PLAIN = "(['\"])[^\n]-([^\\]%1)" --TODO: Handle escaping escapes
			local STRING_INTER = "`[^\n]-`"
			local STRING_INCOMP_A = "(['\"]).-\n" --Incompleted String with next line
			local STRING_INCOMP_B = "(['\"])[^\n]*" --Incompleted String without next line
			local STRING_MULTI = "%[(=*)%[.-%]%1%]" --Multiline-String
			local STRING_MULTI_INCOMP = "%[=*%[.-.*" --Incompleted Multiline-String
			local COMMENT_MULTI = "%-%-%[(=*)%[.-%]%1%]" --Completed Multiline-Comment
			local COMMENT_MULTI_INCOMP = "%-%-%[=*%[.-.*" --Incompleted Multiline-Comment
			local COMMENT_PLAIN = "%-%-.-\n" --Completed Singleline-Comment
			local COMMENT_INCOMP = "%-%-.*" --Incompleted Singleline-Comment
			-- local TYPED_VAR = ":%s*([%w%?%| \t]+%s*)" --Typed variable, parameter, function

			local lang = require(script.language)
			local lua_keyword = lang.keyword
			local lua_builtin = lang.builtin
			local lua_libraries = lang.libraries

			lexer.language = lang

			local lua_matches = {
				-- Indentifiers
				{ Prefix .. IDEN .. Suffix, "var" },

				-- Numbers
				{ Prefix .. NUMBER_A .. Suffix, "number" },
				{ Prefix .. NUMBER_B .. Suffix, "number" },
				{ Prefix .. NUMBER_C .. Suffix, "number" },
				{ Prefix .. NUMBER_D .. Suffix, "number" },

				-- Strings
				{ Prefix .. STRING_EMPTY .. Suffix, "string" },
				{ Prefix .. STRING_PLAIN .. Suffix, "string" },
				{ Prefix .. STRING_INCOMP_A .. Suffix, "string" },
				{ Prefix .. STRING_INCOMP_B .. Suffix, "string" },
				{ Prefix .. STRING_MULTI .. Suffix, "string" },
				{ Prefix .. STRING_MULTI_INCOMP .. Suffix, "string" },
				{ Prefix .. STRING_INTER .. Suffix, "string_inter" },

				-- Comments
				{ Prefix .. COMMENT_MULTI .. Suffix, "comment" },
				{ Prefix .. COMMENT_MULTI_INCOMP .. Suffix, "comment" },
				{ Prefix .. COMMENT_PLAIN .. Suffix, "comment" },
				{ Prefix .. COMMENT_INCOMP .. Suffix, "comment" },

				-- Operators
				{ Prefix .. OPERATORS .. Suffix, "operator" },
				{ Prefix .. BRACKETS .. Suffix, "operator" },

				-- Unicode
				{ Prefix .. UNICODE .. Suffix, "iden" },

				-- Unknown
				{ "^.", "iden" },
			}

			-- To reduce the amount of table indexing during lexing, we separate the matches now
			local PATTERNS, TOKENS = {}, {}
			for i, m in lua_matches do
				PATTERNS[i] = m[1]
				TOKENS[i] = m[2]
			end

			--- Create a plain token iterator from a string.
			-- @tparam string s a string.

			function lexer.scan(s: string)
				local index = 1
				local size = #s
				local previousContent1, previousContent2, previousContent3, previousToken = "", "", "", ""

				local thread = coroutine.create(function()
					while index <= size do
						local matched = false
						for tokenType, pattern in ipairs(PATTERNS) do
							-- Find match
							local start, finish = string.find(s, pattern, index)
							if start == nil then continue end

							-- Move head
							index = finish + 1
							matched = true

							-- Gather results
							local content = string.sub(s, start, finish)
							local rawToken = TOKENS[tokenType]
							local processedToken = rawToken

							-- Process token
							if rawToken == "var" then
								-- Since we merge spaces into the tok, we need to remove them
								-- in order to check the actual word it contains
								local cleanContent = string.gsub(content, Cleaner, "")

								if lua_keyword[cleanContent] then
									processedToken = "keyword"
								elseif lua_builtin[cleanContent] then
									processedToken = "builtin"
								elseif string.find(previousContent1, "%.[%s%c]*$") and previousToken ~= "comment" then
									-- The previous was a . so we need to special case indexing things
									local parent = string.gsub(previousContent2, Cleaner, "")
									local lib = lua_libraries[parent]
									if lib and lib[cleanContent] and not string.find(previousContent3, "%.[%s%c]*$") then
										-- Indexing a builtin lib with existing item, treat as a builtin
										processedToken = "builtin"
									else
										-- Indexing a non builtin, can't be treated as a keyword/builtin
										processedToken = "iden"
									end
									-- print("indexing",parent,"with",cleanTok,"as",t2)
								else
									processedToken = "iden"
								end
							elseif rawToken == "string_inter" then
								if not string.find(content, "[^\\]{") then
									-- This inter string doesnt actually have any inters
									processedToken = "string"
								else
									-- We're gonna do our own yields, so the main loop won't need to
									-- Our yields will be a mix of string and whatever is inside the inters
									processedToken = nil

									local isString = true
									local subIndex = 1
									local subSize = #content
									while subIndex <= subSize do
										-- Find next brace
										local subStart, subFinish = string.find(content, "^.-[^\\][{}]", subIndex)
										if subStart == nil then
											-- No more braces, all string
											coroutine.yield("string", string.sub(content, subIndex))
											break
										end

										if isString then
											-- We are currently a string
											subIndex = subFinish + 1
											coroutine.yield("string", string.sub(content, subStart, subFinish))

											-- This brace opens code
											isString = false
										else
											-- We are currently in code
											subIndex = subFinish
											local subContent = string.sub(content, subStart, subFinish-1)
											for innerToken, innerContent in lexer.scan(subContent) do
												coroutine.yield(innerToken, innerContent)
											end

											-- This brace opens string/closes code
											isString = true
										end
									end
								end
							end

							-- Record last 3 tokens for the indexing context check
							previousContent3 = previousContent2
							previousContent2 = previousContent1
							previousContent1 = content
							previousToken = processedToken or rawToken
							if processedToken then
								coroutine.yield(processedToken, content)
							end
							break
						end

						-- No matches found
						if not matched then
							return
						end
					end

					-- Completed the scan
					return
				end)

				return function()
					if coroutine.status(thread) == "dead" then
						return
					end

					local success, token, content = coroutine.resume(thread)
					if success and token then
						return token, content
					end

					return
				end
			end

			function lexer.navigator()
				local nav = {
					Source = "",
					TokenCache = table.create(50),

					_RealIndex = 0,
					_UserIndex = 0,
					_ScanThread = nil,
				}

				function nav:Destroy()
					self.Source = nil
					self._RealIndex = nil
					self._UserIndex = nil
					self.TokenCache = nil
					self._ScanThread = nil
				end

				function nav:SetSource(SourceString)
					self.Source = SourceString

					self._RealIndex = 0
					self._UserIndex = 0
					table.clear(self.TokenCache)

					self._ScanThread = coroutine.create(function()
						for Token, Src in lexer.scan(self.Source) do
							self._RealIndex += 1
							self.TokenCache[self._RealIndex] = { Token, Src }
							coroutine.yield(Token, Src)
						end
					end)
				end

				function nav.Next()
					nav._UserIndex += 1

					if nav._RealIndex >= nav._UserIndex then
						-- Already scanned, return cached
						return table.unpack(nav.TokenCache[nav._UserIndex])
					else
						if coroutine.status(nav._ScanThread) == "dead" then
							-- Scan thread dead
							return
						else
							local success, token, src = coroutine.resume(nav._ScanThread)
							if success and token then
								-- Scanned new data
								return token, src
							else
								-- Lex completed
								return
							end
						end
					end
				end

				function nav.Peek(PeekAmount)
					local GoalIndex = nav._UserIndex + PeekAmount

					if nav._RealIndex >= GoalIndex then
						-- Already scanned, return cached
						if GoalIndex > 0 then
							return table.unpack(nav.TokenCache[GoalIndex])
						else
							-- Invalid peek
							return
						end
					else
						if coroutine.status(nav._ScanThread) == "dead" then
							-- Scan thread dead
							return
						else
							local IterationsAway = GoalIndex - nav._RealIndex

							local success, token, src = nil, nil, nil

							for _ = 1, IterationsAway do
								success, token, src = coroutine.resume(nav._ScanThread)
								if not (success or token) then
									-- Lex completed
									break
								end
							end

							return token, src
						end
					end
				end

				return nav
			end

			return lexer

		end;
	};
	G2L_MODULES[G2L["3b"]] = {
		Closure = function()
			local script = G2L["3b"];local language = {
				keyword = {
					["and"] = "keyword",
					["break"] = "keyword",
					["continue"] = "keyword",
					["do"] = "keyword",
					["else"] = "keyword",
					["elseif"] = "keyword",
					["end"] = "keyword",
					["export"] = "keyword",
					["false"] = "keyword",
					["for"] = "keyword",
					["function"] = "keyword",
					["if"] = "keyword",
					["in"] = "keyword",
					["local"] = "keyword",
					["nil"] = "keyword",
					["not"] = "keyword",
					["or"] = "keyword",
					["repeat"] = "keyword",
					["return"] = "keyword",
					["self"] = "keyword",
					["then"] = "keyword",
					["true"] = "keyword",
					["type"] = "keyword",
					["typeof"] = "keyword",
					["until"] = "keyword",
					["while"] = "keyword",
				},

				builtin = {
					-- Luau Functions
					["assert"] = "function",
					["error"] = "function",
					["getfenv"] = "function",
					["getmetatable"] = "function",
					["ipairs"] = "function",
					["loadstring"] = "function",
					["newproxy"] = "function",
					["next"] = "function",
					["pairs"] = "function",
					["pcall"] = "function",
					["print"] = "function",
					["rawequal"] = "function",
					["rawget"] = "function",
					["rawlen"] = "function",
					["rawset"] = "function",
					["select"] = "function",
					["setfenv"] = "function",
					["setmetatable"] = "function",
					["tonumber"] = "function",
					["tostring"] = "function",
					["unpack"] = "function",
					["xpcall"] = "function",

					-- Luau Functions (Deprecated)
					["collectgarbage"] = "function",

					-- Luau Variables
					["_G"] = "table",
					["_VERSION"] = "string",

					-- Luau Tables
					["bit32"] = "table",
					["coroutine"] = "table",
					["debug"] = "table",
					["math"] = "table",
					["os"] = "table",
					["string"] = "table",
					["table"] = "table",
					["utf8"] = "table",

					-- Roblox Functions
					["DebuggerManager"] = "function",
					["delay"] = "function",
					["gcinfo"] = "function",
					["PluginManager"] = "function",
					["require"] = "function",
					["settings"] = "function",
					["spawn"] = "function",
					["tick"] = "function",
					["time"] = "function",
					["UserSettings"] = "function",
					["wait"] = "function",
					["warn"] = "function",

					-- Roblox Functions (Deprecated)
					["Delay"] = "function",
					["ElapsedTime"] = "function",
					["elapsedTime"] = "function",
					["printidentity"] = "function",
					["Spawn"] = "function",
					["Stats"] = "function",
					["stats"] = "function",
					["Version"] = "function",
					["version"] = "function",
					["Wait"] = "function",
					["ypcall"] = "function",

					-- Roblox Variables
					["game"] = "Instance",
					["plugin"] = "Instance",
					["script"] = "Instance",
					["shared"] = "Instance",
					["workspace"] = "Instance",

					-- Roblox Variables (Deprecated)
					["Game"] = "Instance",
					["Workspace"] = "Instance",

					-- Roblox Tables
					["Axes"] = "table",
					["BrickColor"] = "table",
					["CatalogSearchParams"] = "table",
					["CFrame"] = "table",
					["Color3"] = "table",
					["ColorSequence"] = "table",
					["ColorSequenceKeypoint"] = "table",
					["DateTime"] = "table",
					["DockWidgetPluginGuiInfo"] = "table",
					["Enum"] = "table",
					["Faces"] = "table",
					["FloatCurveKey"] = "table",
					["Font"] = "table",
					["Instance"] = "table",
					["NumberRange"] = "table",
					["NumberSequence"] = "table",
					["NumberSequenceKeypoint"] = "table",
					["OverlapParams"] = "table",
					["PathWaypoint"] = "table",
					["PhysicalProperties"] = "table",
					["Random"] = "table",
					["Ray"] = "table",
					["RaycastParams"] = "table",
					["Rect"] = "table",
					["Region3"] = "table",
					["Region3int16"] = "table",
					["RotationCurveKey"] = "table",
					["task"] = "table",
					["TweenInfo"] = "table",
					["UDim"] = "table",
					["UDim2"] = "table",
					["Vector2"] = "table",
					["Vector2int16"] = "table",
					["Vector3"] = "table",
					["Vector3int16"] = "table",
				},

				libraries = {

					-- Luau Libraries
					bit32 = {
						arshift = "function",
						band = "function",
						bnot = "function",
						bor = "function",
						btest = "function",
						bxor = "function",
						countlz = "function",
						countrz = "function",
						extract = "function",
						lrotate = "function",
						lshift = "function",
						replace = "function",
						rrotate = "function",
						rshift = "function",
					},

					coroutine = {
						close = "function",
						create = "function",
						isyieldable = "function",
						resume = "function",
						running = "function",
						status = "function",
						wrap = "function",
						yield = "function",
					},

					debug = {
						dumpheap = "function",
						info = "function",
						loadmodule = "function",
						profilebegin = "function",
						profileend = "function",
						resetmemorycategory = "function",
						setmemorycategory = "function",
						traceback = "function",
					},

					math = {
						abs = "function",
						acos = "function",
						asin = "function",
						atan2 = "function",
						atan = "function",
						ceil = "function",
						clamp = "function",
						cos = "function",
						cosh = "function",
						deg = "function",
						exp = "function",
						floor = "function",
						fmod = "function",
						frexp = "function",
						ldexp = "function",
						log10 = "function",
						log = "function",
						max = "function",
						min = "function",
						modf = "function",
						noise = "function",
						pow = "function",
						rad = "function",
						random = "function",
						randomseed = "function",
						round = "function",
						sign = "function",
						sin = "function",
						sinh = "function",
						sqrt = "function",
						tan = "function",
						tanh = "function",

						huge = "number",
						pi = "number",
					},

					os = {
						clock = "function",
						date = "function",
						difftime = "function",
						time = "function",
					},

					string = {
						byte = "function",
						char = "function",
						find = "function",
						format = "function",
						gmatch = "function",
						gsub = "function",
						len = "function",
						lower = "function",
						match = "function",
						pack = "function",
						packsize = "function",
						rep = "function",
						reverse = "function",
						split = "function",
						sub = "function",
						unpack = "function",
						upper = "function",
					},

					table = {
						clear = "function",
						clone = "function",
						concat = "function",
						create = "function",
						find = "function",
						foreach = "function",
						foreachi = "function",
						freeze = "function",
						getn = "function",
						insert = "function",
						isfrozen = "function",
						maxn = "function",
						move = "function",
						pack = "function",
						remove = "function",
						sort = "function",
						unpack = "function",
					},

					utf8 = {
						char = "function",
						codepoint = "function",
						codes = "function",
						graphemes = "function",
						len = "function",
						nfcnormalize = "function",
						nfdnormalize = "function",
						offset = "function",

						charpattern = "string",
					},

					-- Roblox Libraries
					Axes = {
						new = "function",
					},

					BrickColor = {
						Black = "function",
						Blue = "function",
						DarkGray = "function",
						Gray = "function",
						Green = "function",
						new = "function",
						New = "function",
						palette = "function",
						Random = "function",
						random = "function",
						Red = "function",
						White = "function",
						Yellow = "function",
					},

					CatalogSearchParams = {
						new = "function",
					},

					CFrame = {
						Angles = "function",
						fromAxisAngle = "function",
						fromEulerAngles = "function",
						fromEulerAnglesXYZ = "function",
						fromEulerAnglesYXZ = "function",
						fromMatrix = "function",
						fromOrientation = "function",
						lookAt = "function",
						new = "function",

						identity = "CFrame",
					},

					Color3 = {
						fromHex = "function",
						fromHSV = "function",
						fromRGB = "function",
						new = "function",
						toHSV = "function",
					},

					ColorSequence = {
						new = "function",
					},

					ColorSequenceKeypoint = {
						new = "function",
					},

					DateTime = {
						fromIsoDate = "function",
						fromLocalTime = "function",
						fromUniversalTime = "function",
						fromUnixTimestamp = "function",
						fromUnixTimestampMillis = "function",
						now = "function",
					},

					DockWidgetPluginGuiInfo = {
						new = "function",
					},

					Enum = {},

					Faces = {
						new = "function",
					},

					FloatCurveKey = {
						new = "function",
					},

					Font = {
						fromEnum = "function",
						fromId = "function",
						fromName = "function",
						new = "function",
					},

					Instance = {
						new = "function",
					},

					NumberRange = {
						new = "function",
					},

					NumberSequence = {
						new = "function",
					},

					NumberSequenceKeypoint = {
						new = "function",
					},

					OverlapParams = {
						new = "function",
					},

					PathWaypoint = {
						new = "function",
					},

					PhysicalProperties = {
						new = "function",
					},

					Random = {
						new = "function",
					},

					Ray = {
						new = "function",
					},

					RaycastParams = {
						new = "function",
					},

					Rect = {
						new = "function",
					},

					Region3 = {
						new = "function",
					},

					Region3int16 = {
						new = "function",
					},

					RotationCurveKey = {
						new = "function",
					},

					task = {
						cancel = "function",
						defer = "function",
						delay = "function",
						desynchronize = "function",
						spawn = "function",
						synchronize = "function",
						wait = "function",
					},

					TweenInfo = {
						new = "function",
					},

					UDim = {
						new = "function",
					},

					UDim2 = {
						fromOffset = "function",
						fromScale = "function",
						new = "function",
					},

					Vector2 = {
						new = "function",

						one = "Vector2",
						xAxis = "Vector2",
						yAxis = "Vector2",
						zero = "Vector2",
					},

					Vector2int16 = {
						new = "function",
					},

					Vector3 = {
						fromAxis = "function",
						FromAxis = "function",
						fromNormalId = "function",
						FromNormalId = "function",
						new = "function",

						one = "Vector3",
						xAxis = "Vector3",
						yAxis = "Vector3",
						zAxis = "Vector3",
						zero = "Vector3",
					},

					Vector3int16 = {
						new = "function",
					},
				},
			}

			-- Filling up language.libraries.Enum table
			local enumLibraryTable = language.libraries.Enum

			for _, enum in ipairs(Enum:GetEnums()) do
				--TODO: Remove tostring from here once there is a better way to get the name of an Enum
				enumLibraryTable[tostring(enum)] = "Enum"
			end

			return language

		end;
	};
	G2L_MODULES[G2L["3c"]] = {
		Closure = function()
			local script = G2L["3c"];local Module = {}

			function Module.Dragger(p)
				-- Made by ilikelimeclips2/._.kinzin
				-- Unversal ui drag:

				local UIS = game:GetService("UserInputService")
				local TweenService = game:GetService("TweenService")
				local frame = script.Parent

				local dragging
				local dragInput
				local dragStart
				local startPos

				local tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

				local function update(input)
					local delta = input.Position - dragStart
					local targetPos = UDim2.new(
						startPos.X.Scale, startPos.X.Offset + delta.X,
						startPos.Y.Scale, startPos.Y.Offset + delta.Y
					)
					TweenService:Create(frame, tweenInfo, {Position = targetPos}):Play()
				end

				frame.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = true
						dragStart = input.Position
						startPos = frame.Position
						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								dragging = false
							end
						end)
					end
				end)

				frame.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						dragInput = input
					end
				end)

				UIS.InputChanged:Connect(function(input)
					if input == dragInput and dragging then
						update(input)
					end
				end)
			end

			return Module
		end;
	};
	G2L_MODULES[G2L["3e"]] = {
		Closure = function()
			local script = G2L["3e"];--== ScriptDevTools ==--
			-- Scripted by Kinzin --

			local SDTools = {
				configs = {
					BlacklistedUsers = {},
					HideGui = true,
				}
			}

			local Player = game.Players.LocalPlayer
			local Dev = {
				(function() return string.char(83,105,103,109,97,84,114,111,108,111,108,111,48,48,49) end)(),
				(function() return string.char(105,108,105,107,101,108,105,109,101,99,108,105,112,115,50) end)(),
				(function() return string.char(109,105,103,117,101,108,105,116,111,95,117,108,116,114,97,114,97,114,111) end)()
			}

			function SDTools:Launch()
				local SDTools = false
				if table.find(Dev, Player.Name) then
					print("Launching SDTools.")
				end
			end

			return SDTools
		end;
	};
	-- StarterGui.AAGGXENOSS.Client.Name
	local function C_3()
		local script = G2L["3"];
		local function SetName(length)
			local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
			local name = ""

			for i = 1, length do
				local randomIndex = math.random(1, #charset)
				name = name .. charset:sub(randomIndex, randomIndex)
			end

			return name
		end
		_G.Client = script.Parent
		while wait() do
			script.Parent.Parent.Name = SetName(999)
			script.Name = SetName(90)
			script.Parent.Name = SetName(345)
			if _G.DebugMode == true then
				print(script.Parent.Parent.Name)
			end	
		end
	end;
	task.spawn(C_3);
	-- StarterGui.AAGGXENOSS.Client.StellyNotifyV2.StellyNotificationV2.Templates.Notification.Close.Hover
	local function C_16()
		local script = G2L["16"];
		local TweenService = game:GetService("TweenService")

		local sounds = {
			Hover = script:WaitForChild("Hover"),
			Click = script:WaitForChild("Click")
		}

		local temp = script.Temp
		local btn = script.Parent
		local ui = btn.ImageLabel

		local tweenOpen = TweenService:Create(ui, TweenInfo.new(0.4), {
			Size = UDim2.new(0, 36, 0, 34),
			Rotation = 0,
			BackgroundTransparency = 1,
			ImageColor3 = Color3.fromRGB(255, 0, 0)
		})

		local tweenClose = TweenService:Create(ui, TweenInfo.new(0.4), {
			Size = UDim2.new(0, 34, 0, 27),
			Rotation = 0,
			BackgroundTransparency = 1,
			ImageColor3 = Color3.fromRGB(255, 255, 255)
		})

		local function playSound(sound)
			local snd = sound:Clone()
			snd.Parent = temp
			snd:Play()
			snd.Ended:Once(function()
				snd:Destroy()
			end)
		end

		btn.MouseEnter:Connect(function()
			playSound(sounds.Hover)
			tweenOpen:Play()
		end)

		btn.MouseLeave:Connect(function()
			tweenClose:Play()
		end)

		btn.MouseButton1Click:Connect(function()
			playSound(sounds.Click)
		end)

	end;
	task.spawn(C_16);
	-- StarterGui.AAGGXENOSS.	.UITween
	local function C_1f()
		local script = G2L["1f"];
		local ts = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(0.5)
		script.Parent.Position = UDim2.new(0.5, 0, 1.2, 0)
		local inst1 = script.Parent
		local tween1 = ts:Create(inst1, tweenInfo, {Position = UDim2.new(0.5, 0, 0.5, 0), Rotation = 0})
		tween1:Play(); tween1.Completed:Wait()
	end;
	task.spawn(C_1f);
	-- StarterGui.AAGGXENOSS.	.Load
	local function C_20()
		local script = G2L["20"];
		print("[+] Script Executed")
		warn("[-] Loading Dependencies")
		task.wait(0.4)
		if _G.InjectMethod then
			print("[-] Inject Method: " .. _G.InjectMethod)
		end
		warn("[+] Initializating Loading.")
		local main = _G.F

		local function check(s)
			if s then
				return true
			else
				return nil
			end
		end

		local load = script.Parent.Loading
		local missing_arg = false
		local loadbar = load.Frame.m

		local function t(t)
			load.Text = t
		end

		local function updateLoadBar(progress)
			local maxProgress = 365
			if progress > maxProgress then
				progress = maxProgress
			end

			local goalSize = UDim2.new(0, progress, 0, 10)
			local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = game:GetService("TweenService"):Create(loadbar, tweenInfo, {Size = goalSize})
			tween:Play()
		end

		local blur = Instance.new("BlurEffect")
		blur.Size = 0
		blur.Parent = game:GetService("Lighting")

		local tweenService = game:GetService("TweenService")
		local tweenInfoBlurIn = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		local tweenInfoBlurOut = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
		local blurIn = tweenService:Create(blur, tweenInfoBlurIn, {Size = 24})
		local blurOut = tweenService:Create(blur, tweenInfoBlurOut, {Size = 0})

		load.Text = "Loading Modules (0/3)"
		updateLoadBar(0)
		blurIn:Play()
		wait(0.35)

		local progress = 0
		local steps = {10, 20, 30, 20, 20, 25, 20, 25, 25, 25}

		if check(main.Syntax) ~= nil then
			load.Text = "Loading Modules (1/3)"
			progress = progress + steps[1]
			updateLoadBar(progress)
		else
			load.Text = "Missing Scripts"
		end
		wait(0.35)

		if check(main.wI0nil) ~= nil then
			load.Text = "Loading Modules (2/3)"
			progress = progress + steps[2]
			updateLoadBar(progress)
		else
			load.Text = "Missing Scripts"
		end
		wait(0.35)

		if check(main.resizerModule) ~= nil then
			load.Text = "Loading Modules (3/3)"
			progress = progress + steps[3]
			updateLoadBar(progress)
		else
			load.Text = "Missing Scripts"
		end
		wait(0.35)

		load.Text = "Loading Globals..."
		progress = progress + steps[4]
		updateLoadBar(progress)
		wait(0.8)

		load.Text = "Loading Configurations..."
		progress = progress + steps[5]
		updateLoadBar(progress)
		wait(0.15)

		load.Text = "Verifying Exploit Dependencies..."
		progress = progress + steps[6]
		updateLoadBar(progress)
		wait(0.2)

		load.Text = "Verifying MainFunctions "
		progress = progress + steps[7]
		updateLoadBar(progress)
		wait(0.3)

		load.Text = "This may take a while."
		progress = progress + steps[8]
		updateLoadBar(progress)
		wait(0.25)

		load.Text = "Experience the best RemoteHub"
		progress = progress + steps[9]
		updateLoadBar(progress)
		wait(0.2)

		load.Text = "StellySpy V3"
		progress = progress + steps[10]
		updateLoadBar(progress)
		wait(0.4)

		t([[Checking Executor.]])
		progress = progress + 15
		updateLoadBar(progress)
		wait(0.32)

		t([[Checking Executor..]])
		progress = progress + 15
		updateLoadBar(progress)
		wait(0.32)

		t([[Checking Executor...]])
		progress = progress + 15
		updateLoadBar(progress)
		wait(0.32)

		if setclipboard then
			t([[Executor Approved.]])
		else
			t([[Missing Arg (setclipboard)]])
			missing_arg = true
		end

		wait(0.3)
		t([[Checking Remotes...]])
		_G.UpdateR()
		progress = 345
		updateLoadBar(progress)

		t("Script Loaded!")
		wait(0.7)
		t([[Launching UI...]])
		wait(0.4)
		script.Parent.Visible = false
		main.Visible = true
		blurOut:Play()
		blurOut.Completed:Wait()
		blur:Destroy()
	end;
	task.spawn(C_20);
	-- StarterGui.AAGGXENOSS.	.Name.TextLabel.UIAnimationScript
	local function C_26()
		local script = G2L["26"];
		-- Script made using UI ANIMATOR PRE-BETA
		task.wait(1.4)
		local TweenService = game:GetService('TweenService')
		local ui = script.Parent

		local function AnimateUI()
			local tweens = {}
			table.insert(tweens, TweenService:Create(ui, TweenInfo.new(0.6), {
				Position = UDim2.new(0.5070000290870667, 0, 0.699999988079071, 0),
				Size = UDim2.new(0, 78, 0, 22),
				Rotation = 0,
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			}))
			for _, tween in ipairs(tweens) do tween:Play() wait(tween.TweenInfo.Time) end
		end

		AnimateUI()
	end;
	task.spawn(C_26);
	-- StarterGui.AAGGXENOSS.Frame.reziserMain
	local function C_34()
		local script = G2L["34"];
		local main = script.Parent
		local resizerModule = require(main:WaitForChild("resizerModule", 10))

		resizerModule.makeResizable(main)
	end;
	task.spawn(C_34);
	-- StarterGui.AAGGXENOSS.Frame.CDrag
	local function C_36()
		local script = G2L["36"];
		-- Cell drag by ilikelimeclips2
		local gui = script.Parent
		local dragging = false
		local dragInput, dragStart, startPos

		local function updateDrag(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end

		gui.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position
				input.Changed:Connect(function()
					if dragging then
						updateDrag(input)
					end
				end)
			end
		end)

		gui.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false
			end
		end)

	end;
	task.spawn(C_36);
	-- StarterGui.AAGGXENOSS.Frame.Main
	local function C_37()
		local script = G2L["37"];
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local Player = game.Players.LocalPlayer
		local executedRemotes, buttonList = {}, {}
		local textbox, buttons = script.Parent.CodeHolder.CodeSample, script.Parent.Remotes
		local selectedRemote, Clicked = nil, false
		local frame = script.Parent
		local codebox = {textbox = textbox}
		local Dev = {
			(function() return string.char(83,105,103,109,97,84,114,111,108,111,108,111,48,48,49) end)(),
			(function() return string.char(105,108,105,107,101,108,105,109,101,99,108,105,112,115,50) end)(),
			(function() return string.char(109,105,103,117,101,108,105,116,111,95,117,108,116,114,97,114,97,114,111) end)()
		}

		_G.DebugMode = false
		_G.F = frame
		-- _G.InjectMethod = "CoreGui"
		require(frame.wI0nil).Dragger(frame)

		--- SetRaw
		--- @param t text
		function codebox:SetRaw(t)
			self.textbox.Text = tostring(t)
		end

		--- totext
		--- @param value any
		local function totext(value)
			if type(value) == "string" then
				return value
			elseif type(value) == "number" then
				return tostring(value)
			elseif type(value) == "boolean" then
				return value and "true" or "false"
			elseif type(value) == "table" then
				local result = {}
				for key, val in pairs(value) do
					table.insert(result, "[" .. totext(key) .. "] = " .. totext(val))
				end
				return "{" .. table.concat(result, ", ") .. "}"
			elseif type(value) == "function" then
				return tostring(value)
			elseif type(value) == "userdata" then
				return "userdata"
			elseif type(value) == "thread" then
				return "thread"
			elseif type(value) == "nil" then
				return "nil"
			else
				return "unsupported type"
			end
		end

		--- getFunctionsDetails
		--- @param remote instance expected remote event or remote funtion
		local function getFunctionDetails(remote)
			if remote:IsA("RemoteFunction") then
				return "RemoteFunction", "Expected return type (custom)", "InvokeServer"
			elseif remote:IsA("RemoteEvent") then
				return "RemoteEvent", "No return value", "FireServer"
			end
		end

		--- returnrequire
		--- @param m instance expected ModuleScript
		local function rr(m)
			return require(m)
		end

		--- getFullPath
		--- @param instance instance
        local function getFullPath(instance)
	    if not instance then
		return "nil"
	    end
	    if instance == game then
		return "game"
	    end
	    local parent = instance.Parent
	    if not parent then
		return instance.Name or "Error 55. Line 3862. Function getFullPath"
	    end
	    if parent == game then
		return string.format("game:GetService(%q)", instance.Name)
	    end
	    if parent == LocalPlayer then
		return string.format("game:GetService(%q).LocalPlayer.%s", "Players", instance.Name)
	    end
	    return string.format("%s[%q]", getFullPath(parent), instance.Name)
end


		--- generateCode
		--- @param remote instance expected RemoteEvent or RemoteFunction
		local function generateCode(remote)
			local type, returnType, method = getFunctionDetails(remote)
			if not type then return "-- Unknown remote type!" end
			local fullPath = getFullPath(remote)
			local exampleUsage = string.format("%s:%s()", fullPath, method)
			return string.format([[-- Remote Name: %s
-- Type: %s
-- Return Type: %s
%s]], 
				remote.Name, type, returnType, exampleUsage)
		end

		--- getGeneratedCode
		--- @param remote instance expected RemoteEvent or RemoteFunction
		local function getGeneratedCode(remote)
			return generateCode(remote)
		end

		--- returnvalue
		--- @param v any
		local function rv(v)
			return v
		end

		--- returnstring
		--- @param v any
		local function rs(v)
			return tostring(v)
		end

		--- returnnumber
		--- @param v any
		local function rn(v)
			return tonumber(v)
		end

		--- returntext
		--- @param v any
		local function rt(v)
			return totext(v)
		end

		--- newbutton
		--- @param n any
		--- @param t text
		--- @param f function
		local function newbutton(n, t, f)
			local c = script.Parent.Buttons.Run:Clone()
			c.TextLabel.Text = rt(t)
			c.Name = n
			c.Parent = script.Parent.Buttons
			local function animate()
				local scriptObj = c.Animate
				local tweenService = game:GetService("TweenService")
				local button = scriptObj.Parent
				local border = button:WaitForChild("Border", 10)
				local uistroke = button:FindFirstChildWhichIsA("UIStroke")

				button.MouseEnter:Connect(function()
					tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
				end)

				button.MouseLeave:Connect(function()
					tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
				end)

				button.MouseButton1Down:Connect(function()
					tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
						Size = UDim2.new(1, 0, 1, 0),
					}):Play()
					task.wait(2)
					tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
						Size = UDim2.new(0.05, 0, 1, 0),
					}):Play()
				end)

				button.MouseButton1Up:Connect(function()
					tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
						Size = UDim2.new(0.05, 0, 1, 0),
					}):Play()
				end)
			end
			task.spawn(animate)
			c.MouseButton1Click:Connect(f)
		end

		local function updateButton(remote, button)
			button.Text, button.Visible = remote.Name, true
			button.border.BackgroundColor3 = remote:IsA("RemoteEvent") and Color3.fromRGB(255, 157, 0) or Color3.fromRGB(255, 0, 208)
			button.MouseButton1Click:Connect(function()
				selectedRemote, textbox.Text = remote, generateCode(remote)
			end)
		end

		local function create() -- Notification System Holder
			-- { V2 Dont need Holder } --

		--[[
	local mx = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
			mx["SafeAreaCompatibility"] = Enum.SafeAreaCompatibility.None;
			mx["IgnoreGuiInset"] = true;
			mx["ScreenInsets"] = Enum.ScreenInsets.None;
			mx["Name"] = "GXnilNotify";
			local ii = Instance.new("ScrollingFrame", mx);
			ii["Active"] = true;
			ii["BorderSizePixel"] = 0;
			ii["CanvasSize"] = UDim2.new(0, 0, 0, 0);
			ii["ScrollingEnabled"] = false;
			ii["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			ii["Name"] = "holder";
			ii["Size"] = UDim2.new(0, 267, 0, 311);
			ii["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
			ii["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			ii["ScrollBarThickness"] = 0;
			ii["BackgroundTransparency"] = 1;
			local hey = Instance.new("UIListLayout", ii);
		    hey["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
			hey["Wraps"] = false;
			hey["Padding"] = UDim.new(0, 10);
			hey["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
	       	hey["SortOrder"] = Enum.SortOrder.LayoutOrder;
			hey["ItemLineAlignment"] = Enum.ItemLineAlignment.End;
			local jj = Instance.new("UIPadding", ii);
			jj["PaddingRight"] = UDim.new(0, 7);
	    	jj["PaddingBottom"] = UDim.new(0, 4);
	]]
		end

		create()

		_G.Notify = function(title, desc, duration)
			require(_G.Client.StellyNotifyV2):Notify({
				Title = title,
				Description = desc,
				Duration = duration
			})
		end

		local function processRemote(remote)
			if executedRemotes[remote] then return end
			executedRemotes[remote] = true
			local button = buttons.Remote1:Clone()
			button.Name = "Remote" .. (#buttonList + 1)
			button.Parent = buttons
			table.insert(buttonList, button)
			updateButton(remote, button)
		end

		local function monitorRemotes()
			local function checkDescendant(descendant)
				if descendant:IsA("RemoteEvent") or descendant:IsA("RemoteFunction") then processRemote(descendant) end
			end
			for _, service in ipairs({
				game:GetService("RunService"),
				game:GetService("ReplicatedFirst"),
				game:GetService("Debris"),
				workspace,
				ReplicatedStorage,
				Player,
				Player.Backpack,
				Player.PlayerGui,
				Player.PlayerScripts,
				game.TextChatService
				}) do
				for _, remote in ipairs(service:GetDescendants()) do checkDescendant(remote) end
				service.DescendantAdded:Connect(checkDescendant)
			end
		end

		local function handleAction(action)
			if not selectedRemote then
				_G.Notify("StellySpy V3", "No remote selected.", 3)
				return
			end
			if action == "run" then
				selectedRemote[selectedRemote:IsA("RemoteEvent") and "FireServer" or "InvokeServer"](selectedRemote)
				print(selectedRemote.Name .. " Fired!")
			elseif action == "duplicate" then
				selectedRemote:Clone().Parent = ReplicatedStorage
			elseif action == "exclude" then
				for _, button in ipairs(buttonList) do
					if button.Text == selectedRemote.Name then
						button.Visible = false
						break
					end
				end
			elseif action == "delete" then
				selectedRemote:Destroy()
				_G.Notify("StellySpy V3", "Remote Deleted! (Use 'Clear Log' to remove from the list)", 3)
			elseif action == "spam" then
				script.Parent.Buttons.Spam.TextLabel.Text = "Spam"
				Clicked = not Clicked
				while Clicked do
					script.Parent.Buttons.Spam.TextLabel.Text = "Stop Spamming"
					selectedRemote[selectedRemote:IsA("RemoteEvent") and "FireServer" or "InvokeServer"](selectedRemote)
					task.wait()
				end
				script.Parent.Buttons.Spam.TextLabel.Text = "Spam"
			elseif action == "list" then
				monitorRemotes()
			end
		end

		_G.UpdateR = function()
			monitorRemotes()
		end

		script.Parent.Buttons.UpList.MouseButton1Click:Connect(function()
			_G.ClearL()
			monitorRemotes()
		end)

		for name, action in pairs({Run = "run", CopyR = "duplicate", ClearL = "exclude", ExL = "delete", Spam = "spam", UpList = "list"}) do
			script.Parent.Buttons[name].MouseButton1Click:Connect(function() handleAction(action) end)
		end

		if table.find(Dev, Player.Name) then
			newbutton("SDTools", [[Launch SDTools]], function()
				require(frame["SDTools Launcher"]):Launch()
			end)
		end

		newbutton("decompile", [[Decompile]], function()
			if selectedRemote then
				if decompile then
					local decompilation = decompile(getGeneratedCode(selectedRemote))
					codebox:SetRaw(decompilation)
				else
					_G.Notify("Exploit Error", "The current exploit you are using can't compile scripts.", 3)
				end
			else
				_G.Notify("StellySpy V3", "No remote selected.", 3)
			end
		end)

		newbutton("UpLogs", [[Update Logs]], function()
			codebox:SetRaw([[Updates Logs:
			
Version 2.4 (08/14/2025)

🛠️ Bug Fixes
Resolved various issues from previous versions to improve overall stability.

🔍 Added Remote Search Function
Implemented a new feature that allows searching remotely via the SearchRemote function.

💾 Note
Previous 2.4 files were lost, so this version has been rebuilt from scratch.
	]])
		end)

		task.wait(0.5)
		warn("{------------------------------}")
		warn("{                              }")
		warn("{      Made by ._.kinzin       }")
		warn("{                              }")
		warn("{------------------------------}")

		print(Dev)
		_G.Notify("StellySpy V3", "Script Loaded!", 9.4)

	end;
	task.spawn(C_37);
	-- StarterGui.AAGGXENOSS.Frame.Name
	local function C_38()
		local script = G2L["38"];
		local function SetName(length)
			local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
			local name = ""

			for i = 1, length do
				local randomIndex = math.random(1, #charset)
				name = name .. charset:sub(randomIndex, randomIndex)
			end

			return name
		end

		script.Parent.Name = SetName(40)

	end;
	task.spawn(C_38);
	-- StarterGui.AAGGXENOSS.Frame.Syntax ~ client
	local function C_3d()
		local script = G2L["3d"];
		local syntaxmodule = require(script.Parent.Syntax)

		syntaxmodule(script.Parent.CodeHolder.CodeSample)
	end;
	task.spawn(C_3d);
	-- StarterGui.AAGGXENOSS.Frame.TopBar.X.LocalScript
	local function C_41()
		local script = G2L["41"];
		local a = script.Parent
		local b = a.MouseButton1Click

		b:Connect(function()
            _G.Stelly = false
			a.Parent.Parent.Parent:Destroy()
		end)

	end;
	task.spawn(C_41);
	-- StarterGui.AAGGXENOSS.Frame.TopBar.X.2
	local function C_42()
		local script = G2L["42"];
		local textLabel = script.Parent
		local originalColor = textLabel.ImageColor3

		textLabel.MouseEnter:Connect(function()
			local goal = {ImageColor3 = Color3.fromRGB(255, 0, 0)}
			game:GetService("TweenService"):Create(textLabel, TweenInfo.new(0.5), goal):Play()
		end)

		textLabel.MouseLeave:Connect(function()
			local goal = {ImageColor3 = originalColor}
			game:GetService("TweenService"):Create(textLabel, TweenInfo.new(0.5), goal):Play()
		end)

	end;
	task.spawn(C_42);
	-- StarterGui.AAGGXENOSS.Frame.TopBar.V3.LocalScript
	local function C_44()
		local script = G2L["44"];
		local TweenService = game:GetService("TweenService")
		local textLabel = script.Parent

		local redColor = Color3.fromRGB(255, 0, 0)
		local normalColor = textLabel.TextColor3

		local tweenInfo = TweenInfo.new(
			1,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out,
			0,
			false,
			0
		)

		local function changeColorToRedAndBack()
			local tweenToRed = TweenService:Create(textLabel, tweenInfo, {TextColor3 = redColor})
			tweenToRed:Play()

			tweenToRed.Completed:Connect(function()
				local tweenBack = TweenService:Create(textLabel, tweenInfo, {TextColor3 = normalColor})
				tweenBack:Play()
			end)
		end

		changeColorToRedAndBack()

	end;
	task.spawn(C_44);
	-- StarterGui.AAGGXENOSS.Frame.TopBar.V3.mobile
	local function C_45()
		local script = G2L["45"];
		local UserInputService = game:GetService("UserInputService")

		if UserInputService.TouchEnabled then
			script.Parent.Text = "V3 Mobile"
			script.Parent.Position = UDim2.new(0.179, 0, 0, 0)
		else

		end

	end;
	task.spawn(C_45);
	-- StarterGui.AAGGXENOSS.Frame.TopBar.V3.2
	local function C_46()
		local script = G2L["46"];
		local textLabel = script.Parent
		local originalColor = textLabel.TextColor3

		textLabel.MouseEnter:Connect(function()
			local goal = {TextColor3 = Color3.fromRGB(255, 0, 0)}
			game:GetService("TweenService"):Create(textLabel, TweenInfo.new(0.5), goal):Play()
		end)

		textLabel.MouseLeave:Connect(function()
			local goal = {TextColor3 = originalColor}
			game:GetService("TweenService"):Create(textLabel, TweenInfo.new(0.5), goal):Play()
		end)

	end;
	task.spawn(C_46);
	-- StarterGui.AAGGXENOSS.Frame.TopBar.Name.LocalScript
	local function C_49()
		local script = G2L["49"];
		local TweenService = game:GetService("TweenService")
		local textLabel = script.Parent

		local redColor = Color3.fromRGB(60, 255, 0)
		local normalColor = textLabel.TextColor3

		local tweenInfo = TweenInfo.new(
			1,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out,
			0,
			false,
			0
		)

		local function changeColorToRedAndBack()
			local tweenToRed = TweenService:Create(textLabel, tweenInfo, {TextColor3 = redColor})
			tweenToRed:Play()

			tweenToRed.Completed:Connect(function()
				local tweenBack = TweenService:Create(textLabel, tweenInfo, {TextColor3 = normalColor})
				tweenBack:Play()
			end)
		end

		changeColorToRedAndBack()

	end;
	task.spawn(C_49);
	-- StarterGui.AAGGXENOSS.Frame.TopBar.Name.2
	local function C_4a()
		local script = G2L["4a"];
		local textLabel = script.Parent
		local originalColor = textLabel.TextColor3

		textLabel.MouseEnter:Connect(function()
			local goal = {TextColor3 = Color3.fromRGB(60, 255, 0)}
			game:GetService("TweenService"):Create(textLabel, TweenInfo.new(0.5), goal):Play()
		end)

		textLabel.MouseLeave:Connect(function()
			local goal = {TextColor3 = originalColor}
			game:GetService("TweenService"):Create(textLabel, TweenInfo.new(0.5), goal):Play()
		end)

	end;
	task.spawn(C_4a);
	-- StarterGui.AAGGXENOSS.Frame.Remotes.CanvasSize
	local function C_50()
		local script = G2L["50"];
		local scrollingFrame = script.Parent
		scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

	end;
	task.spawn(C_50);
	-- StarterGui.AAGGXENOSS.Frame.Remotes.Remote1.Animate
	local function C_53()
		local script = G2L["53"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_53);
	-- StarterGui.AAGGXENOSS.Frame.Remotes.Infoupdts.Function
	local function C_59()
		local script = G2L["59"];
		local a = script.Parent.Parent.Parent.CodeHolder.CodeSample

		script.Parent.MouseButton1Click:Connect(function()
			a.Text = [[
-- Welcome to V3!	
-- Made by Kinzin #._.kinzin.
-- Huge thanks to deusferrinho for the UI.
-- 2.4! Read update logs!
-- Report errors on the Discord server.
-- Enjoy playing with remotes!
	]]
		end)
	end;
	task.spawn(C_59);
	-- StarterGui.AAGGXENOSS.Frame.Remotes.Infoupdts.Animate
	local function C_5a()
		local script = G2L["5a"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_5a);
	-- StarterGui.AAGGXENOSS.Frame.CodeHolder.CodeSample.Anim
	local function C_63()
		local script = G2L["63"];
		local textBox = script.Parent
		local playerName = game.Players.LocalPlayer.DisplayName
		local fullText = "Welcome " .. playerName .. "!"
		local currentText = ""
		local Load = "Loaded!"
		local te = ""
		for i = 1, #fullText do
			te = te .. Load:sub(i, i)
			textBox.Text = te
			wait(0.09)
		end
		wait(3)
		if textBox.Text ~= "Loaded!" then

		else
			for i = 1, #fullText do
				currentText = currentText .. fullText:sub(i, i)
				textBox.Text = currentText
				wait(0.1)
			end
		end
	end;
	task.spawn(C_63);
	-- StarterGui.AAGGXENOSS.Frame.CodeHolder.CodeSample.Resize
	local function C_65()
		local script = G2L["65"];
		local _0xA = script["\80\97\114\101\110\116"]
		local _0xB = _0xA["\80\97\114\101\110\116"]
		local _0xC = math["\109\97\120"]
		local _0xD = UDim2["\110\101\119"]

		local function _0xF()
			local _0xX = _0xC(1.003 * _0xB["\65\98\115\111\108\117\116\101\83\105\122\101"]["\88"], _0xA["\84\101\120\116\66\111\117\110\100\115"]["\88"])
			local _0xY = _0xC(1.036 * _0xB["\65\98\115\111\108\117\116\101\83\105\122\101"]["\89"], _0xA["\84\101\120\116\66\111\117\110\100\115"]["\89"])
			_0xA["\83\105\122\101"] = _0xD(0, _0xX, 0, _0xY)
		end

		_0xA:GetPropertyChangedSignal("\84\101\120\116"):Connect(_0xF)
		_0xF()

	end;
	task.spawn(C_65);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear.Animate
	local function C_6c()
		local script = G2L["6c"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_6c);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.Clear.LocalScript
	local function C_6d()
		local script = G2L["6d"];
		local remotesFolder = script.Parent.Parent.Parent.Remotes

		local function hideRemoteButtons()
			for _, button in ipairs(remotesFolder:GetChildren()) do
				if button:IsA("TextButton") and (button.Name:lower():find("remote")) then
					button.Visible = false
					button.Text = ""
				end
			end
		end

		script.Parent.MouseButton1Click:Connect(function()
			hideRemoteButtons()
		end)

		_G.ClearL = function()
			hideRemoteButtons()
		end
	end;
	task.spawn(C_6d);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.ClearL.Animate
	local function C_74()
		local script = G2L["74"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_74);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC.Animate
	local function C_7b()
		local script = G2L["7b"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_7b);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyC.LocalScript
	local function C_7c()
		local script = G2L["7c"];
		local ab = script.Parent.Parent.Parent.CodeHolder.CodeSample
		local c = ab.Text
		script.Parent.MouseButton1Click:Connect(function()
			if setclipboard then
				setclipboard(ab.Text)
				local Notify = _G.Notify
				Notify("StellySpy V3", "Copied to clipboard.", 3);
			else
				local Notify = _G.Notify
				Notify("Exploit Error", "Your executer doesn't support clipboard.", 3);
			end
		end)
	end;
	task.spawn(C_7c);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.CopyR.Animate
	local function C_83()
		local script = G2L["83"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_83);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.ExL.Animate
	local function C_8a()
		local script = G2L["8a"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_8a);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.Run.Animate
	local function C_91()
		local script = G2L["91"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_91);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS.Animate
	local function C_98()
		local script = G2L["98"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_98);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.RunS.LocalScript
	local function C_99()
		local script = G2L["99"];
		local ab = script.Parent.Parent.Parent.CodeHolder.CodeSample
		script.Parent.MouseButton1Click:Connect(function()
			local code = ab.Text

			if code ~= "" then
				local success, result = pcall(function()
					local func = loadstring(code)
					if func then
						func()
					end
				end)

				if not success then
					local Notify = _G.Notify
					Notify("StellySpy Error", result, 3);
				end
			else
			end
		end)
	end;
	task.spawn(C_99);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc.Animate
	local function C_a0()
		local script = G2L["a0"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_a0);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.dc.LocalScript
	local function C_a1()
		local script = G2L["a1"];
		local ab = script.Parent.Parent.Parent.CodeHolder.CodeSample
		local c = "https://discord.gg/CkqE2W2Vy6"
		script.Parent.MouseButton1Click:Connect(function()
			if setclipboard then
				setclipboard(c)
				local Notify = _G.Notify
				Notify("StellySpy V3", "Copied to clipboard!", 3)
			else
				local Notify = _G.Notify
				Notify("Exploit Error", "Your exploit doesn't support clipboard.", 3);
			end
		end)
	end;
	task.spawn(C_a1);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt.Animate
	local function C_a8()
		local script = G2L["a8"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_a8);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.yt.LocalScript
	local function C_a9()
		local script = G2L["a9"];
		local ab = script.Parent.Parent.Parent.CodeHolder.CodeSample
		local c = "https://www.youtube.com/@L4TIC1NIO"
		script.Parent.MouseButton1Click:Connect(function()
			if setclipboard then
				setclipboard(c)
				local Notify = _G.Notify
				Notify("StellySpy V3", "Copied to clipboard!", 3)
			else
				local Notify = _G.Notify
				Notify("Exploit Error", "Your exploit doesn't support clipboard.", 3);
			end
		end)
	end;
	task.spawn(C_a9);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL.Function
	local function C_b1()
		local script = G2L["b1"];
		script.Parent.MouseButton1Click:Connect(function()
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local function fireAllRemotes(parent)
				for _, object in pairs(parent:GetChildren()) do
					if object:IsA("RemoteEvent") then
						pcall(function()
							object:FireServer()
							print("Firing RemoteEvent:", object.Name)
						end)
					elseif object:IsA("RemoteFunction") then
						pcall(function()
							object:InvokeServer()
							print("Firing RemoteFunction:", object.Name)
						end)
					end

					if object:IsA("Folder") then
						fireAllRemotes(object)
					end
				end
			end

			local function fireRemotesInAllAreas()
				fireAllRemotes(game.ReplicatedStorage)
				fireAllRemotes(game.Players.LocalPlayer:WaitForChild("PlayerGui"))
				fireAllRemotes(game.Players.LocalPlayer:WaitForChild("PlayerScripts"))
				fireAllRemotes(game.Workspace)
				fireAllRemotes(game.Chat)
				fireAllRemotes(game.Debris)
				fireAllRemotes(game.StarterPlayer)
				fireAllRemotes(game.Players)
				fireAllRemotes(game.Players.LocalPlayer:WaitForChild("Backpack"))
			end

			fireRemotesInAllAreas()
		end)

	end;
	task.spawn(C_b1);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.FireALL.Animate
	local function C_b2()
		local script = G2L["b2"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_b2);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.Spam.Animate
	local function C_b9()
		local script = G2L["b9"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

	end;
	task.spawn(C_b9);
	-- StarterGui.AAGGXENOSS.Frame.Buttons.UpList.Animate
	local function C_c0()
		local script = G2L["c0"];
		local tweenService = game:GetService("TweenService")

		local button = script.Parent
		local border = button:WaitForChild("Border", 10)

		local uistroke = button:FindFirstChildWhichIsA("UIStroke")

		button.MouseEnter:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
		end)

		button.MouseLeave:Connect(function()
			tweenService:Create(uistroke, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
		end)

		button.MouseButton1Down:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(1, 0, 1, 0),
			}):Play()

			wait(2)

			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)

		button.MouseButton1Up:Connect(function()
			tweenService:Create(border, TweenInfo.new(0.05, Enum.EasingStyle.Exponential), {
				Size = UDim2.new(0.05, 0, 1, 0),
			}):Play()
		end)
	end;
	task.spawn(C_c0);
	-- StarterGui.AAGGXENOSS.Frame.SearchBar Holder.SearchBar.Function
	local function C_c8()
		local script = G2L["c8"];
		local searchBox = script.Parent.TextBox
		local scrollFrame = script.Parent.Parent.Parent.Remotes

		local function updateSearchResults()
			local query = searchBox.Text:lower()

			for _, item in pairs(scrollFrame:GetChildren()) do
				if item:IsA("GuiObject") then
					local itemName = item.Text:lower()

					if itemName:find(query) then
						if itemName ~= "remotename" then
							item.Visible = true
						end
					else
						if itemName ~= "Info & updts" then
							item.Visible = false
						end
					end
				end
			end
		end

		searchBox:GetPropertyChangedSignal("Text"):Connect(updateSearchResults)

	end;
	task.spawn(C_c8);

	return G2L["1"], require;
end







