local pl = game:GetService("Players")
local lp = pl.LocalPlayer
local PlayerGui = lp:WaitForChild("PlayerGui")

local G2L = {};



-- StarterGui.ScreenGui.Loader
G2L["2"] = Instance.new("LocalScript", gethui());
G2L["2"]["Name"] = [[Loader]];


-- StarterGui.ScreenGui.Loader.ScreenGui
G2L["3"] = Instance.new("ScreenGui", G2L["2"]);
G2L["3"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame
G2L["4"] = Instance.new("Frame", G2L["3"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4"]["Size"] = UDim2.new(0.334, 0, 0.62035, 0);
G2L["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.UIStroke
G2L["5"] = Instance.new("UIStroke", G2L["4"]);
G2L["5"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.UIListLayout
G2L["6"] = Instance.new("UIListLayout", G2L["4"]);
G2L["6"]["Padding"] = UDim.new(0, 10);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.UIPadding
G2L["7"] = Instance.new("UIPadding", G2L["4"]);
G2L["7"]["PaddingTop"] = UDim.new(0, 10);
G2L["7"]["PaddingRight"] = UDim.new(0, 10);
G2L["7"]["PaddingLeft"] = UDim.new(0, 10);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.2Functon
G2L["8"] = Instance.new("Frame", G2L["4"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["Size"] = UDim2.new(1, 0, 1, -195);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Name"] = [[2Functon]];
G2L["8"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.2Functon.UIListLayout
G2L["9"] = Instance.new("UIListLayout", G2L["8"]);
G2L["9"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["9"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.2Functon.UIStroke
G2L["a"] = Instance.new("UIStroke", G2L["8"]);
G2L["a"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.2Functon.Scrol
G2L["b"] = Instance.new("ScrollingFrame", G2L["8"]);
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["Name"] = [[Scrol]];
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["Selectable"] = false;
G2L["b"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["b"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.2Functon.Scrol.TextLabel
G2L["c"] = Instance.new("TextBox", G2L["b"]);
G2L["c"]["CursorPosition"] = -1;
G2L["c"]["Active"] = false;
G2L["c"]["Name"] = [[TextLabel]];
G2L["c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["c"]["PlaceholderColor3"] = Color3.fromRGB(179, 179, 179);
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextEditable"] = false;
G2L["c"]["TextWrapped"] = true;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["c"]["Selectable"] = false;
G2L["c"]["ClearTextOnFocus"] = false;
G2L["c"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = ""
G2L["c"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.2Functon.Scrol.TextLabel.UIPadding
G2L["d"] = Instance.new("UIPadding", G2L["c"]);
G2L["d"]["PaddingTop"] = UDim.new(0, 5);
G2L["d"]["PaddingLeft"] = UDim.new(0, 5);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer
G2L["e"] = Instance.new("Frame", G2L["4"]);
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["Size"] = UDim2.new(1, 0, 0, 30);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Name"] = [[4SelectVer]];
G2L["e"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.UIListLayout
G2L["f"] = Instance.new("UIListLayout", G2L["e"]);
G2L["f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["f"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.Select-
G2L["10"] = Instance.new("Frame", G2L["e"]);
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["Size"] = UDim2.new(0, 30, 1, 0);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Name"] = [[Select-]];
G2L["10"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.Select-.TextLabel
G2L["11"] = Instance.new("TextLabel", G2L["10"]);
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextSize"] = 14;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["BackgroundTransparency"] = 1;
G2L["11"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[<]];


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.Select-.UIStroke
G2L["12"] = Instance.new("UIStroke", G2L["10"]);
G2L["12"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.Text
G2L["13"] = Instance.new("Frame", G2L["e"]);
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["Size"] = UDim2.new(1, -60, 1, 0);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Name"] = [[Text]];
G2L["13"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.Text.TextLabel
G2L["14"] = Instance.new("TextLabel", G2L["13"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["TextSize"] = 14;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["BackgroundTransparency"] = 1;
G2L["14"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Text"] = [[3.0]];


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.Select+
G2L["15"] = Instance.new("Frame", G2L["e"]);
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["Size"] = UDim2.new(0, 30, 1, 0);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Name"] = [[Select+]];
G2L["15"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.Select+.TextLabel
G2L["16"] = Instance.new("TextLabel", G2L["15"]);
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextSize"] = 14;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["BackgroundTransparency"] = 1;
G2L["16"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[>]];


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.Select+.UIStroke
G2L["17"] = Instance.new("UIStroke", G2L["15"]);
G2L["17"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.4SelectVer.UIStroke
G2L["18"] = Instance.new("UIStroke", G2L["e"]);
G2L["18"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr
G2L["19"] = Instance.new("Frame", G2L["4"]);
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["19"]["Size"] = UDim2.new(1, 0, 0, 30);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["Name"] = [[5SelectScr]];
G2L["19"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.UIListLayout
G2L["1a"] = Instance.new("UIListLayout", G2L["19"]);
G2L["1a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["1a"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.Select-
G2L["1b"] = Instance.new("Frame", G2L["19"]);
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["Size"] = UDim2.new(0, 30, 1, 0);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["Name"] = [[Select-]];
G2L["1b"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.Select-.TextLabel
G2L["1c"] = Instance.new("TextLabel", G2L["1b"]);
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["TextSize"] = 14;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["BackgroundTransparency"] = 1;
G2L["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Text"] = [[<]];


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.Select-.UIStroke
G2L["1d"] = Instance.new("UIStroke", G2L["1b"]);
G2L["1d"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.ScriptName
G2L["1e"] = Instance.new("Frame", G2L["19"]);
G2L["1e"]["BorderSizePixel"] = 0;
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["Size"] = UDim2.new(1, -60, 1, 0);
G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["Name"] = [[ScriptName]];
G2L["1e"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.ScriptName.TextLabel
G2L["1f"] = Instance.new("TextLabel", G2L["1e"]);
G2L["1f"]["BorderSizePixel"] = 0;
G2L["1f"]["TextSize"] = 14;
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1f"]["BackgroundTransparency"] = 1;
G2L["1f"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["Text"] = [[Counter Blox]];


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.Select+
G2L["20"] = Instance.new("Frame", G2L["19"]);
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["Size"] = UDim2.new(0, 30, 1, 0);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Name"] = [[Select+]];
G2L["20"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.Select+.TextLabel
G2L["21"] = Instance.new("TextLabel", G2L["20"]);
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["TextSize"] = 14;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["21"]["BackgroundTransparency"] = 1;
G2L["21"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["21"]["Text"] = [[>]];


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.Select+.UIStroke
G2L["22"] = Instance.new("UIStroke", G2L["20"]);
G2L["22"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.5SelectScr.UIStroke
G2L["23"] = Instance.new("UIStroke", G2L["19"]);
G2L["23"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.Load
G2L["24"] = Instance.new("Frame", G2L["4"]);
G2L["24"]["BorderSizePixel"] = 0;
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["24"]["Size"] = UDim2.new(1, 0, 0, 30);
G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["24"]["Name"] = [[Load]];
G2L["24"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.Load.UIStroke
G2L["25"] = Instance.new("UIStroke", G2L["24"]);
G2L["25"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.Load.TextLabel
G2L["26"] = Instance.new("TextLabel", G2L["24"]);
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["TextSize"] = 14;
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["BackgroundTransparency"] = 1;
G2L["26"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[Load]];


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.3dsc link
G2L["27"] = Instance.new("Frame", G2L["4"]);
G2L["27"]["BorderSizePixel"] = 0;
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["Size"] = UDim2.new(1, 0, 0, 25);
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["Name"] = [[3dsc link]];
G2L["27"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.3dsc link.UIStroke
G2L["28"] = Instance.new("UIStroke", G2L["27"]);
G2L["28"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.3dsc link.TextLabel
G2L["29"] = Instance.new("TextBox", G2L["27"]);
G2L["29"]["Active"] = false;
G2L["29"]["Name"] = [[TextLabel]];
G2L["29"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["TextEditable"] = false;
G2L["29"]["TextWrapped"] = true;
G2L["29"]["TextSize"] = 14;
G2L["29"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["29"]["Selectable"] = false;
G2L["29"]["ClearTextOnFocus"] = false;
G2L["29"]["ClipsDescendants"] = true;
G2L["29"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["Text"] = [[Get more scripts and updates - > https://discord.gg/kgMfr4Bu]];
G2L["29"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.3dsc link.TextLabel.UIPadding
G2L["2a"] = Instance.new("UIPadding", G2L["29"]);
G2L["2a"]["PaddingTop"] = UDim.new(0, 5);
G2L["2a"]["PaddingLeft"] = UDim.new(0, 5);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.1Name
G2L["2b"] = Instance.new("Frame", G2L["4"]);
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Name"] = [[1Name]];
G2L["2b"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.1Name.TextLabel
G2L["2c"] = Instance.new("TextLabel", G2L["2b"]);
G2L["2c"]["TextWrapped"] = true;
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["TextSize"] = 14;
G2L["2c"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["BackgroundTransparency"] = 1;
G2L["2c"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["2c"]["ClipsDescendants"] = true;
G2L["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["Text"] = [[Happy Hub Loader]];


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.1Name.TextLabel.UIPadding
G2L["2d"] = Instance.new("UIPadding", G2L["2c"]);
G2L["2d"]["PaddingTop"] = UDim.new(0, 5);
G2L["2d"]["PaddingLeft"] = UDim.new(0, 5);


-- StarterGui.ScreenGui.Loader.ScreenGui.Frame.1Name.UIStroke
G2L["2e"] = Instance.new("UIStroke", G2L["2b"]);
G2L["2e"]["Color"] = Color3.fromRGB(255, 255, 255);


-- StarterGui.ScreenGui.Loader.ScreenGui.modal
G2L["2f"] = Instance.new("TextButton", G2L["3"]);
G2L["2f"]["BorderSizePixel"] = 0;
G2L["2f"]["Modal"] = true;
G2L["2f"]["TextSize"] = 14;
G2L["2f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2f"]["Text"] = [[]];
G2L["2f"]["Name"] = [[modal]];

PlayerGui.GUI.Main.GlobalChat.ActiveOne.Value = true


local script = G2L["2"];
local runS = game:GetService("RunService")
local TweS = game:GetService("TweenService")

local Gui = script.ScreenGui.Frame

local List = loadstring(game:HttpGet("https://raw.githubusercontent.com/uedan228/HappyHub/refs/heads/main/Loader/List"))()

local scrIdx = 1	
local VecIbx = 1

Gui["5SelectScr"]["Select+"].InputBegan:Connect(function(k, _k)
    if _k then return end

    if k.UserInputType == Enum.UserInputType.MouseButton1 then
        scrIdx = scrIdx % #List + 1
        VecIbx = 1
        Gui["5SelectScr"]["ScriptName"].TextLabel.Text = List[scrIdx].Name
        Gui["4SelectVer"]["Text"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Index
        Gui["2Functon"]["Scrol"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Function
    end
end)

Gui["5SelectScr"]["Select-"].InputBegan:Connect(function(k, _k)
    if _k then return end

    if k.UserInputType == Enum.UserInputType.MouseButton1 then
        scrIdx = scrIdx % #List - 1
        scrIdx = scrIdx<1 and 1 or scrIdx
        VecIbx = 1

        Gui["5SelectScr"]["ScriptName"].TextLabel.Text = List[scrIdx].Name
        Gui["4SelectVer"]["Text"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Index
        Gui["2Functon"]["Scrol"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Function
    end
end)

Gui["4SelectVer"]["Select+"].InputBegan:Connect(function(k, _k)
    if _k then return end

    if k.UserInputType == Enum.UserInputType.MouseButton1 then
        VecIbx = VecIbx % #List[scrIdx]["Versions"] + 1
        Gui["4SelectVer"]["Text"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Index
        Gui["2Functon"]["Scrol"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Function
    end
end)

Gui["4SelectVer"]["Select-"].InputBegan:Connect(function(k, _k)
    if _k then return end

    if k.UserInputType == Enum.UserInputType.MouseButton1 then
        VecIbx = VecIbx % #List[scrIdx]["Versions"] - 1
        VecIbx = VecIbx<1 and 1 or VecIbx

        Gui["4SelectVer"]["Text"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Index
        Gui["2Functon"]["Scrol"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Function
    end
end)

Gui:WaitForChild("Load").InputBegan:Connect(function(k, _k)
    if _k then return end

    if k.UserInputType == Enum.UserInputType.MouseButton1 then
        setclipboard("https://discord.gg/kgMfr4Bu")
        PlayerGui.GUI.Main.GlobalChat.ActiveOne.Value = false
        loadstring(game:HttpGet(List[scrIdx]["Versions"][VecIbx].Link))()
        script:Destroy()
    end
end)

Gui["5SelectScr"]["ScriptName"].TextLabel.Text = List[scrIdx].Name
Gui["4SelectVer"]["Text"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Index
Gui["2Functon"]["Scrol"].TextLabel.Text = List[scrIdx]["Versions"][VecIbx].Function

local hue = 0

while true do
    runS.RenderStepped:Wait()
    hue = hue + 0.005
    if hue > 1 then hue = 0 end

    Gui["3dsc link"].TextLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
end
