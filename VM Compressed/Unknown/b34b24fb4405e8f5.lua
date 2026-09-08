--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 

designed using localmaze gui creator
]=]

local CollectionService = game:GetService("CollectionService");
local G2L = {};

G2L["ForsakenCharacter_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["ForsakenCharacter_1"]["Name"] = [[ForsakenCharacter]];
G2L["ForsakenCharacter_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

CollectionService:AddTag(G2L["ForsakenCharacter_1"], [[main]]);

G2L["Frame_2"] = Instance.new("Frame", G2L["ForsakenCharacter_1"]);
G2L["Frame_2"]["BorderSizePixel"] = 0;
G2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Frame_2"]["Size"] = UDim2.new(0.54739, 0, 0.91411, 0);
G2L["Frame_2"]["Position"] = UDim2.new(0.21523, 0, -0.03681, 0);
G2L["Frame_2"]["BackgroundTransparency"] = 0.5;


G2L["UICorner_3"] = Instance.new("UICorner", G2L["Frame_2"]);



G2L["UIStroke_4"] = Instance.new("UIStroke", G2L["Frame_2"]);
G2L["UIStroke_4"]["Transparency"] = 0.75;
G2L["UIStroke_4"]["Thickness"] = 2;


G2L["Owner_5"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["Owner_5"]["BorderSizePixel"] = 0;
G2L["Owner_5"]["TextSize"] = 18;
G2L["Owner_5"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Owner_5"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Owner_5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Owner_5"]["BackgroundTransparency"] = 0.5;
G2L["Owner_5"]["Size"] = UDim2.new(0.28641, 0, 0.20805, 0);
G2L["Owner_5"]["Text"] = [[Made By Theo]];
G2L["Owner_5"]["Name"] = [[Owner]];
G2L["Owner_5"]["Position"] = UDim2.new(-0.31068, 0, 0, 0);


G2L["UICorner_6"] = Instance.new("UICorner", G2L["Owner_5"]);



G2L["UIStroke_7"] = Instance.new("UIStroke", G2L["Owner_5"]);



G2L["Label_8"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["Label_8"]["BorderSizePixel"] = 0;
G2L["Label_8"]["TextSize"] = 18;
G2L["Label_8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["Label_8"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Label_8"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Label_8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Label_8"]["BackgroundTransparency"] = 0.75;
G2L["Label_8"]["Size"] = UDim2.new(0.62621, 0, 0.20805, 0);
G2L["Label_8"]["Text"] = [[Forsaken Characters Converted By Theo]];
G2L["Label_8"]["Name"] = [[Label]];
G2L["Label_8"]["Position"] = UDim2.new(0.01456, 0, 0.02013, 0);


G2L["UIStroke_9"] = Instance.new("UIStroke", G2L["Label_8"]);



G2L["UICorner_a"] = Instance.new("UICorner", G2L["Label_8"]);



G2L["Divider_b"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["Divider_b"]["BorderSizePixel"] = 0;
G2L["Divider_b"]["TextSize"] = 24;
G2L["Divider_b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["Divider_b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Divider_b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Divider_b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Divider_b"]["BackgroundTransparency"] = 1;
G2L["Divider_b"]["Size"] = UDim2.new(0.35922, 0, 0.19463, 0);
G2L["Divider_b"]["Text"] = [[----------------------------------------------------------]];
G2L["Divider_b"]["Name"] = [[Divider]];
G2L["Divider_b"]["Position"] = UDim2.new(0.00971, 0, 0.18792, 0);


G2L["UICorner_c"] = Instance.new("UICorner", G2L["Divider_b"]);



G2L["UIStroke_d"] = Instance.new("UIStroke", G2L["Divider_b"]);



G2L["Jason_e"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["Jason_e"]["BorderSizePixel"] = 0;
G2L["Jason_e"]["TextSize"] = 14;
G2L["Jason_e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Jason_e"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Jason_e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Jason_e"]["BackgroundTransparency"] = 0.75;
G2L["Jason_e"]["Size"] = UDim2.new(0.12136, 0, 0.16779, 0);
G2L["Jason_e"]["Text"] = [[Jason]];
G2L["Jason_e"]["Name"] = [[Jason]];
G2L["Jason_e"]["Position"] = UDim2.new(0.02427, 0, 0.31544, 0);


G2L["UICorner_f"] = Instance.new("UICorner", G2L["Jason_e"]);



G2L["c00lkidd_10"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["c00lkidd_10"]["BorderSizePixel"] = 0;
G2L["c00lkidd_10"]["TextSize"] = 14;
G2L["c00lkidd_10"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c00lkidd_10"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["c00lkidd_10"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["c00lkidd_10"]["BackgroundTransparency"] = 0.75;
G2L["c00lkidd_10"]["Size"] = UDim2.new(0.12136, 0, 0.16779, 0);
G2L["c00lkidd_10"]["Text"] = [[c00lkidd]];
G2L["c00lkidd_10"]["Name"] = [[c00lkidd]];
G2L["c00lkidd_10"]["Position"] = UDim2.new(0.16019, 0, 0.31544, 0);


G2L["UICorner_11"] = Instance.new("UICorner", G2L["c00lkidd_10"]);



G2L["1x1x1x1_12"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["1x1x1x1_12"]["BorderSizePixel"] = 0;
G2L["1x1x1x1_12"]["TextSize"] = 14;
G2L["1x1x1x1_12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1x1x1x1_12"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["1x1x1x1_12"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1x1x1x1_12"]["BackgroundTransparency"] = 0.75;
G2L["1x1x1x1_12"]["Size"] = UDim2.new(0.12136, 0, 0.16779, 0);
G2L["1x1x1x1_12"]["Text"] = [[1x1x1x1]];
G2L["1x1x1x1_12"]["Name"] = [[1x1x1x1]];
G2L["1x1x1x1_12"]["Position"] = UDim2.new(0.02427, 0, 0.49664, 0);


G2L["UICorner_13"] = Instance.new("UICorner", G2L["1x1x1x1_12"]);



G2L["JohnDoe_14"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["JohnDoe_14"]["BorderSizePixel"] = 0;
G2L["JohnDoe_14"]["TextSize"] = 14;
G2L["JohnDoe_14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["JohnDoe_14"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["JohnDoe_14"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["JohnDoe_14"]["BackgroundTransparency"] = 0.75;
G2L["JohnDoe_14"]["Size"] = UDim2.new(0.12136, 0, 0.16779, 0);
G2L["JohnDoe_14"]["Text"] = [[John Doe]];
G2L["JohnDoe_14"]["Name"] = [[JohnDoe]];
G2L["JohnDoe_14"]["Position"] = UDim2.new(0.16019, 0, 0.49664, 0);


G2L["UICorner_15"] = Instance.new("UICorner", G2L["JohnDoe_14"]);



G2L["Killers_16"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["Killers_16"]["BorderSizePixel"] = 0;
G2L["Killers_16"]["TextSize"] = 24;
G2L["Killers_16"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Killers_16"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Killers_16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Killers_16"]["BackgroundTransparency"] = 0.75;
G2L["Killers_16"]["Size"] = UDim2.new(0.23301, 0, 0.1745, 0);
G2L["Killers_16"]["Text"] = [[Killers]];
G2L["Killers_16"]["Name"] = [[Killers]];
G2L["Killers_16"]["Position"] = UDim2.new(0.03398, 0, 0.69799, 0);


G2L["UICorner_17"] = Instance.new("UICorner", G2L["Killers_16"]);



G2L["UIStroke_18"] = Instance.new("UIStroke", G2L["Killers_16"]);



G2L["Guest1337_19"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["Guest1337_19"]["BorderSizePixel"] = 0;
G2L["Guest1337_19"]["TextSize"] = 10;
G2L["Guest1337_19"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Guest1337_19"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Guest1337_19"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Guest1337_19"]["BackgroundTransparency"] = 0.75;
G2L["Guest1337_19"]["Size"] = UDim2.new(0.12136, 0, 0.16779, 0);
G2L["Guest1337_19"]["Text"] = [[Guest 1337]];
G2L["Guest1337_19"]["Name"] = [[Guest1337]];
G2L["Guest1337_19"]["Position"] = UDim2.new(0.37864, 0, 0.31544, 0);


G2L["UICorner_1a"] = Instance.new("UICorner", G2L["Guest1337_19"]);



G2L["Taph_1b"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["Taph_1b"]["BorderSizePixel"] = 0;
G2L["Taph_1b"]["TextSize"] = 14;
G2L["Taph_1b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Taph_1b"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Taph_1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Taph_1b"]["BackgroundTransparency"] = 0.75;
G2L["Taph_1b"]["Size"] = UDim2.new(0.12136, 0, 0.16779, 0);
G2L["Taph_1b"]["Text"] = [[Taph]];
G2L["Taph_1b"]["Name"] = [[Taph]];
G2L["Taph_1b"]["Position"] = UDim2.new(0.37864, 0, 0.49664, 0);


G2L["UICorner_1c"] = Instance.new("UICorner", G2L["Taph_1b"]);



G2L["TwoTime_1d"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["TwoTime_1d"]["BorderSizePixel"] = 0;
G2L["TwoTime_1d"]["TextSize"] = 14;
G2L["TwoTime_1d"]["TextColor3"] = Color3.fromRGB(355, 255, 255);
G2L["TwoTime_1d"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["TwoTime_1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["TwoTime_1d"]["BackgroundTransparency"] = 0.75;
G2L["TwoTime_1d"]["Size"] = UDim2.new(0.12136, 0, 0.16779, 0);
G2L["TwoTime_1d"]["Text"] = [[TwoTime]];
G2L["TwoTime_1d"]["Name"] = [[TwoTime]];
G2L["TwoTime_1d"]["Position"] = UDim2.new(0.51456, 0, 0.31544, 0);


G2L["UICorner_1e"] = Instance.new("UICorner", G2L["TwoTime_1d"]);



G2L["Dusekkar_1f"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["Dusekkar_1f"]["BorderSizePixel"] = 0;
G2L["Dusekkar_1f"]["TextSize"] = 14;
G2L["Dusekkar_1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Dusekkar_1f"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Dusekkar_1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Dusekkar_1f"]["BackgroundTransparency"] = 0.75;
G2L["Dusekkar_1f"]["Size"] = UDim2.new(0.12136, 0, 0.16779, 0);
G2L["Dusekkar_1f"]["Text"] = [[Dusekkar]];
G2L["Dusekkar_1f"]["Name"] = [[Dusekkar]];
G2L["Dusekkar_1f"]["Position"] = UDim2.new(0.51942, 0, 0.49664, 0);


G2L["UICorner_20"] = Instance.new("UICorner", G2L["Dusekkar_1f"]);



G2L["Shedletsky_21"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["Shedletsky_21"]["BorderSizePixel"] = 0;
G2L["Shedletsky_21"]["TextSize"] = 10;
G2L["Shedletsky_21"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Shedletsky_21"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Shedletsky_21"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Shedletsky_21"]["BackgroundTransparency"] = 0.75;
G2L["Shedletsky_21"]["Size"] = UDim2.new(0.12136, 0, 0.16779, 0);
G2L["Shedletsky_21"]["Text"] = [[Shedletsky]];
G2L["Shedletsky_21"]["Name"] = [[Shedletsky]];
G2L["Shedletsky_21"]["Position"] = UDim2.new(0.65049, 0, 0.31544, 0);


G2L["UICorner_22"] = Instance.new("UICorner", G2L["Shedletsky_21"]);



G2L["Survivor_23"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["Survivor_23"]["BorderSizePixel"] = 0;
G2L["Survivor_23"]["TextSize"] = 24;
G2L["Survivor_23"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["Survivor_23"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["Survivor_23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Survivor_23"]["BackgroundTransparency"] = 0.75;
G2L["Survivor_23"]["Size"] = UDim2.new(0.23301, 0, 0.1745, 0);
G2L["Survivor_23"]["Text"] = [[Survivors]];
G2L["Survivor_23"]["Name"] = [[Survivor]];
G2L["Survivor_23"]["Position"] = UDim2.new(0.3835, 0, 0.69799, 0);


G2L["UICorner_24"] = Instance.new("UICorner", G2L["Survivor_23"]);



G2L["UIStroke_25"] = Instance.new("UIStroke", G2L["Survivor_23"]);

G2L["Jason_e"]["MouseButton1Click"]:Connect(function()
G2L["Frame_2"]:Destroy()
local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true 
settings["Instant respawn"] = false 
settings["Hide HumanoidRootPart"] = false 
settings["PermaDeath fake character"] = true 
settings["R15 Reanimate"] = false 

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/v2"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tag"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Jason.lua"))()

end)

repeat task.wait() until finished
end)

G2L["c00lkidd_10"]["MouseButton1Click"]:Connect(function()
     G2L["Frame_2"]:Destroy()
local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true 
settings["Instant respawn"] = false 
settings["Hide HumanoidRootPart"] = false 
settings["PermaDeath fake character"] = true 
settings["R15 Reanimate"] = false 

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/v2"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tag"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Coolkidd.lua"))()

end)

repeat task.wait() until finished
end)

G2L["1x1x1x1_12"]["MouseButton1Click"]:Connect(function()
     G2L["Frame_2"]:Destroy()
local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true 
settings["Instant respawn"] = false 
settings["Hide HumanoidRootPart"] = false 
settings["PermaDeath fake character"] = true 
settings["R15 Reanimate"] = false 

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/v2"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tag"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/1x4.lua"))()

end)

repeat task.wait() until finished
end)

G2L["JohnDoe_14"]["MouseButton1Click"]:Connect(function()
     G2L["Frame_2"]:Destroy()
local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true 
settings["Instant respawn"] = false 
settings["Hide HumanoidRootPart"] = false 
settings["PermaDeath fake character"] = true 
settings["R15 Reanimate"] = false 

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/v2"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tag"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JohnDoe.lua"))()

end)

repeat task.wait() until finished
end)

G2L["Guest1337_19"]["MouseButton1Click"]:Connect(function()
     G2L["Frame_2"]:Destroy()
local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true 
settings["Instant respawn"] = false 
settings["Hide HumanoidRootPart"] = false 
settings["PermaDeath fake character"] = true 
settings["R15 Reanimate"] = false 

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/v2"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tag"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Guest.lua"))()

end)

repeat task.wait() until finished
end)

G2L["Taph_1b"]["MouseButton1Click"]:Connect(function()
     G2L["Frame_2"]:Destroy()
local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true 
settings["Instant respawn"] = false 
settings["Hide HumanoidRootPart"] = false 
settings["PermaDeath fake character"] = true 
settings["R15 Reanimate"] = false 

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/v2"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tag"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Taph.lua"))()

end)

repeat task.wait() until finished
end)

G2L["TwoTime_1d"]["MouseButton1Click"]:Connect(function()
     G2L["Frame_2"]:Destroy()
local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true 
settings["Instant respawn"] = false 
settings["Hide HumanoidRootPart"] = false 
settings["PermaDeath fake character"] = true 
settings["R15 Reanimate"] = false 

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/v2"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tag"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/TwoTime.lua"))()

end)

repeat task.wait() until finished
end)

G2L["Dusekkar_1f"]["MouseButton1Click"]:Connect(function()
     G2L["Frame_2"]:Destroy()
local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true 
settings["Instant respawn"] = false 
settings["Hide HumanoidRootPart"] = false 
settings["PermaDeath fake character"] = true 
settings["R15 Reanimate"] = false 

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/v2"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tag"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Dusekkar.lua"))()

end)

repeat task.wait() until finished
end)

G2L["Shedletsky_21"]["MouseButton1Click"]:Connect(function()
     G2L["Frame_2"]:Destroy()
local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true 
settings["Instant respawn"] = false 
settings["Hide HumanoidRootPart"] = false 
settings["PermaDeath fake character"] = true 
settings["R15 Reanimate"] = false 

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/v2"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tag"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Shedletsky.lua"))()

end)

repeat task.wait() until finished
end)
return G2L["ForsakenCharacter_1"], require;