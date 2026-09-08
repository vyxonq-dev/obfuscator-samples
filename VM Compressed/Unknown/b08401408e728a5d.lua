-- Simple Script Loader GUI by ChatCPT & Raddy-edits
-- Works with most executors

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DoorsScriptLoader"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.35, 0.5)
frame.Position = UDim2.fromScale(0.325, 0.25)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0.12,0)
title.Text = "]---[DOORS Script Loader]---["
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local layout = Instance.new("UIListLayout", frame)
layout.Padding = UDim.new(0,10)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.Padding = UDim.new(0,10)

title.LayoutOrder = 0

local function createButton(text, url)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.9,0,0.12,0)
	btn.Text = text
	btn.Font = Enum.Font.Gotham
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	btn.BorderSizePixel = 0

	local c = Instance.new("UICorner", btn)
	c.CornerRadius = UDim.new(0,8)

	btn.MouseButton1Click:Connect(function()
		pcall(function()
			loadstring(game:HttpGet(url))()
		end)
	end)

	return btn
end

-- Buttons
createButton("[Hardcore Mode V4]",
"https://rawscripts.net/raw/Universal-Script-Hardcore-V4-Doors-28854").Parent = frame

createButton("[Hardcore Mode Fixed]",
"https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Hardcore%20v4%20recreate/main%20code").Parent = frame

createButton("[Floor 2 Ambient]",
"https://gist.githubusercontent.com/Raddy-edits/2467870ed944ec16f1b92d9917527c76/raw/4d14095bb0cb656d2693e0ec34e7fe988f4fa5ee/Floor-2-Ambient-recode").Parent = frame

createButton("[Impossible Mode]",
"https://raw.githubusercontent.com/Ukazix/impossible-mode/main/Protected_79.lua.txt").Parent = frame

-- Close button
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0.9,0,0.1,0)
close.Text = "Close GUI"
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.TextColor3 = Color3.new(1,1,1)
close.BackgroundColor3 = Color3.fromRGB(120,30,30)
close.BorderSizePixel = 0
Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

wait(0.6)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("[CREDITS]: Noonie, Localplayerr (or Dripocapy) and Oof (for the scripts)",true)
wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("GUI made by ChatCPT. Captions made by Raddy_edits.",true)
wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Thank you for using this script!1!",true)