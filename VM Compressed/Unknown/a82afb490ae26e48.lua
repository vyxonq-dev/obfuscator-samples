--FULL DUMP OF ALL BEANZHUB SCRIPTS! (I've replaced all loadstrings with my deobfuscated ones)
--[[
BEANZHUB LIFE SENTENCE SCRIPT: https://pastebin.com/raw/C2VfF09b
BEANZHUB BLADE BALL SCRIPT: https://pastebin.com/raw/bD0V1uKJ
BEANZHUB UNIVERSAL AIMBOT SCRIPT: https://pastebin.com/raw/3H0Nj0QZ
BEANZHUB  UNTITLED BOXING GAME SCRIPT: https://pastebin.com/raw/AGTKmuch
BEANZHUB MM2 SCRIPT: https://pastebin.com/raw/62fNUnFZ
(the only one I couldnt get was "Emergency Hamburg Script"
]]
--new cbypass ls https://pastebin.com/raw/PhQ6U1s8
--cracked by @riplagardoz
setclipboard("https://discord.gg/URkdsN7xdy")
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "cracked by thewiiufan",
	Text = "@riplagardoz on dc"
})
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "discord invite",
	Text = "join the server for more cracks"
})
--you can delete the credits if you want ^

-- // GUI TO LUA (MODIFIED) \\ --

-- // INSTANCES: 97 | SCRIPTS: 1 | MODULES: 2 \\ --

local UI = {}

UI["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"))
UI["1"]["IgnoreGuiInset"] = true
UI["1"]["DisplayOrder"] = 0
UI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets
UI["1"]["Name"] = [[BeanzHub]]
UI["1"]["ResetOnSpawn"] = false

UI["2"] = Instance.new("ModuleScript", UI["1"])
UI["2"]["Name"] = [[DraggableObject]]

UI["3"] = Instance.new("ModuleScript", UI["1"])
UI["3"]["Name"] = [[Anims]]

UI["4"] = Instance.new("Frame", UI["1"])
UI["4"]["Active"] = true
UI["4"]["BorderSizePixel"] = 0
UI["4"]["BackgroundColor3"] = Color3.fromRGB(100, 100, 100)
UI["4"]["AnchorPoint"] = Vector2.new(0.5, 1)
UI["4"]["Size"] = UDim2.new(0.04902, 0, 0.00163, 0)
UI["4"]["Position"] = UDim2.new(0.5, 0, 0.65046, 0)
UI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)

UI["5"] = Instance.new("Frame", UI["4"])
UI["5"]["BorderSizePixel"] = 0
UI["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["5"]["ClipsDescendants"] = true
UI["5"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5"]["Name"] = [[Title]]
UI["5"]["BackgroundTransparency"] = 1

UI["6"] = Instance.new("ImageLabel", UI["5"])
UI["6"]["ZIndex"] = 3
UI["6"]["BorderSizePixel"] = 0
UI["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["6"]["ScaleType"] = Enum.ScaleType.Fit
UI["6"]["Image"] = [[http://www.roblox.com/asset/?id=18187292776]]
UI["6"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["6"]["BackgroundTransparency"] = 1

UI["7"] = Instance.new("TextLabel", UI["5"])
UI["7"]["TextWrapped"] = true
UI["7"]["BorderSizePixel"] = 0
UI["7"]["TextScaled"] = true
UI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7"]["TextSize"] = 14
UI["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["7"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["7"]["BackgroundTransparency"] = 1
UI["7"]["RichText"] = true
UI["7"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["7"]["ClipsDescendants"] = true
UI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7"]["Text"] = [[Beanz]]
UI["7"]["Position"] = UDim2.new(-0.78854, 0, 0, 0)

UI["8"] = Instance.new("Frame", UI["5"])
UI["8"]["Active"] = true
UI["8"]["ZIndex"] = 2
UI["8"]["BorderSizePixel"] = 0
UI["8"]["BackgroundColor3"] = Color3.fromRGB(100, 100, 100)
UI["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["8"]["Size"] = UDim2.new(0.22235, 0, 1, 0)
UI["8"]["Position"] = UDim2.new(0.11117, 0, 0.5, 0)
UI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["8"]["Name"] = [[Nackground]]

UI["9"] = Instance.new("TextButton", UI["5"])
UI["9"]["TextWrapped"] = true
UI["9"]["BorderSizePixel"] = 0
UI["9"]["TextSize"] = 14
UI["9"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["9"]["TextScaled"] = true
UI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["9"]["ZIndex"] = 3
UI["9"]["Size"] = UDim2.new(0.06157, 0, 0.59705, 0)
UI["9"]["BackgroundTransparency"] = 0.95
UI["9"]["Name"] = [[Delete]]
UI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["9"]["Text"] = [[X]]
UI["9"]["Visible"] = false
UI["9"]["Position"] = UDim2.new(0.92798, 0, 0.19969, 0)

UI["a"] = Instance.new("UIStroke", UI["4"])
UI["a"]["Thickness"] = 3

UI["b"] = Instance.new("TextButton", UI["4"])
UI["b"]["BorderSizePixel"] = 0
UI["b"]["TextSize"] = 14
UI["b"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["b"]["Name"] = [[fordawin]]
UI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["b"]["Visible"] = false

UI["c"] = Instance.new("Frame", UI["4"])
UI["c"]["ZIndex"] = 3
UI["c"]["BorderSizePixel"] = 0
UI["c"]["BackgroundColor3"] = Color3.fromRGB(131, 131, 131)
UI["c"]["AnchorPoint"] = Vector2.new(0.5, 0)
UI["c"]["ClipsDescendants"] = true
UI["c"]["Size"] = UDim2.new(1, 0, 0, 0)
UI["c"]["Position"] = UDim2.new(0.5, 0, 1, 0)
UI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["c"]["Name"] = [[Background]]

UI["d"] = Instance.new("Frame", UI["c"])
UI["d"]["ZIndex"] = 5
UI["d"]["BorderSizePixel"] = 0
UI["d"]["BackgroundColor3"] = Color3.fromRGB(67, 67, 67)
UI["d"]["Size"] = UDim2.new(0.36, 0, 1, 0)
UI["d"]["Position"] = UDim2.new(-0.36001, 0, 0.00185, 0)
UI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["d"]["Name"] = [[Popup]]

UI["e"] = Instance.new("TextButton", UI["d"])
UI["e"]["TextWrapped"] = true
UI["e"]["BorderSizePixel"] = 0
UI["e"]["TextSize"] = 14
UI["e"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["e"]["TextScaled"] = true
UI["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["e"]["ZIndex"] = 3
UI["e"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["e"]["Size"] = UDim2.new(0.23653, 0, 0.1, 0)
UI["e"]["BackgroundTransparency"] = 1
UI["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["e"]["Text"] = [[>]]
UI["e"]["Rotation"] = 180
UI["e"]["Position"] = UDim2.new(1.072, 0, 0.5, 0)

UI["f"] = Instance.new("TextLabel", UI["d"])
UI["f"]["TextWrapped"] = true
UI["f"]["ZIndex"] = 5
UI["f"]["BorderSizePixel"] = 0
UI["f"]["TextScaled"] = true
UI["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["f"]["TextSize"] = 14
UI["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["f"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["f"]["BackgroundTransparency"] = 0.8
UI["f"]["Size"] = UDim2.new(0.71053, 0, 0.18607, 0)
UI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["f"]["Text"] = [[Money autofarm, Part autofarm, Autotrain]]
UI["f"]["Name"] = [[Description]]
UI["f"]["Position"] = UDim2.new(0.14208, 0, 0.32532, 0)

UI["10"] = Instance.new("UIPadding", UI["f"])
UI["10"]["PaddingTop"] = UDim.new(0.1, 0)
UI["10"]["PaddingRight"] = UDim.new(0.1, 0)
UI["10"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["10"]["PaddingBottom"] = UDim.new(0.1, 0)

UI["11"] = Instance.new("TextLabel", UI["d"])
UI["11"]["TextWrapped"] = true
UI["11"]["ZIndex"] = 5
UI["11"]["BorderSizePixel"] = 0
UI["11"]["TextScaled"] = true
UI["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["11"]["TextSize"] = 14
UI["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["11"]["TextColor3"] = Color3.fromRGB(0, 255, 0)
UI["11"]["BackgroundTransparency"] = 1
UI["11"]["Size"] = UDim2.new(0.59292, 0, 0.05907, 0)
UI["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["11"]["Text"] = [[Working]]
UI["11"]["Name"] = [[Status]]
UI["11"]["Position"] = UDim2.new(0.20334, 0, 0.51299, 0)

UI["12"] = Instance.new("TextLabel", UI["d"])
UI["12"]["TextWrapped"] = true
UI["12"]["ZIndex"] = 5
UI["12"]["BorderSizePixel"] = 0
UI["12"]["TextScaled"] = true
UI["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["12"]["TextSize"] = 14
UI["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["12"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["12"]["BackgroundTransparency"] = 1
UI["12"]["Size"] = UDim2.new(0.81409, 0, 0.15697, 0)
UI["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["12"]["Text"] = [[Life Sentence GUI v1.6.1]]
UI["12"]["Name"] = [[Title]]
UI["12"]["Position"] = UDim2.new(0.09296, 0, 0.11951, 0)

UI["13"] = Instance.new("TextButton", UI["d"])
UI["13"]["TextWrapped"] = true
UI["13"]["BorderSizePixel"] = 0
UI["13"]["TextSize"] = 14
UI["13"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["13"]["TextScaled"] = true
UI["13"]["BackgroundColor3"] = Color3.fromRGB(86, 171, 0)
UI["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["13"]["ZIndex"] = 5
UI["13"]["Size"] = UDim2.new(0.48584, 0, 0.09407, 0)
UI["13"]["Name"] = [[CopyScript]]
UI["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["13"]["Text"] = [[Copy Script]]
UI["13"]["Position"] = UDim2.new(0.25563, 0, 0.76031, 0)

UI["14"] = Instance.new("UICorner", UI["13"])


UI["15"] = Instance.new("UIPadding", UI["13"])
UI["15"]["PaddingRight"] = UDim.new(0.1, 0)
UI["15"]["PaddingLeft"] = UDim.new(0.1, 0)

UI["16"] = Instance.new("TextButton", UI["d"])
UI["16"]["TextWrapped"] = true
UI["16"]["BorderSizePixel"] = 0
UI["16"]["TextSize"] = 14
UI["16"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["16"]["TextScaled"] = true
UI["16"]["BackgroundColor3"] = Color3.fromRGB(43, 71, 255)
UI["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["16"]["ZIndex"] = 5
UI["16"]["Size"] = UDim2.new(0.48584, 0, 0.09407, 0)
UI["16"]["Name"] = [[RunScript]]
UI["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["16"]["Text"] = [[Run]]
UI["16"]["Position"] = UDim2.new(0.25563, 0, 0.63067, 0)

UI["17"] = Instance.new("UICorner", UI["16"])


UI["18"] = Instance.new("UIPadding", UI["16"])
UI["18"]["PaddingRight"] = UDim.new(0.3, 0)
UI["18"]["PaddingLeft"] = UDim.new(0.3, 0)

UI["19"] = Instance.new("Frame", UI["c"])
UI["19"]["ZIndex"] = 3
UI["19"]["BorderSizePixel"] = 0
UI["19"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["19"]["Size"] = UDim2.new(0.36, 0, 1, 0)
UI["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["19"]["Name"] = [[OtherBackground]]
UI["19"]["BackgroundTransparency"] = 0.9

UI["1a"] = Instance.new("UIStroke", UI["19"])
UI["1a"]["Thickness"] = 3

UI["1b"] = Instance.new("ScrollingFrame", UI["c"])
UI["1b"]["Active"] = true
UI["1b"]["ZIndex"] = 3
UI["1b"]["BorderSizePixel"] = 0
UI["1b"]["ScrollingEnabled"] = false
UI["1b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1b"]["Name"] = [[Main]]
UI["1b"]["ScrollBarImageTransparency"] = 1
UI["1b"]["Size"] = UDim2.new(0.32222, 0, 0.9746, 0)
UI["1b"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0)
UI["1b"]["Position"] = UDim2.new(0.02645, 0, 0.0254, 0)
UI["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1b"]["ScrollBarThickness"] = 8
UI["1b"]["BackgroundTransparency"] = 1

UI["1c"] = Instance.new("Frame", UI["1b"])
UI["1c"]["BorderSizePixel"] = 0
UI["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1c"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1c"]["Name"] = [[Buttons]]
UI["1c"]["BackgroundTransparency"] = 1

UI["1d"] = Instance.new("UIListLayout", UI["1c"])
UI["1d"]["Padding"] = UDim.new(0.02, 0)
UI["1d"]["SortOrder"] = Enum.SortOrder.LayoutOrder

UI["1e"] = Instance.new("TextButton", UI["1c"])
UI["1e"]["TextWrapped"] = true
UI["1e"]["BorderSizePixel"] = 0
UI["1e"]["TextSize"] = 14
UI["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1e"]["TextScaled"] = true
UI["1e"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76)
UI["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1e"]["ZIndex"] = 4
UI["1e"]["Size"] = UDim2.new(0.89506, 0, 0.04818, 0)
UI["1e"]["BackgroundTransparency"] = 1
UI["1e"]["Name"] = [[Scripts]]
UI["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1e"]["Text"] = [[Scripts]]
UI["1e"]["Position"] = UDim2.new(-0, 0, 0.04028, 0)

UI["1f"] = Instance.new("TextButton", UI["1c"])
UI["1f"]["TextWrapped"] = true
UI["1f"]["BorderSizePixel"] = 0
UI["1f"]["TextSize"] = 14
UI["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1f"]["TextScaled"] = true
UI["1f"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76)
UI["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1f"]["ZIndex"] = 4
UI["1f"]["Size"] = UDim2.new(0.89506, 0, 0.04818, 0)
UI["1f"]["BackgroundTransparency"] = 1
UI["1f"]["Name"] = [[Tools]]
UI["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1f"]["Text"] = [[Tools]]
UI["1f"]["Position"] = UDim2.new(-0, 0, 0.04028, 0)

UI["20"] = Instance.new("TextButton", UI["1c"])
UI["20"]["TextWrapped"] = true
UI["20"]["BorderSizePixel"] = 0
UI["20"]["TextSize"] = 14
UI["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["20"]["TextScaled"] = true
UI["20"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76)
UI["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["20"]["ZIndex"] = 4
UI["20"]["Size"] = UDim2.new(0.89506, 0, 0.04818, 0)
UI["20"]["BackgroundTransparency"] = 1
UI["20"]["Name"] = [[Settings]]
UI["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["20"]["Text"] = [[Settings]]
UI["20"]["Position"] = UDim2.new(-0, 0, 0.04028, 0)

UI["21"] = Instance.new("TextButton", UI["1c"])
UI["21"]["TextWrapped"] = true
UI["21"]["BorderSizePixel"] = 0
UI["21"]["TextSize"] = 14
UI["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["21"]["TextScaled"] = true
UI["21"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76)
UI["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["21"]["ZIndex"] = 4
UI["21"]["Size"] = UDim2.new(0.89506, 0, 0.04818, 0)
UI["21"]["BackgroundTransparency"] = 1
UI["21"]["Name"] = [[Moresoon]]
UI["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["21"]["Text"] = [[More coming soon]]
UI["21"]["Position"] = UDim2.new(-0, 0, 0.04028, 0)

UI["22"] = Instance.new("Frame", UI["1b"])
UI["22"]["ZIndex"] = 3
UI["22"]["BorderSizePixel"] = 3
UI["22"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76)
UI["22"]["BorderMode"] = Enum.BorderMode.Inset
UI["22"]["Size"] = UDim2.new(0.895, 0, 0.048, 0)
UI["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["22"]["Name"] = [[Selector]]

UI["23"] = Instance.new("Frame", UI["c"])
UI["23"]["ZIndex"] = 4
UI["23"]["BorderSizePixel"] = 0
UI["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["23"]["Size"] = UDim2.new(0.59355, 0, 0.79593, 0)
UI["23"]["Position"] = UDim2.new(0.38895, 0, 0.14791, 0)
UI["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["23"]["Name"] = [[dontusethis]]
UI["23"]["BackgroundTransparency"] = 0.9

UI["24"] = Instance.new("UIStroke", UI["23"])
UI["24"]["Enabled"] = false
UI["24"]["Thickness"] = 2.5

UI["25"] = Instance.new("UIStroke", UI["c"])
UI["25"]["Thickness"] = 3

UI["26"] = Instance.new("Folder", UI["c"])
UI["26"]["Name"] = [[Tools]]

UI["27"] = Instance.new("TextBox", UI["26"])
UI["27"]["Visible"] = false
UI["27"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["27"]["ZIndex"] = 3
UI["27"]["BorderSizePixel"] = 0
UI["27"]["TextWrapped"] = true
UI["27"]["TextSize"] = 14
UI["27"]["TextScaled"] = true
UI["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["27"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["27"]["PlaceholderText"] = [[Search...]]
UI["27"]["Size"] = UDim2.new(0.59573, 0, 0.09866, 0)
UI["27"]["Position"] = UDim2.new(0.38645, 0, 0.02309, 0)
UI["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["27"]["Text"] = [[]]

UI["28"] = Instance.new("UICorner", UI["27"])


UI["29"] = Instance.new("UIStroke", UI["27"])
UI["29"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["29"]["Thickness"] = 2.7

UI["2a"] = Instance.new("ScrollingFrame", UI["26"])
UI["2a"]["Visible"] = false
UI["2a"]["Active"] = true
UI["2a"]["ZIndex"] = 3
UI["2a"]["BorderSizePixel"] = 0
UI["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2a"]["Name"] = [[Scroll]]
UI["2a"]["Size"] = UDim2.new(0.54752, 0, 0.78291, 0)
UI["2a"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0)
UI["2a"]["Position"] = UDim2.new(0.43466, 0, 0.1612, 0)
UI["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2a"]["BackgroundTransparency"] = 1

UI["2b"] = Instance.new("UIListLayout", UI["2a"])
UI["2b"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["2b"]["Wraps"] = true
UI["2b"]["Padding"] = UDim.new(0.007, 0)
UI["2b"]["SortOrder"] = Enum.SortOrder.LayoutOrder

UI["2c"] = Instance.new("UIPadding", UI["2a"])
UI["2c"]["PaddingTop"] = UDim.new(0.01, 0)

UI["2d"] = Instance.new("TextButton", UI["2a"])
UI["2d"]["TextWrapped"] = true
UI["2d"]["BorderSizePixel"] = 0
UI["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["2d"]["TextSize"] = 14
UI["2d"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["2d"]["TextScaled"] = true
UI["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["2d"]["ZIndex"] = 3
UI["2d"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["2d"]["Name"] = [[ChatSpy]]
UI["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2d"]["Text"] = [[Chat Spy]]
UI["2d"]["Position"] = UDim2.new(0.099, 0, 0.12146, 0)
-- Attributes
UI["2d"]:SetAttribute([[loadstring]], [[https://raw.githubusercontent.com/dehoisted/Chat-Spy/main/source/main.lua]])
UI["2d"]:SetAttribute([[Description]], [[Allows you to see private messages and messages on games with hidden chats.]])
UI["2d"]:SetAttribute([[Recent]], [[]])
UI["2d"]:SetAttribute([[Title]], [[Chat Spy]])
UI["2d"]:SetAttribute([[Status]], [[Working]])

UI["2e"] = Instance.new("UIPadding", UI["2d"])
UI["2e"]["PaddingTop"] = UDim.new(0.3, 0)
UI["2e"]["PaddingRight"] = UDim.new(0.3, 0)
UI["2e"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["2e"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["2f"] = Instance.new("UICorner", UI["2d"])


UI["30"] = Instance.new("UIStroke", UI["2d"])
UI["30"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["30"]["Thickness"] = 2

UI["31"] = Instance.new("TextButton", UI["2a"])
UI["31"]["TextWrapped"] = true
UI["31"]["BorderSizePixel"] = 0
UI["31"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["31"]["TextSize"] = 14
UI["31"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["31"]["TextScaled"] = true
UI["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["31"]["ZIndex"] = 3
UI["31"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["31"]["Name"] = [[CBypass]]
UI["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["31"]["Text"] = [[Chat Bypass]]
UI["31"]["Position"] = UDim2.new(0.099, 0, 0.17434, 0)
-- Attributes
UI["31"]:SetAttribute([[loadstring]], [[https://raw.githubusercontent.com/pid4k/scripts/main/cbypass.lua]])
UI["31"]:SetAttribute([[Description]], [[Allows you to bypass roblox filter. Still W.I.P]])
UI["31"]:SetAttribute([[Recent]], [[]])
UI["31"]:SetAttribute([[Title]], [[Chat Bypass]])
UI["31"]:SetAttribute([[Status]], [[Working]])

UI["32"] = Instance.new("UIPadding", UI["31"])
UI["32"]["PaddingTop"] = UDim.new(0.3, 0)
UI["32"]["PaddingRight"] = UDim.new(0.3, 0)
UI["32"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["32"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["33"] = Instance.new("UICorner", UI["31"])


UI["34"] = Instance.new("UIStroke", UI["31"])
UI["34"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["34"]["Thickness"] = 2

UI["35"] = Instance.new("TextButton", UI["2a"])
UI["35"]["TextWrapped"] = true
UI["35"]["BorderSizePixel"] = 0
UI["35"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["35"]["TextSize"] = 14
UI["35"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["35"]["TextScaled"] = true
UI["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["35"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["35"]["ZIndex"] = 3
UI["35"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["35"]["Name"] = [[Dex]]
UI["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["35"]["Text"] = [[Dex]]
UI["35"]["Position"] = UDim2.new(0.099, 0, 0.22722, 0)
-- Attributes
UI["35"]:SetAttribute([[loadstring]], [[https://raw.githubusercontent.com/infyiff/backup/main/dex.lua]])
UI["35"]:SetAttribute([[Description]], [[Useful for debugging]])
UI["35"]:SetAttribute([[Recent]], [[]])
UI["35"]:SetAttribute([[Title]], [[Dex]])
UI["35"]:SetAttribute([[Status]], [[Working]])

UI["36"] = Instance.new("UIPadding", UI["35"])
UI["36"]["PaddingTop"] = UDim.new(0.3, 0)
UI["36"]["PaddingRight"] = UDim.new(0.3, 0)
UI["36"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["36"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["37"] = Instance.new("UICorner", UI["35"])


UI["38"] = Instance.new("UIStroke", UI["35"])
UI["38"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["38"]["Thickness"] = 2

UI["39"] = Instance.new("TextButton", UI["2a"])
UI["39"]["TextWrapped"] = true
UI["39"]["BorderSizePixel"] = 0
UI["39"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["39"]["TextSize"] = 14
UI["39"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["39"]["TextScaled"] = true
UI["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["39"]["ZIndex"] = 3
UI["39"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["39"]["Name"] = [[GuiPath]]
UI["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["39"]["Text"] = [[Gui Button Path]]
UI["39"]["Position"] = UDim2.new(0.099, 0, 0.0157, 0)
-- Attributes
UI["39"]:SetAttribute([[loadstring]], [[https://raw.githubusercontent.com/pid4k/scripts/main/getguibuttonpath.lua]]) --this is useless
UI["39"]:SetAttribute([[Description]], [[Allows you to copy paths to gui buttons and press them using K]])
UI["39"]:SetAttribute([[Recent]], [[]])
UI["39"]:SetAttribute([[Title]], [[Gui Button Path]])
UI["39"]:SetAttribute([[Status]], [[Working]])

UI["3a"] = Instance.new("UIPadding", UI["39"])
UI["3a"]["PaddingTop"] = UDim.new(0.3, 0)
UI["3a"]["PaddingRight"] = UDim.new(0.3, 0)
UI["3a"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["3a"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["3b"] = Instance.new("UICorner", UI["39"])


UI["3c"] = Instance.new("UIStroke", UI["39"])
UI["3c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["3c"]["Thickness"] = 2

UI["3d"] = Instance.new("TextButton", UI["2a"])
UI["3d"]["TextWrapped"] = true
UI["3d"]["BorderSizePixel"] = 0
UI["3d"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["3d"]["TextSize"] = 14
UI["3d"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["3d"]["TextScaled"] = true
UI["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["3d"]["ZIndex"] = 3
UI["3d"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["3d"]["Name"] = [[InfiniteYield]]
UI["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["3d"]["Text"] = [[Infinite Yield]]
UI["3d"]["Position"] = UDim2.new(0.099, 0, 0.06858, 0)
-- Attributes
UI["3d"]:SetAttribute([[loadstring]], [[https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source]])
UI["3d"]:SetAttribute([[Description]], [[I mean how should i describe this lol]])
UI["3d"]:SetAttribute([[Recent]], [[]])
UI["3d"]:SetAttribute([[Title]], [[Infinite Yield]])
UI["3d"]:SetAttribute([[Status]], [[Working]])

UI["3e"] = Instance.new("UIPadding", UI["3d"])
UI["3e"]["PaddingTop"] = UDim.new(0.3, 0)
UI["3e"]["PaddingRight"] = UDim.new(0.3, 0)
UI["3e"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["3e"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["3f"] = Instance.new("UICorner", UI["3d"])


UI["40"] = Instance.new("UIStroke", UI["3d"])
UI["40"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["40"]["Thickness"] = 2

UI["41"] = Instance.new("TextButton", UI["2a"])
UI["41"]["TextWrapped"] = true
UI["41"]["BorderSizePixel"] = 0
UI["41"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["41"]["TextSize"] = 14
UI["41"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["41"]["TextScaled"] = true
UI["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["41"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["41"]["ZIndex"] = 3
UI["41"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["41"]["Name"] = [[RemoteSpy]]
UI["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["41"]["Text"] = [[Simple Spy]]
UI["41"]["Position"] = UDim2.new(0.099, 0, 0.17434, 0)
-- Attributes
UI["41"]:SetAttribute([[loadstring]], [[https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua]])
UI["41"]:SetAttribute([[Description]], [[]])
UI["41"]:SetAttribute([[Recent]], [[]])
UI["41"]:SetAttribute([[Title]], [[Simple Spy v3]])
UI["41"]:SetAttribute([[Status]], [[Working]])

UI["42"] = Instance.new("UIPadding", UI["41"])
UI["42"]["PaddingTop"] = UDim.new(0.3, 0)
UI["42"]["PaddingRight"] = UDim.new(0.3, 0)
UI["42"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["42"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["43"] = Instance.new("UICorner", UI["41"])


UI["44"] = Instance.new("UIStroke", UI["41"])
UI["44"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["44"]["Thickness"] = 2

UI["45"] = Instance.new("Folder", UI["c"])
UI["45"]["Name"] = [[Scripts]]

UI["46"] = Instance.new("ScrollingFrame", UI["45"])
UI["46"]["Active"] = true
UI["46"]["ZIndex"] = 3
UI["46"]["BorderSizePixel"] = 0
UI["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["46"]["Name"] = [[Scroll]]
UI["46"]["Size"] = UDim2.new(0.54752, 0, 0.78291, 0)
UI["46"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0)
UI["46"]["Position"] = UDim2.new(0.43466, 0, 0.1612, 0)
UI["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["46"]["BackgroundTransparency"] = 1

UI["47"] = Instance.new("UIListLayout", UI["46"])
UI["47"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["47"]["Wraps"] = true
UI["47"]["Padding"] = UDim.new(0.007, 0)
UI["47"]["SortOrder"] = Enum.SortOrder.LayoutOrder

UI["48"] = Instance.new("UIPadding", UI["46"])
UI["48"]["PaddingTop"] = UDim.new(0.01, 0)

UI["49"] = Instance.new("TextButton", UI["46"])
UI["49"]["TextWrapped"] = true
UI["49"]["BorderSizePixel"] = 0
UI["49"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["49"]["TextSize"] = 14
UI["49"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["49"]["TextScaled"] = true
UI["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["49"]["ZIndex"] = 3
UI["49"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["49"]["Name"] = [[Life sentence]]
UI["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["49"]["Text"] = [[Life Sentence GUI]]
UI["49"]["Position"] = UDim2.new(0.099, 0, 0.0157, 0)
-- Attributes
UI["49"]:SetAttribute([[loadstring]], [[https://pastebin.com/raw/C2VfF09b]]) --NEW LOADSTING
UI["49"]:SetAttribute([[Description]], [[Money autofarm, Part autofarm, Autotrain]])
UI["49"]:SetAttribute([[Recent]], [[]])
UI["49"]:SetAttribute([[Title]], [[Life Sentence GUI v1.7]])
UI["49"]:SetAttribute([[Status]], [[Working]])

UI["4a"] = Instance.new("UIPadding", UI["49"])
UI["4a"]["PaddingTop"] = UDim.new(0.3, 0)
UI["4a"]["PaddingRight"] = UDim.new(0.3, 0)
UI["4a"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["4a"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["4b"] = Instance.new("UICorner", UI["49"])


UI["4c"] = Instance.new("UIStroke", UI["49"])
UI["4c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["4c"]["Thickness"] = 2

UI["4d"] = Instance.new("TextButton", UI["46"])
UI["4d"]["TextWrapped"] = true
UI["4d"]["BorderSizePixel"] = 0
UI["4d"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["4d"]["TextSize"] = 14
UI["4d"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["4d"]["TextScaled"] = true
UI["4d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["4d"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["4d"]["ZIndex"] = 3
UI["4d"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["4d"]["Name"] = [[TSG]]
UI["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["4d"]["Text"] = [[BladeBall GUI]]
UI["4d"]["Position"] = UDim2.new(0.099, 0, 0.06858, 0)
-- Attributes
UI["4d"]:SetAttribute([[loadstring]], [[https://pastebin.com/raw/bD0V1uKJ]])
UI["4d"]:SetAttribute([[Description]], [[AutoParry,W.I.P (cracked by @riplagardoz)]])
UI["4d"]:SetAttribute([[Recent]], [[]])
UI["4d"]:SetAttribute([[Title]], [[BladeBall GUI]])
UI["4d"]:SetAttribute([[Status]], [[Working]])

UI["4e"] = Instance.new("UIPadding", UI["4d"])
UI["4e"]["PaddingTop"] = UDim.new(0.3, 0)
UI["4e"]["PaddingRight"] = UDim.new(0.3, 0)
UI["4e"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["4e"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["4f"] = Instance.new("UICorner", UI["4d"])


UI["50"] = Instance.new("UIStroke", UI["4d"])
UI["50"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["50"]["Thickness"] = 2

UI["51"] = Instance.new("TextButton", UI["46"])
UI["51"]["TextWrapped"] = true
UI["51"]["BorderSizePixel"] = 0
UI["51"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["51"]["TextSize"] = 14
UI["51"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["51"]["TextScaled"] = true
UI["51"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["51"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["51"]["ZIndex"] = 3
UI["51"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["51"]["Name"] = [[UniversalAB]]
UI["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["51"]["Text"] = [[Universal Aimbot]]
UI["51"]["Position"] = UDim2.new(0.099, 0, 0.17434, 0)
-- Attributes
UI["51"]:SetAttribute([[loadstring]], [[https://pastebin.com/raw/3H0Nj0QZ]])
UI["51"]:SetAttribute([[Description]], [[Sigma imbot fr]])
UI["51"]:SetAttribute([[Recent]], [[]])
UI["51"]:SetAttribute([[Title]], [[Universal Aimbot GUI]])
UI["51"]:SetAttribute([[Status]], [[Working]])

UI["52"] = Instance.new("UIPadding", UI["51"])
UI["52"]["PaddingTop"] = UDim.new(0.3, 0)
UI["52"]["PaddingRight"] = UDim.new(0.3, 0)
UI["52"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["52"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["53"] = Instance.new("UICorner", UI["51"])


UI["54"] = Instance.new("UIStroke", UI["51"])
UI["54"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["54"]["Thickness"] = 2

UI["55"] = Instance.new("TextBox", UI["45"])
UI["55"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["55"]["ZIndex"] = 3
UI["55"]["BorderSizePixel"] = 0
UI["55"]["TextWrapped"] = true
UI["55"]["TextSize"] = 14
UI["55"]["TextScaled"] = true
UI["55"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["55"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["55"]["PlaceholderText"] = [[Search...]]
UI["55"]["Size"] = UDim2.new(0.59573, 0, 0.09866, 0)
UI["55"]["Position"] = UDim2.new(0.38645, 0, 0.02309, 0)
UI["55"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["55"]["Text"] = [[]]

UI["56"] = Instance.new("UICorner", UI["55"])


UI["57"] = Instance.new("UIStroke", UI["55"])
UI["57"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["57"]["Thickness"] = 2.7

UI["58"] = Instance.new("Folder", UI["c"])
UI["58"]["Name"] = [[Settings]]

UI["59"] = Instance.new("Frame", UI["58"])
UI["59"]["Visible"] = false
UI["59"]["ZIndex"] = 4
UI["59"]["BorderSizePixel"] = 0
UI["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["59"]["Size"] = UDim2.new(0.4441, 0, 0.13943, 0)
UI["59"]["Position"] = UDim2.new(0.43515, 0, 0.17286, 0)
UI["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["59"]["Name"] = [[Scroll]]

UI["5a"] = Instance.new("TextLabel", UI["59"])
UI["5a"]["TextWrapped"] = true
UI["5a"]["ZIndex"] = 4
UI["5a"]["BorderSizePixel"] = 0
UI["5a"]["TextScaled"] = true
UI["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["5a"]["TextSize"] = 14
UI["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["5a"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["5a"]["Size"] = UDim2.new(0.49731, 0, 0.52097, 0)
UI["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5a"]["Text"] = [[Fast Intro]]
UI["5a"]["Name"] = [[Skip]]
UI["5a"]["Position"] = UDim2.new(0.03317, 0, 0.18866, 0)

UI["5b"] = Instance.new("TextButton", UI["59"])
UI["5b"]["BorderSizePixel"] = 0
UI["5b"]["TextSize"] = 14
UI["5b"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["5b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["5b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["5b"]["ZIndex"] = 4
UI["5b"]["Size"] = UDim2.new(0.3, 0, 0.6, 0)
UI["5b"]["BackgroundTransparency"] = 1
UI["5b"]["Name"] = [[SkipButton]]
UI["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5b"]["Text"] = [[]]
UI["5b"]["Position"] = UDim2.new(0.62772, 0, 0.16171, 0)

UI["5c"] = Instance.new("UIStroke", UI["5b"])
UI["5c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

UI["5d"] = Instance.new("LocalScript", UI["1"])
UI["5d"]["Name"] = [[gitgud]]

UI["5e"] = Instance.new("TextButton", UI["1"])
UI["5e"]["TextWrapped"] = true
UI["5e"]["BorderSizePixel"] = 0
UI["5e"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["5e"]["TextSize"] = 14
UI["5e"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["5e"]["TextScaled"] = true
UI["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["5e"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["5e"]["ZIndex"] = 3
UI["5e"]["Size"] = UDim2.new(0.802, 0, 0.04627, 0)
UI["5e"]["Name"] = [[Placeholder]]
UI["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5e"]["Text"] = [[Life Sentence GUI]]
UI["5e"]["Visible"] = false
UI["5e"]["Position"] = UDim2.new(0.099, 0, 0.0157, 0)
-- Attributes
UI["5e"]:SetAttribute([[loadstring]], [[https://raw.githubusercontent.com/pid4k/scripts/main/lifesentence.lua]]) --this script is not used
UI["5e"]:SetAttribute([[Description]], [[Money autofarm, Part autofarm, Autotrain]])
UI["5e"]:SetAttribute([[Recent]], [[]])
UI["5e"]:SetAttribute([[Title]], [[Life Sentence GUI v1.7]])
UI["5e"]:SetAttribute([[Status]], [[Working]])

UI["5f"] = Instance.new("UIPadding", UI["5e"])
UI["5f"]["PaddingTop"] = UDim.new(0.3, 0)
UI["5f"]["PaddingRight"] = UDim.new(0.3, 0)
UI["5f"]["PaddingLeft"] = UDim.new(0.04, 0)
UI["5f"]["PaddingBottom"] = UDim.new(0.3, 0)

UI["60"] = Instance.new("UICorner", UI["5e"])


UI["61"] = Instance.new("UIStroke", UI["5e"])
UI["61"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["61"]["Thickness"] = 2

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

G2L_MODULES[UI["2"]] = {
Closure = function()
    local script = UI["2"]
--[[
	@Author: Spynaz
	@Description: Enables dragging on GuiObjects. Supports both mouse and touch.
	
	For instructions on how to use this module, go to this link:
	https://devforum.roblox.com/t/simple-module-for-creating-draggable-gui-elements/230678
--]]

local UDim2_new = UDim2.new

local UserInputService = game:GetService("UserInputService")

local DraggableObject 		= {}
DraggableObject.__index 	= DraggableObject

-- Sets up a new draggable object
function DraggableObject.new(Object, second)
	local self 			= {}
	self.Object			= Object
	self.SecondObject = second or nil
	self.DragStarted	= nil
	self.DragEnded		= nil
	self.Dragged		= nil
	self.Dragging		= false
	
	setmetatable(self, DraggableObject)
	
	return self
end

-- Enables dragging
function DraggableObject:Enable()
	local object			= self.Object
	local secondobject      = self.SecondObject
	local dragInput			= nil
	local dragStart			= nil
	local startPos			= nil
	local preparingToDrag	= false
	
	-- Updates the element
	local function update(input)
		local delta 		= input.Position - dragStart
		local newPosition	= UDim2_new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		object.Position 	= newPosition
	
		return newPosition
	end
	local function start(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			preparingToDrag = true
			--[[if self.DragStarted then
				self.DragStarted()
			end
			
			dragging	 	= true
			dragStart 		= input.Position
			startPos 		= Element.Position
			--]]

			local connection 
			connection = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End and (self.Dragging or preparingToDrag) then
					self.Dragging = false
					connection:Disconnect()

					if self.DragEnded and not preparingToDrag then
						self.DragEnded()
					end

					preparingToDrag = false
				end
			end)
		end
	end
	self.InputBegan = object.InputBegan:Connect(start)
	if secondobject ~= nil then
	self.InputBegan = secondobject.InputBegan:Connect(start)
	end
	
	self.InputChanged = object.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	self.InputChanged2 = UserInputService.InputChanged:Connect(function(input)
		if object.Parent == nil then
			self:Disable()
			return
		end
		
		if preparingToDrag then
			preparingToDrag = false
			
			if self.DragStarted then
				self.DragStarted()
			end
			
			self.Dragging	= true
			dragStart 		= input.Position
			startPos 		= object.Position
		end
		
		if input == dragInput and self.Dragging then
			local newPosition = update(input)
			
			if self.Dragged then
				self.Dragged(newPosition)
			end
		end
	end)
end

-- Disables dragging
function DraggableObject:Disable()
	self.InputBegan:Disconnect()
	self.InputChanged:Disconnect()
	self.InputChanged2:Disconnect()
	
	if self.Dragging then
		self.Dragging = false
		
		if self.DragEnded then
			self.DragEnded()
		end
	end
end

return DraggableObject

end
}
G2L_MODULES[UI["3"]] = {
Closure = function()
    local script = UI["3"]
local anims = {}
local mainfolder = "BeanzHub/"
local paste = "Main.txt"
local settingsfile = tostring(mainfolder..paste)
local tweenService = game:GetService("TweenService")
local Idkwhatthisis = script.Parent.Frame
local main = Idkwhatthisis.Title
Idkwhatthisis.Title.TextLabel.Visible = false
Idkwhatthisis.Background.UIStroke.Enabled = false
local Beanzdisplay = main.TextLabel
introcompleted = false
function resetdefault(file:string,placeholder:string,slots:number)
	local torepeat = tostring(placeholder..",")
	torepeat = torepeat:rep(slots)
	torepeat = torepeat:sub(0,torepeat:len()-1)
	writefile(file,torepeat)
end
function installfile()
	if isfile then
		if not isfolder("BeanzHub") then
			makefolder("BeanzHub")
		end
		if not isfile(settingsfile) then
			writefile(settingsfile,"")
			resetdefault(settingsfile,"nil",10)
		end
	end
	task.wait()
end

installfile()
function checkvariable(file:string,variable:number):string
	if isfile then
	if readfile(file) == nil then
		resetdefault(file,"nil",3)
	end
	local filecontents = readfile(file)
	local splitwordstable = filecontents:split(",")
	local putbacksentence = ""
	for option, word in splitwordstable do
		if option == variable then
			return word
		end
	end
	end
end
function writevariable(file:string,variable:number,check:string)
	if isfile then
	if readfile(file) == nil then
		resetdefault(file,"nil",3)
	end
	local filecontents = readfile(file)
	local splitwordstable = filecontents:split(",")
	local putbacksentence = ""
	for option, word in splitwordstable do
		if option == variable then
			putbacksentence = tostring(putbacksentence .. check .. ",")
		else
			if word ~= "" then
				putbacksentence = tostring(putbacksentence .. word .. ",")
			end
		end										
	end
	putbacksentence = putbacksentence:sub(0,putbacksentence:len()-1)
	writefile(file,putbacksentence)
	end
end
local speed = 1
if checkvariable(settingsfile,2) == "true" then
	speed = 0
	Idkwhatthisis.Background.Settings.Scroll.SkipButton.BackgroundTransparency = 0
end
function anims.Intro()
	local properties = {Size = UDim2.fromScale(0.049,0.103)
	}
	local tweeninfo = TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false)
	local tween = tweenService:Create(Idkwhatthisis,tweeninfo,properties)
	tween:Play()
	tween:GetPropertyChangedSignal("PlaybackState"):Connect(function()
		if tween.PlaybackState == Enum.PlaybackState.Completed then
			task.wait(0.4*speed)
			local size = {Size = UDim2.fromScale(0.34,0.103)}
			local beanpos = {Position = UDim2.fromScale(-0.384,0),
				Rotation = -360
			}
			local resize = tweenService:Create(Idkwhatthisis,tweeninfo,size)
			local beanidk = tweenService:Create(Idkwhatthisis.Title.ImageLabel,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),beanpos)
			resize:Play()
			beanidk:Play()
			task.wait(0.4*speed)
			local change = {Position = UDim2.fromScale(0,0)}
			local textcomein = tweenService:Create(Idkwhatthisis.Title.TextLabel,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),change)
			Idkwhatthisis.Title.TextLabel.Visible = true
			textcomein:Play()
			task.wait(0.8*speed)
			Beanzdisplay.Text = [[  Beanz<font color="rgb(255,0,0)">z</font>]]
			task.wait(0.4*speed)
			Beanzdisplay.Text = [[   Beanz<font color="rgb(255,0,0)">zz</font>]]
			task.wait(0.4*speed)
			Beanzdisplay.Text = [[    Beanz<font color="rgb(255,0,0)">zzz</font>]]
			task.wait(0.2*speed)
			Beanzdisplay.Text = [[   Beanz<font color="rgb(255,0,0)">zz</font>]]
			task.wait(0.2*speed)
			Beanzdisplay.Text = [[  Beanz<font color="rgb(255,0,0)">z</font>]]
			task.wait(0.2*speed)
			Beanzdisplay.Text = [[ Beanz<font color="rgb(255,0,0)"></font>]]
			task.wait(0.4*speed)
			Beanzdisplay.Text = [[  Beanz<font color="rgb(42, 70, 255)">H</font>]]
			task.wait(0.2*speed)
			Beanzdisplay.Text = [[   Beanz<font color="rgb(42, 70, 255)">HU</font>]]
			task.wait(0.2*speed)
			Beanzdisplay.Text = [[    Beanz<font color="rgb(42, 70, 255)">HUB</font>]]
			task.wait(0.3*speed)
			local pos = {Position = UDim2.fromScale(0.5,0.324),
				Size = UDim2.fromScale(0.45,0.082)
			}
			local center = tweenService:Create(Idkwhatthisis,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),pos)
			center:Play()
			task.wait(0.4*speed)
			local backgroundtable = {Size = UDim2.fromScale(1,6.761)}
			local openbackground = tweenService:Create(Idkwhatthisis.Background,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),backgroundtable)
			openbackground:Play()
			Idkwhatthisis.Background.UIStroke.Enabled = true
			task.wait(0.4*speed)
			introcompleted = true
		end
	end)
	return true
end
function anims.Status()
	if introcompleted == false then
		return false
	else
		return true
	end
end
return anims

end
}
local function SCRIPT_5d()
local script = UI["5d"]
	local Beanzanim = require(script.Parent.Anims)
	local mainfolder = "BeanzHub/"
	local paste = "Main.txt"
	local settingsfile = tostring(mainfolder..paste)
	function resetdefault(file:string,placeholder:string,slots:number)
		local torepeat = tostring(placeholder..",")
		torepeat = torepeat:rep(slots)
		torepeat = torepeat:sub(0,torepeat:len()-1)
		writefile(file,torepeat)
	end
	
	function installfile()
		if isfile then
			if not isfolder("BeanzHub") then
				makefolder("BeanzHub")
			end
			if not isfile(settingsfile) then
				writefile(settingsfile,"")
				resetdefault(settingsfile,"nil",10)
			end
		end
		task.wait()
	end
	
	installfile()
	function checkvariable(file:string,variable:number):string
		if readfile(file) == nil then
			resetdefault(file,"nil",3)
		end
		local filecontents = readfile(file)
		local splitwordstable = filecontents:split(",")
		local putbacksentence = ""
		for option, word in splitwordstable do
			if option == variable then
				return word
			end
		end
	end
	function writevariable(file:string,variable:number,check:string)
		if readfile(file) == nil then
			resetdefault(file,"nil",3)
		end
		local filecontents = readfile(file)
		local splitwordstable = filecontents:split(",")
		local putbacksentence = ""
		for option, word in splitwordstable do
			if option == variable then
				putbacksentence = tostring(putbacksentence .. check .. ",")
			else
				if word ~= "" then
					putbacksentence = tostring(putbacksentence .. word .. ",")
				end
			end										
		end
		putbacksentence = putbacksentence:sub(0,putbacksentence:len()-1)
		writefile(file,putbacksentence)
	end
	local gui = script.Parent
	local MainFrame = gui.Frame
	local Title = MainFrame.Title
	local MainFrameMenu = MainFrame.Background
	local MainMenu = MainFrameMenu.Main
	local scriptsearch = MainFrameMenu.Scripts.TextBox
	local toolssearch = MainFrameMenu.Tools.TextBox
	local settingsfolder = MainFrameMenu.Settings
	local UIS = game:GetService("UserInputService")
	local tweenService = game:GetService("TweenService")
	local DraggableObject	= require(gui.DraggableObject)
	local FrameDrag 		= DraggableObject.new(MainFrame)
	Beanzanim.Intro()
	local Popup = MainFrameMenu.Popup
	local originalpopuppos = Popup.Position
	local selectedscript = nil
	local coloredbutton = gui.Frame.fordawin
	local popupbutton = Popup.TextButton
	local originalbuttonpos = popupbutton.Position
	local current = "Scripts"
	local everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	local forpopup = {Position = UDim2.fromScale(0,0)}
	popupbutton.Visible = false
	Title.Delete.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)
	for _, ok in game:GetService("CoreGui"):GetChildren() do
		if gui.Name == ok.Name then
			if gui == ok then continue end
			ok:Destroy()
		end
	end
	local forpopupbutton = {Position = UDim2.fromScale(1.072,0.5),
		Rotation = 180
	}
	local tweenbacktable = {Position = originalpopuppos}
	local tweenbacktablebutton = {Position = originalbuttonpos,
		Rotation = -180
	}
	local popupanim = tweenService:Create(Popup,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),forpopup)
	local buttonanim = tweenService:Create(popupbutton,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),forpopupbutton)
	local backanim = tweenService:Create(Popup,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),tweenbacktable)
	local backanimbutton = tweenService:Create(popupbutton,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),tweenbacktablebutton)
	
	repeat task.wait() until Beanzanim.Status()
	Title.Delete.Visible = true
	FrameDrag:Enable()
	local selector = MainMenu.Selector
	local multi = 0.068
	function sendselector(thing,whereto)
		local tabla = {Position = whereto}
		local switch = tweenService:Create(thing,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),tabla)
		switch:Play()
		task.wait(0.2)
		switch:Destroy()
	end
	function toClipboard(txt)
		if everyClipboard then
			everyClipboard(tostring(txt))
		end
	end
	for i, button in ipairs(MainMenu.Buttons:GetChildren()) do
		if button:IsA("TextButton") then
			button.MouseButton1Up:Connect(function()
				if current == button.Name then return end
				current = button.Name
				local accpos = i-2
				local pos = UDim2.fromScale(0,multi*accpos)
				sendselector(selector,pos)
				for _, folder in MainFrameMenu:GetChildren() do
					if folder:IsA("Folder") then
						local has = false
						if folder:FindFirstChild("TextBox") then
							has = true
						end
					folder.Scroll.Visible = false
					if has then
					folder.TextBox.Visible = false
					end
					if current == folder.Name then
						folder.Scroll.Visible = true
						if has then
						folder.TextBox.Visible = true
						end
					end
					end
				end
			end)
		end
	end
	function changefocus(button:TextButton)
		selectedscript = button
		Popup.Title.Text = button:GetAttribute("Title")
		Popup.Description.Text = button:GetAttribute("Description")
		local scriptstatus = button:GetAttribute("Status")
		if scriptstatus == "Working" then
			Popup.Status.Text = scriptstatus
			Popup.Status.TextColor3 = Color3.fromRGB(0, 255, 0)
		elseif scriptstatus == "Not Working" then
			Popup.Status.Text = scriptstatus
			Popup.Status.TextColor3 = Color3.fromRGB(170,0,0)
	end
	end
	Popup.RunScript.MouseButton1Click:Connect(function()
		if selectedscript == nil then return end
		loadstring(game:HttpGet(selectedscript:GetAttribute("loadstring"), true))()
	end)
	Popup.CopyScript.MouseButton1Click:Connect(function()
		if selectedscript == nil then return end
		toClipboard(tostring("loadstring(game:HttpGet('"..selectedscript:GetAttribute("loadstring").."', true))()"))
	end)
	backanimbutton:GetPropertyChangedSignal("PlaybackState"):Connect(function(state)
		if backanimbutton.PlaybackState == Enum.PlaybackState.Completed then
			popupbutton.Rotation = 0
		end
	end)

		local scripttable = {
		["EmergencyHamburg"] = {
			Text = "Emergency Hamburg Script",
			Title = "Emergency Hamburg Script",
			Description = "this is the only one i couldnt crack ):",
			Loadstring = "https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/emergencyhamburg.lua", --old loadstring ):
			Status = "Working",
			
		},
		["MM2"] = {
			Text = "Murder Mystery 2",
			Title = "Murder Mystery 2",
			Description = "CRACKED BY @RIPLAGARDOZ ON DC",
			Loadstring = "https://pastebin.com/raw/62fNUnFZ", --NEW LOADSTRING
			Status = "Not Working",
		},
["UntitledBoxingGame"] = {
			Text = "Untitled Boxing Game Script",
			Title = "UBG Script",
			Description = "CRACKED BY @RIPLAGARDOZ ON DC",
			Loadstring = "https://pastebin.com/raw/AGTKmuch", --NEW LOADSTRING
			Status = "Working",
			
		}
	}
	for i,v in scripttable do
		local clone = gui.Placeholder:Clone()
		clone.Parent  = scriptsearch.Parent.Scroll
		clone.Name = i
		clone.Text = v.Text
		clone:SetAttribute("Description",v.Description)
		clone:SetAttribute("Title",v.Title)
		clone:SetAttribute("loadstring",v.Loadstring)
		clone:SetAttribute("Status",v.Status)
		clone.Visible = true
	end
	
	local tooltable = {}
	for i,v in tooltable do
		local clone = gui.Placeholder:Clone()
		clone.Parent  = toolssearch.Parent.Scroll
		clone.Name = i
		clone.Text = v.Text
		clone:SetAttribute("Description",v.Description)
		clone:SetAttribute("Title",v.Title)
		clone:SetAttribute("loadstring",v.Loadstring)
		clone:SetAttribute("Status",v.Status)
		clone.Visible = true
	end
	for _, button in scriptsearch.Parent.Scroll:GetChildren() do
		if button:IsA("TextButton") then
			button.MouseButton1Click:Connect(function()
				
				if selectedscript == button then return end
				popupbutton.Visible = true
				if popupanim.PlaybackState == Enum.PlaybackState.Playing or popupanim.PlaybackState == Enum.PlaybackState.Completed then
					local duration = 0.4
					local goto = {BackgroundColor3 = Color3.fromRGB(42, 70, 255),
						BackgroundTransparency = 0.4
					}
					local dontgotoplsicantnamestuff = {BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 0
					}
						local addbackgroundcolor = tweenService:Create(button,TweenInfo.new(duration,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),goto)
						local removebackgroundcolor = nil
						if coloredbutton ~= nil then
						removebackgroundcolor = tweenService:Create(coloredbutton,TweenInfo.new(duration,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),dontgotoplsicantnamestuff)
						end
						task.delay(duration,function()
							addbackgroundcolor:Destroy()
						if  coloredbutton ~= nil then
							if removebackgroundcolor then
							removebackgroundcolor:Destroy()
							end
						end
						end)
					coloredbutton = button
					addbackgroundcolor:Cancel()
					if  coloredbutton ~= nil then
						if removebackgroundcolor then
							removebackgroundcolor:Cancel()
						end
					end
					popupanim:Cancel()
					Popup.Position = originalpopuppos
					addbackgroundcolor:Play()
					if removebackgroundcolor then
						removebackgroundcolor:Play()
					end
					popupanim:Play()
					button.Rotation = 0
					buttonanim:Play()
					changefocus(button)
					else local duration = 0.4
					local goto = {BackgroundColor3 = Color3.fromRGB(42, 70, 255),
						BackgroundTransparency = 0.4
					}
					local dontgotoplsicantnamestuff = {BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 0
					}
					local addbackgroundcolor = tweenService:Create(button,TweenInfo.new(duration,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),goto)
					local removebackgroundcolor = tweenService:Create(coloredbutton,TweenInfo.new(duration,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),dontgotoplsicantnamestuff)
					task.delay(duration,function()
						addbackgroundcolor:Destroy()
						removebackgroundcolor:Destroy()
					end)
					coloredbutton = button
					popupanim:Play()
					buttonanim:Play()
					addbackgroundcolor:Play()
					if coloredbutton ~= nil then
						if removebackgroundcolor then
							removebackgroundcolor:Play()
						end
					end
					changefocus(button)
				end
			end)
		end
	end
	for _, button in toolssearch.Parent.Scroll:GetChildren() do
		if button:IsA("TextButton") then
			button.MouseButton1Click:Connect(function()
				if selectedscript == button then return end
				popupbutton.Visible = true
				if popupanim.PlaybackState == Enum.PlaybackState.Playing or popupanim.PlaybackState == Enum.PlaybackState.Completed then
					local duration = 0.4
					local goto = {BackgroundColor3 = Color3.fromRGB(42, 70, 255),
						BackgroundTransparency = 0.4
					}
					local dontgotoplsicantnamestuff = {BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 0
					}
					local addbackgroundcolor = tweenService:Create(button,TweenInfo.new(duration,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),goto)
					local removebackgroundcolor = nil
					if coloredbutton ~= nil then
						removebackgroundcolor = tweenService:Create(coloredbutton,TweenInfo.new(duration,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),dontgotoplsicantnamestuff)
					end
					task.delay(duration,function()
						addbackgroundcolor:Destroy()
						if  coloredbutton ~= nil then
							if removebackgroundcolor then
								removebackgroundcolor:Destroy()
							end
						end
					end)
					coloredbutton = button
					addbackgroundcolor:Cancel()
					if  coloredbutton ~= nil then
						if removebackgroundcolor then
							removebackgroundcolor:Cancel()
						end
					end
					popupanim:Cancel()
					Popup.Position = originalpopuppos
					addbackgroundcolor:Play()
					if removebackgroundcolor then
						removebackgroundcolor:Play()
					end
					popupanim:Play()
					button.Rotation = 0
					buttonanim:Play()
					changefocus(button)
				else local duration = 0.4
					local goto = {BackgroundColor3 = Color3.fromRGB(42, 70, 255),
						BackgroundTransparency = 0.4
					}
					local dontgotoplsicantnamestuff = {BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 0
					}
					local addbackgroundcolor = tweenService:Create(button,TweenInfo.new(duration,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),goto)
					local removebackgroundcolor = tweenService:Create(coloredbutton,TweenInfo.new(duration,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),dontgotoplsicantnamestuff)
					task.delay(duration,function()
						addbackgroundcolor:Destroy()
						removebackgroundcolor:Destroy()
					end)
					coloredbutton = button
					popupanim:Play()
					buttonanim:Play()
					addbackgroundcolor:Play()
					if coloredbutton ~= nil then
						if removebackgroundcolor then
							removebackgroundcolor:Play()
						end
					end
					changefocus(button)
				end
			end)
		end
	end
	popupbutton.MouseButton1Click:Connect(function()
		local dontgotoplsicantnamestuff = {BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0
		}
		backanim:Play()
		backanimbutton:Play()
		selectedscript = nil
		local removebackgroundcolor = tweenService:Create(coloredbutton,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),dontgotoplsicantnamestuff)
		removebackgroundcolor:Play()
		coloredbutton = nil
		task.wait(0.2)
		popupbutton.Visible = false
	end)
	
	scriptsearch:GetPropertyChangedSignal("Text"):Connect(function()
		local text = string.lower(scriptsearch.Text)
		for _, link in scriptsearch.Parent.Scroll:GetChildren() do
			if link:IsA("TextButton") then
				if string.find(string.lower(link.Text),text,1,true) then
					link.Visible = true
				else
					link.Visible = false
				end
			end
		end
	end)
	toolssearch:GetPropertyChangedSignal("Text"):Connect(function()
		local text = string.lower(toolssearch.Text)
		for _, link in toolssearch.Parent.Scroll:GetChildren() do
			if link:IsA("TextButton") then
				if string.find(string.lower(link.Text),text,1,true) then
					link.Visible = true
				else
					link.Visible = false
				end
			end
		end
	end)
	
	settingsfolder.Scroll.SkipButton.MouseButton1Click:Connect(function()
		if settingsfolder.Scroll.SkipButton.BackgroundTransparency == 0 then -- on
			writevariable(settingsfile,2,"false")
			settingsfolder.Scroll.SkipButton.BackgroundTransparency = 1
		else
			writevariable(settingsfile,2,"true")
			settingsfolder.Scroll.SkipButton.BackgroundTransparency =0
		end
	end)
end
task.spawn(SCRIPT_5d)

return UI["1"], require;