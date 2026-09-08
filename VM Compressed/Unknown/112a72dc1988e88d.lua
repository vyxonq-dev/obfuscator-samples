--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 38 | Scripts: 1 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.GhipsX
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["Name"] = [[GhipsX]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.GhipsX.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(19, 19, 19);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(0.29801, 0, 0.31969, 0);
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.GhipsX.Frame.LocalScript
G2L["3"] = Instance.new("LocalScript", G2L["2"]);



-- StarterGui.GhipsX.Frame.UICorner
G2L["4"] = Instance.new("UICorner", G2L["2"]);



-- StarterGui.GhipsX.Frame.Nada
G2L["5"] = Instance.new("Frame", G2L["2"]);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(38, 0, 58);
G2L["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5"]["Size"] = UDim2.new(0.00222, 0, 0.892, 0);
G2L["5"]["Position"] = UDim2.new(0.58667, 0, 0.5, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Name"] = [[Nada]];


-- StarterGui.GhipsX.Frame.Nada.UICorner
G2L["6"] = Instance.new("UICorner", G2L["5"]);



-- StarterGui.GhipsX.Frame.Titulo
G2L["7"] = Instance.new("TextLabel", G2L["2"]);
G2L["7"]["TextWrapped"] = true;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextSize"] = 14;
G2L["7"]["TextScaled"] = true;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["7"]["Size"] = UDim2.new(0.32, 0, 0.132, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[GHIPSX]];
G2L["7"]["Name"] = [[Titulo]];
G2L["7"]["Position"] = UDim2.new(0.29823, 0, 0.346, 0);


-- StarterGui.GhipsX.Frame.ImageLabel
G2L["8"] = Instance.new("ImageLabel", G2L["2"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["8"]["Image"] = [[rbxassetid://129931686467420]];
G2L["8"]["Size"] = UDim2.new(0.22222, 0, 0.4, 0);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["BackgroundTransparency"] = 1;
G2L["8"]["Position"] = UDim2.new(0.29944, 0, 0.198, 0);


-- StarterGui.GhipsX.Frame.Descripcion
G2L["9"] = Instance.new("TextLabel", G2L["2"]);
G2L["9"]["TextWrapped"] = true;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextSize"] = 14;
G2L["9"]["TextScaled"] = true;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["9"]["TextColor3"] = Color3.fromRGB(90, 86, 94);
G2L["9"]["BackgroundTransparency"] = 1;
G2L["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["9"]["Size"] = UDim2.new(0.32667, 0, 0.044, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[Key System]];
G2L["9"]["Name"] = [[Descripcion]];
G2L["9"]["Position"] = UDim2.new(0.29764, 0, 0.434, 0);


-- StarterGui.GhipsX.Frame.Submit
G2L["a"] = Instance.new("TextButton", G2L["2"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["TextSize"] = 14;
G2L["a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(135, 13, 255);
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a"]["Size"] = UDim2.new(0.22222, 0, 0.16, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[]];
G2L["a"]["Name"] = [[Submit]];
G2L["a"]["Position"] = UDim2.new(0.15556, 0, 0.816, 0);


-- StarterGui.GhipsX.Frame.Submit.UICorner
G2L["b"] = Instance.new("UICorner", G2L["a"]);
G2L["b"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.GhipsX.Frame.Submit.TextLabel
G2L["c"] = Instance.new("TextLabel", G2L["a"]);
G2L["c"]["TextWrapped"] = true;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextScaled"] = true;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["BackgroundTransparency"] = 1;
G2L["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["c"]["Size"] = UDim2.new(0.8, 0, 0.35, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[SUBMIT]];
G2L["c"]["Position"] = UDim2.new(0.495, 0, 0.5, 0);


-- StarterGui.GhipsX.Frame.Submit.TextLabel.UIStroke
G2L["d"] = Instance.new("UIStroke", G2L["c"]);
G2L["d"]["Color"] = Color3.fromRGB(176, 139, 183);


-- StarterGui.GhipsX.Frame.Submit.UIStroke
G2L["e"] = Instance.new("UIStroke", G2L["a"]);
G2L["e"]["Thickness"] = 1.15;
G2L["e"]["Color"] = Color3.fromRGB(130, 0, 177);
G2L["e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.GhipsX.Frame.GetKey
G2L["f"] = Instance.new("TextButton", G2L["2"]);
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["TextSize"] = 14;
G2L["f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
G2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["f"]["Size"] = UDim2.new(0.22222, 0, 0.16, 0);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Text"] = [[]];
G2L["f"]["Name"] = [[GetKey]];
G2L["f"]["Position"] = UDim2.new(0.44444, 0, 0.816, 0);


-- StarterGui.GhipsX.Frame.GetKey.UICorner
G2L["10"] = Instance.new("UICorner", G2L["f"]);
G2L["10"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.GhipsX.Frame.GetKey.UIStroke
G2L["11"] = Instance.new("UIStroke", G2L["f"]);
G2L["11"]["Thickness"] = 0.41;
G2L["11"]["Color"] = Color3.fromRGB(125, 125, 125);
G2L["11"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.GhipsX.Frame.GetKey.TextLabel
G2L["12"] = Instance.new("TextLabel", G2L["f"]);
G2L["12"]["TextWrapped"] = true;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["TextSize"] = 14;
G2L["12"]["TextScaled"] = true;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["BackgroundTransparency"] = 1;
G2L["12"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["12"]["Size"] = UDim2.new(0.8, 0, 0.35, 0);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Text"] = [[GET KEY]];
G2L["12"]["Position"] = UDim2.new(0.495, 0, 0.5, 0);


-- StarterGui.GhipsX.Frame.Cadro
G2L["13"] = Instance.new("Frame", G2L["2"]);
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
G2L["13"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["13"]["Size"] = UDim2.new(0.51111, 0, 0.16, 0);
G2L["13"]["Position"] = UDim2.new(0.3, 0, 0.62, 0);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Name"] = [[Cadro]];


-- StarterGui.GhipsX.Frame.Cadro.UICorner
G2L["14"] = Instance.new("UICorner", G2L["13"]);
G2L["14"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.GhipsX.Frame.Cadro.UIStroke
G2L["15"] = Instance.new("UIStroke", G2L["13"]);
G2L["15"]["Thickness"] = 0.41;
G2L["15"]["Color"] = Color3.fromRGB(125, 125, 125);
G2L["15"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.GhipsX.Frame.Cadro.EnterKey
G2L["16"] = Instance.new("TextBox", G2L["13"]);
G2L["16"]["Name"] = [[EnterKey]];
G2L["16"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextSize"] = 12;
G2L["16"]["TextColor3"] = Color3.fromRGB(105, 105, 105);
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["16"]["Size"] = UDim2.new(0.82609, 0, 0.5, 0);
G2L["16"]["Position"] = UDim2.new(0.49126, 0, 0.485, 0);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[Enter your key here..]];
G2L["16"]["BackgroundTransparency"] = 1;


-- StarterGui.GhipsX.Frame.Notice
G2L["17"] = Instance.new("TextLabel", G2L["2"]);
G2L["17"]["TextWrapped"] = true;
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["TextSize"] = 14;
G2L["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["17"]["TextScaled"] = true;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["17"]["TextColor3"] = Color3.fromRGB(90, 86, 94);
G2L["17"]["BackgroundTransparency"] = 1;
G2L["17"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["17"]["Size"] = UDim2.new(0.32667, 0, 0.044, 0);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Text"] = [[Notice]];
G2L["17"]["Name"] = [[Notice]];
G2L["17"]["Position"] = UDim2.new(0.22875, 0, 0.498, 0);


-- StarterGui.GhipsX.Frame.ImageLabel
G2L["18"] = Instance.new("ImageLabel", G2L["2"]);
G2L["18"]["ZIndex"] = 0;
G2L["18"]["BorderSizePixel"] = 0;
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(209, 20, 255);
G2L["18"]["ImageColor3"] = Color3.fromRGB(179, 45, 255);
G2L["18"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["18"]["Image"] = [[rbxassetid://4996891970]];
G2L["18"]["Size"] = UDim2.new(1.10431, 0, 1.104, 0);
G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["18"]["BackgroundTransparency"] = 1;
G2L["18"]["Position"] = UDim2.new(0.50033, 0, 0.498, 0);


-- StarterGui.GhipsX.Frame.Descripcion
G2L["19"] = Instance.new("TextLabel", G2L["2"]);
G2L["19"]["TextWrapped"] = true;
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["TextSize"] = 14;
G2L["19"]["TextScaled"] = true;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["19"]["TextColor3"] = Color3.fromRGB(155, 54, 255);
G2L["19"]["BackgroundTransparency"] = 1;
G2L["19"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["19"]["Size"] = UDim2.new(0.33556, 0, 0.052, 0);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["Text"] = [[¿How do I get the key?]];
G2L["19"]["Name"] = [[Descripcion]];
G2L["19"]["Position"] = UDim2.new(0.78685, 0, 0.078, 0);


-- StarterGui.GhipsX.Frame.Descripcion
G2L["1a"] = Instance.new("TextLabel", G2L["2"]);
G2L["1a"]["TextWrapped"] = true;
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["TextSize"] = 14;
G2L["1a"]["TextScaled"] = true;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["BackgroundTransparency"] = 1;
G2L["1a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1a"]["Size"] = UDim2.new(0.33556, 0, 0.264, 0);
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Text"] = [[To obtain your key, click the GET KEY button. This will automatically copy a link to your clipboard. Paste the link into your web browser and follow the instructions provided.]];
G2L["1a"]["Name"] = [[Descripcion]];
G2L["1a"]["Position"] = UDim2.new(0.78685, 0, 0.264, 0);


-- StarterGui.GhipsX.Frame.Descripcion
G2L["1b"] = Instance.new("TextLabel", G2L["2"]);
G2L["1b"]["TextWrapped"] = true;
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["TextSize"] = 14;
G2L["1b"]["TextScaled"] = true;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1b"]["TextColor3"] = Color3.fromRGB(155, 54, 255);
G2L["1b"]["BackgroundTransparency"] = 1;
G2L["1b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1b"]["Size"] = UDim2.new(0.33556, 0, 0.184, 0);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["Text"] = [[If you encounter any bugs or problems, please contact us through our social media channels.]];
G2L["1b"]["Name"] = [[Descripcion]];
G2L["1b"]["Position"] = UDim2.new(0.78685, 0, 0.504, 0);


-- StarterGui.GhipsX.Frame.ImageLabel
G2L["1c"] = Instance.new("ImageLabel", G2L["2"]);
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1c"]["Image"] = [[rbxassetid://121079734659925]];
G2L["1c"]["Size"] = UDim2.new(0.06671, 0, 0.12, 0);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Position"] = UDim2.new(0.65038, 0, 0.704, 0);


-- StarterGui.GhipsX.Frame.ImageLabel.UICorner
G2L["1d"] = Instance.new("UICorner", G2L["1c"]);



-- StarterGui.GhipsX.Frame.ImageLabel
G2L["1e"] = Instance.new("ImageLabel", G2L["2"]);
G2L["1e"]["BorderSizePixel"] = 0;
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1e"]["Image"] = [[rbxassetid://742578299]];
G2L["1e"]["Size"] = UDim2.new(0.06671, 0, 0.12, 0);
G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["Position"] = UDim2.new(0.7867, 0, 0.704, 0);


-- StarterGui.GhipsX.Frame.ImageLabel.UICorner
G2L["1f"] = Instance.new("UICorner", G2L["1e"]);



-- StarterGui.GhipsX.Frame.ImageLabel
G2L["20"] = Instance.new("ImageLabel", G2L["2"]);
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["20"]["Image"] = [[rbxassetid://13484974997]];
G2L["20"]["Size"] = UDim2.new(0.06671, 0, 0.12, 0);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Position"] = UDim2.new(0.91974, 0, 0.704, 0);


-- StarterGui.GhipsX.Frame.ImageLabel.UICorner
G2L["21"] = Instance.new("UICorner", G2L["20"]);



-- StarterGui.GhipsX.Frame.Descripcion
G2L["22"] = Instance.new("TextLabel", G2L["2"]);
G2L["22"]["TextWrapped"] = true;
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["TextSize"] = 14;
G2L["22"]["TextScaled"] = true;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["BackgroundTransparency"] = 1;
G2L["22"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["22"]["Size"] = UDim2.new(0.33556, 0, 0.052, 0);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Text"] = [[GhipsX]];
G2L["22"]["Name"] = [[Descripcion]];
G2L["22"]["Position"] = UDim2.new(0.78685, 0, 0.79, 0);


-- StarterGui.GhipsX.Frame.Descripcion
G2L["23"] = Instance.new("TextLabel", G2L["2"]);
G2L["23"]["TextWrapped"] = true;
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["TextSize"] = 14;
G2L["23"]["TextScaled"] = true;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["BackgroundTransparency"] = 1;
G2L["23"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["23"]["Size"] = UDim2.new(0.33556, 0, 0.052, 0);
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Text"] = [[GhipsX]];
G2L["23"]["Name"] = [[Descripcion]];
G2L["23"]["Position"] = UDim2.new(0.91805, 0, 0.79, 0);


-- StarterGui.GhipsX.Frame.Descripcion
G2L["24"] = Instance.new("TextLabel", G2L["2"]);
G2L["24"]["TextWrapped"] = true;
G2L["24"]["BorderSizePixel"] = 0;
G2L["24"]["TextSize"] = 14;
G2L["24"]["TextScaled"] = true;
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["24"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["24"]["BackgroundTransparency"] = 1;
G2L["24"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["24"]["Size"] = UDim2.new(0.33556, 0, 0.052, 0);
G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["24"]["Text"] = [[GhipsX]];
G2L["24"]["Name"] = [[Descripcion]];
G2L["24"]["Position"] = UDim2.new(0.64898, 0, 0.79, 0);


-- StarterGui.GhipsX.Frame.Descripcion
G2L["25"] = Instance.new("TextLabel", G2L["2"]);
G2L["25"]["TextWrapped"] = true;
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["TextSize"] = 14;
G2L["25"]["TextScaled"] = true;
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["25"]["TextColor3"] = Color3.fromRGB(255, 255, 128);
G2L["25"]["BackgroundTransparency"] = 1;
G2L["25"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["25"]["Size"] = UDim2.new(0.33556, 0, 0.052, 0);
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["Text"] = [[Thank you for using the script]];
G2L["25"]["Name"] = [[Descripcion]];
G2L["25"]["Position"] = UDim2.new(0.78685, 0, 0.918, 0);


-- StarterGui.GhipsX.UIAspectRatioConstraint
G2L["26"] = Instance.new("UIAspectRatioConstraint", G2L["1"]);



-- StarterGui.GhipsX.Frame.LocalScript
local function C_3()
local script = G2L["3"];
	local TweenService = game:GetService("TweenService")
	local frame = script.Parent -- El Frame principal
	
	-- --- REFERENCIAS ---
	local noticeLabel = frame:WaitForChild("Notice") 
	local inputBox = frame:WaitForChild("Cadro"):WaitForChild("EnterKey")
	local submitBtn = frame:WaitForChild("Submit")
	local getKeyBtn = frame:WaitForChild("GetKey")
	
	-- =================================================================
	--  CONFIGURACIÓN PRINCIPAL
	-- =================================================================
	local CLAVE_REAL = "ESORPSLAWIMOFDAIOMAF" 
	local LINK_KEY = "https://pastefy.app/0J80iNQg/raw" 
	
	-- TU SCRIPT EXACTO A EJECUTAR:
	local URL_SCRIPT = "https://pastefy.app/n8hf8Wyf/raw"
	
	-- --- TIEMPOS ---
	local TIEMPO_ERROR = 2   -- Tiempo que dura el mensaje de error
	local TIEMPO_EXITO = 0.5 -- Tiempo de espera antes de cerrar
	
	-- --- ESTILO INICIAL ---
	inputBox.PlaceholderText = "Enter your key here.."
	inputBox.PlaceholderColor3 = Color3.fromRGB(104, 104, 104)
	inputBox.Text = "" 
	noticeLabel.Text = "" 
	
	-- =================================================================
	--  ANIMACIONES
	-- =================================================================
	
	local function animarClick(objeto)
		local tamanoOriginal = objeto.Size
		local tweenInfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local encoger = TweenService:Create(objeto, tweenInfo1, {Size = UDim2.new(tamanoOriginal.X.Scale * 0.9, 0, tamanoOriginal.Y.Scale * 0.9, 0)})
		encoger:Play()
		encoger.Completed:Wait()
		local tweenInfo2 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local crecer = TweenService:Create(objeto, tweenInfo2, {Size = tamanoOriginal})
		crecer:Play()
	end
	
	local function animarError(objeto)
		local posOriginal = objeto.Position
		local fuerza = 0.01 
		for i = 1, 4 do
			objeto.Position = UDim2.new(posOriginal.X.Scale + fuerza, 0, posOriginal.Y.Scale, 0)
			task.wait(0.04)
			objeto.Position = UDim2.new(posOriginal.X.Scale - fuerza, 0, posOriginal.Y.Scale, 0)
			task.wait(0.04)
		end
		objeto.Position = posOriginal 
	end
	
	local function cerrarConEstiloPro()
		local infoTween = TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		local objetivo = {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}
	
		for _, elemento in pairs(frame:GetDescendants()) do
			if elemento:IsA("GuiObject") then
				local infoRapido = TweenInfo.new(0.3)
				pcall(function() TweenService:Create(elemento, infoRapido, {BackgroundTransparency=1, TextTransparency=1, ImageTransparency=1}):Play() end)
			end
		end
	
		local tweenSalida = TweenService:Create(frame, infoTween, objetivo)
		tweenSalida:Play()
		tweenSalida.Completed:Wait()
		frame.Visible = false 
	end
	
	local function mostrarAviso(texto, color)
		noticeLabel.Text = texto
		noticeLabel.TextColor3 = color
	end
	
	-- =================================================================
	--  LÓGICA FUNCIONAL
	-- =================================================================
	
	-- --- BOTÓN: GET KEY ---
	getKeyBtn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			animarClick(getKeyBtn)
	
			local exito, _ = pcall(function()
				if setclipboard then setclipboard(LINK_KEY) return true
				elseif toclipboard then toclipboard(LINK_KEY) return true
				else error("No clipboard") end
			end)
	
			if exito then
				mostrarAviso("¡Link copied to clipboard!", Color3.fromRGB(0, 255, 0))
			else
				inputBox.Text = LINK_KEY
				mostrarAviso("Copy the link (Ctrl + C)", Color3.fromRGB(255, 255, 0))
				inputBox:CaptureFocus() 
				inputBox.CursorPosition = #inputBox.Text + 1
			end
		end
	end)
	
	-- --- BOTÓN: SUBMIT (EJECUCIÓN REAL) ---
	submitBtn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			animarClick(submitBtn)
	
			if inputBox.Text == CLAVE_REAL then
				-- === CLAVE CORRECTA ===
				mostrarAviso("Correct Key! Running...", Color3.fromRGB(0, 255, 0))
				task.wait(TIEMPO_EXITO) 
	
				-- 1. Cerramos la interfaz con animación
				cerrarConEstiloPro()
	
				-- 2. EJECUTAMOS TU SCRIPT
				task.spawn(function()
					local success, err = pcall(function()
						loadstring(game:HttpGet(URL_SCRIPT))()
					end)
	
					if not success then
						warn("Error loading script: " .. tostring(err))
					else
						print("GhipsX script loaded successfully.")
					end
				end)
	
			else
				-- === CLAVE INCORRECTA ===
				mostrarAviso("Incorrect Key", Color3.fromRGB(255, 0, 0)) 
				inputBox.Text = "" 
				task.spawn(function() animarError(inputBox) end) -- Temblor
	
				task.delay(TIEMPO_ERROR, function()
					if noticeLabel.Text == "Incorrect Key" then noticeLabel.Text = "" end
				end)
			end
		end
	end)
end;
task.spawn(C_3);

return G2L["1"], require;