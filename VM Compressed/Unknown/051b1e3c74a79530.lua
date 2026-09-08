if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end


local LMG2L = {};

LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["IgnoreGuiInset"] = true;
LMG2L["ScreenGui_1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
LMG2L["ScreenGui_1"]["ResetOnSpawn"] = false;


LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Frame_2"]["BorderSizePixel"] = 0;
LMG2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["Frame_2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
LMG2L["Frame_2"]["Size"] = UDim2.new(0.42753, 0, 0.5078, 0);
LMG2L["Frame_2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


LMG2L["ScrollingFrame_3"] = Instance.new("ScrollingFrame", LMG2L["Frame_2"]);
LMG2L["ScrollingFrame_3"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
LMG2L["ScrollingFrame_3"]["BorderSizePixel"] = 0;
LMG2L["ScrollingFrame_3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255);
LMG2L["ScrollingFrame_3"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
LMG2L["ScrollingFrame_3"]["Size"] = UDim2.new(0.96575, 0, 0.82123, 0);
LMG2L["ScrollingFrame_3"]["Position"] = UDim2.new(0.01712, 0, 0.13966, 0);
LMG2L["ScrollingFrame_3"]["ScrollBarThickness"] = 5;


LMG2L["LocalScript_4"] = Instance.new("LocalScript", LMG2L["ScrollingFrame_3"]);



LMG2L["UIGridLayout_5"] = Instance.new("UIGridLayout", LMG2L["ScrollingFrame_3"]);
LMG2L["UIGridLayout_5"]["CellSize"] = UDim2.new(0.3, 0, 0.3, 0);
LMG2L["UIGridLayout_5"]["CellPadding"] = UDim2.new(0.03, 0, 0.05, 0);


LMG2L["TextButton_6"] = Instance.new("TextButton", LMG2L["ScrollingFrame_3"]);
LMG2L["TextButton_6"]["TextWrapped"] = true;
LMG2L["TextButton_6"]["BorderSizePixel"] = 0;
LMG2L["TextButton_6"]["TextScaled"] = true;
LMG2L["TextButton_6"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
LMG2L["TextButton_6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Guru.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_6"]["Size"] = UDim2.new(0.2, 0, 0.3, 0);
LMG2L["TextButton_6"]["Visible"] = false;


LMG2L["UIStroke_7"] = Instance.new("UIStroke", LMG2L["Frame_2"]);
LMG2L["UIStroke_7"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
LMG2L["UIStroke_7"]["Color"] = Color3.fromRGB(255, 0, 0);


LMG2L["Frame_8"] = Instance.new("Frame", LMG2L["Frame_2"]);
LMG2L["Frame_8"]["BorderSizePixel"] = 0;
LMG2L["Frame_8"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
LMG2L["Frame_8"]["Size"] = UDim2.new(0.9726, 0, 0.09497, 0);
LMG2L["Frame_8"]["Position"] = UDim2.new(0.0137, 0, 0.02235, 0);


LMG2L["TextButton_9"] = Instance.new("TextButton", LMG2L["Frame_8"]);
LMG2L["TextButton_9"]["TextWrapped"] = true;
LMG2L["TextButton_9"]["BorderSizePixel"] = 0;
LMG2L["TextButton_9"]["TextScaled"] = true;
LMG2L["TextButton_9"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
LMG2L["TextButton_9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_9"]["Size"] = UDim2.new(0.04577, 0, 0.76471, 0);
LMG2L["TextButton_9"]["Text"] = [[X]];
LMG2L["TextButton_9"]["Position"] = UDim2.new(0.9507, 0, 0.11765, 0);


LMG2L["LocalScript_a"] = Instance.new("LocalScript", LMG2L["TextButton_9"]);



LMG2L["TextLabel_b"] = Instance.new("TextLabel", LMG2L["Frame_8"]);
LMG2L["TextLabel_b"]["TextWrapped"] = true;
LMG2L["TextLabel_b"]["BorderSizePixel"] = 0;
LMG2L["TextLabel_b"]["TextScaled"] = true;
LMG2L["TextLabel_b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel_b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Creepster.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextLabel_b"]["BackgroundTransparency"] = 1;
LMG2L["TextLabel_b"]["Size"] = UDim2.new(0.89437, 0, 0.64706, 0);
LMG2L["TextLabel_b"]["Text"] = [[zero x hub]];
LMG2L["TextLabel_b"]["Position"] = UDim2.new(0.01056, 0, 0.17647, 0);


LMG2L["UIDragDetector_c"] = Instance.new("UIDragDetector", LMG2L["Frame_2"]);



LMG2L["UIAspectRatioConstraint_d"] = Instance.new("UIAspectRatioConstraint", LMG2L["Frame_2"]);
LMG2L["UIAspectRatioConstraint_d"]["AspectRatio"] = 1.63128;


local function C_4()
	local script = LMG2L["LocalScript_4"];
	local scr = script.Parent	
	local btn = scr.TextButton	
	
	function createbutton(name, call)	
		local bt = btn:Clone()	
		bt.Parent = scr	
		bt.Text = name	
		bt.Visible = true	
	
		bt.MouseButton1Click:Connect(function()	
			pcall(call)	
		end)	
	end	

	
	createbutton("animation v3", function()	
		loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty16.lua"))()
	end)	

	createbutton("among us v2", function()	
		loadstring(game:HttpGet("https://rawscripts.net/raw/Nothing-Fe-Among-Us-V2-(R6)-3224"))()
	end)

	createbutton("server admin", function()	
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ONEReverseCard/My-Scripts/main/Netless%20Server%20Admin.md"))()
	end)	


	createbutton("holdable hats", function()	
		loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-fe-holdble-hets-21612"))()
	end)	

	createbutton("xester", function()	
		loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-Jb-xester-14221"))()
	end)	



	createbutton("pandora", function()	
		loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-jb-fe-pndor-14850"))()
	end)

	createbutton("human hub", function()	
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/human.luau"))()
	end)	
	
	createbutton("cat girl", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/cat"))()
end)

createbutton("dog v2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/cursordog.luau"))()
end)

createbutton("car", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/car.luau"))()
end)

createbutton("clovr", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/fakrvr.luau"))()
end)

createbutton("friend", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/friend.luau"))()
end)

end;
task.spawn(C_4);
local function C_a()
	local script = LMG2L["LocalScript_a"];
	script.Parent.MouseButton1Click:Connect(function()	
		script.Parent.Parent.Parent.Parent:Destroy()	
	end)	
end;
task.spawn(C_a);

return LMG2L["ScreenGui_1"], require;
