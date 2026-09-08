-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local topbar = Instance.new("Frame")
local main = Instance.new("Frame")
local _1 = Instance.new("TextButton")
local _2 = Instance.new("TextButton")
local info = Instance.new("TextLabel")
local title = Instance.new("TextLabel")
local close = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

topbar.Name = "topbar"
topbar.Parent = ScreenGui
topbar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
topbar.BorderSizePixel = 0
topbar.Position = UDim2.new(0.492125988, 0, 0.55447942, 0)
topbar.Size = UDim2.new(0, 221, 0, 19)

main.Name = "main"
main.Parent = topbar
main.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
main.BackgroundTransparency = 0.250
main.BorderColor3 = Color3.fromRGB(0, 0, 0)
main.BorderSizePixel = 0
main.Position = UDim2.new(0, 0, 1, 0)
main.Size = UDim2.new(0, 221, 0, 99)

_1.Name = "1"
_1.Parent = main
_1.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
_1.BorderSizePixel = 0
_1.Position = UDim2.new(0.0271493215, 0, 0.0621525943, 0)
_1.Size = UDim2.new(0, 208, 0, 26)
_1.Font = Enum.Font.SourceSans
_1.Text = "1. Animator Remover"
_1.TextColor3 = Color3.fromRGB(231, 231, 231)
_1.TextSize = 14.000
_1.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/hdYTy0Pu"))()
end)


_2.Name = "2"
_2.Parent = main
_2.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
_2.BorderSizePixel = 0
_2.Position = UDim2.new(0.0271493215, 0, 0.366282463, 0)
_2.Size = UDim2.new(0, 208, 0, 26)
_2.Font = Enum.Font.SourceSans
_2.Text = "2. Reanimate Wally West"
_2.TextColor3 = Color3.fromRGB(231, 231, 231)
_2.TextSize = 14.000
_2.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/prz7ufK5"))()
end)

info.Name = "info"
info.Parent = main
info.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
info.BorderColor3 = Color3.fromRGB(0, 0, 0)
info.BorderSizePixel = 0
info.Position = UDim2.new(-0.00038830511, 0, 0.692308843, 0)
info.Size = UDim2.new(0, 221, 0, 62)
info.Font = Enum.Font.SourceSans
info.Text = "Use any roblox emote, press anim remover and then press reanimate Wally West!  Emote Animation Credits: @7x_pokics, @lockj, @BenereV2 And Gang."
info.TextColor3 = Color3.fromRGB(225, 225, 225)
info.TextSize = 14.000
info.TextWrapped = true
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextYAlignment = Enum.TextYAlignment.Top

title.Name = "title"
title.Parent = topbar
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Position = UDim2.new(-0.00038830511, 0, 0, 0)
title.Size = UDim2.new(0, 151, 0, 19)
title.Font = Enum.Font.Michroma
title.Text = "Wally West FE  - V1"
title.TextColor3 = Color3.fromRGB(217, 210, 1)
title.TextSize = 14.000

close.Name = "close"
close.Parent = topbar
close.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
close.BorderColor3 = Color3.fromRGB(0, 0, 0)
close.BorderSizePixel = 0
close.Position = UDim2.new(0.873303175, 0, 0, 0)
close.Size = UDim2.new(0, 27, 0, 19)
close.Font = Enum.Font.SourceSans
close.Text = "X"
close.TextColor3 = Color3.fromRGB(232, 232, 232)
close.TextSize = 14.000

-- Scripts:

local function IYTOUZG_fake_script() -- topbar.Dragify 
	local script = Instance.new('LocalScript', topbar)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(IYTOUZG_fake_script)()
local function RQICRC_fake_script() -- close.LocalScript 
	local script = Instance.new('LocalScript', close)

	local button = script.Parent
	local screenGui = button:FindFirstAncestorOfClass("ScreenGui")
	
	button.MouseButton1Click:Connect(function()
		if screenGui then
			screenGui:Destroy()
		end
	end)
	
end
coroutine.wrap(RQICRC_fake_script)()
