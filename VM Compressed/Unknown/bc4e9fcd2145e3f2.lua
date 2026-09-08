-- Instances: 8 | Scripts: 0 | Modules: 0 | Tags: 0
local LMG2L = {};

-- Players.AnonymousSkiddo.PlayerGui.ScreenGui
LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- Players.AnonymousSkiddo.PlayerGui.ScreenGui.Frame
LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Frame_2"]["BorderSizePixel"] = 0;
LMG2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Frame_2"]["Size"] = UDim2.new(0, 248, 0, 242);
LMG2L["Frame_2"]["Position"] = UDim2.new(0, 246, 0, 46);


-- Players.AnonymousSkiddo.PlayerGui.ScreenGui.Frame.TextLabel
LMG2L["TextLabel_3"] = Instance.new("TextLabel", LMG2L["Frame_2"]);
LMG2L["TextLabel_3"]["BorderSizePixel"] = 0;
LMG2L["TextLabel_3"]["BackgroundColor3"] = Color3.fromRGB(233, 233, 233);
LMG2L["TextLabel_3"]["Size"] = UDim2.new(0, 248, 0, 18);
LMG2L["TextLabel_3"]["Text"] = [[CraxyXploitz F3X Ultimate]];
LMG2L["TextLabel_3"]["Position"] = UDim2.new(0, 0, 0, -18);


-- Players.AnonymousSkiddo.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_4"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_4"]["BorderSizePixel"] = 0;
LMG2L["TextButton_4"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
LMG2L["TextButton_4"]["Size"] = UDim2.new(0, 176, 0, 30);
LMG2L["TextButton_4"]["Text"] = [[particals (loop click for good effect)]];
LMG2L["TextButton_4"]["Position"] = UDim2.new(0, 2, 0, 2);
LMG2L["TextButton_4"].MouseButton1Click:Connect(function()
-- load once
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-f3x-partical-script-leaked-70295"))()
-- load twice so it can cause more particals bro
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-f3x-partical-script-leaked-70295"))()

end)

-- Players.AnonymousSkiddo.PlayerGui.ScreenGui.Frame.TextButton.TextButton
LMG2L["TextButton_5"] = Instance.new("TextButton", LMG2L["TextButton_4"]);
LMG2L["TextButton_5"]["BorderSizePixel"] = 0;
LMG2L["TextButton_5"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
LMG2L["TextButton_5"]["Size"] = UDim2.new(0, 54, 0, 44);
LMG2L["TextButton_5"]["Text"] = [[Skybox gui]];
LMG2L["TextButton_5"]["Position"] = UDim2.new(0, 2, 0, 34);
LMG2L["TextButton_5"].MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/LzNyMcz8"))()
end)

-- Players.AnonymousSkiddo.PlayerGui.ScreenGui.Frame.TextButton.TextButton.TextButton
LMG2L["TextButton_6"] = Instance.new("TextButton", LMG2L["TextButton_5"]);
LMG2L["TextButton_6"]["BorderSizePixel"] = 0;
LMG2L["TextButton_6"]["BackgroundColor3"] = Color3.fromRGB(236, 236, 236);
LMG2L["TextButton_6"]["Size"] = UDim2.new(0, 66, 0, 44);
LMG2L["TextButton_6"]["Text"] = [[Gears gui]];
LMG2L["TextButton_6"]["Position"] = UDim2.new(0, 56, 0, 0);
LMG2L["TextButton_6"].MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/jWWWLfYn"))()
end)

-- Players.AnonymousSkiddo.PlayerGui.ScreenGui.Frame.UIDragDetector
LMG2L["UIDragDetector_7"] = Instance.new("UIDragDetector", LMG2L["Frame_2"]);



-- Players.AnonymousSkiddo.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_8"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_8"]["BorderSizePixel"] = 0;
LMG2L["TextButton_8"]["BackgroundColor3"] = Color3.fromRGB(229, 229, 229);
LMG2L["TextButton_8"]["Size"] = UDim2.new(0, 208, 0, 38);
LMG2L["TextButton_8"]["Text"] = [[Load Goofy Leaked script lolll]];
LMG2L["TextButton_8"]["Position"] = UDim2.new(0, 26, 0, 84);
LMG2L["TextButton_8"].MouseButton1Click:Connect(function()
loadstring(game:HttpGet(('https://pastebin.com/raw/hp08JgV1'),true))()
end)


return LMG2L["ScreenGui_1"], require;