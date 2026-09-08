--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 124 | Scripts: 9 | Modules: 2 | Tags: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game.CoreGui);
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.ScreenGui.Runner
G2L["2"] = Instance.new("LocalScript", G2L["1"]);
G2L["2"]["Name"] = [[Runner]];


-- StarterGui.ScreenGui.Mobile
G2L["3"] = Instance.new("Frame", G2L["1"]);
G2L["3"]["Visible"] = false;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["3"]["Size"] = UDim2.new(0, 577, 0, 319);
G2L["3"]["Position"] = UDim2.new(0.14804, 0, 0.11752, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Name"] = [[Mobile]];


-- StarterGui.ScreenGui.Mobile.LocalScript
G2L["4"] = Instance.new("LocalScript", G2L["3"]);



-- StarterGui.ScreenGui.Mobile.UIDrag
G2L["5"] = Instance.new("LocalScript", G2L["3"]);
G2L["5"]["Name"] = [[UIDrag]];


-- StarterGui.ScreenGui.Mobile.Top
G2L["6"] = Instance.new("Frame", G2L["3"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
G2L["6"]["Size"] = UDim2.new(0, 577, 0, 35);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Name"] = [[Top]];


-- StarterGui.ScreenGui.Mobile.Top.KRNL
G2L["7"] = Instance.new("ImageLabel", G2L["6"]);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["7"]["Image"] = [[rbxassetid://125999447519604]];
G2L["7"]["Size"] = UDim2.new(0, 37, 0, 37);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Name"] = [[KRNL]];


-- StarterGui.ScreenGui.Mobile.Top.KRNL.UIAspectRatioConstraint
G2L["8"] = Instance.new("UIAspectRatioConstraint", G2L["7"]);



-- StarterGui.ScreenGui.Mobile.Top.TextLabel
G2L["9"] = Instance.new("TextLabel", G2L["6"]);
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextSize"] = 17;
G2L["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["BackgroundTransparency"] = 1;
G2L["9"]["Size"] = UDim2.new(0, 120, 0, 36);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[KRNL Executor]];
G2L["9"]["Position"] = UDim2.new(0.06523, 0, 0.0203, 0);


-- StarterGui.ScreenGui.Mobile.Top.Load
G2L["a"] = Instance.new("TextButton", G2L["6"]);
G2L["a"]["TextWrapped"] = true;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["TextSize"] = 22;
G2L["a"]["TextScaled"] = true;
G2L["a"]["TextColor3"] = Color3.fromRGB(181, 181, 181);
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["a"]["Size"] = UDim2.new(0, 63, 0, 17);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[ElysianHub]];
G2L["a"]["Name"] = [[Load]];
G2L["a"]["Position"] = UDim2.new(0.85951, 0, 0.23558, 0);


-- StarterGui.ScreenGui.Mobile.Top.Load.LocalScript
G2L["b"] = Instance.new("LocalScript", G2L["a"]);



-- StarterGui.ScreenGui.Mobile.Main
G2L["c"] = Instance.new("ScrollingFrame", G2L["3"]);
G2L["c"]["Active"] = true;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["CanvasSize"] = UDim2.new(0, 0, 4, 0);
G2L["c"]["TopImage"] = [[]];
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
G2L["c"]["Name"] = [[Main]];
G2L["c"]["BottomImage"] = [[]];
G2L["c"]["Size"] = UDim2.new(0, 428, 0, 215);
G2L["c"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Position"] = UDim2.new(0.03459, 0, 0.14197, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.ScreenGui.Mobile.Main.Code
G2L["d"] = Instance.new("TextBox", G2L["c"]);
G2L["d"]["Name"] = [[Code]];
G2L["d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["TextWrapped"] = true;
G2L["d"]["TextSize"] = 19;
G2L["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["d"]["MultiLine"] = true;
G2L["d"]["ClearTextOnFocus"] = false;
G2L["d"]["PlaceholderText"] = [[print("HELLO KRNL")]];
G2L["d"]["Size"] = UDim2.new(0, 585, 0, 1795);
G2L["d"]["Position"] = UDim2.new(0, 0, -5.30175, 0);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Text"] = [[]];
G2L["d"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Mobile.Main.UIListLayout
G2L["e"] = Instance.new("UIListLayout", G2L["c"]);
G2L["e"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.ScreenGui.Mobile.btn
G2L["f"] = Instance.new("Frame", G2L["3"]);
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["Size"] = UDim2.new(0, 428, 0, 41);
G2L["f"]["Position"] = UDim2.new(0.03459, 0, 0.83964, 0);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Name"] = [[btn]];
G2L["f"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Mobile.btn.LocalScript
G2L["10"] = Instance.new("LocalScript", G2L["f"]);



-- StarterGui.ScreenGui.Mobile.btn.LocalScript.API
G2L["11"] = Instance.new("ModuleScript", G2L["10"]);
G2L["11"]["Name"] = [[API]];


-- StarterGui.ScreenGui.Mobile.btn.UIListLayout
G2L["12"] = Instance.new("UIListLayout", G2L["f"]);
G2L["12"]["Padding"] = UDim.new(0, 9);
G2L["12"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["12"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["12"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- StarterGui.ScreenGui.Mobile.btn.Exe
G2L["13"] = Instance.new("TextButton", G2L["f"]);
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["TextSize"] = 22;
G2L["13"]["TextColor3"] = Color3.fromRGB(181, 181, 181);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["13"]["Size"] = UDim2.new(0, 137, 0, 31);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[Execute]];
G2L["13"]["Name"] = [[Exe]];
G2L["13"]["Position"] = UDim2.new(-0, 0, 0.1213, 0);


-- StarterGui.ScreenGui.Mobile.btn.Exe.ImageLabel
G2L["14"] = Instance.new("ImageLabel", G2L["13"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["14"]["Image"] = [[rbxassetid://94640768832047]];
G2L["14"]["Size"] = UDim2.new(0, 17, 0, 17);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["BackgroundTransparency"] = 1;
G2L["14"]["Position"] = UDim2.new(0.80793, 0, 0.23565, 0);


-- StarterGui.ScreenGui.Mobile.btn.Exe.ImageLabel.UIAspectRatioConstraint
G2L["15"] = Instance.new("UIAspectRatioConstraint", G2L["14"]);



-- StarterGui.ScreenGui.Mobile.btn.Inj
G2L["16"] = Instance.new("TextButton", G2L["f"]);
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextSize"] = 22;
G2L["16"]["TextColor3"] = Color3.fromRGB(181, 181, 181);
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["Size"] = UDim2.new(0, 137, 0, 31);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[Inject]];
G2L["16"]["Name"] = [[Inj]];
G2L["16"]["Position"] = UDim2.new(0.67915, 0, 0.1213, 0);


-- StarterGui.ScreenGui.Mobile.btn.Inj.ImageLabel
G2L["17"] = Instance.new("ImageLabel", G2L["16"]);
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["17"]["Image"] = [[rbxassetid://110159304114119]];
G2L["17"]["Size"] = UDim2.new(0, 17, 0, 17);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["BackgroundTransparency"] = 1;
G2L["17"]["Position"] = UDim2.new(0.75944, 0, 0.23565, 0);


-- StarterGui.ScreenGui.Mobile.btn.Inj.ImageLabel.UIAspectRatioConstraint
G2L["18"] = Instance.new("UIAspectRatioConstraint", G2L["17"]);



-- StarterGui.ScreenGui.Mobile.btn.Clr
G2L["19"] = Instance.new("TextButton", G2L["f"]);
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["TextSize"] = 22;
G2L["19"]["TextColor3"] = Color3.fromRGB(181, 181, 181);
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["19"]["Size"] = UDim2.new(0, 137, 0, 31);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["Text"] = [[Clear]];
G2L["19"]["Name"] = [[Clr]];
G2L["19"]["Position"] = UDim2.new(0.33958, 0, 0.1213, 0);


-- StarterGui.ScreenGui.Mobile.btn.Clr.ImageLabel
G2L["1a"] = Instance.new("ImageLabel", G2L["19"]);
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["1a"]["Image"] = [[rbxassetid://132971593063501]];
G2L["1a"]["Size"] = UDim2.new(0, 17, 0, 17);
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["BackgroundTransparency"] = 1;
G2L["1a"]["Position"] = UDim2.new(0.78369, 0, 0.23565, 0);


-- StarterGui.ScreenGui.Mobile.btn.Clr.ImageLabel.UIAspectRatioConstraint
G2L["1b"] = Instance.new("UIAspectRatioConstraint", G2L["1a"]);



-- StarterGui.ScreenGui.Mobile.ScrollingFrame
G2L["1c"] = Instance.new("ScrollingFrame", G2L["3"]);
G2L["1c"]["Active"] = true;
G2L["1c"]["ZIndex"] = 2;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["CanvasSize"] = UDim2.new(0, 0, 10, 0);
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["Size"] = UDim2.new(0, 113, 0, 234);
G2L["1c"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Position"] = UDim2.new(0.78693, 0, 0.21769, 0);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.UICorner
G2L["1d"] = Instance.new("UICorner", G2L["1c"]);
G2L["1d"]["CornerRadius"] = UDim.new(0, 25);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.UIGridLayout
G2L["1e"] = Instance.new("UIGridLayout", G2L["1c"]);
G2L["1e"]["CellSize"] = UDim2.new(0, 100, 0, 200);
G2L["1e"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["1e"]["CellPadding"] = UDim2.new(0, 5, 0, 10);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example
G2L["1f"] = Instance.new("Frame", G2L["1c"]);
G2L["1f"]["ZIndex"] = 2;
G2L["1f"]["BorderSizePixel"] = 0;
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(91, 91, 91);
G2L["1f"]["Size"] = UDim2.new(0, 136, 0, 200);
G2L["1f"]["Position"] = UDim2.new(0, 0, 0, 0);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["Name"] = [[Example]];
G2L["1f"]["BackgroundTransparency"] = 0.45;


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.TextLabel
G2L["20"] = Instance.new("TextLabel", G2L["1f"]);
G2L["20"]["TextWrapped"] = true;
G2L["20"]["ZIndex"] = 2;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["TextSize"] = 56;
G2L["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["20"]["TextScaled"] = true;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["BackgroundTransparency"] = 1;
G2L["20"]["Size"] = UDim2.new(-1.27931, 210, 0.0125, 30);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Text"] = [[Example name]];
G2L["20"]["Position"] = UDim2.new(0.06758, 0, 0.24121, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.TextButton
G2L["21"] = Instance.new("TextButton", G2L["1f"]);
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["TextSize"] = 14;
G2L["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(53, 53, 53);
G2L["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["21"]["ZIndex"] = 2;
G2L["21"]["Size"] = UDim2.new(0.02, 51, 0.01265, 14);
G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["21"]["Text"] = [[Run]];
G2L["21"]["Position"] = UDim2.new(0.42444, 0, 0.14856, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Copy
G2L["22"] = Instance.new("ImageLabel", G2L["1f"]);
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["22"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["22"]["Image"] = [[rbxassetid://86138545569367]];
G2L["22"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["BackgroundTransparency"] = 1;
G2L["22"]["Name"] = [[Copy]];
G2L["22"]["Position"] = UDim2.new(0.07702, 0, 0.80121, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Copy.UIAspectRatioConstraint
G2L["23"] = Instance.new("UIAspectRatioConstraint", G2L["22"]);



-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Copy.TextLabel
G2L["24"] = Instance.new("TextLabel", G2L["22"]);
G2L["24"]["TextWrapped"] = true;
G2L["24"]["ZIndex"] = 2;
G2L["24"]["BorderSizePixel"] = 0;
G2L["24"]["TextSize"] = 20;
G2L["24"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["24"]["TextScaled"] = true;
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["24"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["24"]["BackgroundTransparency"] = 1;
G2L["24"]["Size"] = UDim2.new(-8.21033, 210, -0.53833, 30);
G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["24"]["Text"] = [[ClickToCopy]];
G2L["24"]["Position"] = UDim2.new(1.23488, 0, 0.19219, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Copy.TextButton
G2L["25"] = Instance.new("TextButton", G2L["22"]);
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["TextTransparency"] = 1;
G2L["25"]["TextSize"] = 14;
G2L["25"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["25"]["BackgroundTransparency"] = 1;
G2L["25"]["Size"] = UDim2.new(0, 76, 0, 21);
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["Position"] = UDim2.new(-0, 0, 0, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.COntainsKEy
G2L["26"] = Instance.new("ImageLabel", G2L["1f"]);
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["26"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["26"]["Image"] = [[rbxassetid://81864026272064]];
G2L["26"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["BackgroundTransparency"] = 1;
G2L["26"]["Name"] = [[COntainsKEy]];
G2L["26"]["Position"] = UDim2.new(0.07297, 0, 0.91121, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.COntainsKEy.UIAspectRatioConstraint
G2L["27"] = Instance.new("UIAspectRatioConstraint", G2L["26"]);



-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.COntainsKEy.TextLabel
G2L["28"] = Instance.new("TextLabel", G2L["26"]);
G2L["28"]["TextWrapped"] = true;
G2L["28"]["ZIndex"] = 2;
G2L["28"]["BorderSizePixel"] = 0;
G2L["28"]["TextSize"] = 20;
G2L["28"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["28"]["TextScaled"] = true;
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["28"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["28"]["BackgroundTransparency"] = 1;
G2L["28"]["Size"] = UDim2.new(-8.1865, 210, -0.53833, 30);
G2L["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["28"]["Text"] = [[ClickToCopy]];
G2L["28"]["Position"] = UDim2.new(1.23488, 0, 0.19219, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.COntainsKEy.TextButton
G2L["29"] = Instance.new("TextButton", G2L["26"]);
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["TextTransparency"] = 1;
G2L["29"]["TextSize"] = 14;
G2L["29"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["29"]["BackgroundTransparency"] = 1;
G2L["29"]["Size"] = UDim2.new(0, 76, 0, 21);
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["Position"] = UDim2.new(-0, 0, 0, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Count
G2L["2a"] = Instance.new("TextLabel", G2L["1f"]);
G2L["2a"]["BorderSizePixel"] = 0;
G2L["2a"]["TextSize"] = 28;
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["BackgroundTransparency"] = 1;
G2L["2a"]["Size"] = UDim2.new(0, 26, 0, 38);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["Text"] = [[1]];
G2L["2a"]["Name"] = [[Count]];
G2L["2a"]["Position"] = UDim2.new(-0.011, 0, 0, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Logo
G2L["2b"] = Instance.new("ImageLabel", G2L["1f"]);
G2L["2b"]["ZIndex"] = 2;
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2b"]["Image"] = [[rbxassetid://104649966280536]];
G2L["2b"]["Size"] = UDim2.new(0, 23, 0, 42);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["BackgroundTransparency"] = 1;
G2L["2b"]["Name"] = [[Logo]];
G2L["2b"]["Position"] = UDim2.new(0.87635, 0, 0.08106, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Logo.UICorner
G2L["2c"] = Instance.new("UICorner", G2L["2b"]);
G2L["2c"]["CornerRadius"] = UDim.new(0, 25);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Logo.UIAspectRatioConstraint
G2L["2d"] = Instance.new("UIAspectRatioConstraint", G2L["2b"]);



-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.View
G2L["2e"] = Instance.new("ImageLabel", G2L["1f"]);
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2e"]["Image"] = [[rbxassetid://104741126012073]];
G2L["2e"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2e"]["BackgroundTransparency"] = 1;
G2L["2e"]["Name"] = [[View]];
G2L["2e"]["Position"] = UDim2.new(0.08764, 0, 0.45621, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.View.UIAspectRatioConstraint
G2L["2f"] = Instance.new("UIAspectRatioConstraint", G2L["2e"]);



-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.View.TextLabel
G2L["30"] = Instance.new("TextLabel", G2L["2e"]);
G2L["30"]["TextWrapped"] = true;
G2L["30"]["ZIndex"] = 2;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["TextSize"] = 20;
G2L["30"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["30"]["TextScaled"] = true;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["30"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["30"]["BackgroundTransparency"] = 1;
G2L["30"]["Size"] = UDim2.new(-8.70037, 210, -0.53833, 30);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Text"] = [[1million]];
G2L["30"]["Position"] = UDim2.new(1.19593, 0, 0.19219, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Verify
G2L["31"] = Instance.new("ImageLabel", G2L["1f"]);
G2L["31"]["BorderSizePixel"] = 0;
G2L["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["31"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["31"]["Image"] = [[rbxassetid://106324515607448]];
G2L["31"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["BackgroundTransparency"] = 1;
G2L["31"]["Name"] = [[Verify]];
G2L["31"]["Position"] = UDim2.new(0.07838, 0, 0.56348, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Verify.UIAspectRatioConstraint
G2L["32"] = Instance.new("UIAspectRatioConstraint", G2L["31"]);



-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Verify.TextLabel
G2L["33"] = Instance.new("TextLabel", G2L["31"]);
G2L["33"]["TextWrapped"] = true;
G2L["33"]["ZIndex"] = 2;
G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["TextSize"] = 20;
G2L["33"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["33"]["TextScaled"] = true;
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["33"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["33"]["BackgroundTransparency"] = 1;
G2L["33"]["Size"] = UDim2.new(-8.30942, 210, -0.53833, 30);
G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["Text"] = [[ClickToCopy]];
G2L["33"]["Position"] = UDim2.new(1.2205, 0, 0.19219, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Verify.TextButton
G2L["34"] = Instance.new("TextButton", G2L["31"]);
G2L["34"]["BorderSizePixel"] = 0;
G2L["34"]["TextTransparency"] = 1;
G2L["34"]["TextSize"] = 14;
G2L["34"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["34"]["BackgroundTransparency"] = 1;
G2L["34"]["Size"] = UDim2.new(0, 76, 0, 21);
G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["Position"] = UDim2.new(-0, 0, 0, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Place
G2L["35"] = Instance.new("ImageLabel", G2L["1f"]);
G2L["35"]["BorderSizePixel"] = 0;
G2L["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["35"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["35"]["Image"] = [[rbxassetid://76183981184625]];
G2L["35"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["35"]["BackgroundTransparency"] = 1;
G2L["35"]["Name"] = [[Place]];
G2L["35"]["Position"] = UDim2.new(0.07772, 0, 0.68359, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Place.UIAspectRatioConstraint
G2L["36"] = Instance.new("UIAspectRatioConstraint", G2L["35"]);



-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Place.TextLabel
G2L["37"] = Instance.new("TextLabel", G2L["35"]);
G2L["37"]["TextWrapped"] = true;
G2L["37"]["ZIndex"] = 2;
G2L["37"]["BorderSizePixel"] = 0;
G2L["37"]["TextSize"] = 20;
G2L["37"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["37"]["TextScaled"] = true;
G2L["37"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["37"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["37"]["BackgroundTransparency"] = 1;
G2L["37"]["Size"] = UDim2.new(-7.91802, 210, -0.53833, 30);
G2L["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["37"]["Text"] = [[ClickToCopy]];
G2L["37"]["Position"] = UDim2.new(1.22225, 0, 0.19219, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.Place.TextButton
G2L["38"] = Instance.new("TextButton", G2L["35"]);
G2L["38"]["BorderSizePixel"] = 0;
G2L["38"]["TextTransparency"] = 1;
G2L["38"]["TextSize"] = 14;
G2L["38"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["38"]["BackgroundTransparency"] = 1;
G2L["38"]["Size"] = UDim2.new(0, 76, 0, 21);
G2L["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["Position"] = UDim2.new(-0, 0, 0, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.ImageLabel
G2L["39"] = Instance.new("ImageLabel", G2L["1f"]);
G2L["39"]["ZIndex"] = 2;
G2L["39"]["BorderSizePixel"] = 0;
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["39"]["ImageTransparency"] = 1;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["39"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["39"]["Image"] = [[rbxassetid://104649966280536]];
G2L["39"]["Size"] = UDim2.new(0, 23, 0, 42);
G2L["39"]["Visible"] = false;
G2L["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["39"]["BackgroundTransparency"] = 1;
G2L["39"]["Position"] = UDim2.new(0.68635, 0, 0.08106, 0);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.ImageLabel.UICorner
G2L["3a"] = Instance.new("UICorner", G2L["39"]);
G2L["3a"]["CornerRadius"] = UDim.new(0, 25);


-- StarterGui.ScreenGui.Mobile.ScrollingFrame.Example.ImageLabel.UIAspectRatioConstraint
G2L["3b"] = Instance.new("UIAspectRatioConstraint", G2L["39"]);



-- StarterGui.ScreenGui.Mobile.TextBox
G2L["3c"] = Instance.new("TextBox", G2L["3"]);
G2L["3c"]["ZIndex"] = 2;
G2L["3c"]["BorderSizePixel"] = 0;
G2L["3c"]["TextSize"] = 14;
G2L["3c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(19, 19, 19);
G2L["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3c"]["PlaceholderText"] = [[search your script]];
G2L["3c"]["Size"] = UDim2.new(0, 97, 0, 19);
G2L["3c"]["Position"] = UDim2.new(0.78426, 0, 0.14031, 0);
G2L["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["Text"] = [[]];
G2L["3c"]["BackgroundTransparency"] = 0.55;


-- StarterGui.ScreenGui.Mobile.ImageButton
G2L["3d"] = Instance.new("ImageButton", G2L["3"]);
G2L["3d"]["BorderSizePixel"] = 0;
G2L["3d"]["BackgroundTransparency"] = 1;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["3d"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 30);
G2L["3d"]["ImageColor3"] = Color3.fromRGB(71, 71, 71);
G2L["3d"]["ZIndex"] = 2;
G2L["3d"]["Image"] = [[rbxassetid://15985408996]];
G2L["3d"]["Size"] = UDim2.new(0.03, 14, 0.02, 14);
G2L["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3d"]["Rotation"] = 135;
G2L["3d"]["Position"] = UDim2.new(0.9493, 0, 0.13421, 0);


-- StarterGui.ScreenGui.Mobile.ImageButton.UIAspectRatioConstraint
G2L["3e"] = Instance.new("UIAspectRatioConstraint", G2L["3d"]);



-- StarterGui.ScreenGui.PC
G2L["3f"] = Instance.new("Frame", G2L["1"]);
G2L["3f"]["Visible"] = false;
G2L["3f"]["BorderSizePixel"] = 0;
G2L["3f"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["3f"]["Size"] = UDim2.new(0, 808, 0, 449);
G2L["3f"]["Position"] = UDim2.new(0.14804, 0, 0.11752, 0);
G2L["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3f"]["Name"] = [[PC]];


-- StarterGui.ScreenGui.PC.LocalScript
G2L["40"] = Instance.new("LocalScript", G2L["3f"]);



-- StarterGui.ScreenGui.PC.UIDrag
G2L["41"] = Instance.new("LocalScript", G2L["3f"]);
G2L["41"]["Name"] = [[UIDrag]];


-- StarterGui.ScreenGui.PC.Main
G2L["42"] = Instance.new("ScrollingFrame", G2L["3f"]);
G2L["42"]["Active"] = true;
G2L["42"]["BorderSizePixel"] = 0;
G2L["42"]["CanvasSize"] = UDim2.new(0, 0, 4, 0);
G2L["42"]["TopImage"] = [[]];
G2L["42"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
G2L["42"]["Name"] = [[Main]];
G2L["42"]["BottomImage"] = [[]];
G2L["42"]["Size"] = UDim2.new(0, 600, 0, 303);
G2L["42"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["42"]["Position"] = UDim2.new(0.03465, 0, 0.14197, 0);
G2L["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.ScreenGui.PC.Main.Code
G2L["43"] = Instance.new("TextBox", G2L["42"]);
G2L["43"]["Name"] = [[Code]];
G2L["43"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["43"]["BorderSizePixel"] = 0;
G2L["43"]["TextWrapped"] = true;
G2L["43"]["TextSize"] = 19;
G2L["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["43"]["MultiLine"] = true;
G2L["43"]["ClearTextOnFocus"] = false;
G2L["43"]["PlaceholderText"] = [[print("HELLO KRNL")]];
G2L["43"]["Size"] = UDim2.new(0, 585, 0, 1795);
G2L["43"]["Position"] = UDim2.new(0, 0, -5.30175, 0);
G2L["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["Text"] = [[]];
G2L["43"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.PC.Main.UIListLayout
G2L["44"] = Instance.new("UIListLayout", G2L["42"]);
G2L["44"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.ScreenGui.PC.Page
G2L["45"] = Instance.new("Frame", G2L["3f"]);
G2L["45"]["BorderSizePixel"] = 0;
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["Size"] = UDim2.new(0, 600, 0, 20);
G2L["45"]["Position"] = UDim2.new(0.03465, 0, 0.13586, 0);
G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Name"] = [[Page]];
G2L["45"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.PC.Page.UIListLayout
G2L["46"] = Instance.new("UIListLayout", G2L["45"]);
G2L["46"]["Padding"] = UDim.new(0, 1);
G2L["46"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["46"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["46"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- StarterGui.ScreenGui.PC.btn
G2L["47"] = Instance.new("Frame", G2L["3f"]);
G2L["47"]["BorderSizePixel"] = 0;
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["47"]["Size"] = UDim2.new(0, 600, 0, 58);
G2L["47"]["Position"] = UDim2.new(0.03465, 0, 0.83964, 0);
G2L["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["47"]["Name"] = [[btn]];
G2L["47"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.PC.btn.LocalScript
G2L["48"] = Instance.new("LocalScript", G2L["47"]);



-- StarterGui.ScreenGui.PC.btn.LocalScript.API
G2L["49"] = Instance.new("ModuleScript", G2L["48"]);
G2L["49"]["Name"] = [[API]];


-- StarterGui.ScreenGui.PC.btn.UIListLayout
G2L["4a"] = Instance.new("UIListLayout", G2L["47"]);
G2L["4a"]["Padding"] = UDim.new(0, 12);
G2L["4a"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["4a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["4a"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- StarterGui.ScreenGui.PC.btn.Exe
G2L["4b"] = Instance.new("TextButton", G2L["47"]);
G2L["4b"]["BorderSizePixel"] = 0;
G2L["4b"]["TextSize"] = 22;
G2L["4b"]["TextColor3"] = Color3.fromRGB(181, 181, 181);
G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
G2L["4b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4b"]["Size"] = UDim2.new(0, 192, 0, 44);
G2L["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4b"]["Text"] = [[Execute]];
G2L["4b"]["Name"] = [[Exe]];
G2L["4b"]["Position"] = UDim2.new(0, 0, 0.07759, 0);


-- StarterGui.ScreenGui.PC.btn.Exe.ImageLabel
G2L["4c"] = Instance.new("ImageLabel", G2L["4b"]);
G2L["4c"]["BorderSizePixel"] = 0;
G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["4c"]["Image"] = [[rbxassetid://94640768832047]];
G2L["4c"]["Size"] = UDim2.new(0, 25, 0, 44);
G2L["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4c"]["BackgroundTransparency"] = 1;
G2L["4c"]["Position"] = UDim2.new(0.80729, 0, 0.23455, 0);


-- StarterGui.ScreenGui.PC.btn.Exe.ImageLabel.UIAspectRatioConstraint
G2L["4d"] = Instance.new("UIAspectRatioConstraint", G2L["4c"]);



-- StarterGui.ScreenGui.PC.btn.Clr
G2L["4e"] = Instance.new("TextButton", G2L["47"]);
G2L["4e"]["BorderSizePixel"] = 0;
G2L["4e"]["TextSize"] = 22;
G2L["4e"]["TextColor3"] = Color3.fromRGB(181, 181, 181);
G2L["4e"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
G2L["4e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4e"]["Size"] = UDim2.new(0, 192, 0, 44);
G2L["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4e"]["Text"] = [[Clear]];
G2L["4e"]["Name"] = [[Clr]];
G2L["4e"]["Position"] = UDim2.new(0.33997, 0, 0.07759, 0);


-- StarterGui.ScreenGui.PC.btn.Clr.ImageLabel
G2L["4f"] = Instance.new("ImageLabel", G2L["4e"]);
G2L["4f"]["BorderSizePixel"] = 0;
G2L["4f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["4f"]["Image"] = [[rbxassetid://132971593063501]];
G2L["4f"]["Size"] = UDim2.new(0, 25, 0, 44);
G2L["4f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4f"]["BackgroundTransparency"] = 1;
G2L["4f"]["Position"] = UDim2.new(0.80729, 0, 0.23455, 0);


-- StarterGui.ScreenGui.PC.btn.Clr.ImageLabel.UIAspectRatioConstraint
G2L["50"] = Instance.new("UIAspectRatioConstraint", G2L["4f"]);



-- StarterGui.ScreenGui.PC.btn.Inj
G2L["51"] = Instance.new("TextButton", G2L["47"]);
G2L["51"]["BorderSizePixel"] = 0;
G2L["51"]["TextSize"] = 22;
G2L["51"]["TextColor3"] = Color3.fromRGB(181, 181, 181);
G2L["51"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
G2L["51"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["51"]["Size"] = UDim2.new(0, 192, 0, 44);
G2L["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["51"]["Text"] = [[Inject]];
G2L["51"]["Name"] = [[Inj]];
G2L["51"]["Position"] = UDim2.new(0.67993, 0, 0.07759, 0);


-- StarterGui.ScreenGui.PC.btn.Inj.ImageLabel
G2L["52"] = Instance.new("ImageLabel", G2L["51"]);
G2L["52"]["BorderSizePixel"] = 0;
G2L["52"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["52"]["Image"] = [[rbxassetid://110159304114119]];
G2L["52"]["Size"] = UDim2.new(0, 25, 0, 44);
G2L["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["52"]["BackgroundTransparency"] = 1;
G2L["52"]["Position"] = UDim2.new(0.80729, 0, 0.23455, 0);


-- StarterGui.ScreenGui.PC.btn.Inj.ImageLabel.UIAspectRatioConstraint
G2L["53"] = Instance.new("UIAspectRatioConstraint", G2L["52"]);



-- StarterGui.ScreenGui.PC.ScrollingFrame
G2L["54"] = Instance.new("ScrollingFrame", G2L["3f"]);
G2L["54"]["Active"] = true;
G2L["54"]["ZIndex"] = 2;
G2L["54"]["BorderSizePixel"] = 0;
G2L["54"]["CanvasSize"] = UDim2.new(0, 0, 10, 0);
G2L["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["54"]["Size"] = UDim2.new(0, 159, 0, 330);
G2L["54"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["54"]["Position"] = UDim2.new(0.78829, 0, 0.21769, 0);
G2L["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["54"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.PC.ScrollingFrame.UICorner
G2L["55"] = Instance.new("UICorner", G2L["54"]);
G2L["55"]["CornerRadius"] = UDim.new(0, 25);


-- StarterGui.ScreenGui.PC.ScrollingFrame.UIGridLayout
G2L["56"] = Instance.new("UIGridLayout", G2L["54"]);
G2L["56"]["CellSize"] = UDim2.new(0, 190, 0, 200);
G2L["56"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["56"]["CellPadding"] = UDim2.new(0, 5, 0, 10);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example
G2L["57"] = Instance.new("Frame", G2L["54"]);
G2L["57"]["ZIndex"] = 2;
G2L["57"]["BorderSizePixel"] = 0;
G2L["57"]["BackgroundColor3"] = Color3.fromRGB(91, 91, 91);
G2L["57"]["Size"] = UDim2.new(0, 392, 0, 124);
G2L["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["57"]["Name"] = [[Example]];
G2L["57"]["BackgroundTransparency"] = 0.45;


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.TextLabel
G2L["58"] = Instance.new("TextLabel", G2L["57"]);
G2L["58"]["TextWrapped"] = true;
G2L["58"]["ZIndex"] = 2;
G2L["58"]["BorderSizePixel"] = 0;
G2L["58"]["TextSize"] = 56;
G2L["58"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["58"]["TextScaled"] = true;
G2L["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["58"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["58"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["58"]["BackgroundTransparency"] = 1;
G2L["58"]["Size"] = UDim2.new(-0.41629, 210, 0.12521, 30);
G2L["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["58"]["Text"] = [[Example name]];
G2L["58"]["Position"] = UDim2.new(0.06758, 0, 0.13972, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.TextButton
G2L["59"] = Instance.new("TextButton", G2L["57"]);
G2L["59"]["BorderSizePixel"] = 0;
G2L["59"]["TextSize"] = 14;
G2L["59"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["59"]["BackgroundColor3"] = Color3.fromRGB(53, 53, 53);
G2L["59"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["59"]["ZIndex"] = 2;
G2L["59"]["Size"] = UDim2.new(0.22, 51, 0.02, 14);
G2L["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["59"]["Text"] = [[Run]];
G2L["59"]["Position"] = UDim2.new(0.11444, 0, 0.03621, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Copy
G2L["5a"] = Instance.new("ImageLabel", G2L["57"]);
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["5a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5a"]["Image"] = [[rbxassetid://86138545569367]];
G2L["5a"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["BackgroundTransparency"] = 1;
G2L["5a"]["Name"] = [[Copy]];
G2L["5a"]["Position"] = UDim2.new(0.07702, 0, 0.80121, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Copy.UIAspectRatioConstraint
G2L["5b"] = Instance.new("UIAspectRatioConstraint", G2L["5a"]);



-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Copy.TextLabel
G2L["5c"] = Instance.new("TextLabel", G2L["5a"]);
G2L["5c"]["TextWrapped"] = true;
G2L["5c"]["ZIndex"] = 2;
G2L["5c"]["BorderSizePixel"] = 0;
G2L["5c"]["TextSize"] = 20;
G2L["5c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["5c"]["TextScaled"] = true;
G2L["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["5c"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["5c"]["BackgroundTransparency"] = 1;
G2L["5c"]["Size"] = UDim2.new(-4.9395, 210, -0.53833, 30);
G2L["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5c"]["Text"] = [[ClickToCopy]];
G2L["5c"]["Position"] = UDim2.new(1.23488, 0, 0.19219, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Copy.TextButton
G2L["5d"] = Instance.new("TextButton", G2L["5a"]);
G2L["5d"]["BorderSizePixel"] = 0;
G2L["5d"]["TextTransparency"] = 1;
G2L["5d"]["TextSize"] = 14;
G2L["5d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5d"]["BackgroundTransparency"] = 1;
G2L["5d"]["Size"] = UDim2.new(0, 76, 0, 21);
G2L["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5d"]["Position"] = UDim2.new(-0, 0, 0, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.COntainsKEy
G2L["5e"] = Instance.new("ImageLabel", G2L["57"]);
G2L["5e"]["BorderSizePixel"] = 0;
G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["5e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5e"]["Image"] = [[rbxassetid://81864026272064]];
G2L["5e"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5e"]["BackgroundTransparency"] = 1;
G2L["5e"]["Name"] = [[COntainsKEy]];
G2L["5e"]["Position"] = UDim2.new(0.07297, 0, 0.91121, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.COntainsKEy.UIAspectRatioConstraint
G2L["5f"] = Instance.new("UIAspectRatioConstraint", G2L["5e"]);



-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.COntainsKEy.TextLabel
G2L["60"] = Instance.new("TextLabel", G2L["5e"]);
G2L["60"]["TextWrapped"] = true;
G2L["60"]["ZIndex"] = 2;
G2L["60"]["BorderSizePixel"] = 0;
G2L["60"]["TextSize"] = 20;
G2L["60"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["60"]["TextScaled"] = true;
G2L["60"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["60"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["60"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["60"]["BackgroundTransparency"] = 1;
G2L["60"]["Size"] = UDim2.new(-4.75641, 210, -0.53833, 30);
G2L["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["60"]["Text"] = [[ClickToCopy]];
G2L["60"]["Position"] = UDim2.new(1.23488, 0, 0.19219, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.COntainsKEy.TextButton
G2L["61"] = Instance.new("TextButton", G2L["5e"]);
G2L["61"]["BorderSizePixel"] = 0;
G2L["61"]["TextTransparency"] = 1;
G2L["61"]["TextSize"] = 14;
G2L["61"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["61"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["61"]["BackgroundTransparency"] = 1;
G2L["61"]["Size"] = UDim2.new(0, 76, 0, 21);
G2L["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["61"]["Position"] = UDim2.new(-0, 0, 0, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Count
G2L["62"] = Instance.new("TextLabel", G2L["57"]);
G2L["62"]["BorderSizePixel"] = 0;
G2L["62"]["TextSize"] = 28;
G2L["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["62"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["62"]["BackgroundTransparency"] = 1;
G2L["62"]["Size"] = UDim2.new(0, 26, 0, 38);
G2L["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["62"]["Text"] = [[1]];
G2L["62"]["Name"] = [[Count]];
G2L["62"]["Position"] = UDim2.new(-0.011, 0, 0, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Logo
G2L["63"] = Instance.new("ImageLabel", G2L["57"]);
G2L["63"]["ZIndex"] = 2;
G2L["63"]["BorderSizePixel"] = 0;
G2L["63"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["63"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["63"]["Image"] = [[rbxassetid://104649966280536]];
G2L["63"]["Size"] = UDim2.new(0, 23, 0, 42);
G2L["63"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["63"]["BackgroundTransparency"] = 1;
G2L["63"]["Name"] = [[Logo]];
G2L["63"]["Position"] = UDim2.new(0.68635, 0, 0.08106, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Logo.UICorner
G2L["64"] = Instance.new("UICorner", G2L["63"]);
G2L["64"]["CornerRadius"] = UDim.new(0, 25);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Logo.UIAspectRatioConstraint
G2L["65"] = Instance.new("UIAspectRatioConstraint", G2L["63"]);



-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.View
G2L["66"] = Instance.new("ImageLabel", G2L["57"]);
G2L["66"]["BorderSizePixel"] = 0;
G2L["66"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["66"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["66"]["Image"] = [[rbxassetid://104741126012073]];
G2L["66"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["66"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["66"]["BackgroundTransparency"] = 1;
G2L["66"]["Name"] = [[View]];
G2L["66"]["Position"] = UDim2.new(0.08764, 0, 0.45621, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.View.UIAspectRatioConstraint
G2L["67"] = Instance.new("UIAspectRatioConstraint", G2L["66"]);



-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.View.TextLabel
G2L["68"] = Instance.new("TextLabel", G2L["66"]);
G2L["68"]["TextWrapped"] = true;
G2L["68"]["ZIndex"] = 2;
G2L["68"]["BorderSizePixel"] = 0;
G2L["68"]["TextSize"] = 20;
G2L["68"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["68"]["TextScaled"] = true;
G2L["68"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["68"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["68"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["68"]["BackgroundTransparency"] = 1;
G2L["68"]["Size"] = UDim2.new(-5.69334, 210, -0.53833, 30);
G2L["68"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["68"]["Text"] = [[1million]];
G2L["68"]["Position"] = UDim2.new(1.23488, 0, 0.19219, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Verify
G2L["69"] = Instance.new("ImageLabel", G2L["57"]);
G2L["69"]["BorderSizePixel"] = 0;
G2L["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["69"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["69"]["Image"] = [[rbxassetid://106324515607448]];
G2L["69"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["69"]["BackgroundTransparency"] = 1;
G2L["69"]["Name"] = [[Verify]];
G2L["69"]["Position"] = UDim2.new(0.07838, 0, 0.56348, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Verify.UIAspectRatioConstraint
G2L["6a"] = Instance.new("UIAspectRatioConstraint", G2L["69"]);



-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Verify.TextLabel
G2L["6b"] = Instance.new("TextLabel", G2L["69"]);
G2L["6b"]["TextWrapped"] = true;
G2L["6b"]["ZIndex"] = 2;
G2L["6b"]["BorderSizePixel"] = 0;
G2L["6b"]["TextSize"] = 20;
G2L["6b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["6b"]["TextScaled"] = true;
G2L["6b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["6b"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["6b"]["BackgroundTransparency"] = 1;
G2L["6b"]["Size"] = UDim2.new(-4.98053, 210, -0.53833, 30);
G2L["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6b"]["Text"] = [[ClickToCopy]];
G2L["6b"]["Position"] = UDim2.new(1.23488, 0, 0.19219, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Verify.TextButton
G2L["6c"] = Instance.new("TextButton", G2L["69"]);
G2L["6c"]["BorderSizePixel"] = 0;
G2L["6c"]["TextTransparency"] = 1;
G2L["6c"]["TextSize"] = 14;
G2L["6c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6c"]["BackgroundTransparency"] = 1;
G2L["6c"]["Size"] = UDim2.new(0, 76, 0, 21);
G2L["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6c"]["Position"] = UDim2.new(-0, 0, 0, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Place
G2L["6d"] = Instance.new("ImageLabel", G2L["57"]);
G2L["6d"]["BorderSizePixel"] = 0;
G2L["6d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6d"]["Image"] = [[rbxassetid://76183981184625]];
G2L["6d"]["Size"] = UDim2.new(0, 17, 0, 31);
G2L["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6d"]["BackgroundTransparency"] = 1;
G2L["6d"]["Name"] = [[Place]];
G2L["6d"]["Position"] = UDim2.new(0.07772, 0, 0.68359, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Place.UIAspectRatioConstraint
G2L["6e"] = Instance.new("UIAspectRatioConstraint", G2L["6d"]);



-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Place.TextLabel
G2L["6f"] = Instance.new("TextLabel", G2L["6d"]);
G2L["6f"]["TextWrapped"] = true;
G2L["6f"]["ZIndex"] = 2;
G2L["6f"]["BorderSizePixel"] = 0;
G2L["6f"]["TextSize"] = 20;
G2L["6f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["6f"]["TextScaled"] = true;
G2L["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["6f"]["TextColor3"] = Color3.fromRGB(235, 235, 235);
G2L["6f"]["BackgroundTransparency"] = 1;
G2L["6f"]["Size"] = UDim2.new(-4.26692, 210, -0.53833, 30);
G2L["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6f"]["Text"] = [[ClickToCopy]];
G2L["6f"]["Position"] = UDim2.new(1.23488, 0, 0.19219, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.Place.TextButton
G2L["70"] = Instance.new("TextButton", G2L["6d"]);
G2L["70"]["BorderSizePixel"] = 0;
G2L["70"]["TextTransparency"] = 1;
G2L["70"]["TextSize"] = 14;
G2L["70"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["70"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["70"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["70"]["BackgroundTransparency"] = 1;
G2L["70"]["Size"] = UDim2.new(0, 76, 0, 21);
G2L["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["70"]["Position"] = UDim2.new(-0, 0, 0, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.ImageLabel
G2L["71"] = Instance.new("ImageLabel", G2L["57"]);
G2L["71"]["ZIndex"] = 2;
G2L["71"]["BorderSizePixel"] = 0;
G2L["71"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["71"]["ImageTransparency"] = 1;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["71"]["Image"] = [[rbxassetid://104649966280536]];
G2L["71"]["Size"] = UDim2.new(0, 23, 0, 42);
G2L["71"]["Visible"] = false;
G2L["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["71"]["BackgroundTransparency"] = 1;
G2L["71"]["Position"] = UDim2.new(0.68635, 0, 0.08106, 0);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.ImageLabel.UICorner
G2L["72"] = Instance.new("UICorner", G2L["71"]);
G2L["72"]["CornerRadius"] = UDim.new(0, 25);


-- StarterGui.ScreenGui.PC.ScrollingFrame.Example.ImageLabel.UIAspectRatioConstraint
G2L["73"] = Instance.new("UIAspectRatioConstraint", G2L["71"]);



-- StarterGui.ScreenGui.PC.TextBox
G2L["74"] = Instance.new("TextBox", G2L["3f"]);
G2L["74"]["ZIndex"] = 2;
G2L["74"]["BorderSizePixel"] = 0;
G2L["74"]["TextSize"] = 14;
G2L["74"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["74"]["BackgroundColor3"] = Color3.fromRGB(19, 19, 19);
G2L["74"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["74"]["PlaceholderText"] = [[search your script]];
G2L["74"]["Size"] = UDim2.new(0, 137, 0, 27);
G2L["74"]["Position"] = UDim2.new(0.78562, 0, 0.14031, 0);
G2L["74"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["74"]["Text"] = [[]];
G2L["74"]["BackgroundTransparency"] = 0.55;


-- StarterGui.ScreenGui.PC.ImageButton
G2L["75"] = Instance.new("ImageButton", G2L["3f"]);
G2L["75"]["BorderSizePixel"] = 0;
G2L["75"]["BackgroundTransparency"] = 1;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["75"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 30);
G2L["75"]["ImageColor3"] = Color3.fromRGB(71, 71, 71);
G2L["75"]["ZIndex"] = 2;
G2L["75"]["Image"] = [[rbxassetid://15985408996]];
G2L["75"]["Size"] = UDim2.new(0, 21, 0, 21);
G2L["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["75"]["Rotation"] = 135;
G2L["75"]["Position"] = UDim2.new(0.96096, 0, 0.14433, 0);


-- StarterGui.ScreenGui.PC.ImageButton.UIAspectRatioConstraint
G2L["76"] = Instance.new("UIAspectRatioConstraint", G2L["75"]);



-- StarterGui.ScreenGui.PC.Top
G2L["77"] = Instance.new("Frame", G2L["3f"]);
G2L["77"]["BorderSizePixel"] = 0;
G2L["77"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
G2L["77"]["Size"] = UDim2.new(0, 808, 0, 50);
G2L["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["77"]["Name"] = [[Top]];


-- StarterGui.ScreenGui.PC.Top.KRNL
G2L["78"] = Instance.new("ImageLabel", G2L["77"]);
G2L["78"]["BorderSizePixel"] = 0;
G2L["78"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["78"]["Image"] = [[rbxassetid://125999447519604]];
G2L["78"]["Size"] = UDim2.new(0, 57, 0, 53);
G2L["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["78"]["BackgroundTransparency"] = 1;
G2L["78"]["Name"] = [[KRNL]];


-- StarterGui.ScreenGui.PC.Top.KRNL.UIAspectRatioConstraint
G2L["79"] = Instance.new("UIAspectRatioConstraint", G2L["78"]);



-- StarterGui.ScreenGui.PC.Top.TextLabel
G2L["7a"] = Instance.new("TextLabel", G2L["77"]);
G2L["7a"]["BorderSizePixel"] = 0;
G2L["7a"]["TextSize"] = 17;
G2L["7a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["7a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7a"]["BackgroundTransparency"] = 1;
G2L["7a"]["Size"] = UDim2.new(0, 169, 0, 52);
G2L["7a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7a"]["Text"] = [[KRNL Executor]];
G2L["7a"]["Position"] = UDim2.new(0.06535, 0, 0.02, 0);


-- StarterGui.ScreenGui.PC.Top.Load
G2L["7b"] = Instance.new("TextButton", G2L["77"]);
G2L["7b"]["TextWrapped"] = true;
G2L["7b"]["BorderSizePixel"] = 0;
G2L["7b"]["TextSize"] = 22;
G2L["7b"]["TextScaled"] = true;
G2L["7b"]["TextColor3"] = Color3.fromRGB(181, 181, 181);
G2L["7b"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
G2L["7b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7b"]["Size"] = UDim2.new(0.04948, 63, 0.15862, 17);
G2L["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7b"]["Text"] = [[ElysianHub]];
G2L["7b"]["Name"] = [[Load]];
G2L["7b"]["Position"] = UDim2.new(0.85951, 0, 0.23558, 0);


-- StarterGui.ScreenGui.PC.Top.Load.LocalScript
G2L["7c"] = Instance.new("LocalScript", G2L["7b"]);



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

G2L_MODULES[G2L["11"]] = {
Closure = function()
    local script = G2L["11"];local M = {}

local Button = {
	clear = script.Parent.Parent.Clr,
	execute = script.Parent.Parent.Exe,
	inject = script.Parent.Parent.Inj
}

local function notify(Title, msg, duration)
	game.StarterGui:SetCore("SendNotification", {
		Title = Title,
		Text = msg,
		Duration = duration or 5,
	})
end

function M.LoadAPI(textbox)
	Button.execute.MouseButton1Click:Connect(function()
		loadstring(textbox.Text)()
	end)
	
	Button.clear.MouseButton1Click:Connect(function()
		textbox.Text = ""
	end)
	
	Button.inject.MouseButton1Click:Connect(function()
		notify("Krnl", "injecting please wait!", 5)
		task.wait(5)
		local remote = game.ReplicatedStorage:FindFirstChild("__KRNL")
		if remote then
			notify("Krnl", "Already injected", 5)
		else
			local newRemote = Instance.new("RemoteFunction")
			newRemote.Name = "__KRNL"
			newRemote.Parent = game.ReplicatedStorage
			notify("Krnl", "Successfully injected", 5)
		end
	end)
end

return M


end;
};
G2L_MODULES[G2L["49"]] = {
Closure = function()
    local script = G2L["49"];local M = {}

local Button = {
	clear = script.Parent.Parent.Clr,
	execute = script.Parent.Parent.Exe,
	inject = script.Parent.Parent.Inj
}

local function notify(Title, msg, duration)
	game.StarterGui:SetCore("SendNotification", {
		Title = Title,
		Text = msg,
		Duration = duration or 5,
	})
end

function M.LoadAPI(textbox)
	Button.execute.MouseButton1Click:Connect(function()
		loadstring(textbox.Text)()
	end)
	
	Button.clear.MouseButton1Click:Connect(function()
		textbox.Text = ""
	end)
	
	Button.inject.MouseButton1Click:Connect(function()
		notify("Krnl", "injecting please wait!", 5)
		task.wait(5)
		local remote = game.ReplicatedStorage:FindFirstChild("__KRNL")
		if remote then
			notify("Krnl", "Already injected", 5)
		else
			local newRemote = Instance.new("RemoteFunction")
			newRemote.Name = "__KRNL"
			newRemote.Parent = game.ReplicatedStorage
			notify("Krnl", "Successfully injected", 5)
		end
	end)
end

return M


end;
};
-- StarterGui.ScreenGui.Runner
local function C_2()
local script = G2L["2"];
	local usertype = game:GetService("UserInputService")
	
	if usertype.KeyboardEnabled  then
		script.Parent.Mobile.Visible = false
		script.Parent.PC.Visible = true
		
	elseif usertype.TouchEnabled then
		script.Parent.Mobile.Visible = true
		script.Parent.PC.Visible = false
	end
end;
task.spawn(C_2);
-- StarterGui.ScreenGui.Mobile.LocalScript
local function C_4()
local script = G2L["4"];
	local Example = script.Parent.ScrollingFrame:FindFirstChild("Example")
	local Searchbtn = script.Parent:FindFirstChild("ImageButton")
	local search = script.Parent:FindFirstChild("TextBox")
	
	local HttpService = game:GetService("HttpService")
	
	if Example then
		Example.Visible = false
	end
	
	local function clearResults()
		local scrollingFrame = script.Parent.ScrollingFrame
		local children = scrollingFrame:GetChildren()
		for i = #children, 1, -1 do
			local child = children[i]
			if child.Name ~= "Example" and child:IsA("Frame") then
				child:Destroy()
			elseif child.Name == "Example" and child ~= Example then
				child:Destroy()
			end
		end
	end
	
	local function SearchScripts(txt)
		clearResults()
		local ok, response = pcall(function()
			return game:HttpGet("https://scriptblox.com/api/script/search?q="..txt.."&page=1&max=1000")
		end)
		if not ok or not response then return end
	
		local data = HttpService:JSONDecode(response)
		if not data.result or not data.result.scripts or #data.result.scripts == 0 then
			if Example then
				local noResult = Example:Clone()
				noResult.Name = "NoResult"
				noResult.Parent = script.Parent.ScrollingFrame
				noResult.Visible = true
				noResult.Size = UDim2.new(1,-10,0,40)
				local textLabel = noResult:FindFirstChild("TextLabel")
				if textLabel then
					textLabel.Text = "No results found."
				end
				local textButton = noResult:FindFirstChild("TextButton")
				if textButton then
					textButton.Visible = false
				end
			end
			return
		end
	
		for i = 1, #data.result.scripts do
			local info = data.result.scripts[i]
			if Example then
				local holder = Example:Clone()
				holder.Name = "Result_"..tostring(i)
				holder.Parent = script.Parent.ScrollingFrame
				holder.Visible = true
				holder.Size = UDim2.new(1,-10,0,40)
	
				if info.key == false then
					holder.COntainsKEy.TextLabel.Text = " Dont Contains Key!!"
				elseif info.key == true then
					holder.COntainsKEy.TextLabel.Text = "Contains Key!!"
				end
	
				if info.verified == false then
					holder.Verify.TextLabel.Text = "Not Verified!"
				elseif info.verified == true then
					holder.Verify.TextLabel.Text = "Verified!"
				end
	
				
				local countLabel = holder:FindFirstChild("Count")
				if countLabel and countLabel:IsA("TextLabel") then
					countLabel.Text = tostring(i)
				end
	
				holder.Place.TextLabel.Text = tostring(info.game._id)
				holder.Copy.TextButton.MouseButton1Click:Connect(function()
					setclipboard(tostring(info.script))
				end)
	
				local viewLabel = holder:FindFirstChild("View")
				if viewLabel and viewLabel:FindFirstChild("TextLabel") then
					viewLabel.TextLabel.Text = tostring(info.views or "0")
				end
	
				local textLabel = holder:FindFirstChild("TextLabel")
				if textLabel then
					textLabel.Text = info.title or "No Title"
				end
	
				local textButton = holder:FindFirstChild("TextButton")
				if textButton then
					textButton.Visible = true
					textButton.MouseButton1Click:Connect(function()
						pcall(function()
							loadstring(info.script)()
						end)
					end)
				end
	
				local imageLabel = holder:FindFirstChild("ImageLabel")
				if imageLabel then
					imageLabel.Image = "rbxassetid://"..tostring(info.imageUrl)
				end
			end
		end
	end
	
	if Searchbtn then
		Searchbtn.MouseButton1Click:Connect(function()
			if search and search.Text ~= "" then
				SearchScripts(search.Text)
			end
		end)
	end
	
	
end;
task.spawn(C_4);
-- StarterGui.ScreenGui.Mobile.UIDrag
local function C_5()
local script = G2L["5"];
	-- Made by Real_IceyDev (@lceyDex) --
	-- Simple UI dragger (PC Only/Any device that has a mouse) --
	
	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end;
task.spawn(C_5);
-- StarterGui.ScreenGui.Mobile.Top.Load.LocalScript
local function C_b()
local script = G2L["b"];
	script.Parent.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/G4mg1/ElysianHub/refs/heads/main/README.md"))()
	end)
end;
task.spawn(C_b);
-- StarterGui.ScreenGui.Mobile.btn.LocalScript
local function C_10()
local script = G2L["10"];
	local re = require(script.API)
	local textbox = script.Parent.Parent.Main.Code
	
	re.LoadAPI(textbox)
end;
task.spawn(C_10);
-- StarterGui.ScreenGui.PC.LocalScript
local function C_40()
local script = G2L["40"];
	local Example = script.Parent.ScrollingFrame:FindFirstChild("Example")
	local Searchbtn = script.Parent:FindFirstChild("ImageButton")
	local search = script.Parent:FindFirstChild("TextBox")
	
	local HttpService = game:GetService("HttpService")
	
	if Example then
		Example.Visible = false
	end
	
	local function clearResults()
		local scrollingFrame = script.Parent.ScrollingFrame
		local children = scrollingFrame:GetChildren()
		for i = #children, 1, -1 do
			local child = children[i]
			if child.Name ~= "Example" and child:IsA("Frame") then
				child:Destroy()
			elseif child.Name == "Example" and child ~= Example then
				child:Destroy()
			end
		end
	end
	
	local function SearchScripts(txt)
		clearResults()
		local ok, response = pcall(function()
			return game:HttpGet("https://scriptblox.com/api/script/search?q="..txt.."&page=1&max=1000")
		end)
		if not ok or not response then return end
	
		local data = HttpService:JSONDecode(response)
		if not data.result or not data.result.scripts or #data.result.scripts == 0 then
			if Example then
				local noResult = Example:Clone()
				noResult.Name = "NoResult"
				noResult.Parent = script.Parent.ScrollingFrame
				noResult.Visible = true
				noResult.Size = UDim2.new(1,-10,0,40)
				local textLabel = noResult:FindFirstChild("TextLabel")
				if textLabel then
					textLabel.Text = "No results found."
				end
				local textButton = noResult:FindFirstChild("TextButton")
				if textButton then
					textButton.Visible = false
				end
			end
			return
		end
	
		for i = 1, #data.result.scripts do
			local info = data.result.scripts[i]
			if Example then
				local holder = Example:Clone()
				holder.Name = "Result_"..tostring(i)
				holder.Parent = script.Parent.ScrollingFrame
				holder.Visible = true
				holder.Size = UDim2.new(1,-10,0,40)
	
				if info.key == false then
					holder.COntainsKEy.TextLabel.Text = " Dont Contains Key!!"
				elseif info.key == true then
					holder.COntainsKEy.TextLabel.Text = "Contains Key!!"
				end
	
				if info.verified == false then
					holder.Verify.TextLabel.Text = "Not Verified!"
				elseif info.verified == true then
					holder.Verify.TextLabel.Text = "Verified!"
				end
	
				
				local countLabel = holder:FindFirstChild("Count")
				if countLabel and countLabel:IsA("TextLabel") then
					countLabel.Text = tostring(i)
				end
	
				holder.Place.TextLabel.Text = tostring(info.game._id)
				holder.Copy.TextButton.MouseButton1Click:Connect(function()
					setclipboard(tostring(info.script))
				end)
	
				local viewLabel = holder:FindFirstChild("View")
				if viewLabel and viewLabel:FindFirstChild("TextLabel") then
					viewLabel.TextLabel.Text = tostring(info.views or "0")
				end
	
				local textLabel = holder:FindFirstChild("TextLabel")
				if textLabel then
					textLabel.Text = info.title or "No Title"
				end
	
				local textButton = holder:FindFirstChild("TextButton")
				if textButton then
					textButton.Visible = true
					textButton.MouseButton1Click:Connect(function()
						pcall(function()
							loadstring(info.script)()
						end)
					end)
				end
	
				local imageLabel = holder:FindFirstChild("ImageLabel")
				if imageLabel then
					imageLabel.Image = "rbxassetid://"..tostring(info.imageUrl)
				end
			end
		end
	end
	
	if Searchbtn then
		Searchbtn.MouseButton1Click:Connect(function()
			if search and search.Text ~= "" then
				SearchScripts(search.Text)
			end
		end)
	end
	
	
end;
task.spawn(C_40);
-- StarterGui.ScreenGui.PC.UIDrag
local function C_41()
local script = G2L["41"];
	-- Made by Real_IceyDev (@lceyDex) --
	-- Simple UI dragger (PC Only/Any device that has a mouse) --
	
	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end;
task.spawn(C_41);
-- StarterGui.ScreenGui.PC.btn.LocalScript
local function C_48()
local script = G2L["48"];
	local re = require(script.API)
	local textbox = script.Parent.Parent.Main.Code
	
	re.LoadAPI(textbox)
end;
task.spawn(C_48);
-- StarterGui.ScreenGui.PC.Top.Load.LocalScript
local function C_7c()
local script = G2L["7c"];
	script.Parent.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/G4mg1/ElysianHub/refs/heads/main/README.md"))()
	end)
end;
task.spawn(C_7c);

return G2L["1"], require;
