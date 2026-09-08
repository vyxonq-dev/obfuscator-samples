--========================
-- SERVICES
--========================
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--========================
-- ACCESS IDS
--========================
local allowedIds = {
	[1247981068]  = true,
	[4971827646]  = true,
	[1366799706]  = true,
	[8875263792]  = true,
	[2657344311]  = true,
	[530701231]   = true,
	[1119400070]  = true,
	[10284358952] = true,
    [10305665790] = true,
    [3749287431] = true,
    [8384197121] = true,
    [4187988480] = true,
    [4530125920] = true,
    [4946984979] = true
}

--========================
-- DISCORD AUTOCOPY
--========================
local discordLink = "https://discord.gg/Jk7rahYzmQ"

local copyBox = Instance.new("TextBox")
copyBox.Size = UDim2.new(0,1,0,1)
copyBox.TextTransparency = 1
copyBox.BackgroundTransparency = 1
copyBox.TextEditable = false
copyBox.ClearTextOnFocus = false
copyBox.Text = discordLink
copyBox.Parent = PlayerGui
copyBox:CaptureFocus()
copyBox.CursorPosition = #discordLink + 1
copyBox.SelectionStart = 1

--========================
-- NO ACCESS GUI
--========================
if not allowedIds[LocalPlayer.UserId] then
	local gui = Instance.new("ScreenGui", PlayerGui)
	gui.ResetOnSpawn = false

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0,360,0,180)
	frame.Position = UDim2.new(0.5,-180,0.5,-90)
	frame.BackgroundColor3 = Color3.fromRGB(25,25,35)
	Instance.new("UICorner",frame).CornerRadius = UDim.new(0,14)

	local txt = Instance.new("TextLabel",frame)
	txt.Size = UDim2.new(1,-20,1,-20)
	txt.Position = UDim2.new(0,10,0,10)
	txt.BackgroundTransparency = 1
	txt.TextWrapped = true
	txt.TextScaled = true
	txt.Font = Enum.Font.GothamBold
	txt.TextColor3 = Color3.new(1,1,1)
	txt.Text =
	"You don't have access to this script.\n\nGet it by joining the following Discord server:\n"..discordLink
	return
end

--========================
-- MAIN GUI
--========================
local gui = Instance.new("ScreenGui", PlayerGui)
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,240,0,430)
frame.Position = UDim2.new(0,50,0,50)
frame.BackgroundColor3 = Color3.fromRGB(30,30,40)
frame.BorderSizePixel = 0
Instance.new("UICorner",frame).CornerRadius = UDim.new(0,12)

--========================
-- DRAGGABLE
--========================
local dragging, dragStart, startPos
frame.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = i.Position
		startPos = frame.Position
	end
end)
UserInputService.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
UserInputService.InputChanged:Connect(function(i)
	if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
		local delta = i.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

--========================
-- TITLE
--========================
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "🚀 TROLL MENU"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)

--========================
-- BUTTON FACTORY
--========================
local function makeButton(text, y, color, callback)
	local b = Instance.new("TextButton", frame)
	b.Size = UDim2.new(0.9,0,0,35)
	b.Position = UDim2.new(0.05,0,0,y)
	b.Text = text
	b.TextScaled = true
	b.Font = Enum.Font.GothamBold
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = color
	Instance.new("UICorner",b).CornerRadius = UDim.new(0,8)
	b.MouseButton1Click:Connect(callback)
end

--========================
-- MARKETPLACE ACTIONS
--========================
makeButton("⏭ Skip Level",40,Color3.fromRGB(255,80,80),function()
	MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId,2667066831,true)
end)

makeButton("💀 Kill All",80,Color3.fromRGB(80,255,80),function()
	MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId,3336458992,true)
end)

makeButton("✨ Fling All",120,Color3.fromRGB(80,80,255),function()
	MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId,3378303882,true)
end)

makeButton("👤 Fling Player",160,Color3.fromRGB(220,60,60),function()
	MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId,2667076892,true)
end)

--========================
-- INFINITE YIELD BUTTON
--========================
makeButton("🧠 Infinite Yield",200,Color3.fromRGB(140,90,255),function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-yield-reborn-83505"))()
end)

--========================
-- VFLY BUTTON (CORRECT SCRIPT)
--========================
makeButton("✈️ VFly",240,Color3.fromRGB(90,200,255),function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-VFly-English-22651"))()
end)

--========================
-- FLING PLAYER INFO TEXT
--========================
local flingInfo = Instance.new("TextLabel", frame)
flingInfo.Size = UDim2.new(1,-10,0,45)
flingInfo.Position = UDim2.new(0,5,0,280)
flingInfo.BackgroundTransparency = 1
flingInfo.TextWrapped = true
flingInfo.TextSize = 11
flingInfo.Font = Enum.Font.Gotham
flingInfo.TextColor3 = Color3.fromRGB(230,200,120)
flingInfo.Text =
"You should open the Fling Player menu and press the button for the selected player. Then, without closing the purchase UI, you can press Fling Player."

--========================
-- CHAT INFO
--========================
local info = Instance.new("TextLabel", frame)
info.Size = UDim2.new(1,-10,0,45)
info.Position = UDim2.new(0,5,1,-50)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.TextSize = 12
info.Font = Enum.Font.Gotham
info.TextColor3 = Color3.fromRGB(200,200,200)
info.Text =
"You can also type the commands ;fling all, ;kill all and ;skip level in the chat for more realism"

--========================
-- CHAT COMMANDS (VISIBLE)
--========================
LocalPlayer.Chatted:Connect(function(msg)
	msg = msg:lower()
	if msg == ";skip level" then
		MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId,2667066831,true)
	elseif msg == ";kill all" then
		MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId,3336458992,true)
	elseif msg == ";fling all" then
		MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId,3378303882,true)
	end
end)