if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end

local G2l = {};

G2l["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2l["ScreenGui_1"]["IgnoreGuiInset"] = true;
G2l["ScreenGui_1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2l["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2l["ScreenGui_1"]["ResetOnSpawn"] = false;


G2l["Frame_2"] = Instance.new("Frame", G2l["ScreenGui_1"]);
G2l["Frame_2"]["BorderSizePixel"] = 0;
G2l["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 228, 255);
G2l["Frame_2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2l["Frame_2"]["Size"] = UDim2.new(0.16545, 0, 0.52859, 0);
G2l["Frame_2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


G2l["ScrollingFrame_3"] = Instance.new("ScrollingFrame", G2l["Frame_2"]);
G2l["ScrollingFrame_3"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
G2l["ScrollingFrame_3"]["BorderSizePixel"] = 0;
G2l["ScrollingFrame_3"]["BackgroundColor3"] = Color3.fromRGB(4, 156, 255);
G2l["ScrollingFrame_3"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2l["ScrollingFrame_3"]["Size"] = UDim2.new(0.93805, 0, 0.8655, 0);
G2l["ScrollingFrame_3"]["Position"] = UDim2.new(0.0354, 0, 0.10526, 0);
G2l["ScrollingFrame_3"]["ScrollBarThickness"] = 4;


G2l["UIListLayout_4"] = Instance.new("UIListLayout", G2l["ScrollingFrame_3"]);
G2l["UIListLayout_4"]["Padding"] = UDim.new(0.03, 0);


G2l["LocalScript_5"] = Instance.new("LocalScript", G2l["ScrollingFrame_3"]);



G2l["TextButton_6"] = Instance.new("TextButton", G2l["ScrollingFrame_3"]);
G2l["TextButton_6"]["TextWrapped"] = true;
G2l["TextButton_6"]["BorderSizePixel"] = 0;
G2l["TextButton_6"]["TextScaled"] = true;
G2l["TextButton_6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2l["TextButton_6"]["BackgroundColor3"] = Color3.fromRGB(0, 75, 255);
G2l["TextButton_6"]["Size"] = UDim2.new(1, 0, 0.1, 0);
G2l["TextButton_6"]["Visible"] = false;


G2l["UIStroke_7"] = Instance.new("UIStroke", G2l["Frame_2"]);



G2l["UIDragDetector_8"] = Instance.new("UIDragDetector", G2l["Frame_2"]);



G2l["Frame_9"] = Instance.new("Frame", G2l["Frame_2"]);
G2l["Frame_9"]["BorderSizePixel"] = 0;
G2l["Frame_9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2l["Frame_9"]["Size"] = UDim2.new(0.9646, 0, 0.07018, 0);
G2l["Frame_9"]["Position"] = UDim2.new(0.0177, 0, 0.0117, 0);


G2l["TextButton_a"] = Instance.new("TextButton", G2l["Frame_9"]);
G2l["TextButton_a"]["TextWrapped"] = true;
G2l["TextButton_a"]["BorderSizePixel"] = 0;
G2l["TextButton_a"]["TextScaled"] = true;
G2l["TextButton_a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2l["TextButton_a"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2l["TextButton_a"]["Size"] = UDim2.new(0.11009, 0, 0.83333, 0);
G2l["TextButton_a"]["Text"] = [[X]];
G2l["TextButton_a"]["Position"] = UDim2.new(0.86239, 0, 0.08333, 0);


G2l["LocalScript_b"] = Instance.new("LocalScript", G2l["TextButton_a"]);



G2l["TextLabel_c"] = Instance.new("TextLabel", G2l["Frame_9"]);
G2l["TextLabel_c"]["TextWrapped"] = true;
G2l["TextLabel_c"]["BorderSizePixel"] = 0;
G2l["TextLabel_c"]["TextScaled"] = true;
G2l["TextLabel_c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2l["TextLabel_c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Oswald.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2l["TextLabel_c"]["Size"] = UDim2.new(0.77064, 0, 0.66667, 0);
G2l["TextLabel_c"]["Text"] = [[rebel hub]];
G2l["TextLabel_c"]["Position"] = UDim2.new(0.01835, 0, 0.16667, 0);


G2l["UIAspectRatioConstraint_d"] = Instance.new("UIAspectRatioConstraint", G2l["Frame_2"]);
G2l["UIAspectRatioConstraint_d"]["AspectRatio"] = 0.66082;


local function C_5()
	local script = G2l["LocalScript_5"];
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
	
	createbutton("laser", function()	
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 63690008 62234425 48474313 62724852 451220849 451220849")
		wait(2.1)
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
	
		
	
		loadstring(game:HttpGet('https://pastefy.app/b07Nxyh0/raw'))()
	end)	

	createbutton("little people", function()	
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 48474313 4246228452 62724852 451220849 3409612660 4094878701 4047554959 4489239608 63690008 62234425")
		wait(2.1)
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
	
		
		loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhdat4461/1-Line-Scripts/refs/heads/main/Little%20People"))()	
	end)	

	createbutton("car", function()	
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/car.luau'))()
	end)

	createbutton("clovr", function()	
		loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-FE-Fake-VR-45999"))()
	end)

	createbutton("human hub", function()	
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/human.luau"))()
	end)

	
	createbutton("zero hub", function()	
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/zero.luau"))()
	end)

	createbutton("giant", function()	
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/giant.luau"))()
	end)
		
	
end;
task.spawn(C_5);
local function C_b()
	local script = G2l["LocalScript_b"];
	script.Parent.MouseButton1Click:Connect(function()	
		script.Parent.Parent.Parent.Parent:Destroy()	
	end)	
end;
task.spawn(C_b);

return G2l["ScreenGui_1"], require;
