--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 27 | Scripts: 2 | Modules: 0 | Tags: 0
local InstanceToLuaModule = loadstring(game:HttpGet('https://raw.githubusercontent.com/VoidShell-null/VoidShell-Hub/refs/heads/main/Utils/InstanceToLua.lua'))()
local converter, messages = InstanceToLuaModule.new()

if not converter and messages then
    for _, msg in ipairs(messages) do
        local formatted = string.format("  [%s] %s: %s", msg.timestamp, msg.type, msg.message)
        print(formatted)
    end
    return 
end

local everyClipboard = set_rbxclipboard or to_clipboard or set_rbx_clipboard or setrbxclipboard or set_clipboard or setclipboard or toclipboard or (Clipboard and Clipboard.set)
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (Fluxus and Fluxus.request) or request
local cloneref = cloneref or clone_reference or clone_ref or (cache and (cache.clone_reference or cache.clonereference or cache.cloneref))
local Service = function(Null)
        return (cloneref or function(a) return a end)(game:GetService(Null))
    end
local hiddenUI = gethui or get_hidden_gui or gethiddengui or gethiddenui or get_hui or hiddenUI or function() 
    return Service("Players").LocalPlayer.PlayerGui;
end;
local Discord = "https://discord.gg/U2nvFRa8zQ"


local G2L = {};

-- StarterGui.InstanceTolua
G2L["1"] = Instance.new("ScreenGui", hiddenUI());
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["DisplayOrder"] = 777;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["Name"] = [[InstanceTolua]];
G2L["1"]["ResetOnSpawn"] = false;
G2L["1"]["Name"] = "InstanceTolua"

-- StarterGui.InstanceTolua.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["Active"] = true;
G2L["2"]["ZIndex"] = 7;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Size"] = UDim2.new(0, 352, 0, 438);
G2L["2"]["Position"] = UDim2.new(0.24483, 0, 0.16809, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Draggable"] = true

-- StarterGui.InstanceTolua.Frame.UIScale
G2L["3"] = Instance.new("UIScale", G2L["2"]);
G2L["3"]["Scale"] = 1.06;


-- StarterGui.InstanceTolua.Frame.UICorner
G2L["4"] = Instance.new("UICorner", G2L["2"]);



-- StarterGui.InstanceTolua.Frame.TextLabel
G2L["5"] = Instance.new("TextLabel", G2L["2"]);
G2L["5"]["TextWrapped"] = true;
G2L["5"]["TextStrokeTransparency"] = 0;
G2L["5"]["ZIndex"] = 8;
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["TextSize"] = 14;
G2L["5"]["TextStrokeColor3"] = Color3.fromRGB(0, 86, 255);
G2L["5"]["TextScaled"] = true;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/PermanentMarker.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["5"]["BackgroundTransparency"] = 1;
G2L["5"]["RichText"] = true;
G2L["5"]["Size"] = UDim2.new(1, 0, 0, 29);
G2L["5"]["ClipsDescendants"] = true;
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 86, 255);
G2L["5"]["Text"] = [[Instance To Lua]];
G2L["5"]["Position"] = UDim2.new(0, 0, -0.00335, 0);


-- StarterGui.InstanceTolua.Frame.Frame
G2L["6"] = Instance.new("Frame", G2L["2"]);
G2L["6"]["ZIndex"] = 8;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(0, 86, 255);
G2L["6"]["Size"] = UDim2.new(0, 293, 0, 1);
G2L["6"]["Position"] = UDim2.new(0.08361, 0, 0.12245, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.InstanceTolua.Frame.Frame.UICorner
G2L["7"] = Instance.new("UICorner", G2L["6"]);



-- StarterGui.InstanceTolua.Frame.UIAspectRatioConstraint
G2L["8"] = Instance.new("UIAspectRatioConstraint", G2L["2"]);
G2L["8"]["AspectRatio"] = 1.55;


-- StarterGui.InstanceTolua.Frame.Path
G2L["9"] = Instance.new("Folder", G2L["2"]);
G2L["9"]["Name"] = [[Path]];


-- StarterGui.InstanceTolua.Frame.Path.Shadow
G2L["a"] = Instance.new("TextBox", G2L["9"]);
G2L["a"]["CursorPosition"] = -1;
G2L["a"]["Name"] = [[Shadow]];
G2L["a"]["PlaceholderColor3"] = Color3.fromRGB(82, 82, 82);
G2L["a"]["ZIndex"] = 7;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["TextSize"] = 14;
G2L["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(0, 86, 255);
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["a"]["ClearTextOnFocus"] = false;
G2L["a"]["ClipsDescendants"] = true;
G2L["a"]["PlaceholderText"] = [[Path]];
G2L["a"]["Size"] = UDim2.new(0, 231, 0, 41);
G2L["a"]["Position"] = UDim2.new(0.16952, 0, 0.20404, 1);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[]];


-- •『StarterGui.InstanceTolua.Frame.Path.Shadow.UICorner』
G2L["b"] = Instance.new("UICorner", G2L["a"]);



-- StarterGui.InstanceTolua.Frame.Path.Path
G2L["c"] = Instance.new("TextBox", G2L["9"]);
G2L["c"]["CursorPosition"] = -1;
G2L["c"]["LineHeight"] = 1.06;
G2L["c"]["Name"] = [[Path]];
G2L["c"]["PlaceholderColor3"] = Color3.fromRGB(82, 82, 82);
G2L["c"]["ZIndex"] = 8;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextColor3"] = Color3.fromRGB(85, 85, 85);
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
G2L["c"]["ClearTextOnFocus"] = false;
G2L["c"]["ClipsDescendants"] = true;
G2L["c"]["PlaceholderText"] = [[Path]];
G2L["c"]["Size"] = UDim2.new(0, 231, 0, 41);
G2L["c"]["Position"] = UDim2.new(0.16952, 0, 0.20355, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[gethui().InstanceTolua]];


-- StarterGui.InstanceTolua.Frame.Path.Path.UICorner
G2L["d"] = Instance.new("UICorner", G2L["c"]);



-- StarterGui.InstanceTolua.Frame.Path.Shadow1
G2L["e"] = Instance.new("TextBox", G2L["9"]);
G2L["e"]["Visible"] = false;
G2L["e"]["Name"] = [[Shadow1]];
G2L["e"]["PlaceholderColor3"] = Color3.fromRGB(82, 82, 82);
G2L["e"]["ZIndex"] = 7;
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["TextSize"] = 14;
G2L["e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(0, 86, 255);
G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["e"]["ClearTextOnFocus"] = false;
G2L["e"]["ClipsDescendants"] = true;
G2L["e"]["PlaceholderText"] = [[Path]];
G2L["e"]["Size"] = UDim2.new(0, 231, 0, 41);
G2L["e"]["Position"] = UDim2.new(0.16952, 0, 0.20304, -1);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Text"] = [[]];


-- StarterGui.InstanceTolua.Frame.Path.Shadow1.UICorner
G2L["f"] = Instance.new("UICorner", G2L["e"]);



-- StarterGui.InstanceTolua.Frame.Convert
G2L["10"] = Instance.new("Folder", G2L["2"]);
G2L["10"]["Name"] = [[Convert]];


-- StarterGui.InstanceTolua.Frame.Convert.Shadow
G2L["11"] = Instance.new("TextButton", G2L["10"]);
G2L["11"]["TextWrapped"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextSize"] = 19;
G2L["11"]["TextColor3"] = Color3.fromRGB(0, 86, 255);
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(0, 86, 255);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11"]["ZIndex"] = 7;
G2L["11"]["Size"] = UDim2.new(0, 111, 0, 42);
G2L["11"]["ClipsDescendants"] = true;
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[]];
G2L["11"]["Name"] = [[Shadow]];
G2L["11"]["Position"] = UDim2.new(0.33996, 0, 0.46893, 2);


-- StarterGui.InstanceTolua.Frame.Convert.Shadow.UICorner
G2L["12"] = Instance.new("UICorner", G2L["11"]);



-- StarterGui.InstanceTolua.Frame.Convert.TextButton
G2L["13"] = Instance.new("TextButton", G2L["10"]);
G2L["13"]["TextWrapped"] = true;
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["TextSize"] = 19;
G2L["13"]["AutoButtonColor"] = false;
G2L["13"]["TextColor3"] = Color3.fromRGB(0, 86, 255);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["13"]["ZIndex"] = 8;
G2L["13"]["Size"] = UDim2.new(0, 111, 0, 42);
G2L["13"]["ClipsDescendants"] = true;
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[Convert]];
G2L["13"]["Position"] = UDim2.new(0.33996, 0, 0.46893, 0);


-- StarterGui.InstanceTolua.Frame.Convert.TextButton.UICorner
G2L["14"] = Instance.new("UICorner", G2L["13"]);



-- StarterGui.InstanceTolua.Frame.Convert.TextButton.LocalScript
G2L["15"] = Instance.new("LocalScript", G2L["13"]);



-- StarterGui.InstanceTolua.Frame.TextLabel
G2L["16"] = Instance.new("TextLabel", G2L["2"]);
G2L["16"]["ZIndex"] = 8;
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextSize"] = 14;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["16"]["BackgroundTransparency"] = 1;
G2L["16"]["Size"] = UDim2.new(0, 147, 0, 28);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[By @nullspecter. on Discord]];
G2L["16"]["Position"] = UDim2.new(0.01608, 0, 0.8516, 0);


-- StarterGui.InstanceTolua.Frame.Frame
G2L["17"] = Instance.new("Frame", G2L["2"]);
G2L["17"]["Active"] = true;
G2L["17"]["ZIndex"] = 6;
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
G2L["17"]["ClipsDescendants"] = true;
G2L["17"]["Size"] = UDim2.new(0, 352, 0, 438);
G2L["17"]["Position"] = UDim2.new(0, 0, 0, 5);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.InstanceTolua.Frame.Frame.UICorner
G2L["18"] = Instance.new("UICorner", G2L["17"]);



-- StarterGui.InstanceTolua.Frame.Frame.UIAspectRatioConstraint
G2L["19"] = Instance.new("UIAspectRatioConstraint", G2L["17"]);
G2L["19"]["AspectRatio"] = 1.55;


-- StarterGui.InstanceTolua.Frame.TextButton
G2L["1a"] = Instance.new("TextButton", G2L["2"]);
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["TextSize"] = 14;
G2L["1a"]["TextColor3"] = Color3.fromRGB(0, 86, 255);
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1a"]["ZIndex"] = 8;
G2L["1a"]["BackgroundTransparency"] = 1;
G2L["1a"]["Size"] = UDim2.new(0, 147, 0, 28);
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Text"] = [[https://discord.gg/U2nvFRa8zQ]];
G2L["1a"]["Position"] = UDim2.new(0.557, 0, 0.852, 0);


-- StarterGui.InstanceTolua.Frame.TextButton.LocalScript
G2L["1b"] = Instance.new("LocalScript", G2L["1a"]);



-- StarterGui.InstanceTolua.Frame.Convert.TextButton.LocalScript


local function GetInstance(path: string): Instance?
    local luaCode = string.format("return %s", path)
    
    local success, result = pcall(function()
        return loadstring(luaCode)()
    end)
    
    if success and typeof(result) == "Instance" then
       -- print(`{path} → {result and result.Name or "nil"}`)
        return result
    elseif not success then
        warn(result)
    else
        return result, typeof(result)
        -- warn(`Path returned non-Instance: {path} | Type: {typeof(result)}`)
    end
    
    return nil
end

--[
local conversionActive = false
local Prev = G2L["c"]["Text"]
function InstanceToLuaModule:callback(formatted, message, type)
    -- Always update during conversion
    G2L["c"]["Text"] = formatted
    conversionActive = true
    
    -- When conversion finishes, schedule reset
    if type == "SUCCESS" or type == "ERROR" then
        conversionActive = false
        task.delay(7, function()
            if not conversionActive then
                G2L["c"]["Text"] = Prev
            end
        end)
    end
end


local function C_15()
	local script = G2L["15"];
	local shadow = script.Parent.Parent.Shadow
	local Button = script.Parent

	Button.MouseButton1Down:Connect(function()
		shadow.Visible = not shadow.Visible
		task.delay(0.2,function()
			if not shadow.Visible then
				shadow.Visible = true
			end
		end)
		Prev = G2L["c"]["Text"]
		converter:toFile(GetInstance(G2L["c"].Text)) -- Default mode is Reusable 
		-- converter:toClipboard(GetInstance(G2L["c"].Text)) -- Default mode is Reusable 
	    -- InstanceToLua(converter, GetInstance(G2L["c"].Text),"Reusable","file","InstanceToLua_"..os.time()..".lua")
	end)
end;
task.spawn(C_15);
-- StarterGui.InstanceTolua.Frame.TextButton.LocalScript
local function C_1b()
	local script = G2L["1b"];
	local script = script.Parent

	script.MouseButton1Down:Connect(function()
		script.TextColor3 = Color3.fromHex("#969696")
		task.delay(0.2, function()
			if script.TextColor3 == Color3.fromHex("#969696") then
				script.TextColor3 = Color3.new(0, 0.333333, 1)
			end
		end)
		everyClipboard(Discord)
	end)
end;
task.spawn(C_1b);

return G2L["1"], require;