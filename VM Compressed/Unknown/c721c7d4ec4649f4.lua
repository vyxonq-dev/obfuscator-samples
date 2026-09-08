local cdwashere = {};

-- StarterGui.Stigma Ultimate (Lua Version)
cdwashere["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
cdwashere["1"]["DisplayOrder"] = 1999999999;
cdwashere["1"]["Name"] = [[Stigma Ultimate (Lua Version)]];
cdwashere["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
cdwashere["1"]["ResetOnSpawn"] = false;


-- StarterGui.Stigma Ultimate (Lua Version).TopBar
cdwashere["2"] = Instance.new("Frame", cdwashere["1"]);
cdwashere["2"]["BorderSizePixel"] = 0;
cdwashere["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["2"]["Size"] = UDim2.new(0, 713, 0, 30);
cdwashere["2"]["Position"] = UDim2.new(0.5, 0, 0.3, 0);
cdwashere["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["2"]["Name"] = [[TopBar]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.UIStroke
cdwashere["3"] = Instance.new("UIStroke", cdwashere["2"]);
cdwashere["3"]["Transparency"] = 0.5;
cdwashere["3"]["Color"] = Color3.fromRGB(66, 66, 66);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Line
cdwashere["4"] = Instance.new("Frame", cdwashere["2"]);
cdwashere["4"]["ZIndex"] = 100;
cdwashere["4"]["BorderSizePixel"] = 0;
cdwashere["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["4"]["Size"] = UDim2.new(1, 0, 0, 1);
cdwashere["4"]["Position"] = UDim2.new(0, 0, 1, 0);
cdwashere["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["4"]["Name"] = [[Line]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.ExitButton
cdwashere["5"] = Instance.new("Frame", cdwashere["2"]);
cdwashere["5"]["BorderSizePixel"] = 0;
cdwashere["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["5"]["Size"] = UDim2.new(0, 43, 0, 30);
cdwashere["5"]["Position"] = UDim2.new(1, -43, -0, 0);
cdwashere["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["5"]["Name"] = [[ExitButton]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.ExitButton.Icon
cdwashere["6"] = Instance.new("ImageLabel", cdwashere["5"]);
cdwashere["6"]["BorderSizePixel"] = 0;
cdwashere["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["6"]["Image"] = [[rbxassetid://89147200827095]];
cdwashere["6"]["Size"] = UDim2.new(0, 10, 0, 10);
cdwashere["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["6"]["BackgroundTransparency"] = 1;
cdwashere["6"]["Name"] = [[Icon]];
cdwashere["6"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.ExitButton.LocalScript
cdwashere["7"] = Instance.new("LocalScript", cdwashere["5"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.ExitButton.Button
cdwashere["8"] = Instance.new("TextButton", cdwashere["5"]);
cdwashere["8"]["BorderSizePixel"] = 0;
cdwashere["8"]["TextSize"] = 14;
cdwashere["8"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["8"]["ZIndex"] = 2;
cdwashere["8"]["BackgroundTransparency"] = 1;
cdwashere["8"]["Size"] = UDim2.new(1, 0, 1, 0);
cdwashere["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["8"]["Text"] = [[]];
cdwashere["8"]["Name"] = [[Button]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Expand
cdwashere["9"] = Instance.new("Frame", cdwashere["2"]);
cdwashere["9"]["BorderSizePixel"] = 0;
cdwashere["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["9"]["Size"] = UDim2.new(0, 43, 0, 30);
cdwashere["9"]["Position"] = UDim2.new(1, -86, 0, 0);
cdwashere["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["9"]["Name"] = [[Expand]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Expand.Icon
cdwashere["a"] = Instance.new("ImageLabel", cdwashere["9"]);
cdwashere["a"]["BorderSizePixel"] = 0;
cdwashere["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["a"]["Image"] = [[rbxassetid://107492258303282]];
cdwashere["a"]["Size"] = UDim2.new(0, 10, 0, 10);
cdwashere["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["a"]["BackgroundTransparency"] = 1;
cdwashere["a"]["Name"] = [[Icon]];
cdwashere["a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Expand.LocalScript
cdwashere["b"] = Instance.new("LocalScript", cdwashere["9"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Expand.Button
cdwashere["c"] = Instance.new("TextButton", cdwashere["9"]);
cdwashere["c"]["BorderSizePixel"] = 0;
cdwashere["c"]["TextSize"] = 14;
cdwashere["c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["c"]["ZIndex"] = 2;
cdwashere["c"]["BackgroundTransparency"] = 1;
cdwashere["c"]["Size"] = UDim2.new(1, 0, 1, 0);
cdwashere["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["c"]["Text"] = [[]];
cdwashere["c"]["Name"] = [[Button]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Minimize
cdwashere["d"] = Instance.new("Frame", cdwashere["2"]);
cdwashere["d"]["BorderSizePixel"] = 0;
cdwashere["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["d"]["Size"] = UDim2.new(0, 43, 0, 30);
cdwashere["d"]["Position"] = UDim2.new(1, -129, 0, 0);
cdwashere["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["d"]["Name"] = [[Minimize]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Minimize.Icon
cdwashere["e"] = Instance.new("ImageLabel", cdwashere["d"]);
cdwashere["e"]["BorderSizePixel"] = 0;
cdwashere["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["e"]["Image"] = [[rbxassetid://118084930426480]];
cdwashere["e"]["Size"] = UDim2.new(0, 10, 0, 10);
cdwashere["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["e"]["BackgroundTransparency"] = 1;
cdwashere["e"]["Name"] = [[Icon]];
cdwashere["e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Minimize.LocalScript
cdwashere["f"] = Instance.new("LocalScript", cdwashere["d"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Minimize.Button
cdwashere["10"] = Instance.new("TextButton", cdwashere["d"]);
cdwashere["10"]["BorderSizePixel"] = 0;
cdwashere["10"]["TextSize"] = 14;
cdwashere["10"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["10"]["ZIndex"] = 2;
cdwashere["10"]["BackgroundTransparency"] = 1;
cdwashere["10"]["Size"] = UDim2.new(1, 0, 1, 0);
cdwashere["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["10"]["Text"] = [[]];
cdwashere["10"]["Name"] = [[Button]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor
cdwashere["11"] = Instance.new("Frame", cdwashere["2"]);
cdwashere["11"]["ZIndex"] = -1;
cdwashere["11"]["BorderSizePixel"] = 0;
cdwashere["11"]["BackgroundColor3"] = Color3.fromRGB(241, 241, 241);
cdwashere["11"]["Size"] = UDim2.new(1, 0, 0, 440);
cdwashere["11"]["Position"] = UDim2.new(0, 0, 1.03333, 0);
cdwashere["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["11"]["Name"] = [[Executor]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.UIStroke
cdwashere["12"] = Instance.new("UIStroke", cdwashere["11"]);
cdwashere["12"]["Transparency"] = 0.5;
cdwashere["12"]["Color"] = Color3.fromRGB(66, 66, 66);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside
cdwashere["13"] = Instance.new("Frame", cdwashere["11"]);
cdwashere["13"]["BorderSizePixel"] = 0;
cdwashere["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["13"]["Size"] = UDim2.new(1, 0, 1, -25);
cdwashere["13"]["Position"] = UDim2.new(0, 0, 0, 25);
cdwashere["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["13"]["Name"] = [[Inside]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox
cdwashere["14"] = Instance.new("Frame", cdwashere["13"]);
cdwashere["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["14"]["Size"] = UDim2.new(0, 482, 0, 316);
cdwashere["14"]["Position"] = UDim2.new(0, 2, 0, 6);
cdwashere["14"]["BorderColor3"] = Color3.fromRGB(161, 161, 161);
cdwashere["14"]["Name"] = [[FastColoredTextbox]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll
cdwashere["15"] = Instance.new("ScrollingFrame", cdwashere["14"]);
cdwashere["15"]["Active"] = true;
cdwashere["15"]["ZIndex"] = 2;
cdwashere["15"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
cdwashere["15"]["TopImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
cdwashere["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["15"]["Name"] = [[Scroll]];
cdwashere["15"]["BottomImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
cdwashere["15"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["15"]["Size"] = UDim2.new(1, -1, 1, -1);
cdwashere["15"]["ScrollBarImageColor3"] = Color3.fromRGB(80, 80, 80);
cdwashere["15"]["Position"] = UDim2.new(0.5, 0, 0.5, 1);
cdwashere["15"]["BorderColor3"] = Color3.fromRGB(106, 106, 106);
cdwashere["15"]["ScrollBarThickness"] = 16;


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.TextBox
cdwashere["16"] = Instance.new("TextBox", cdwashere["15"]);
cdwashere["16"]["TextXAlignment"] = Enum.TextXAlignment.Left;
cdwashere["16"]["PlaceholderColor3"] = Color3.fromRGB(179, 179, 179);
cdwashere["16"]["BorderSizePixel"] = 0;
cdwashere["16"]["TextWrapped"] = true;
cdwashere["16"]["TextTransparency"] = 0.75;
cdwashere["16"]["TextSize"] = 15;
cdwashere["16"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["16"]["TextYAlignment"] = Enum.TextYAlignment.Top;
cdwashere["16"]["BackgroundColor3"] = Color3.fromRGB(29, 35, 46);
cdwashere["16"]["RichText"] = true;
cdwashere["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["16"]["MultiLine"] = true;
cdwashere["16"]["ClearTextOnFocus"] = false;
cdwashere["16"]["Size"] = UDim2.new(10, -27, 1, 0);
cdwashere["16"]["Position"] = UDim2.new(0, 20, 0, 0);
cdwashere["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["16"]["Text"] = [[]];
cdwashere["16"]["BackgroundTransparency"] = 1;


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.TextBox.LineChecker
cdwashere["17"] = Instance.new("LocalScript", cdwashere["16"]);
cdwashere["17"]["Name"] = [[LineChecker]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.LinesFrame
cdwashere["18"] = Instance.new("Frame", cdwashere["15"]);
cdwashere["18"]["BorderSizePixel"] = 0;
cdwashere["18"]["BackgroundColor3"] = Color3.fromRGB(222, 222, 222);
cdwashere["18"]["Size"] = UDim2.new(0, 20, 17.91826, 0);
cdwashere["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["18"]["Name"] = [[LinesFrame]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.LinesFrame.TextLabelTemplate
cdwashere["19"] = Instance.new("TextLabel", cdwashere["18"]);
cdwashere["19"]["TextWrapped"] = true;
cdwashere["19"]["BorderSizePixel"] = 0;
cdwashere["19"]["TextSize"] = 15;
cdwashere["19"]["TextScaled"] = true;
cdwashere["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["19"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["19"]["BackgroundTransparency"] = 1;
cdwashere["19"]["Size"] = UDim2.new(0, 20, 0, 15);
cdwashere["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["19"]["Text"] = [[1]];
cdwashere["19"]["Name"] = [[TextLabelTemplate]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.LinesFrame.UIListLayout
cdwashere["1a"] = Instance.new("UIListLayout", cdwashere["18"]);
cdwashere["1a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.LinesValue
cdwashere["1b"] = Instance.new("NumberValue", cdwashere["15"]);
cdwashere["1b"]["Name"] = [[LinesValue]];
cdwashere["1b"]["Value"] = 1;


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.Lines
cdwashere["1c"] = Instance.new("LocalScript", cdwashere["15"]);
cdwashere["1c"]["Name"] = [[Lines]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.Highlighting
cdwashere["1d"] = Instance.new("TextLabel", cdwashere["15"]);
cdwashere["1d"]["TextWrapped"] = true;
cdwashere["1d"]["BorderSizePixel"] = 0;
cdwashere["1d"]["TextSize"] = 15;
cdwashere["1d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
cdwashere["1d"]["TextYAlignment"] = Enum.TextYAlignment.Top;
cdwashere["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["1d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["1d"]["BackgroundTransparency"] = 1;
cdwashere["1d"]["RichText"] = true;
cdwashere["1d"]["Size"] = UDim2.new(10, -27, 1, 0);
cdwashere["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["1d"]["Text"] = [[]];
cdwashere["1d"]["Name"] = [[Highlighting]];
cdwashere["1d"]["Position"] = UDim2.new(0, 20, 0, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.UIStroke
cdwashere["1e"] = Instance.new("UIStroke", cdwashere["15"]);
cdwashere["1e"]["Transparency"] = 0.82;
cdwashere["1e"]["Color"] = Color3.fromRGB(216, 168, 255);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.Syntax
cdwashere["1f"] = Instance.new("LocalScript", cdwashere["15"]);
cdwashere["1f"]["Name"] = [[Syntax]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.LineSelector
cdwashere["20"] = Instance.new("Frame", cdwashere["15"]);
cdwashere["20"]["ZIndex"] = -7;
cdwashere["20"]["BorderSizePixel"] = 0;
cdwashere["20"]["BackgroundColor3"] = Color3.fromRGB(178, 197, 255);
cdwashere["20"]["Size"] = UDim2.new(1, 0, 0, 15);
cdwashere["20"]["Position"] = UDim2.new(0, 20, 0, 0);
cdwashere["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["20"]["Name"] = [[LineSelector]];
cdwashere["20"]["BackgroundTransparency"] = 1;


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.Selector
cdwashere["21"] = Instance.new("LocalScript", cdwashere["15"]);
cdwashere["21"]["Name"] = [[Selector]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.Cursor
cdwashere["22"] = Instance.new("Frame", cdwashere["15"]);
cdwashere["22"]["BorderSizePixel"] = 0;
cdwashere["22"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["22"]["Size"] = UDim2.new(0, 1, 0, 15);
cdwashere["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["22"]["Name"] = [[Cursor]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.CursorScript
cdwashere["23"] = Instance.new("LocalScript", cdwashere["15"]);
cdwashere["23"]["Name"] = [[CursorScript]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.TextMeasurer
cdwashere["24"] = Instance.new("TextLabel", cdwashere["15"]);
cdwashere["24"]["BorderSizePixel"] = 0;
cdwashere["24"]["TextSize"] = 15;
cdwashere["24"]["TextXAlignment"] = Enum.TextXAlignment.Left;
cdwashere["24"]["TextYAlignment"] = Enum.TextYAlignment.Top;
cdwashere["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["24"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["24"]["BackgroundTransparency"] = 1;
cdwashere["24"]["RichText"] = true;
cdwashere["24"]["Size"] = UDim2.new(10, -27, 1, 0);
cdwashere["24"]["Visible"] = false;
cdwashere["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["24"]["Text"] = [[]];
cdwashere["24"]["Name"] = [[TextMeasurer]];
cdwashere["24"]["Position"] = UDim2.new(0, 20, 0, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.AutomaticScrollBarSize
cdwashere["25"] = Instance.new("LocalScript", cdwashere["15"]);
cdwashere["25"]["Name"] = [[AutomaticScrollBarSize]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.LineButtom
cdwashere["26"] = Instance.new("Frame", cdwashere["14"]);
cdwashere["26"]["ZIndex"] = 100;
cdwashere["26"]["BorderSizePixel"] = 0;
cdwashere["26"]["BackgroundColor3"] = Color3.fromRGB(228, 228, 228);
cdwashere["26"]["Size"] = UDim2.new(1, 0, 0, 1);
cdwashere["26"]["Position"] = UDim2.new(0, 1, 1, 0);
cdwashere["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["26"]["Name"] = [[LineButtom]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.LineRight
cdwashere["27"] = Instance.new("Frame", cdwashere["14"]);
cdwashere["27"]["ZIndex"] = 100;
cdwashere["27"]["BorderSizePixel"] = 0;
cdwashere["27"]["BackgroundColor3"] = Color3.fromRGB(228, 228, 228);
cdwashere["27"]["Size"] = UDim2.new(0, 1, 1, 0);
cdwashere["27"]["Position"] = UDim2.new(1, 0, 0, 0);
cdwashere["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["27"]["Name"] = [[LineRight]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Execute
cdwashere["28"] = Instance.new("ImageLabel", cdwashere["13"]);
cdwashere["28"]["BorderSizePixel"] = 0;
cdwashere["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["28"]["Image"] = [[rbxassetid://75573445620342]];
cdwashere["28"]["Size"] = UDim2.new(0, 49, 0, 115);
cdwashere["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["28"]["BackgroundTransparency"] = 1;
cdwashere["28"]["Name"] = [[Execute]];
cdwashere["28"]["Position"] = UDim2.new(0, 488, 0, 5);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Execute.Text
cdwashere["29"] = Instance.new("ImageLabel", cdwashere["28"]);
cdwashere["29"]["BorderSizePixel"] = 0;
cdwashere["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["29"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["29"]["Image"] = [[rbxassetid://100825135027443]];
cdwashere["29"]["Size"] = UDim2.new(0, 30, 0, 9);
cdwashere["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["29"]["BackgroundTransparency"] = 1;
cdwashere["29"]["Name"] = [[Text]];
cdwashere["29"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Execute.LocalScript
cdwashere["2a"] = Instance.new("LocalScript", cdwashere["28"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Execute.Button
cdwashere["2b"] = Instance.new("TextButton", cdwashere["28"]);
cdwashere["2b"]["BorderSizePixel"] = 0;
cdwashere["2b"]["TextSize"] = 14;
cdwashere["2b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["2b"]["BackgroundTransparency"] = 1;
cdwashere["2b"]["Size"] = UDim2.new(1, 0, 1, 0);
cdwashere["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["2b"]["Text"] = [[]];
cdwashere["2b"]["Name"] = [[Button]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Execute.Button.LocalScript
cdwashere["2c"] = Instance.new("LocalScript", cdwashere["2b"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Clear
cdwashere["2d"] = Instance.new("ImageLabel", cdwashere["13"]);
cdwashere["2d"]["BorderSizePixel"] = 0;
cdwashere["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["2d"]["Image"] = [[rbxassetid://75573445620342]];
cdwashere["2d"]["Size"] = UDim2.new(0, 49, 0, 104);
cdwashere["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["2d"]["BackgroundTransparency"] = 1;
cdwashere["2d"]["Name"] = [[Clear]];
cdwashere["2d"]["Position"] = UDim2.new(0, 488, 0, 124);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Clear.Text
cdwashere["2e"] = Instance.new("ImageLabel", cdwashere["2d"]);
cdwashere["2e"]["BorderSizePixel"] = 0;
cdwashere["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["2e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["2e"]["Image"] = [[rbxassetid://115944720629396]];
cdwashere["2e"]["Size"] = UDim2.new(0, 40, 0, 8);
cdwashere["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["2e"]["BackgroundTransparency"] = 1;
cdwashere["2e"]["Name"] = [[Text]];
cdwashere["2e"]["Position"] = UDim2.new(0.5, -1, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Clear.LocalScript
cdwashere["2f"] = Instance.new("LocalScript", cdwashere["2d"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Clear.Button
cdwashere["30"] = Instance.new("TextButton", cdwashere["2d"]);
cdwashere["30"]["BorderSizePixel"] = 0;
cdwashere["30"]["TextSize"] = 14;
cdwashere["30"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["30"]["BackgroundTransparency"] = 1;
cdwashere["30"]["Size"] = UDim2.new(1, 0, 1, 0);
cdwashere["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["30"]["Text"] = [[]];
cdwashere["30"]["Name"] = [[Button]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Clear.Button.LocalScript
cdwashere["31"] = Instance.new("LocalScript", cdwashere["30"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Load
cdwashere["32"] = Instance.new("ImageLabel", cdwashere["13"]);
cdwashere["32"]["BorderSizePixel"] = 0;
cdwashere["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["32"]["Image"] = [[rbxassetid://75573445620342]];
cdwashere["32"]["Size"] = UDim2.new(0, 49, 0, 91);
cdwashere["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["32"]["BackgroundTransparency"] = 1;
cdwashere["32"]["Name"] = [[Load]];
cdwashere["32"]["Position"] = UDim2.new(0, 488, 0, 232);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Load.Text
cdwashere["33"] = Instance.new("ImageLabel", cdwashere["32"]);
cdwashere["33"]["BorderSizePixel"] = 0;
cdwashere["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["33"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["33"]["Image"] = [[rbxassetid://136284563958419]];
cdwashere["33"]["Size"] = UDim2.new(0, 40, 0, 9);
cdwashere["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["33"]["BackgroundTransparency"] = 1;
cdwashere["33"]["Name"] = [[Text]];
cdwashere["33"]["Position"] = UDim2.new(0.5, -1, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Load.LocalScript
cdwashere["34"] = Instance.new("LocalScript", cdwashere["32"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Output
cdwashere["35"] = Instance.new("Frame", cdwashere["13"]);
cdwashere["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["35"]["Size"] = UDim2.new(0, 531, 0, 54);
cdwashere["35"]["Position"] = UDim2.new(0, 5, 0, 333);
cdwashere["35"]["BorderColor3"] = Color3.fromRGB(131, 136, 145);
cdwashere["35"]["Name"] = [[Output]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Output.Lines
cdwashere["36"] = Instance.new("ScrollingFrame", cdwashere["35"]);
cdwashere["36"]["Active"] = true;
cdwashere["36"]["BorderSizePixel"] = 0;
cdwashere["36"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
cdwashere["36"]["TopImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
cdwashere["36"]["BackgroundColor3"] = Color3.fromRGB(241, 241, 241);
cdwashere["36"]["Name"] = [[Lines]];
cdwashere["36"]["BottomImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
cdwashere["36"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["36"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
cdwashere["36"]["Size"] = UDim2.new(1, -2, 1, -2);
cdwashere["36"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["36"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
cdwashere["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Output.Lines.UIListLayout
cdwashere["37"] = Instance.new("UIListLayout", cdwashere["36"]);
cdwashere["37"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Output.Lines.LocalScript
cdwashere["38"] = Instance.new("LocalScript", cdwashere["36"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.>
cdwashere["39"] = Instance.new("ImageLabel", cdwashere["13"]);
cdwashere["39"]["BorderSizePixel"] = 0;
cdwashere["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["39"]["Image"] = [[rbxassetid://116962370783403]];
cdwashere["39"]["Size"] = UDim2.new(0, 6, 0, 7);
cdwashere["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["39"]["BackgroundTransparency"] = 1;
cdwashere["39"]["Name"] = [[>]];
cdwashere["39"]["Position"] = UDim2.new(0, 7, 0, 399);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.CmdBar
cdwashere["3a"] = Instance.new("ImageLabel", cdwashere["13"]);
cdwashere["3a"]["BorderSizePixel"] = 0;
cdwashere["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["3a"]["Image"] = [[rbxassetid://116191135841016]];
cdwashere["3a"]["Size"] = UDim2.new(0, 695, 0, 20);
cdwashere["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["3a"]["BackgroundTransparency"] = 1;
cdwashere["3a"]["Name"] = [[CmdBar]];
cdwashere["3a"]["Position"] = UDim2.new(0, 17, 0, 392);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.CmdBar.TextBox
cdwashere["3b"] = Instance.new("TextBox", cdwashere["3a"]);
cdwashere["3b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
cdwashere["3b"]["BorderSizePixel"] = 0;
cdwashere["3b"]["TextSize"] = 14;
cdwashere["3b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
cdwashere["3b"]["Size"] = UDim2.new(1, -4, 1, 0);
cdwashere["3b"]["Position"] = UDim2.new(0, 4, 0, 0);
cdwashere["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["3b"]["Text"] = [[]];
cdwashere["3b"]["BackgroundTransparency"] = 1;


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Frame
cdwashere["3c"] = Instance.new("Frame", cdwashere["13"]);
cdwashere["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
cdwashere["3c"]["Size"] = UDim2.new(0, 166, 0, 366);
cdwashere["3c"]["Position"] = UDim2.new(0, 543, 0, 6);
cdwashere["3c"]["BorderColor3"] = Color3.fromRGB(131, 136, 145);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Dex
cdwashere["3d"] = Instance.new("ImageLabel", cdwashere["11"]);
cdwashere["3d"]["BorderSizePixel"] = 0;
cdwashere["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["3d"]["Image"] = [[rbxassetid://132955609022468]];
cdwashere["3d"]["Size"] = UDim2.new(0, 44, 0, 22);
cdwashere["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["3d"]["BackgroundTransparency"] = 1;
cdwashere["3d"]["Name"] = [[Dex]];
cdwashere["3d"]["Position"] = UDim2.new(1, -47, 0, 1);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Dex.Text
cdwashere["3e"] = Instance.new("ImageLabel", cdwashere["3d"]);
cdwashere["3e"]["BorderSizePixel"] = 0;
cdwashere["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["3e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["3e"]["Image"] = [[rbxassetid://124612305319416]];
cdwashere["3e"]["Size"] = UDim2.new(0, 26, 0, 8);
cdwashere["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["3e"]["BackgroundTransparency"] = 1;
cdwashere["3e"]["Name"] = [[Text]];
cdwashere["3e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Dex.LocalScript
cdwashere["3f"] = Instance.new("LocalScript", cdwashere["3d"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.R6
cdwashere["40"] = Instance.new("ImageLabel", cdwashere["11"]);
cdwashere["40"]["BorderSizePixel"] = 0;
cdwashere["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["40"]["Image"] = [[rbxassetid://94345372292839]];
cdwashere["40"]["Size"] = UDim2.new(0, 36, 0, 22);
cdwashere["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["40"]["BackgroundTransparency"] = 1;
cdwashere["40"]["Name"] = [[R6]];
cdwashere["40"]["Position"] = UDim2.new(1, -90, 0, 1);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.R6.Text
cdwashere["41"] = Instance.new("ImageLabel", cdwashere["40"]);
cdwashere["41"]["BorderSizePixel"] = 0;
cdwashere["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["41"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["41"]["Image"] = [[rbxassetid://71791492337681]];
cdwashere["41"]["Size"] = UDim2.new(0, 17, 0, 8);
cdwashere["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["41"]["BackgroundTransparency"] = 1;
cdwashere["41"]["Name"] = [[Text]];
cdwashere["41"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.R6.LocalScript
cdwashere["42"] = Instance.new("LocalScript", cdwashere["40"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Hide
cdwashere["43"] = Instance.new("ImageLabel", cdwashere["11"]);
cdwashere["43"]["BorderSizePixel"] = 0;
cdwashere["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["43"]["Image"] = [[rbxassetid://80519824964932]];
cdwashere["43"]["Size"] = UDim2.new(0, 60, 0, 22);
cdwashere["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["43"]["BackgroundTransparency"] = 1;
cdwashere["43"]["Name"] = [[Hide]];
cdwashere["43"]["Position"] = UDim2.new(1, -157, 0, 1);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Hide.Text
cdwashere["44"] = Instance.new("ImageLabel", cdwashere["43"]);
cdwashere["44"]["BorderSizePixel"] = 0;
cdwashere["44"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["44"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["44"]["Image"] = [[rbxassetid://105129982110125]];
cdwashere["44"]["Size"] = UDim2.new(0, 32, 0, 8);
cdwashere["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["44"]["BackgroundTransparency"] = 1;
cdwashere["44"]["Name"] = [[Text]];
cdwashere["44"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Hide.LocalScript
cdwashere["45"] = Instance.new("LocalScript", cdwashere["43"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Dial
cdwashere["46"] = Instance.new("ImageLabel", cdwashere["11"]);
cdwashere["46"]["BorderSizePixel"] = 0;
cdwashere["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["46"]["Image"] = [[rbxassetid://112774266364294]];
cdwashere["46"]["Size"] = UDim2.new(0, 51, 0, 22);
cdwashere["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["46"]["BackgroundTransparency"] = 1;
cdwashere["46"]["Name"] = [[Dial]];
cdwashere["46"]["Position"] = UDim2.new(1, -215, 0, 1);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Dial.Text
cdwashere["47"] = Instance.new("ImageLabel", cdwashere["46"]);
cdwashere["47"]["BorderSizePixel"] = 0;
cdwashere["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["47"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
cdwashere["47"]["Image"] = [[rbxassetid://75781921916947]];
cdwashere["47"]["Size"] = UDim2.new(0, 33, 0, 8);
cdwashere["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["47"]["BackgroundTransparency"] = 1;
cdwashere["47"]["Name"] = [[Text]];
cdwashere["47"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Dial.LocalScript
cdwashere["48"] = Instance.new("LocalScript", cdwashere["46"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.FakeTabs
cdwashere["49"] = Instance.new("ImageLabel", cdwashere["11"]);
cdwashere["49"]["Interactable"] = false;
cdwashere["49"]["BorderSizePixel"] = 0;
cdwashere["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["49"]["Image"] = [[rbxassetid://125387927253553]];
cdwashere["49"]["Size"] = UDim2.new(0, 131, 0, 22);
cdwashere["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["49"]["BackgroundTransparency"] = 1;
cdwashere["49"]["Name"] = [[FakeTabs]];
cdwashere["49"]["Position"] = UDim2.new(0, 0, 0, 3);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.UIDragDetector
cdwashere["4a"] = Instance.new("UIDragDetector", cdwashere["2"]);



-- StarterGui.Stigma Ultimate (Lua Version).TopBar.ImageLabel
cdwashere["4b"] = Instance.new("ImageLabel", cdwashere["2"]);
cdwashere["4b"]["BorderSizePixel"] = 0;
cdwashere["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
cdwashere["4b"]["Image"] = [[rbxassetid://71536695379015]];
cdwashere["4b"]["Size"] = UDim2.new(0, 115, 1, 0);
cdwashere["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
cdwashere["4b"]["BackgroundTransparency"] = 1;
cdwashere["4b"]["Position"] = UDim2.new(0, 0, 0, 1);


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Logo
cdwashere["4c"] = Instance.new("LocalScript", cdwashere["2"]);
cdwashere["4c"]["Name"] = [[Logo]];


-- StarterGui.Stigma Ultimate (Lua Version).TopBar.ExitButton.LocalScript
local function C_7()
local script = cdwashere["7"];
	local buttonframe = script.Parent
	local icon = buttonframe.Icon
	buttonframe.MouseEnter:Connect(function()
		buttonframe.BackgroundColor3 = Color3.fromRGB(200, 44, 28)
		icon.Image = "rbxassetid://124181583672545"
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.Image = "rbxassetid://89147200827095"
	end)
end;
task.spawn(C_7);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Expand.LocalScript
local function C_b()
local script = cdwashere["b"];
	local buttonframe = script.Parent
	local icon = buttonframe.Icon
	buttonframe.MouseEnter:Connect(function()
		buttonframe.BackgroundColor3 = Color3.fromRGB(240, 236, 236)
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end)
end;
task.spawn(C_b);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Minimize.LocalScript
local function C_f()
local script = cdwashere["f"];
	local buttonframe = script.Parent
	local icon = buttonframe.Icon
	buttonframe.MouseEnter:Connect(function()
		buttonframe.BackgroundColor3 = Color3.fromRGB(240, 236, 236)
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end)
end;
task.spawn(C_f);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.TextBox.LineChecker
local function C_17()
local script = cdwashere["17"];
	local textBox = script.Parent
	local linesValue = script.Parent.Parent.LinesValue
	
	local function countLines(text)
		local _, count = string.gsub(text, "\n", "\n")
		return count + 1
	end
	
	local lastLineCount = countLines(textBox.Text)
	
	textBox:GetPropertyChangedSignal("Text"):Connect(function()
		local currentLineCount = countLines(textBox.Text)
		if currentLineCount ~= lastLineCount then
			-- Update the NumberValue based on the difference
			local diff = currentLineCount - lastLineCount
			linesValue.Value += diff
			lastLineCount = currentLineCount
		end
	end)
	
end;
task.spawn(C_17);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.Lines
local function C_1c()
local script = cdwashere["1c"];
	local scrollingFrame = script.Parent
	local frame = scrollingFrame:FindFirstChild("LinesFrame")
	local template = frame:FindFirstChild("TextLabelTemplate")
	local linesValue = scrollingFrame:FindFirstChild("LinesValue")
	
	if not frame or not template or not linesValue then
		warn("LOL, something went wrong in the code dummy")-------------------------------------------------------------------------------------
		return
	end
	
	local clones = {}
	--local currentLineCount = linesValue.Value
	local currentLineCount = 1
	
	linesValue:GetPropertyChangedSignal("Value"):Connect(function()
		local newLineCount = linesValue.Value
	
		if newLineCount > currentLineCount then
			for _ = 1, newLineCount - currentLineCount do
				local clone = template:Clone()
				clone.Visible = true
				clone.Text = tostring(#clones + 2)
				clone.Parent = frame
				table.insert(clones, clone)
			end
		elseif newLineCount < currentLineCount then
			for _ = 1, currentLineCount - newLineCount do
				local lastClone = table.remove(clones)
				if lastClone then
					lastClone:Destroy()
				end
			end
		end
	
		currentLineCount = newLineCount
	end)
end;
task.spawn(C_1c);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.Syntax
local function C_1f()
local script = cdwashere["1f"];
	local scrollingFrame = script.Parent
	local textBox = scrollingFrame:WaitForChild("TextBox")
	local highlightLabel = scrollingFrame:WaitForChild("Highlighting")
	
	local keywords = {
		-- Lua base
		["and"] = true, ["break"] = true, ["do"] = true, ["else"] = true,
		["elseif"] = true, ["end"] = true, ["false"] = true, ["for"] = true,
		["function"] = true, ["if"] = true, ["in"] = true, ["local"] = true,
		["nil"] = true, ["not"] = true, ["or"] = true, ["repeat"] = true,
		["return"] = true, ["then"] = true, ["true"] = true, ["until"] = true,
		["while"] = true,["require"] = true,
	
		-- Lua globals
		["print"] = true, ["pairs"] = true, ["ipairs"] = true, ["next"] = true,
		["tonumber"] = true, ["tostring"] = true, ["type"] = true, ["pcall"] = true,
		["xpcall"] = true, ["coroutine"] = true, ["table"] = true, ["string"] = true,
		["math"] = true, ["os"] = true,
	
		-- Roblox common types/functions
		["game"] = true, ["workspace"] = true, ["script"] = true, ["Instance"] = true,
		["Vector3"] = true, ["CFrame"] = true, ["Color3"] = true, ["UDim2"] = true,
		["Enum"] = true, ["wait"] = true, ["delay"] = true, ["spawn"] = true,
		["tick"] = true, ["time"] = true,
	}
	
	local colorMap = {
		["keyword"] = Color3.fromRGB(255, 112, 129),
		["string"] = Color3.fromRGB(172, 235, 144),
		["comment"] = Color3.fromRGB(120, 120, 120),
		["number"] = Color3.fromRGB(255, 196, 1),
	}
	
	local function highlight(code)
		local result = ""
		local i = 1
	
		while i <= #code do
			local char = code:sub(i, i)
	
			if code:sub(i, i+1) == "--" then
				local comment = code:sub(i):match("^%-%-[^\n]*")
				result ..= `<font color="rgb(120,120,120)">{comment}</font>`
				i += #comment
			elseif char == '"' or char == "'" then
				local quote = char
				local s, e = code:find(quote..".-"..quote, i)
				if s then
					local str = code:sub(s, e)
					result ..= `<font color="rgb(172, 235, 144)">{str}</font>`
					i = e + 1
				else
					result ..= char
					i += 1
				end
			elseif code:sub(i):match("^%d") then
				local num = code:sub(i):match("^%d+%.?%d*")
				result ..= `<font color="rgb(255, 198, 1)">{num}</font>`
				i += #num
			elseif code:sub(i):match("^%a") then
				local word = code:sub(i):match("^[%a_][%w_]*")
				if keywords[word] then
					result ..= `<font color="rgb(255, 112, 129)">{word}</font>`
				else
					result ..= word
				end
				i += #word
			else
				result ..= char
				i += 1
			end
		end
		return result
	end
	
	local function sync()
		highlightLabel.Text = highlight(textBox.Text)
		highlightLabel.Size = textBox.Size
		highlightLabel.Position = textBox.Position
	end
	
	textBox:GetPropertyChangedSignal("Text"):Connect(sync)
	textBox:GetPropertyChangedSignal("CursorPosition"):Connect(sync)
	textBox:GetPropertyChangedSignal("Size"):Connect(sync)
	sync()
end;
task.spawn(C_1f);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.Selector
local function C_21()
local script = cdwashere["21"];
	local fastTextBox = script.Parent
	local textBox = fastTextBox:WaitForChild("TextBox")
	local selector = fastTextBox:WaitForChild("LineSelector")
	
	local lineHeight = textBox.TextSize
	selector.BackgroundTransparency = 0.85
	
	local TweenService = game:GetService("TweenService")
	local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	local function updateLineSelector()
		local cursor = textBox.CursorPosition
		if cursor <= 0 then
			selector.Visible = false
			return
		end
	
		local textBeforeCursor = textBox.Text:sub(1, cursor)
		local lineNumber = select(2, textBeforeCursor:gsub("\n", "\n")) + 1
		local targetPosition = UDim2.new(0, 20, 0, (lineNumber - 1) * lineHeight)
		local targetSize = UDim2.new(1, 0, 0, lineHeight)
	
		TweenService:Create(selector, tweenInfo, {
			Position = targetPosition,
			Size = targetSize,
		}):Play()
		selector.Visible = true
	end
	textBox:GetPropertyChangedSignal("CursorPosition"):Connect(updateLineSelector)
	textBox:GetPropertyChangedSignal("Text"):Connect(updateLineSelector)
	
	updateLineSelector()
end;
task.spawn(C_21);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.CursorScript
local function C_23()
local script = cdwashere["23"];
	local fastTextBox = script.Parent
	local textBox = fastTextBox:WaitForChild("TextBox")
	local cursorFrame = fastTextBox:WaitForChild("Cursor")
	local measurer = fastTextBox:WaitForChild("TextMeasurer")
	local blinkInterval = 0.5
	local offsetX = 20
	local lineHeight = textBox.TextSize
	
	cursorFrame.Size = UDim2.new(0, 1, 0, lineHeight)
	cursorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	local function updateCursor()
		local cursorPos = textBox.CursorPosition
		if cursorPos <= 0 then
			cursorFrame.Visible = false
			return
		end
	
		local textBeforeCursor = textBox.Text:sub(1, cursorPos - 1)
		local lineNumber = select(2, textBeforeCursor:gsub("\n", "\n")) + 1
		local lastNewline = textBeforeCursor:match(".*()\n")
		local currentLineText = lastNewline and textBeforeCursor:sub(lastNewline + 1) or textBeforeCursor
	
		measurer.Text = currentLineText
		local textWidth = measurer.TextBounds.X
		local xPos = textWidth + offsetX
		local yPos = (lineNumber - 1) * lineHeight
		
		cursorFrame.Position = UDim2.new(0, xPos, 0, yPos)
		cursorFrame.Visible = true
	end
	
	local function blink()
		while true do
			cursorFrame.Visible = not cursorFrame.Visible
			wait(blinkInterval)
		end
	end
	
	textBox:GetPropertyChangedSignal("CursorPosition"):Connect(updateCursor)
	textBox:GetPropertyChangedSignal("Text"):Connect(updateCursor)
	
	spawn(blink)
	updateCursor()
end;
task.spawn(C_23);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.FastColoredTextbox.Scroll.AutomaticScrollBarSize
local function C_25()
local script = cdwashere["25"];
	local scrollingFrame = script.Parent
	local textBox = scrollingFrame:WaitForChild("TextBox")
	local textService = game:GetService("TextService")
	
	local function updateCanvasSize()
		local textSize = textService:GetTextSize(
			textBox.Text,
			textBox.TextSize,
			textBox.Font,
			Vector2.new(math.huge, math.huge)
		)
		local paddingX, paddingY = 10, 10
	
		scrollingFrame.CanvasSize = UDim2.new(
			0, textSize.X + paddingX,
			0, textSize.Y + paddingY
		)
	end
	textBox:GetPropertyChangedSignal("Text"):Connect(updateCanvasSize)
	updateCanvasSize()
end;
task.spawn(C_25);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Execute.LocalScript
local function C_2a()
local script = cdwashere["2a"];
	local buttonframe = script.Parent
	buttonframe.MouseEnter:Connect(function()
		buttonframe.Image = "rbxassetid://135868158416070"
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.Image = "rbxassetid://75573445620342"
	end)
end;
task.spawn(C_2a);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Execute.Button.LocalScript
local function C_2c()
local script = cdwashere["2c"];
	local fastcoloredtextbox = script.Parent.Parent.Parent.FastColoredTextbox
	script.Parent.MouseButton1Click:Connect(function()
		loadstring(fastcoloredtextbox.Scroll.TextBox.Text)()
	end)
end;
task.spawn(C_2c);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Clear.LocalScript
local function C_2f()
local script = cdwashere["2f"];
	local buttonframe = script.Parent
	buttonframe.MouseEnter:Connect(function()
		buttonframe.Image = "rbxassetid://90705258500182"
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.Image = "rbxassetid://75573445620342"
	end)
end;
task.spawn(C_2f);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Clear.Button.LocalScript
local function C_31()
local script = cdwashere["31"];
	local fastcoloredtextbox = script.Parent.Parent.Parent.FastColoredTextbox
	script.Parent.MouseButton1Click:Connect(function()
		fastcoloredtextbox.Scroll.TextBox.Text = ""
		fastcoloredtextbox.Scroll.Highlighting.Text = ""
		fastcoloredtextbox.Scroll.TextMeasurer.Text = ""
	end)
end;
task.spawn(C_31);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Load.LocalScript
local function C_34()
local script = cdwashere["34"];
	local buttonframe = script.Parent
	buttonframe.MouseEnter:Connect(function()
		buttonframe.Image = "rbxassetid://99787951177033"
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.Image = "rbxassetid://75573445620342"
	end)
end;
task.spawn(C_34);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Inside.Output.Lines.LocalScript
local function C_38()
local script = cdwashere["38"];
	local log_service = game:GetService("LogService")
	local scrolling_frame = script.Parent
	
	local function get_time_string()
		local time = os.date("*t")
		return string.format("[%02d:%02d:%02d]", time.hour, time.min, time.sec)
	end
	
	local function create_log_label(message, message_type)
		local label = Instance.new("TextLabel",scrolling_frame)
		label.Size = UDim2.new(1, 0, 0, 20)
		label.BackgroundTransparency = 1
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.Font = Enum.Font.SourceSans
		label.TextSize = 16
		label.TextWrapped = true
	
		local timestamp = get_time_string()
		label.Text = string.format("%s %s", timestamp, message)
	
		if message_type == Enum.MessageType.MessageOutput then
			label.TextColor3 = Color3.fromRGB(0, 0, 0)
		elseif message_type == Enum.MessageType.MessageWarning then
			label.TextColor3 = Color3.fromRGB(255, 255, 0)
		elseif message_type == Enum.MessageType.MessageError then
			label.TextColor3 = Color3.fromRGB(255, 0, 0)
		else
			label.TextColor3 = Color3.fromRGB(200, 200, 200)
		end
	end
	
	log_service.MessageOut:Connect(function(message, message_type)
		create_log_label(message, message_type)
	end)
	
end;
task.spawn(C_38);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Dex.LocalScript
local function C_3f()
local script = cdwashere["3f"];
	local buttonframe = script.Parent
	buttonframe.MouseEnter:Connect(function()
		buttonframe.Image = "rbxassetid://83505663931886"
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.Image = "rbxassetid://132955609022468"
	end)
end;
task.spawn(C_3f);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.R6.LocalScript
local function C_42()
local script = cdwashere["42"];
	local buttonframe = script.Parent
	buttonframe.MouseEnter:Connect(function()
		buttonframe.Image = "rbxassetid://127869245380602"
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.Image = "rbxassetid://94345372292839"
	end)
end;
task.spawn(C_42);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Hide.LocalScript
local function C_45()
local script = cdwashere["45"];
	local buttonframe = script.Parent
	buttonframe.MouseEnter:Connect(function()
		buttonframe.Image = "rbxassetid://76507323936918"
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.Image = "rbxassetid://80519824964932"
	end)
end;
task.spawn(C_45);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Executor.Dial.LocalScript
local function C_48()
local script = cdwashere["48"];
	local buttonframe = script.Parent
	buttonframe.MouseEnter:Connect(function()
		buttonframe.Image = "rbxassetid://135274225468305"
	end)
	buttonframe.MouseLeave:Connect(function()
		buttonframe.Image = "rbxassetid://112774266364294"
	end)
end;
task.spawn(C_48);
-- StarterGui.Stigma Ultimate (Lua Version).TopBar.Logo
local function C_4c()
local script = cdwashere["4c"];
	if script.Parent.Parent.Enabled ~= true then
		return
	end
	loadstring(game:HttpGet("https://raw.githubusercontent.com/C-Dr1ve/Executor-Remakes-In-Lua/refs/heads/main/Logos/Stigma.lua"))()
end;
task.spawn(C_4c);

return cdwashere["1"], require;
