local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local plr = Players.LocalPlayer

local function getHumanoid()
	local char = plr.Character or plr.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end

local zoomOn = false
local zoomBtn

local function toggleZoom()
	zoomOn = not zoomOn
	if zoomOn then
		plr.CameraMaxZoomDistance = math.huge
		plr.CameraMinZoomDistance = 0.5
		if zoomBtn then zoomBtn.Text = "INF ZOOM : ON" end
	else
		plr.CameraMaxZoomDistance = 20
		plr.CameraMinZoomDistance = 0.5
		if zoomBtn then zoomBtn.Text = "INF ZOOM : OFF" end
	end
end

local hitboxOn = false
local hitboxLabel

local function toggleHitbox()
	hitboxOn = not hitboxOn
	if hitboxLabel then
		hitboxLabel.Text = hitboxOn and "HITBOX : ON" or "HITBOX : OFF"
	end
	if hitboxOn then
		pcall(function()
			loadstring(game:HttpGet("https://pastefy.app/ItfO0tdg/raw"))()
		end)
	end
end

local PATH_FOLDER_NAME = "GojoPath"
local PATH_LENGTH = 4500
local STEP = 20
local WALL_HEIGHT = 15

local PATH_POINTS = {
	{pos = Vector3.new(149.62,3.19,135.54), side = "RIGHT"},
	{pos = Vector3.new(151.18,3.19,-137.11), side = "LEFT"}
}

local pathEnabled = false

local function removePath()
	local f = workspace:FindFirstChild(PATH_FOLDER_NAME)
	if f then f:Destroy() end
end

local function createPathAt(data)
	local folder = workspace:FindFirstChild(PATH_FOLDER_NAME) or Instance.new("Folder", workspace)
	folder.Name = PATH_FOLDER_NAME

	for i = STEP/2, PATH_LENGTH, STEP do
		local zOffset = (data.side == "LEFT") and 1.5 or -1.5

		local floor = Instance.new("Part")
		floor.Anchored = true
		floor.Size = Vector3.new(STEP+0.5,1,12.5)
		floor.Color = Color3.fromRGB(170,0,255)
		floor.Position = Vector3.new(data.pos.X+i, data.pos.Y-3, data.pos.Z+zOffset)
		floor.Parent = folder

		local wall = Instance.new("Part")
		wall.Anchored = true
		wall.Size = Vector3.new(STEP+0.5, WALL_HEIGHT, 1)
		wall.Color = floor.Color
		wall.Position = floor.Position + Vector3.new(0, WALL_HEIGHT/2, (data.side=="LEFT") and -5.5 or 5.5)
		wall.Parent = folder
	end
end

local function clearRightWalls()
	for _,obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("Folder") and obj.Name == "RightWalls" then
			pcall(function() obj:Destroy() end)
		end
	end
end

workspace.DescendantAdded:Connect(function(obj)
	if obj:IsA("Folder") and obj.Name == "RightWalls" then
		task.wait()
		pcall(function() obj:Destroy() end)
	end
end)

local VIP_ACTIVE = false
local VIP_TARGET_NAME = "VIPWalls"

local function deleteVIP()
	for _,v in ipairs(workspace:GetDescendants()) do
		if v.Name == VIP_TARGET_NAME then
			pcall(function() v:Destroy() end)
		end
	end
end

workspace.DescendantAdded:Connect(function(v)
	if VIP_ACTIVE and v.Name == VIP_TARGET_NAME then
		task.wait()
		pcall(function() v:Destroy() end)
	end
end)

local function togglePath()
	if not pathEnabled then
		pathEnabled = true
		removePath()
		deleteVIP()
		clearRightWalls()
		for _,d in ipairs(PATH_POINTS) do
			createPathAt(d)
		end
	else
		pathEnabled = false
		removePath()
	end
end

local START_POS = Vector3.new(151.90,3.19,-135.30)
local END_POS   = Vector3.new(2438.78,3.24,-135.16)
local SPEED = 450

local function startTween()
	local char = plr.Character or plr.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")
	deleteVIP()
	clearRightWalls()
	hrp.CFrame = CFrame.new(START_POS)

	local duration = (END_POS - START_POS).Magnitude / SPEED
	TweenService:Create(
		hrp,
		TweenInfo.new(duration, Enum.EasingStyle.Linear),
		{CFrame = CFrame.new(END_POS)}
	):Play()
end

local noclip = false
local noclipConn

local function toggleNoclip(label)
	noclip = not noclip
	if noclipConn then noclipConn:Disconnect() noclipConn = nil end

	if noclip then
		label.Text = "NOCLIP : ON"
		noclipConn = RunService.Stepped:Connect(function()
			local c = plr.Character
			if not c then return end
			for _,v in ipairs(c:GetChildren()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end)
	else
		label.Text = "NOCLIP : OFF"
	end
end

local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.ResetOnSpawn = false
gui.Name = "GojoHub"

local bg = Instance.new("ImageLabel", gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundTransparency = 1
bg.Image = "rbxassetid://15288176369"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,260,0,260)
frame.Position = UDim2.new(0.05,0,0.35,0)
frame.BackgroundColor3 = Color3.fromRGB(30,0,60)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "GOJO HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(200,100,255)

local function tab(txt,x)
	local b = Instance.new("TextButton", frame)
	b.Size = UDim2.new(0.3,0,0,24)
	b.Position = UDim2.new(x,0,0.18,0)
	b.Text = txt
	b.Font = Enum.Font.GothamBold
	b.TextSize = 13
	b.BackgroundColor3 = Color3.fromRGB(120,0,200)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
	return b
end

local mainTab = tab("MAIN",0.05)
local infoTab = tab("INFO",0.35)
local playerTab = tab("PLAYER",0.65)

local function page()
	local s = Instance.new("ScrollingFrame", frame)
	s.Size = UDim2.new(1,-20,0,170)
	s.Position = UDim2.new(0,10,0.35,0)
	s.CanvasSize = UDim2.new(0,0,0,340)
	s.BackgroundTransparency = 1
	s.Visible = false
	return s
end

local mainFrame = page()
local infoFrame = page()
local playerFrame = page()
mainFrame.Visible = true

local function button(parent,text,y,cb)
	local b = Instance.new("TextButton", parent)
	b.Size = UDim2.new(1,0,0,36)
	b.Position = UDim2.new(0,0,0,y)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.BackgroundColor3 = Color3.fromRGB(120,0,200)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,12)
	b.MouseButton1Click:Connect(cb)
	return b
end

button(mainFrame,"PATH BUILDER",0,togglePath)
button(mainFrame,"VIP STRAIGHT MOVE",42,startTween)
button(mainFrame,"VIP WALL REMOVER",84,function()
	VIP_ACTIVE = true
	deleteVIP()
end)

hitboxLabel = button(playerFrame,"HITBOX : OFF",0,toggleHitbox)

local noclipBtn = button(playerFrame,"NOCLIP : OFF",42,function() end)
noclipBtn.MouseButton1Click:Connect(function()
	toggleNoclip(noclipBtn)
end)

zoomBtn = button(playerFrame,"INF ZOOM : OFF",84,toggleZoom)

local function inputBox(y,titleText,apply)
	local label = Instance.new("TextLabel", playerFrame)
	label.Size = UDim2.new(1,0,0,18)
	label.Position = UDim2.new(0,0,0,y)
	label.BackgroundTransparency = 1
	label.Text = titleText
	label.Font = Enum.Font.GothamBold
	label.TextSize = 13
	label.TextColor3 = Color3.fromRGB(200,160,255)

	local box = Instance.new("TextBox", playerFrame)
	box.Size = UDim2.new(1,0,0,32)
	box.Position = UDim2.new(0,0,0,y+18)
	box.PlaceholderText = titleText
	box.Font = Enum.Font.Gotham
	box.TextSize = 14
	box.BackgroundColor3 = Color3.fromRGB(60,0,120)
	box.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)

	box.FocusLost:Connect(function()
		local v = tonumber(box.Text)
		if v then apply(v) end
	end)
end

inputBox(130,"WALK SPEED",function(v) getHumanoid().WalkSpeed = v end)
inputBox(186,"JUMP POWER",function(v)
	local h = getHumanoid()
	h.UseJumpPower = true
	h.JumpPower = v
end)
inputBox(242,"GRAVITY",function(v) workspace.Gravity = v end)

local infoText = Instance.new("TextLabel", infoFrame)
infoText.Size = UDim2.new(1,0,0,120)
infoText.BackgroundTransparency = 1
infoText.TextWrapped = true
infoText.Text = "MADE BY GOJO\nGOJO HUB 1.0\nEscape Tsunami For Brainrot"
infoText.Font = Enum.Font.GothamBold
infoText.TextSize = 15
infoText.TextColor3 = Color3.fromRGB(220,180,255)

local function show(f)
	mainFrame.Visible = false
	infoFrame.Visible = false
	playerFrame.Visible = false
	f.Visible = true
end

mainTab.MouseButton1Click:Connect(function() show(mainFrame) end)
infoTab.MouseButton1Click:Connect(function() show(infoFrame) end)
playerTab.MouseButton1Click:Connect(function() show(playerFrame) end)
