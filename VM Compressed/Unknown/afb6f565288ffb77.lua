local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "inc0mu gui reborn LOL i am back",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "inc0mu gui LOL",
   LoadingSubtitle = "by the own inc0mu",
   ShowText = "inc0mu gui", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "G", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "inc0mu"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Goofy ahh key",
      Subtitle = "yeah get the key",
      Note = "the key is inc0mu bro stop being a skid", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"inc0mu"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Welcome bro", nil) -- Title, Image
local Section = MainTab:CreateSection("hell yeah")

Rayfield:Notify({
   Title = "YOOO U EXECUTED MY SCRIPT WSP",
   Content = "YAAAAAAY",
   Duration = 6.5,
   Image = nil,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
-- Make sure to copy aLL of this!

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local INFJUMP = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui

main.Name = "main"
main.Parent = ScreenGui
main.Active = true
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.119258665, 0, 0, 0)
main.Size = UDim2.new(0, 146, 0, 28)
main.Active = true
main.Draggable = false

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 146, 0, 28)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "Misc"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 17.000
TextLabel.TextWrapped = true

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 1, 0)
Frame.Size = UDim2.new(0, 146, 0, 61)

INFJUMP.Name = "INFJUMP"
INFJUMP.Parent = main
INFJUMP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
INFJUMP.BorderSizePixel = 0
INFJUMP.Position = UDim2.new(0.794520497, 0, 1.6785717, 0)
INFJUMP.Size = UDim2.new(0, 21, 0, 21)
INFJUMP.Font = Enum.Font.SourceSans
INFJUMP.Text = ""
INFJUMP.TextColor3 = Color3.fromRGB(0, 0, 0)
INFJUMP.TextSize = 14.000
INFJUMP.MouseButton1Down:connect(function()
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';
 
_G.JumpHeight = 50;
 
function Action(Object, Function) if Object ~= nil then Function(Object); end end
 
UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end)

TextLabel_2.Parent = main
TextLabel_2.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.0547945201, 0, 1.57142854, 0)
TextLabel_2.Size = UDim2.new(0, 94, 0, 28)
TextLabel_2.Font = Enum.Font.SciFi
TextLabel_2.Text = "Inf jump"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 17.000
TextLabel_2.TextWrapped = true

-- Scripts:

local function TKDWQ_fake_script() -- INFJUMP.LocalScript 
local script = Instance.new('LocalScript', INFJUMP)

function zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end

counter = 0

while wait(0.1)do
script.Parent.BackgroundColor3 = Color3.fromHSV(zigzag(counter),1,1)
 
counter = counter + 0.01
end
end
coroutine.wrap(TKDWQ_fake_script)()
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {0, 200},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 1,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})
    
local Clans = Window:CreateTab("c00lgui clan", nil) -- Title, Image

local Button = Clans:CreateButton({
   Name = "c00lclan",
   Callback = function()
        --Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local PhysicsService = game:GetService("PhysicsService")
local Character       = Player.Character or Player.CharacterAdded:Wait()
local Humanoid        = Character:WaitForChild("Humanoid")
local HRP             = Character:WaitForChild("HumanoidRootPart")
local Mouse           = Player:GetMouse()
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")
local Debris = game:GetService("Debris")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local player = Player

local PlaceId = game.PlaceId
local JobId = game.JobId
--settings
local infjump = false
local invisRunning = false
local noclipOn = false
local noclipConn
local hoverHeight
local bindFrame, bindConn, waitingBindFunction
local customBinds = {}
local infJumpEnabled = false
local infJumpConnection = nil
local espOn = false
local spinOn = false
local spinBAV, lockBP
local savedCFrame
local invisRunning = false
local InvisibleCharacter = nil
local OriginalCharacter = nil
local voidConn = nil
local flyingEnabled = false
local invisRunning = false
local flyBG, flyBV, flyConn
local ray = workspace.CurrentCamera:ScreenPointToRay(Mouse.X, Mouse.Y)
local hit, pos = workspace:FindPartOnRay(ray, Character)
--GUI settings
local GUI_WIDTH     = 400
local GUI_HEIGHT    = 320
local TITLE_HEIGHT  = 30
local NAV_HEIGHT    = 30
local FOOTER_HEIGHT = 30
local GRID_PADDING  = 4
local GRID_COLUMNS  = 4

math.randomseed(os.time())
local character_set = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

local string_sub = string.sub
local math_random = math.random
local table_concat = table.concat
local character_set_amount = #character_set
local number_one = 1
local default_length = 10



local function generate_string(length)
	local random_string = {}

	for int = number_one, length or default_length do
		local random_number = math_random(number_one, character_set_amount)
		local character = string_sub(character_set, random_number, random_number)

		random_string[#random_string + number_one] = character
	end

	return table_concat(random_string)
end
-- Function manager with descriptions
local FunctionManager = {
	CategorizedFunctions = { All = {} },
	Categories          = { "All" },
	CurrentCategoryIndex= 1,
	Descriptions        = {},
	ISFE = {},
	OnFunctionAdded     = Instance.new("BindableEvent"),
}

function FunctionManager:register(name, callback, category, description, FE)
	category = category or "General"
	if not self.CategorizedFunctions[category] then
		self.CategorizedFunctions[category] = {}
		table.insert(self.Categories, category)
	end
	self.CategorizedFunctions[category][name] = callback
	self.CategorizedFunctions.All[name]        = callback
	self.Descriptions[name]                    = description or ""
	self.ISFE[name]                    = FE or "yes"
	if description == "NOT FE" then
		self.ISFE[name] = "no"
	end
	self.OnFunctionAdded:Fire(category, name, callback)
	self.OnFunctionAdded:Fire("All",      name, callback)
	
end

function FunctionManager:getCurrentCategory()
	return self.Categories[self.CurrentCategoryIndex]
end

function FunctionManager:cycleCategory()
	self.CurrentCategoryIndex = self.CurrentCategoryIndex % #self.Categories + 1
	return self:getCurrentCategory()
end



local screenGui = Instance.new("ScreenGui")
screenGui.Name        = generate_string(math_random(1, 10))
local die = screenGui.Name
screenGui.ResetOnSpawn= false
screenGui.Parent      = PlayerGui
local notificationContainer = Instance.new("Frame")
notificationContainer.Name = "NotificationContainer"
notificationContainer.Size = UDim2.new(1, 0, 1, 0)
notificationContainer.Position = UDim2.new(0, 0, 0, 0)
notificationContainer.BackgroundTransparency = 1
notificationContainer.ZIndex = 100
notificationContainer.Parent = screenGui
local function Notify(text, title, duration)
	duration = duration or 4

	local frame = Instance.new("Frame")
	frame.AnchorPoint = Vector2.new(1, 1)
	frame.Size = UDim2.new(0, 300, 0, 70)
	frame.Position = UDim2.new(1, 320, 1, -10)
	frame.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
	frame.BackgroundTransparency = 0
	frame.BorderSizePixel = 0
	frame.ZIndex = 200
	frame.Parent = notificationContainer

	local titleLabel = Instance.new("TextLabel")
	titleLabel.BackgroundTransparency = 1
	titleLabel.Size = UDim2.new(1, -10, 0, 24)
	titleLabel.Position = UDim2.new(0, 5, 0, 4)
	titleLabel.Font = Enum.Font.SourceSansBold
	titleLabel.Text = title or "Notice"
	titleLabel.TextColor3 = Color3.new(1, 1, 1)
	titleLabel.TextSize = 18
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.ZIndex = 201
	titleLabel.Parent = frame

	local bodyLabel = Instance.new("TextLabel")
	bodyLabel.BackgroundTransparency = 1
	bodyLabel.Size = UDim2.new(1, -10, 1, -30)
	bodyLabel.Position = UDim2.new(0, 5, 0, 28)
	bodyLabel.Font = Enum.Font.SourceSans
	bodyLabel.Text = text or ""
	bodyLabel.TextColor3 = Color3.new(1, 1, 1)
	bodyLabel.TextSize = 14
	bodyLabel.TextWrapped = true
	bodyLabel.TextXAlignment = Enum.TextXAlignment.Left
	bodyLabel.ZIndex = 201
	bodyLabel.Parent = frame

	task.defer(function()
		local slideIn = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(1, -10, 1, -10)
		})
		slideIn:Play()
	end)


	task.delay(duration, function()
		local fadeOut = TweenService:Create(frame, TweenInfo.new(0.3), {
			BackgroundTransparency = 1,
			Position = UDim2.new(1, 320, 1, -10)
		})
		local titleFade = TweenService:Create(titleLabel, TweenInfo.new(0.3), {TextTransparency = 1})
		local bodyFade = TweenService:Create(bodyLabel, TweenInfo.new(0.3), {TextTransparency = 1})

		fadeOut:Play()
		titleFade:Play()
		bodyFade:Play()

		fadeOut.Completed:Wait()
		frame:Destroy()
	end)
end




local notificationLayout = Instance.new("UIListLayout")
notificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
notificationLayout.Padding = UDim.new(0, 6)
notificationLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
notificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
notificationLayout.Parent = notificationContainer
Notify("Welcome to C00lClan!", "Have fun!", 3)
-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name            = generate_string(math_random(1, 10))
mainFrame.Size            = UDim2.new(0, GUI_WIDTH, 0, GUI_HEIGHT)
mainFrame.Position        = UDim2.new(0.5, -GUI_WIDTH/2, 0.5, -GUI_HEIGHT/2)
mainFrame.BackgroundColor3= Color3.fromRGB(25, 5, 5)
mainFrame.BorderSizePixel = 0
mainFrame.Parent          = screenGui

-- Tooltip
local tooltip = Instance.new("TextLabel", screenGui)
tooltip.Name               = generate_string(math_random(1, 10))
tooltip.Size               = UDim2.new(0, 200, 0, 40)
tooltip.BackgroundColor3   = Color3.fromRGB(30,30,30)
tooltip.BorderSizePixel    = 0
tooltip.Visible            = false
tooltip.ZIndex             = 100
tooltip.ClipsDescendants   = false
tooltip.TextColor3 = Color3.fromRGB(255, 255, 255)
tooltip.TextWrapped = true
-- Title bar
local titleBar = Instance.new("Frame", mainFrame)
titleBar.Name             = generate_string(math_random(1, 10))
titleBar.Size             = UDim2.new(1,0,0,TITLE_HEIGHT)
titleBar.BackgroundColor3 = Color3.fromRGB(60,0,0)
titleBar.BorderSizePixel  = 0

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size           = UDim2.new(1,-60,1,0)
titleLabel.Position       = UDim2.new(0,4,0,0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text           = "C00LCLAN V1"
titleLabel.Font           = Enum.Font.SourceSansBold
titleLabel.TextSize       = 18
titleLabel.TextColor3     = Color3.new(1,1,1)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Name           = generate_string(math_random(1, 10))

local minBtn = Instance.new("TextButton", titleBar)
minBtn.Name               = generate_string(math_random(1, 10))
minBtn.Size               = UDim2.new(0,30,1,0)
minBtn.Position           = UDim2.new(1,-30,0,0)
minBtn.Text               = "_"
minBtn.Font               = Enum.Font.SourceSansBold
minBtn.TextSize           = 18
minBtn.TextColor3         = Color3.new(1,1,1)
minBtn.BackgroundColor3   = Color3.fromRGB(80,10,10)
minBtn.BorderSizePixel    = 0

-- Drag logic
local dragging, dragInput, dragStart, startPos = false, nil
local function updateDrag(input)
	local delta = input.Position - dragStart
	mainFrame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
end
titleBar.InputBegan:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 then
		dragging, dragStart, startPos = true, i.Position, mainFrame.Position
		i.Changed:Connect(function()
			if i.UserInputState==Enum.UserInputState.End then dragging=false end
		end)
	end
end)
titleBar.InputChanged:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseMovement then dragInput=i end
end)
UserInputService.InputChanged:Connect(function(i)
	if i==dragInput and dragging then updateDrag(i) end
end)

-- Category nav
local catNav = Instance.new("Frame", mainFrame)
catNav.Name               = generate_string(math_random(1, 10))
catNav.Size               = UDim2.new(1,0,0,NAV_HEIGHT)
catNav.Position           = UDim2.new(0,0,0,TITLE_HEIGHT)
catNav.BackgroundTransparency = 1

local leftCat = Instance.new("TextButton", catNav)
leftCat.Size              = UDim2.new(0,50,1,0)
leftCat.Text              = "<"
leftCat.Font              = Enum.Font.SourceSansBold
leftCat.TextSize          = 24
leftCat.TextColor3        = Color3.new(1,1,1)
leftCat.BackgroundColor3  = Color3.fromRGB(100,0,0)
leftCat.BorderSizePixel   = 0
leftCat.Name              = generate_string(math_random(1, 10))
local catLabel = Instance.new("TextLabel", catNav)
catLabel.Size             = UDim2.new(1,-100,1,0)
catLabel.Position         = UDim2.new(0,50,0,0)
catLabel.BackgroundTransparency = 1
catLabel.Text             = "All"
catLabel.Font             = Enum.Font.SourceSansBold
catLabel.TextSize         = 18
catLabel.TextColor3       = Color3.new(1,1,1)
catNav.Name               = generate_string(math_random(1, 10))
local rightCat = leftCat:Clone()
rightCat.Parent           = catNav
rightCat.Position         = UDim2.new(1,-50,0,0)
rightCat.Text             = ">"
rightCat.Name = generate_string(math_random(1, 10))

-- Grid
local gridFrame = Instance.new("ScrollingFrame", mainFrame)
gridFrame.Name            = generate_string(math_random(1, 10))
gridFrame.ClipsDescendants= true
gridFrame.Size            = UDim2.new(1,-2*GRID_PADDING,0,GUI_HEIGHT-TITLE_HEIGHT-NAV_HEIGHT-FOOTER_HEIGHT-2*GRID_PADDING)
gridFrame.Position        = UDim2.new(0,GRID_PADDING,0,TITLE_HEIGHT+NAV_HEIGHT+GRID_PADDING)
gridFrame.BackgroundTransparency = 1

local gridLayout = Instance.new("UIGridLayout", gridFrame)
gridLayout.Name           = generate_string(math_random(1, 10))
gridLayout.CellSize       = UDim2.new(0,(GUI_WIDTH-2*GRID_PADDING-(GRID_COLUMNS-1)*GRID_PADDING)/GRID_COLUMNS,0,40)
gridLayout.CellPadding    = UDim2.new(0,GRID_PADDING,0,GRID_PADDING)
gridLayout.SortOrder      = Enum.SortOrder.LayoutOrder

-- Footer
local footer = Instance.new("Frame", mainFrame)
footer.Name               = generate_string(math_random(1, 10))
footer.Size               = UDim2.new(1,0,0,FOOTER_HEIGHT)
footer.Position           = UDim2.new(0,0,1,-FOOTER_HEIGHT)
footer.BackgroundTransparency = 1

local closeBtn = Instance.new("TextButton", footer)
closeBtn.Size             = UDim2.new(1,0,1,0)
closeBtn.Text             = "Close"
closeBtn.Font             = Enum.Font.SourceSansBold
closeBtn.TextSize         = 18
closeBtn.TextColor3       = Color3.new(1,1,1)
closeBtn.BackgroundColor3 = Color3.fromRGB(100,0,0)
closeBtn.BorderSizePixel  = 0
closeBtn.Name             = generate_string(math_random(1, 10))
-- Minimize toggle
local minimized = false
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized == true then
		mainFrame.BackgroundTransparency = 1
	else
		mainFrame.BackgroundTransparency = 0
	end
	gridFrame.Visible     = not minimized
	catNav.Visible        = not minimized
	footer.Visible        = not minimized
	minBtn.Text           = minimized and "◻" or "_"
end)
local function NotifyERROR(text)
	Notify(text, "ERROR", 3)
end
-- Build the grid and tooltips
local function updateGrid()
	for _, c in ipairs(gridFrame:GetChildren()) do
		if c:IsA("TextButton") then c:Destroy() end
	end
	local cat = FunctionManager:getCurrentCategory()
	catLabel.Text = cat

	for name, cb in pairs(FunctionManager.CategorizedFunctions[cat]) do
		local btn = Instance.new("TextButton")
		local isFE = FunctionManager.ISFE[name]
		btn.Size             = UDim2.new(1,0,0,40)
		btn.BackgroundColor3 = Color3.fromRGB(70,10,10)
		btn.BorderSizePixel  = 0
		btn.Font             = Enum.Font.SourceSansBold
		btn.TextSize         = 16
		btn.TextColor3       = Color3.new(1,1,1)
		btn.Text             = name
		btn.TextWrapped      = true
		btn.Parent           = gridFrame
		btn.Name             = generate_string(math_random(1, 10))
		if isFE == "no" then
			btn.BackgroundColor3 = Color3.fromRGB(72, 100, 87)
		end
		-- tooltip
		local desc = FunctionManager.Descriptions[name]
		
		btn.MouseMoved:Connect(function()
			if desc ~= "" and desc ~= nil then
				tooltip.Text     = desc
				tooltip.Position = UDim2.new(0,Mouse.X,0,Mouse.Y - tooltip.Size.Y.Offset - 4)
				tooltip.Visible = true
			end
		end)
		btn.MouseLeave:Connect(function() tooltip.Visible = false end)

		btn.MouseButton1Click:Connect(function()
			pcall(cb)
		end)
	end
end
local logo = Instance.new("ImageLabel")
logo.Name                 = generate_string(math_random(1, 10))
logo.BackgroundTransparency = 1
logo.Size                 = UDim2.new(1, 0, 0, 100)
logo.Position             = UDim2.new(0, -50, 0, -100)
logo.Image                = "rbxassetid://87486058304609"
logo.ScaleType            = Enum.ScaleType.Fit              
logo.Parent               = mainFrame
-- nav buttons
leftCat.MouseButton1Click:Connect(function()
	FunctionManager.CurrentCategoryIndex = (FunctionManager.CurrentCategoryIndex - 2) % #FunctionManager.Categories + 1
	updateGrid()
end)
rightCat.MouseButton1Click:Connect(function()
	FunctionManager:cycleCategory()
	updateGrid()
end)
closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)
FunctionManager.OnFunctionAdded.Event:Connect(updateGrid)



-- Initialize
updateGrid()

FunctionManager:register("Decal Spam", function()
	local decalID = 8408806737
	local function exPro(root)
		for _, v in pairs(root:GetChildren()) do
			if v:IsA("Decal") and v.Texture ~= "http://www.roblox.com/asset/?id="..decalID then
				v.Parent = nil
			elseif v:IsA("BasePart") then
				v.Material = "Plastic"
				v.Transparency = 0
				local One = Instance.new("Decal", v)
				local Two = Instance.new("Decal", v)
				local Three = Instance.new("Decal", v)
				local Four = Instance.new("Decal", v)
				local Five = Instance.new("Decal", v)
				local Six = Instance.new("Decal", v)
				One.Texture = "http://www.roblox.com/asset/?id="..decalID
				Two.Texture = "http://www.roblox.com/asset/?id="..decalID
				Three.Texture = "http://www.roblox.com/asset/?id="..decalID
				Four.Texture = "http://www.roblox.com/asset/?id="..decalID
				Five.Texture = "http://www.roblox.com/asset/?id="..decalID
				Six.Texture = "http://www.roblox.com/asset/?id="..decalID
				One.Face = "Front"
				Two.Face = "Back"
				Three.Face = "Right"
				Four.Face = "Left"
				Five.Face = "Top"
				Six.Face = "Bottom"
			end
			exPro(v)
		end
	end
	local function asdf(root)
		for _, v in pairs(root:GetChildren()) do
			asdf(v)
		end
	end
	exPro(game.Workspace)
	asdf(game.Workspace)

	local s = Instance.new("Sky")
	s.Name = "Sky"
	s.Parent = game.Lighting
	local skyboxID = 8408806737
	s.SkyboxBk = "http://www.roblox.com/asset/?id="..skyboxID
	s.SkyboxDn = "http://www.roblox.com/asset/?id="..skyboxID
	s.SkyboxFt = "http://www.roblox.com/asset/?id="..skyboxID
	s.SkyboxLf = "http://www.roblox.com/asset/?id="..skyboxID
	s.SkyboxRt = "http://www.roblox.com/asset/?id="..skyboxID
	s.SkyboxUp = "http://www.roblox.com/asset/?id="..skyboxID
	game.Lighting.TimeOfDay = 12

	for i, v in pairs(game.Players:GetChildren()) do
		local emit = Instance.new("ParticleEmitter")
		emit.Parent = v.Character.Torso
		emit.Texture = "http://www.roblox.com/asset/?id=8408806737"
		emit.VelocitySpread = 20
	end
	for i, v in pairs(game.Players:GetChildren()) do
		local emit = Instance.new("ParticleEmitter")
		emit.Parent = v.Character.Torso
		emit.Texture = "http://www.roblox.com/asset/?id=8408806737"
		emit.VelocitySpread = 20
	end
	for i, v in pairs(game.Players:GetChildren()) do
		local emit = Instance.new("ParticleEmitter")
		emit.Parent = v.Character.Torso
		emit.Texture = "http://www.roblox.com/asset/?id=8408806737"
		emit.VelocitySpread = 20
	end
	while true do
		game.Lighting.Ambient = Color3.new(math.random() , math.random() , math.random())
		wait(0.2)
		game.Lighting.ShadowColor = Color3.new(math.random() , math.random() , math.random())
		wait(0.2) 
	end
end, "Troll", "NOT FE")
FunctionManager:register("JOHN DOE", function()

	local redSkyboxAssetId = "rbxassetid://1012887"
	local sky = Lighting:FindFirstChildOfClass("Sky")
	if not sky then
		sky = Instance.new("Sky", Lighting)
	end
	sky.SkyboxBk = redSkyboxAssetId
	sky.SkyboxDn = redSkyboxAssetId
	sky.SkyboxFt = redSkyboxAssetId
	sky.SkyboxLf = redSkyboxAssetId
	sky.SkyboxRt = redSkyboxAssetId
	sky.SkyboxUp = redSkyboxAssetId

	if not ReplicatedStorage:FindFirstChild("juisdfj0i32i0eidsuf0iok") then
		local detection = Instance.new("Decal")
		detection.Name = "juisdfj0i32i0eidsuf0iok"
		detection.Parent = ReplicatedStorage
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "PersistentSoundGui"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = player:WaitForChild("PlayerGui")

	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 150, 0, 50)
	button.Position = UDim2.new(0.02, 0, 0.477, 0)
	button.Text = "Sound Toggle"
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 20
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Parent = screenGui

	local backgroundSound = SoundService:FindFirstChild("PersistentBGSound")
	if not backgroundSound then
		backgroundSound = Instance.new("Sound")
		backgroundSound.Name = "PersistentBGSound"
		backgroundSound.SoundId = "rbxassetid://19094700"
		backgroundSound.PlaybackSpeed = 0.221
		backgroundSound.Looped = true
		backgroundSound.Volume = 1
		backgroundSound.Parent = SoundService
		backgroundSound:Play()
	end

	button.Activated:Connect(function()
		backgroundSound.Playing = not backgroundSound.Playing
	end)

	local function setupCharacter(character)
		local humanoid = character:WaitForChild("Humanoid")
		local torso = character:WaitForChild("Torso")
		local hrp = character:WaitForChild("HumanoidRootPart")

		local tool = Instance.new("Tool")
		tool.Name = "Slash"
		tool.RequiresHandle = false
		tool.Parent = player.Backpack

		tool.Activated:Connect(function()
			local animation = Instance.new("Animation")
			animation.AnimationId = "rbxassetid://186934658"
			local track = humanoid:LoadAnimation(animation)
			track:Play()
			track:AdjustSpeed(2)

			local s = Instance.new("Sound", torso)
			s.SoundId = "rbxassetid://28144425"
			s:Play()

			task.wait(0.2)

			local s2 = Instance.new("Sound", torso)
			s2.SoundId = "rbxassetid://429400881"
			s2.Volume = 0.2
			s2:Play()
		end)

		local naeeym = Instance.new("BillboardGui", character)
		naeeym.Size = UDim2.new(0, 100, 0, 40)
		naeeym.StudsOffset = Vector3.new(0, 2, 0)
		naeeym.Adornee = character:WaitForChild("Head")

		local tecks = Instance.new("TextLabel", naeeym)
		tecks.BackgroundTransparency = 1
		tecks.BorderSizePixel = 0
		tecks.Font = Enum.Font.Fantasy
		tecks.TextSize = 24
		tecks.TextStrokeTransparency = 0
		tecks.TextStrokeColor3 = Color3.new(0, 0, 0)
		tecks.TextColor3 = Color3.new(0, 0, 0)
		tecks.Size = UDim2.new(1, 0, 0.5, 0)
		tecks.Text = "John Doe"

		local function changeName(newName)
			tecks.Text = newName
		end

		local function shakeTag()
			local originalOffset = naeeym.StudsOffset
			for _ = 1, 10 do
				naeeym.StudsOffset = originalOffset + Vector3.new(math.random(-1,1), math.random(-1,1), math.random(-1,1))
				task.wait(0.05)
			end
			naeeym.StudsOffset = originalOffset
		end

		coroutine.wrap(function()
			while character:IsDescendantOf(workspace) do
				changeName("BURN IN HELL")
				shakeTag()
				task.wait(0.2)
				changeName("STOP")
				task.wait(0.1)
				changeName("JUST GIVE UP")
				shakeTag()
				task.wait(0.2)
				changeName("STOP")
				shakeTag()
				task.wait(0.2)
				changeName("JOHN DOE")
				shakeTag()
				task.wait(0.3)
				changeName("HOPELESS")
				shakeTag()
				task.wait(0.3)
			end
		end)()

		local footPartSize = Vector3.new(10, 0.5, 10)
		local floorPartColor = BrickColor.Black()
		local floorMaterial = Enum.Material.Neon
		local yOffset = -2.8
		local lastPosition = hrp.Position
		local standingTimer = 0

		RunService.Heartbeat:Connect(function(dt)
			if not character:IsDescendantOf(workspace) then return end
			local currentPosition = hrp.Position
			standingTimer += dt
			local distanceMoved = (currentPosition - lastPosition).Magnitude
			local stepPosition = Vector3.new(currentPosition.X, hrp.Position.Y + yOffset, currentPosition.Z)

			local function createFootstep(position)
				local part = Instance.new("Part")
				part.Size = footPartSize
				part.Position = position
				part.Anchored = true
				part.CanCollide = false
				part.BrickColor = floorPartColor
				part.Material = floorMaterial
				part.Transparency = 0.5
				part.Parent = workspace
				task.spawn(function()
					for i = 1, 10 do
						part.Transparency = i * 0.03
						task.wait(0.05)
					end
				end)
				Debris:AddItem(part, 1)
			end

			if distanceMoved > 1 then
				createFootstep(stepPosition)
				lastPosition = currentPosition
				standingTimer = 0
			elseif standingTimer > 0.5 then
				createFootstep(stepPosition)
				standingTimer = 0
			end
		end)

		local movel = 0.1
		local hiddenfling = true

		local function fling()
			while hiddenfling and character:IsDescendantOf(workspace) do
				if hrp then
					local originalVelocity = hrp.Velocity
					hrp.Velocity = originalVelocity * 10000 + Vector3.new(0, 10000, 0)
					RunService.RenderStepped:Wait()
					hrp.Velocity = originalVelocity
					RunService.Stepped:Wait()
					hrp.Velocity = originalVelocity + Vector3.new(0, movel, 0)
					movel = -movel
				end
				RunService.Heartbeat:Wait()
			end
		end
		coroutine.wrap(fling)()
	end

	player.CharacterAdded:Connect(setupCharacter)
	if player.Character then
		setupCharacter(player.Character)
	end

	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")

	local player = Players.LocalPlayer
	local mouse = player:GetMouse()

	local function teleportToMousePosition()
		local character = player.Character
		if not character or not character:FindFirstChild("HumanoidRootPart") then
			return
		end

		local target = mouse.Hit
		if target then
			character:MoveTo(target.Position)
		end
	end

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end

		if input.KeyCode == Enum.KeyCode.T then
			teleportToMousePosition()
		end
	end)
end, "Trolling", "BROKEN")
FunctionManager:register("Invis gui", function()
	loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
end, "Trolling", "Credits to the original maker!")
FunctionManager:register("DANCE", function()
	local anim = Instance.new("Animation")
	anim.AnimationId = "rbxassetid://27789359" 
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
	track:Play()
end, "Fun", "DANCE DANCE")
FunctionManager:register("Sound GUI", function()
	local gui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("SoundGui")
	if gui then
		gui:Destroy()
		return
	end
	local SoundGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local AddSoundId = Instance.new("TextButton")
	local SoundIds = Instance.new("TextBox")
	local Default = Instance.new("TextButton")
	local Credits = Instance.new("TextLabel")
	local Title = Instance.new("TextLabel")
	local Swap = Instance.new("ImageButton")
	local PlayBackSpeed = Instance.new("TextBox")
	local Volume = Instance.new("TextBox")
	local Looped = Instance.new("TextBox")
	local Exit = Instance.new("ImageButton")
	local Frame2 = Instance.new("Frame")
	local Open = Instance.new("ImageButton")
	local spoky = Instance.new("Sound")
	local c00lflag = Instance.new("Sound")
	local drag = Instance.new("UIDragDetector")
	drag.Parent = Frame
	c00lflag.Name = "c00lsound23sas"
	c00lflag.Parent = Frame
	spoky.Parent = Frame
	spoky.SoundId = "rbxassetid://95156028272944"
	spoky.Volume = 3
	spoky.PlaybackSpeed = 0.2
	spoky.Name = "spoky"
	--Properties:

	SoundGui.Name = "SoundGui"
	SoundGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	SoundGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SoundGui.ResetOnSpawn = false

	Frame.Parent = SoundGui
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderColor3 = Color3.fromRGB(255, 0, 4)
	Frame.BorderSizePixel = 2
	Frame.Position = UDim2.new(0, 700, 0, 300)
	Frame.Size = UDim2.new(0, 398, 0, 206)

	AddSoundId.Name = "AddSoundId"
	AddSoundId.Parent = Frame
	AddSoundId.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	AddSoundId.BorderColor3 = Color3.fromRGB(255, 0, 0)
	AddSoundId.BorderSizePixel = 2
	AddSoundId.Position = UDim2.new(0.118090451, 0, 0.718446612, 0)
	AddSoundId.Size = UDim2.new(0, 307, 0, 36)
	AddSoundId.Font = Enum.Font.Arial
	AddSoundId.Text = "Add Sound!"
	AddSoundId.TextColor3 = Color3.fromRGB(255, 255, 255)
	AddSoundId.TextSize = 29.000

	SoundIds.Name = "SoundIds"
	SoundIds.Parent = Frame
	SoundIds.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	SoundIds.BorderColor3 = Color3.fromRGB(255, 0, 0)
	SoundIds.BorderSizePixel = 2
	SoundIds.Position = UDim2.new(0.118090451, 0, 0.305825233, 0)
	SoundIds.Size = UDim2.new(0, 307, 0, 33)
	SoundIds.Font = Enum.Font.Arial
	SoundIds.PlaceholderText = "Add a sound ID here!, No rbx://"
	SoundIds.Text = ""
	SoundIds.TextColor3 = Color3.fromRGB(255, 255, 255)
	SoundIds.TextScaled = true
	SoundIds.TextSize = 14.000
	SoundIds.TextWrapped = true

	Default.Name = "Default"
	Default.Parent = Frame
	Default.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Default.BorderColor3 = Color3.fromRGB(255, 0, 0)
	Default.BorderSizePixel = 2
	Default.Position = UDim2.new(0.118090451, 0, 0.529126227, 0)
	Default.Size = UDim2.new(0, 307, 0, 28)
	Default.Font = Enum.Font.Arial
	Default.Text = "Spooky Scary Skeletons!"
	Default.TextColor3 = Color3.fromRGB(255, 255, 255)
	Default.TextSize = 23.000

	Credits.Name = "Credits"
	Credits.Parent = Frame
	Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Credits.BackgroundTransparency = 1.000
	Credits.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Credits.BorderSizePixel = 0
	Credits.Position = UDim2.new(0.577889442, 0, 0.9174757, 0)
	Credits.Size = UDim2.new(0, 153, 0, 17)
	Credits.Font = Enum.Font.SourceSans
	Credits.Text = "made by: 1known. On discord!"
	Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
	Credits.TextSize = 14.000

	Title.Name = "Title"
	Title.Parent = Frame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(255, 0, 4)
	Title.BorderSizePixel = 2
	Title.Position = UDim2.new(0.208542719, 0, 0.0291262139, 0)
	Title.Size = UDim2.new(0, 231, 0, 48)
	Title.Font = Enum.Font.Arial
	Title.Text = "c00lSound GUI!"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 33.000
	Title.TextWrapped = true

	Swap.Name = "Swap"
	Swap.Parent = Frame
	Swap.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Swap.BorderColor3 = Color3.fromRGB(255, 0, 0)
	Swap.BorderSizePixel = 0
	Swap.Position = UDim2.new(0.904522598, 0, 0.33495146, 0)
	Swap.Size = UDim2.new(0, 23, 0, 21)
	Swap.Image = "rbxassetid://2500573769"

	PlayBackSpeed.Name = "PlayBackSpeed"
	PlayBackSpeed.Parent = Frame
	PlayBackSpeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	PlayBackSpeed.BorderColor3 = Color3.fromRGB(255, 0, 0)
	PlayBackSpeed.BorderSizePixel = 2
	PlayBackSpeed.Position = UDim2.new(0.118090451, 0, 0.305825233, 0)
	PlayBackSpeed.Size = UDim2.new(0, 307, 0, 33)
	PlayBackSpeed.Visible = false
	PlayBackSpeed.Font = Enum.Font.Arial
	PlayBackSpeed.PlaceholderText = "Playback speed, Enter a number!"
	PlayBackSpeed.Text = "1"
	PlayBackSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
	PlayBackSpeed.TextScaled = true
	PlayBackSpeed.TextSize = 14.000
	PlayBackSpeed.TextWrapped = true

	Volume.Name = "Volume"
	Volume.Parent = Frame
	Volume.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Volume.BorderColor3 = Color3.fromRGB(255, 0, 0)
	Volume.BorderSizePixel = 2
	Volume.Position = UDim2.new(0.118090451, 0, 0.305825233, 0)
	Volume.Size = UDim2.new(0, 307, 0, 33)
	Volume.Visible = false
	Volume.Font = Enum.Font.Arial
	Volume.PlaceholderText = "Volume! Enter a number."
	Volume.Text = "0.5"
	Volume.TextColor3 = Color3.fromRGB(255, 255, 255)
	Volume.TextScaled = true
	Volume.TextSize = 14.000
	Volume.TextWrapped = true

	Looped.Name = "Looped"
	Looped.Parent = Frame
	Looped.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Looped.BorderColor3 = Color3.fromRGB(255, 0, 0)
	Looped.BorderSizePixel = 2
	Looped.Position = UDim2.new(0.118090451, 0, 0.305825233, 0)
	Looped.Size = UDim2.new(0, 307, 0, 33)
	Looped.Visible = false
	Looped.Font = Enum.Font.Arial
	Looped.PlaceholderText = "Is it looped?, Type: False or True"
	Looped.Text = "False"
	Looped.TextColor3 = Color3.fromRGB(255, 255, 255)
	Looped.TextScaled = true
	Looped.TextSize = 14.000
	Looped.TextWrapped = true

	Exit.Name = "Exit"
	Exit.Parent = Frame
	Exit.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Exit.BorderColor3 = Color3.fromRGB(255, 0, 0)
	Exit.BorderSizePixel = 2
	Exit.Position = UDim2.new(0.921999991, 0, 0.0289999992, 0)
	Exit.Size = UDim2.new(0, 25, 0, 23)
	Exit.Image = "rbxassetid://14930908086"

	Frame2.Name = "Frame2"
	Frame2.Parent = SoundGui
	Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame2.BorderSizePixel = 0
	Frame2.Position = UDim2.new(0.984443069, 0, 0.841666639, 0)
	Frame2.Size = UDim2.new(0, 25, 0, 23)
	Frame2.Visible = false

	Open.Name = "Open"
	Open.Parent = Frame2
	Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Open.BorderColor3 = Color3.fromRGB(255, 0, 0)
	Open.BorderSizePixel = 2
	Open.Position = UDim2.new(-0.0312646478, 0, -0.0113339629, 0)
	Open.Size = UDim2.new(0, 25, 0, 23)
	Open.Image = "rbxassetid://14930908086"

	-- Scripts:

	local function GSSVM_fake_script() -- AddSoundId.LocalScript 
		local script = Instance.new('LocalScript', AddSoundId)

		local parent = script.Parent

		parent.Activated:Connect(function()
			local SoundId = parent.Parent:WaitForChild("SoundIds").Text
			local Playbackspeed = parent.Parent:WaitForChild("PlayBackSpeed").Text
			local Volume = parent.Parent:WaitForChild("Volume").Text
			local looped = parent.Parent:WaitForChild("Looped").Text
			if SoundId == "" then
				parent.Text = "No Sound ID!"
				wait(2)
				parent.Text = "Add Sound!"
				return
			end

			local id = "rbxassetid://" .. SoundId
			local speed = tonumber(Playbackspeed) or 1
			local existingSound = game.Workspace:FindFirstChild("c00lsound23sas")

			if existingSound then
				existingSound.SoundId = id
				existingSound.PlaybackSpeed = speed
				existingSound.Volume = Volume
				if looped == "False" then
					existingSound.Looped = false
				elseif looped == "True"	then
					existingSound.Looped = true
				else
					existingSound.Looped = false
				end
				existingSound:Play()
			else
				local clonedSound = parent.Parent.c00lsound23sas:Clone()
				clonedSound.Parent = game.Workspace
				clonedSound.SoundId = id
				clonedSound.PlaybackSpeed = speed
				clonedSound.Volume = Volume
				if looped == "False" then
					clonedSound.Looped = false
				elseif looped == "True"	then
					clonedSound.Looped = true
				else
					clonedSound.Looped = false
				end
				clonedSound.Looped = looped

				clonedSound:Play()
			end

			parent.Text = "Injected Sound Succesfully!, Be sure to enter a correct ID if it doesnt work!"
			parent.TextScaled = true
			wait(3.5)
			parent.TextScaled = false
			parent.Text = "Add Sound!"
		end)

	end
	coroutine.wrap(GSSVM_fake_script)()
	local function MWUVEW_fake_script() -- Default.LocalScript 
		local script = Instance.new('LocalScript', Default)

		local parent = script.Parent
		local sound = parent.Parent.spoky

		parent.Activated:Connect(function()
			if sound.Playing == true then
				sound.Playing = false
			else
				sound.Playing = true
			end
		end)
	end
	coroutine.wrap(MWUVEW_fake_script)()
	local function BIKZQ_fake_script() -- Swap.LocalScript 
		local script = Instance.new('LocalScript', Swap)

		local parent = script.Parent
		local playback = parent.Parent.PlayBackSpeed
		local Sound = parent.Parent.SoundIds
		local volume = parent.Parent.Volume
		local looped = parent.Parent.Looped
		parent.Activated:Connect(function()
			if Sound.Visible == true then
				Sound.Visible = false
				playback.Visible = true
				volume.Visible = false
				looped.Visible = false

			elseif playback.Visible ==true then
				playback.Visible = false
				Sound.Visible = false
				volume.Visible = true
				looped.Visible = false

			elseif volume.Visible == true then
				Sound.Visible = false
				playback.Visible = false
				volume.Visible = false
				looped.Visible = true
			elseif looped.Visible == true then
				Sound.Visible = true
				playback.Visible = false
				volume.Visible = false
				looped.Visible = false
			end
		end)
	end
	coroutine.wrap(BIKZQ_fake_script)()
	local function AXYPXC_fake_script() -- Exit.LocalScript 
		local script = Instance.new('LocalScript', Exit)

		local parent = script.Parent
		local main = parent.Parent

		parent.Activated:Connect(function()
			main.Parent.Frame2.Visible = true
			main.Visible = false

		end)
	end
	coroutine.wrap(AXYPXC_fake_script)()
	local function WHTXC_fake_script() -- Open.LocalScript 
		local script = Instance.new('LocalScript', Open)

		local parent = script.Parent
		local main = parent.Parent.Parent.Frame

		parent.Activated:Connect(function()
			main.Visible = true
			parent.Parent.Visible = false
		end)
	end
	coroutine.wrap(WHTXC_fake_script)()
end, "General", "NOT FE")
FunctionManager:register("Bind Key", function()
	if bindFrame then return end 

	local gui = Player:FindFirstChild("PlayerGui"):FindFirstChild(die)
	if not gui then NotifyERROR("Gui not found!"); return end
	screenGui = gui

	bindFrame = Instance.new("Frame")
	bindFrame.Name = generate_string(math_random(1, 10))
	bindFrame.Size = UDim2.new(1,0,1,0)
	bindFrame.BackgroundColor3 = Color3.new(0,0,0)
	bindFrame.BackgroundTransparency = 0.5
	bindFrame.ZIndex = 50
	bindFrame.Parent = screenGui

	local panel = Instance.new("Frame")
	panel.Name = generate_string(math_random(1, 10))
	panel.Size = UDim2.new(0, 300, 0, 400)
	panel.Position = UDim2.new(0.5, -150, 0.5, -200)
	panel.BackgroundColor3 = Color3.fromRGB(35,35,35)
	panel.BorderSizePixel = 0
	panel.ZIndex = 51
	panel.Parent = bindFrame

	local closeBtn = Instance.new("TextButton")
	closeBtn.Size = UDim2.new(0, 60, 0, 24)
	closeBtn.Position = UDim2.new(1, -64, 0, 4)
	closeBtn.Text = "Close"
	closeBtn.Font = Enum.Font.SourceSansBold
	closeBtn.TextSize = 14
	closeBtn.BackgroundColor3 = Color3.fromRGB(150,50,50)
	closeBtn.TextColor3 = Color3.new(1,1,1)
	closeBtn.ZIndex = 52
	closeBtn.Parent = panel
	closeBtn.MouseButton1Click:Connect(function()
		bindFrame:Destroy()
		bindFrame = nil
		if bindConn then bindConn:Disconnect(); bindConn = nil end
	end)

	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, -8, 0, 24)
	title.Position = UDim2.new(0, 4, 0, 4)
	title.BackgroundTransparency = 1
	title.Font = Enum.Font.SourceSansBold
	title.TextSize = 18
	title.TextColor3 = Color3.new(1,1,1)
	title.Text = "Bind Key to Function"
	title.ZIndex = 52
	title.Parent = panel

	local list = Instance.new("ScrollingFrame")
	list.Size = UDim2.new(1, -8, 1, -40)
	list.Position = UDim2.new(0, 4, 0, 32)
	list.CanvasSize = UDim2.new(0,0,0,0)
	list.ScrollBarThickness = 6
	list.ZIndex = 51
	list.Parent = panel

	local uiList = Instance.new("UIListLayout")
	uiList.Padding = UDim.new(0,4)
	uiList.SortOrder = Enum.SortOrder.LayoutOrder
	uiList.Parent = list

	local function refreshList()
		for _, child in ipairs(list:GetChildren()) do
			if child:IsA("TextButton") or child:IsA("TextLabel") then
				child:Destroy()
			end
		end

		for _, cat in ipairs(FunctionManager.Categories) do
			local hdr = Instance.new("TextLabel")
			hdr.Size = UDim2.new(1,0,0,24)
			hdr.BackgroundTransparency = 1
			hdr.Font = Enum.Font.SourceSansBold
			hdr.TextSize = 16
			hdr.TextColor3 = Color3.new(1,1,0)
			hdr.Text = "["..cat.."]"
			hdr.ZIndex = 51
			hdr.Parent = list

			for name, cb in pairs(FunctionManager:getFunctionsInCategory(cat)) do
				local btn = Instance.new("TextButton")
				btn.Size = UDim2.new(1,0,0,24)
				btn.Font = Enum.Font.SourceSans
				btn.TextSize = 14
				btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
				btn.TextColor3 = Color3.new(1,1,1)
				btn.ZIndex = 51

				local bound = {}
				for key, fn in pairs(customBinds) do
					if fn == cb then table.insert(bound, tostring(key)) end
				end
				local suffix = #bound>0 and " ("..table.concat(bound, ",")..")" or ""
				btn.Text = name..suffix
				btn.Parent = list

				btn.MouseButton1Click:Connect(function()
					waitingBindFunction = { cb = cb, btn = btn, name = name }
					btn.Text = name.." → [Press a key]"
				end)
			end
		end

		list.CanvasSize = UDim2.new(0,0,0, uiList.AbsoluteContentSize.Y + 8)
	end
	bindConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed or not waitingBindFunction then return end
		if input.UserInputType == Enum.UserInputType.Keyboard then
			customBinds[input.KeyCode] = waitingBindFunction.cb
			waitingBindFunction.btn.Text = waitingBindFunction.name.." ("..tostring(input.KeyCode)..")"
			waitingBindFunction = nil
		end
	end)
	refreshList()

end, "Utility", "BUGGED")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		local fn = customBinds[input.KeyCode]
		if fn and type(fn) == "function" then
			pcall(fn)
		end
	end
end)
FunctionManager:register("JumpUp", function()
	local char = Player.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if hrp then hrp.Velocity = Vector3.new(0, 100, 0) end
end, "Movement", "Leap into the air!")


FunctionManager:register("Sit", function()
	local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
	if hum then hum.Sit = true end
end, "Movement", "SIT DOWN")


FunctionManager:register("INF JUMP", function()
	infJumpEnabled = not infJumpEnabled

	if infJumpEnabled then
		local debounce = false

		infJumpConnection = UserInputService.JumpRequest:Connect(function()
			if debounce then return end
			debounce = true

			local character = Player.Character
			local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
			if humanoid then
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end

			task.wait()
			debounce = false
		end)
	else
		if infJumpConnection then
			infJumpConnection:Disconnect()
			infJumpConnection = nil
		end
	end
end, "Movement", "Jump Forever!")

FunctionManager:register("WalkSpeed Slider", function()
	if screenGui:FindFirstChild("WalkSpeedModal") then return end


	local overlay = Instance.new("Frame")
	overlay.Name               = "WalkSpeedModal"
	overlay.Size               = UDim2.new(1,0,1,0)
	overlay.Position           = UDim2.new(0,0,0,0)
	overlay.BackgroundColor3   = Color3.new(0,0,0)
	overlay.BackgroundTransparency = 0.5
	overlay.ZIndex             = 50
	overlay.Parent             = screenGui

	local panel = Instance.new("Frame")
	panel.Name                  = "SliderPanel"
	panel.Size                  = UDim2.new(0, 300, 0, 100)
	panel.Position              = UDim2.new(0.5, -150, 0.5, -50)
	panel.BackgroundColor3      = Color3.fromRGB(40,40,40)
	panel.BorderSizePixel       = 0
	panel.ZIndex                = 51
	panel.Parent                = overlay

	local closeBtn = Instance.new("TextButton")
	closeBtn.Name               = "Close"
	closeBtn.Size               = UDim2.new(0,60,0,24)
	closeBtn.Position           = UDim2.new(1,-64,0,4)
	closeBtn.Font               = Enum.Font.SourceSansBold
	closeBtn.TextSize           = 14
	closeBtn.Text               = "Close"
	closeBtn.BackgroundColor3   = Color3.fromRGB(150,50,50)
	closeBtn.TextColor3         = Color3.new(1,1,1)
	closeBtn.ZIndex             = 52
	closeBtn.Parent             = panel
	closeBtn.MouseButton1Click:Connect(function()
		overlay:Destroy()
	end)

	local label = Instance.new("TextLabel")
	label.Name                  = "ValueLabel"
	label.Size                  = UDim2.new(1,-8,0,24)
	label.Position              = UDim2.new(0,4,0,4)
	label.BackgroundTransparency= 1
	label.Font                  = Enum.Font.SourceSansBold
	label.TextSize              = 18
	label.TextColor3            = Color3.new(1,1,1)
	label.Text                  = "WalkSpeed: " .. tostring(Humanoid.WalkSpeed)
	label.ZIndex                = 52
	label.Parent                = panel

	local track = Instance.new("Frame")
	track.Name                  = "Track"
	track.Size                  = UDim2.new(1,-16,0,20)
	track.Position              = UDim2.new(0,8,0,40)
	track.BackgroundColor3      = Color3.fromRGB(60,60,60)
	track.BorderSizePixel       = 0
	track.ZIndex                = 51
	track.Parent                = panel

	local fill = Instance.new("Frame")
	fill.Name                   = "Fill"
	fill.Size                   = UDim2.new(
		math.clamp((Humanoid.WalkSpeed - 8)/(100-8),0,1), 0,
		1, 0
	)
	fill.BackgroundColor3       = Color3.fromRGB(100,200,100)
	fill.BorderSizePixel        = 0
	fill.ZIndex                 = 52
	fill.Parent                 = track

	local dragging = false
	local minS, maxS = 8, 100

	local function update(x)
		local rel = math.clamp((x - track.AbsolutePosition.X)/track.AbsoluteSize.X, 0,1)
		local v = math.floor(minS + (maxS-minS)*rel)
		Humanoid.WalkSpeed = v
		label.Text = "WalkSpeed: "..v
		fill.Size = UDim2.new(rel,0,1,0)
	end

	track.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			update(i.Position.X)
		end
	end)
	track.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
	UserInputService.InputChanged:Connect(function(i)
		if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
			update(i.Position.X)
		end
	end)
end, "Movement", "Control your walkspeed!")



FunctionManager:register("Server Hop", function()
	local success, res = pcall(function()
		return game:HttpGet(
			"https://games.roblox.com/v1/games/" ..
				PlaceId ..
				"/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true"
		)
	end)

	if not success then
		return NotifyERROR("[Server Hop] HTTP request failed")
	end

	local body
	local ok, err = pcall(function()
		body = HttpService:JSONDecode(res)
	end)
	if not ok or type(body) ~= "table" or type(body.data) ~= "table" then
		return NotifyERROR("[Server Hop] Invalid JSON response")
	end

	local servers = {}
	for _, v in ipairs(body.data) do
		if type(v) == "table"
			and tonumber(v.playing)
			and tonumber(v.maxPlayers)
			and v.playing < v.maxPlayers
			and v.id ~= JobId then
			table.insert(servers, v.id)
		end
	end

	if #servers == 0 then
		return NotifyERROR("[Server Hop] No available servers found")
	end

	local choice = servers[math.random(1, #servers)]
	TeleportService:TeleportToPlaceInstance(PlaceId, choice, Players.LocalPlayer)
end, "Utility","Changes Servers")

FunctionManager:register("TP Behind Closest", function()

	if not  HRP then
		NotifyERROR("No HumanoidRootPart found.")
		return
	end

	local closestPlayer
	local shortestDistance = math.huge


	for _, otherPlayer in ipairs(Players:GetPlayers()) do
		if otherPlayer ~= Player and otherPlayer.Character then
			local otherRoot = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
			if otherRoot then
				local distance = (otherRoot.Position - HRP.Position).Magnitude
				if distance < shortestDistance then
					shortestDistance = distance
					closestPlayer = otherPlayer
				end
			end
		end
	end

	if closestPlayer and closestPlayer.Character then
		local targetRoot = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
		if targetRoot then
			local behindPosition = targetRoot.CFrame.Position - targetRoot.CFrame.LookVector * 3
			local newCFrame = CFrame.new(behindPosition, targetRoot.Position) 
			HRP.CFrame = newCFrame
		end
	else
		NotifyERROR("No nearby player found.")
	end
end, "Movement", "Owai moi, shinderu. NANI?")
FunctionManager:register("Scare Closest Player", function()

	if not HRP then
		NotifyERROR("Could not find your HumanoidRootPart.")
		return
	end

	local closestPlayer, closestDistance = nil, math.huge
	for _, otherPlayer in ipairs(Players:GetPlayers()) do
		if otherPlayer ~= Player and otherPlayer.Character then
			local otherRoot = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
			if otherRoot then
				local dist = (otherRoot.Position - HRP.Position).Magnitude
				if dist < closestDistance then
					closestDistance = dist
					closestPlayer = otherPlayer
				end
			end
		end
	end

	if closestPlayer and closestPlayer.Character then
		local targetRoot = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
		if targetRoot then
			local oldPos = HRP.CFrame
			HRP.CFrame = targetRoot.CFrame + targetRoot.CFrame.lookVector * 2
			HRP.CFrame = CFrame.new(HRP.Position, targetRoot.Position)
			task.wait(0.5)
			HRP.CFrame = oldPos
		end
	else
		NotifyERROR("No target player nearby.")
	end
end, "Fun", "FNAF reference")
FunctionManager:register("ESP Toggle", function()
	espOn = not espOn
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr.Character and plr ~= Player then
			local head = plr.Character:FindFirstChild("Head")
			if head then
				local bb = head:FindFirstChild("ESP") or Instance.new("BillboardGui", head)
				bb.Name = "ESP"
				bb.Size = UDim2.new(0,80,0,20)
				bb.AlwaysOnTop = true
				local lbl = bb:FindFirstChild("Name") or Instance.new("TextLabel", bb)
				lbl.Name = "Name"
				lbl.BackgroundTransparency = 1
				lbl.Size = UDim2.new(1,0,1,0)
				lbl.TextColor3 = Color3.new(1,0,0)
				lbl.TextScaled = true
				lbl.Text = plr.Name
				bb.Enabled = espOn
			end
		end
	end
	Notify("ESP " .. (espOn and "Enabled" or "Disabled"), "SYSTEM", 3)
end, "Visual", "ur cooked i just got wallhacks")
FunctionManager:register("JumpPowerSlider", function()
	if screenGui:FindFirstChild("JumpPowerModal") then return end
	Humanoid.UseJumpPower = true
	local overlay = Instance.new("Frame")
	overlay.Name               = "JumpPowerModal"
	overlay.Size               = UDim2.new(1,0,1,0)
	overlay.Position           = UDim2.new(0,0,0,0)
	overlay.BackgroundColor3   = Color3.new(0,0,0)
	overlay.BackgroundTransparency = 0.5
	overlay.ZIndex             = 50
	overlay.Parent             = screenGui


	local panel = Instance.new("Frame")
	panel.Name                  = "JumpPanel"
	panel.Size                  = UDim2.new(0, 300, 0, 100)
	panel.Position              = UDim2.new(0.5, -150, 0.5, -50)
	panel.BackgroundColor3      = Color3.fromRGB(40,40,40)
	panel.BorderSizePixel       = 0
	panel.ZIndex                = 51
	panel.Parent                = overlay


	local closeBtn = Instance.new("TextButton")
	closeBtn.Name               = "Close"
	closeBtn.Size               = UDim2.new(0,60,0,24)
	closeBtn.Position           = UDim2.new(1,-64,0,4)
	closeBtn.Font               = Enum.Font.SourceSansBold
	closeBtn.TextSize           = 14
	closeBtn.Text               = "Close"
	closeBtn.BackgroundColor3   = Color3.fromRGB(150,50,50)
	closeBtn.TextColor3         = Color3.new(1,1,1)
	closeBtn.ZIndex             = 52
	closeBtn.Parent             = panel
	closeBtn.MouseButton1Click:Connect(function()
		overlay:Destroy()
	end)


	local label = Instance.new("TextLabel")
	label.Name                  = "ValueLabel"
	label.Size                  = UDim2.new(1,-8,0,24)
	label.Position              = UDim2.new(0,4,0,4)
	label.BackgroundTransparency= 1
	label.Font                  = Enum.Font.SourceSansBold
	label.TextSize              = 18
	label.TextColor3            = Color3.new(1,1,1)
	label.Text                  = "JumpPower: " .. tostring(Humanoid.JumpPower)
	label.ZIndex                = 52
	label.Parent                = panel


	local track = Instance.new("Frame")
	track.Name                  = "Track"
	track.Size                  = UDim2.new(1,-16,0,20)
	track.Position              = UDim2.new(0,8,0,40)
	track.BackgroundColor3      = Color3.fromRGB(60,60,60)
	track.BorderSizePixel       = 0
	track.ZIndex                = 51
	track.Parent                = panel

	local fill = Instance.new("Frame")
	fill.Name                   = "Fill"
	fill.Size                   = UDim2.new(
		math.clamp((Humanoid.JumpPower - 50)/(200-50),0,1), 0,
		1, 0
	)
	fill.BackgroundColor3       = Color3.fromRGB(100,200,100)
	fill.BorderSizePixel        = 0
	fill.ZIndex                 = 52
	fill.Parent                 = track


	local dragging = false
	local minJ, maxJ = 50, 200

	local function update(x)
		local rel = math.clamp((x - track.AbsolutePosition.X)/track.AbsoluteSize.X, 0,1)
		local v = math.floor(minJ + (maxJ-minJ)*rel)
		Humanoid.JumpPower = v
		label.Text = "JumpPower: "..v
		fill.Size = UDim2.new(rel,0,1,0)
	end

	track.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			update(i.Position.X)
		end
	end)
	track.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
	UserInputService.InputChanged:Connect(function(i)
		if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
			update(i.Position.X)
		end
	end)
end, "Movement", "Control your jumppower")



FunctionManager:register("Spin Bot", function()
	spinOn = not spinOn
	if spinOn then
		if not HRP then return NotifyERROR("No HRP!") end


		lockBP = Instance.new("BodyPosition")
		lockBP.Name = "SpinLockBP"
		lockBP.Position = HRP.Position
		lockBP.MaxForce = Vector3.new(1e6, 1e6, 1e6)
		lockBP.P = 1e5
		lockBP.D = 0
		lockBP.Parent = HRP


		spinBAV = Instance.new("BodyAngularVelocity")
		spinBAV.Name = "SpinBAV"
		spinBAV.AngularVelocity = Vector3.new(0, 10000, 0) 
		spinBAV.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
		spinBAV.P = 1e5
		spinBAV.Parent = HRP

		NotifyERROR("Spin Bot On")
	else
		if spinBAV then
			spinBAV:Destroy()
			spinBAV = nil
		end
		if lockBP then
			lockBP:Destroy()
			lockBP = nil
		end
		NotifyERROR("Spin Bot Off")
	end
end, "Visual", "Speeeeen")

FunctionManager:register("TP To Mouse", function()
	if hit then
		HRP.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
		warn("Teleported to mouse")
	end
end, "Movement", "BUGGED")
FunctionManager:register("Save Position", function()
	savedCFrame = HRP.CFrame
	Notify("Position Saved", "SYSTEM", 3)
end, "Utility", "Checkpoint")
FunctionManager:register("Load Position", function()
	if savedCFrame then
		HRP.CFrame = savedCFrame
		Notify("Position Loaded", "SYSTEM", 3)
	else
		NotifyERROR("No Position Saved")
	end
end, "Utility", "Reload")


FunctionManager:register("No‑Clip", function()
	noclipOn = not noclipOn

	if noclipOn then
		hoverHeight = HRP.Position.Y

		while noclipOn == true do
			task.wait(0.01)
		
			for _, part in ipairs(Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end

			local pos = HRP.Position
			HRP.CFrame = CFrame.new(pos.X, hoverHeight, pos.Z)
		end

		Notify("No‑Clip ON (locked at height)", "SYSTEM", 3)
	else
		for _, part in ipairs(Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = true
			end
		end
		Notify("No‑Clip OFF", "SYSTEM", 3)
	end
end, "Movement", "NOCLIP")

FunctionManager:register("DarkDex", function()
	--Maybe works?
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()	
end, "General", "Take a peek under the hood")
FunctionManager:register("SimpleSpy", function()
	--also maybe works?
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end, "Catch remotes")
FunctionManager:register("Orbit All Nearby Parts", function()
	local radius = 20
	local height = 3
	local orbitSpeed = 2

	local speaker = Players.LocalPlayer
	local character = speaker.Character or speaker.CharacterAdded:Wait()
	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then
		NotifyERROR("No HumanoidRootPart found.")
		return
	end

	local origin = root.Position
	local orbitParts = {}

	for _, part in ipairs(workspace:GetDescendants()) do
		if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(workspace.Terrain) then
			local isInCharacter = false

			for _, player in ipairs(Players:GetPlayers()) do
				local char = player.Character
				if char and part:IsDescendantOf(char) then
					isInCharacter = true
					break
				end
			end


			if not isInCharacter and (part.Position - origin).Magnitude <= radius then
				if not CollectionService:HasTag(part, "OrbitPart") then
					if part:CanSetNetworkOwnership() then
						part:SetNetworkOwner(speaker)
					else
						warn("Cannot set network owner for part:", part.Name)
					end
					part.CanCollide = false
					CollectionService:AddTag(part, "OrbitPart")
					table.insert(orbitParts, part)
				end

			end
		end
	end

	if #orbitParts == 0 then
		warn("No parts found for orbit.")
		return
	end

	local angleOffset = 2 * math.pi / #orbitParts

	for i, part in ipairs(orbitParts) do
		local angle = angleOffset * i

		local startPos = root.Position + Vector3.new(
			math.cos(angle) * radius,
			height,
			math.sin(angle) * radius
		)

		part.Position = startPos

		local bodyGyro = Instance.new("BodyGyro")
		bodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
		bodyGyro.P = 1e4
		bodyGyro.CFrame = CFrame.new(part.Position, root.Position)
		bodyGyro.Parent = part

		local bodyVel = Instance.new("BodyVelocity")
		bodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		bodyVel.P = 1e4
		bodyVel.Parent = part

		local conn
		conn = RunService.Heartbeat:Connect(function(dt)
			if not root or not root.Parent then
				conn:Disconnect()
				return
			end

			angle += orbitSpeed * dt

			local orbitCenter = root.Position
			local orbitPoint = orbitCenter + Vector3.new(
				math.cos(angle) * radius,
				height,
				math.sin(angle) * radius
			)

			local tangent = Vector3.new(
				-math.sin(angle),
				0,
				math.cos(angle)
			).Unit * orbitSpeed * radius

			bodyVel.Velocity = tangent
			bodyGyro.CFrame = CFrame.new(part.Position, orbitCenter)
			part.Position = orbitPoint
		end)
	end

	warn("Orbiting", #orbitParts, "parts around you.")
end, "Fun", "You have to be near the parts for a while for it to work")


local function toggleInvisibility()
	if invisRunning then return end
	invisRunning = true

	local player = Players.LocalPlayer
	repeat task.wait(0.1) until player.Character
	local originalChar = player.Character
	originalChar.Archivable = true

	local invisibleChar = originalChar:Clone()
	invisibleChar.Name   = ""
	invisibleChar.Parent = Lighting

	-- clone transparency
	for _, part in ipairs(invisibleChar:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Transparency = (part.Name == "HumanoidRootPart") and 1 or 0.5
		end
	end

	-- we’ll need these in nested functions:
	local isInvis = false
	local voidConn, deathConn, steppedConn

	-- Respawn helper (puts you back to originalChar)
	local function Respawn()
		invisRunning = false
		if steppedConn then steppedConn:Disconnect() end
		if deathConn   then deathConn:Disconnect()   end

		player.Character = originalChar
		originalChar.Parent = workspace
		-- destroy the extra humanoid
		local clonedHum = originalChar:FindFirstChildWhichIsA("Humanoid")
		if clonedHum then clonedHum:Destroy() end

		invisibleChar.Parent = nil
	end

	-- fix for falling through the void
	local voidY = workspace.FallenPartsDestroyHeight
	steppedConn = RunService.Stepped:Connect(function()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
		local y = hrp.Position.Y
		if (voidY < 0 and y <= voidY) or (voidY >= 0 and y >= voidY) then
			Respawn()
		end
	end)

	-- if cloned character dies
	local clonedHum = invisibleChar:FindFirstChildWhichIsA("Humanoid")
	deathConn = clonedHum.Died:Connect(Respawn)

	-- now swap them
	local camCF = workspace.CurrentCamera.CFrame
	local hrpCF = originalChar.HumanoidRootPart.CFrame

	originalChar:MoveTo(Vector3.new(0, math.pi*1e6, 0))
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	task.wait(0.2)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom

	invisibleChar.Parent = workspace
	invisibleChar.HumanoidRootPart.CFrame = hrpCF
	player.Character = invisibleChar

	-- re‑enable animations
	for _, a in ipairs(player.Character:GetDescendants()) do
		if a.Name == "Animate" and a:IsA("Model") then
			a.Disabled = true; a.Disabled = false
		end
	end
	workspace.CurrentCamera:remove()
	wait(.1)
	repeat wait() until player.Character ~= nil
	workspace.CurrentCamera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	player.CameraMinZoomDistance = 0.5
	player.CameraMaxZoomDistance = 400
	player.CameraMode = "Classic"
	player.Character.Head.Anchored = false
	player.Character.Animate.Enabled = false
	player.Character.Animate.Enabled = true
	Notify("You are now invisible!", "System", 3)
end

FunctionManager:register(
	"Invisible",
	toggleInvisibility,
	"Fun",
	"Make your character invisible until you respawn or die"
)


FunctionManager:register("Fly", function()
	if not HRP then
		warn("No HumanoidRootPart found; cannot fly.")
		return
	end

	flyingEnabled = not flyingEnabled

	if flyingEnabled then

		flyBG = Instance.new("BodyGyro")
		flyBG.P = 9e4
		flyBG.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
		flyBG.CFrame = HRP.CFrame
		flyBG.Parent = HRP


		flyBV = Instance.new("BodyVelocity")
		flyBV.MaxForce = Vector3.new(9e4, 9e4, 9e4)
		flyBV.Velocity = Vector3.new(0, 0, 0)
		flyBV.Parent = HRP

		flyConn = RunService.Heartbeat:Connect(function()
			local camCFrame = workspace.CurrentCamera.CFrame
			local dir = Vector3.new()

			if UserInputService:IsKeyDown(Enum.KeyCode.W) then
				dir = dir + camCFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then
				dir = dir - camCFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then
				dir = dir - camCFrame.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then
				dir = dir + camCFrame.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
				dir = dir + Vector3.new(0, 1, 0)
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				dir = dir - Vector3.new(0, 1, 0)
			end

			if dir.Magnitude > 0 then
				dir = dir.Unit * 50
			end
			flyBV.Velocity = dir
			flyBG.CFrame = CFrame.new(HRP.Position, HRP.Position + camCFrame.LookVector)
		end)

	else
		if flyConn then flyConn:Disconnect() flyConn = nil end
		if flyBG then flyBG:Destroy() flyBG = nil end
		if flyBV then flyBV:Destroy() flyBV = nil end


	end
end, "Movement", "Fly around!")

FunctionManager:register("HatHub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/inkdupe/hat-scripts/refs/heads/main/updatedhathub.lua"))()
end, "Troll", "Credits to original maker!")
FunctionManager:register("Hitbox Extender", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/AAPVdev/scripts/refs/heads/main/UI_LimbExtender.lua'))()
end, "Troll", "Extends hitboxes")
FunctionManager:register("Part Grab", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/v0c0n1337/scripts/refs/heads/main/Unachored_parts_controller_v2.lua.txt"))()
end, "Troll", "Much better part grab")
FunctionManager:register("Hat Script", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/Scp-096-Obfuscated/refs/heads/main/obuf"))()
end, "Troll", "HATS")



FunctionManager:register("PART ORBIT", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/aZjaAr6F", true))()
end, "Troll", "Probs better orbit")


FunctionManager:register("chat unbanner", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/aDFhvMC4", true))()
end, "Utility", "Credits to the original maker!")
FunctionManager:register("Fling GUI", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/VynRhxJV", true))()
end, "Troll", "Credits to the original maker!")



--init
updateGrid()
   end,
})

local FeThings = Window:CreateTab("Fe Scripts", nil) -- Title, Image

        local Button = FeThings:CreateButton({
   Name = "FE Fling all (bugged)",
   Callback = function()
        local Targets = {"All"} -- "All", "Target Name", "arian_was_here"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local GetPlayer = function(Name)
	Name = Name:lower()
	if Name == "all" or Name == "others" then
		AllBool = true
		return
	elseif Name == "random" then
		local GetPlayers = Players:GetPlayers()
		if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
		return GetPlayers[math.random(#GetPlayers)]
	elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
		for _,x in next, Players:GetPlayers() do
			if x ~= Player then
				if x.Name:lower():match("^"..Name) then
					return x;
				elseif x.DisplayName:lower():match("^"..Name) then
					return x;
				end
			end
		end
	else
		return
	end
end

local Message = function(_Title, _Text, Time)
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local SkidFling = function(TargetPlayer)
	local Character = Player.Character
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Humanoid and Humanoid.RootPart

	local TCharacter = TargetPlayer.Character
	local THumanoid
	local TRootPart
	local THead
	local Accessory
	local Handle

	if TCharacter:FindFirstChildOfClass("Humanoid") then
		THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
	end
	if THumanoid and THumanoid.RootPart then
		TRootPart = THumanoid.RootPart
	end
	if TCharacter:FindFirstChild("Head") then
		THead = TCharacter.Head
	end
	if TCharacter:FindFirstChildOfClass("Accessory") then
		Accessory = TCharacter:FindFirstChildOfClass("Accessory")
	end
	if Accessoy and Accessory:FindFirstChild("Handle") then
		Handle = Accessory.Handle
	end

	if Character and Humanoid and RootPart then
		if RootPart.Velocity.Magnitude < 50 then
			getgenv().OldPos = RootPart.CFrame
		end
		if THumanoid and THumanoid.Sit and not AllBool then
			return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
		end
		if THead then
			workspace.CurrentCamera.CameraSubject = THead
		elseif not THead and Handle then
			workspace.CurrentCamera.CameraSubject = Handle
		elseif THumanoid and TRootPart then
			workspace.CurrentCamera.CameraSubject = THumanoid
		end
		if not TCharacter:FindFirstChildWhichIsA("BasePart") then
			return
		end

		local FPos = function(BasePart, Pos, Ang)
			RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
			Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
			RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
			RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
		end

		local SFBasePart = function(BasePart)
			local TimeToWait = 2
			local Time = tick()
			local Angle = 0

			repeat
				if RootPart and THumanoid then
					if BasePart.Velocity.Magnitude < 50 then
						Angle = Angle + 100

						FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()
					else
						FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
						task.wait()

						FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()
					end
				else
					break
				end
			until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
		end

		

		local BV = Instance.new("BodyVelocity")
		BV.Name = "EpixVel"
		BV.Parent = RootPart
		BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
		BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

		if TRootPart and THead then
			if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
				SFBasePart(THead)
			else
				SFBasePart(TRootPart)
			end
		elseif TRootPart and not THead then
			SFBasePart(TRootPart)
		elseif not TRootPart and THead then
			SFBasePart(THead)
		elseif not TRootPart and not THead and Accessory and Handle then
			SFBasePart(Handle)
		else
			return Message("Error Occurred", "Target is missing everything", 5)
		end

		BV:Destroy()
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		workspace.CurrentCamera.CameraSubject = Humanoid

		repeat
			RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
			Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
			Humanoid:ChangeState("GettingUp")
			table.foreach(Character:GetChildren(), function(_, x)
				if x:IsA("BasePart") then
					x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
				end
			end)
			task.wait()
		until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
			
	else
		return Message("Error Occurred", "Random error", 5)
	end
end

if not Welcome then Message("Script by AnthonyIsntHere", "inc0mu gui version yessss", 5) end
getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
	for _,x in next, Players:GetPlayers() do
		SkidFling(x)
	end
end

for _,x in next, Targets do
	if GetPlayer(x) and GetPlayer(x) ~= Player then
		if GetPlayer(x).UserId ~= 1414978355 then
			local TPlayer = GetPlayer(x)
			if TPlayer then
				SkidFling(TPlayer)
			end
		else
			Message("Error Occurred", "This user is whitelisted! (Owner)", 5)
		end
	elseif not GetPlayer(x) and not AllBool then
		Message("Error Occurred", "Username Invalid", 5)
	end
end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Fly gui",
   Callback = function()
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- State
local flying = false
local flySpeed = 50
local toggleKey = Enum.KeyCode.F
local guiToggleKey = Enum.KeyCode.RightShift
local waitingForKeyInput = false
local waitingForGuiKeyInput = false

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "FlyGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 140)
frame.Position = UDim2.new(0.5, -200, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Active = true
frame.Draggable = true
frame.Visible = true
frame.Parent = gui

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 180, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(40, 150, 90)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 20
toggleButton.Text = "Flying: OFF"
toggleButton.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0, 120, 0, 40)
speedBox.Position = UDim2.new(0, 200, 0, 10)
speedBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
speedBox.TextColor3 = Color3.new(1, 1, 1)
speedBox.Font = Enum.Font.SourceSansBold
speedBox.TextSize = 20
speedBox.PlaceholderText = "Speed"
speedBox.Text = tostring(flySpeed)
speedBox.ClearTextOnFocus = false
speedBox.Parent = frame

local keybindButton = Instance.new("TextButton")
keybindButton.Size = UDim2.new(0, 180, 0, 30)
keybindButton.Position = UDim2.new(0, 10, 0, 55)
keybindButton.BackgroundColor3 = Color3.fromRGB(40, 90, 180)
keybindButton.TextColor3 = Color3.new(1, 1, 1)
keybindButton.Font = Enum.Font.SourceSansBold
keybindButton.TextSize = 18
keybindButton.Text = "Set Fly Key"
keybindButton.Parent = frame

local keybindLabel = Instance.new("TextLabel")
keybindLabel.Size = UDim2.new(0, 120, 0, 30)
keybindLabel.Position = UDim2.new(0, 200, 0, 55)
keybindLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keybindLabel.TextColor3 = Color3.new(1, 1, 1)
keybindLabel.Font = Enum.Font.SourceSans
keybindLabel.TextSize = 18
keybindLabel.Text = toggleKey.Name
keybindLabel.BorderSizePixel = 0
keybindLabel.Parent = frame

-- GUI TOGGLE KEYBIND
local guiKeyButton = Instance.new("TextButton")
guiKeyButton.Size = UDim2.new(0, 180, 0, 30)
guiKeyButton.Position = UDim2.new(0, 10, 0, 95)
guiKeyButton.BackgroundColor3 = Color3.fromRGB(180, 90, 40)
guiKeyButton.TextColor3 = Color3.new(1, 1, 1)
guiKeyButton.Font = Enum.Font.SourceSansBold
guiKeyButton.TextSize = 18
guiKeyButton.Text = "Set GUI Key"
guiKeyButton.Parent = frame

local guiKeyLabel = Instance.new("TextLabel")
guiKeyLabel.Size = UDim2.new(0, 120, 0, 30)
guiKeyLabel.Position = UDim2.new(0, 200, 0, 95)
guiKeyLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
guiKeyLabel.TextColor3 = Color3.new(1, 1, 1)
guiKeyLabel.Font = Enum.Font.SourceSans
guiKeyLabel.TextSize = 18
guiKeyLabel.Text = guiToggleKey.Name
guiKeyLabel.BorderSizePixel = 0
guiKeyLabel.Parent = frame

-- Flight
local bodyGyro, bodyVelocity

local function startFlying()
	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not root then return end

	bodyGyro = Instance.new("BodyGyro")
	bodyGyro.P = 9e4
	bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	bodyGyro.CFrame = root.CFrame
	bodyGyro.Parent = root

	bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.Velocity = Vector3.new(0, 0, 0)
	bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	bodyVelocity.Parent = root
end

local function stopFlying()
	if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
	if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
end

local function toggleFly()
	flying = not flying
	toggleButton.Text = flying and "Flying: ON" or "Flying: OFF"
	if flying then startFlying() else stopFlying() end
end

-- Button logic
toggleButton.MouseButton1Click:Connect(toggleFly)

keybindButton.MouseButton1Click:Connect(function()
	keybindLabel.Text = "Press key..."
	waitingForKeyInput = true
end)

guiKeyButton.MouseButton1Click:Connect(function()
	guiKeyLabel.Text = "Press key..."
	waitingForGuiKeyInput = true
end)

-- Input handling
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	if waitingForKeyInput and input.UserInputType == Enum.UserInputType.Keyboard then
		toggleKey = input.KeyCode
		keybindLabel.Text = toggleKey.Name
		waitingForKeyInput = false
		return
	end

	if waitingForGuiKeyInput and input.UserInputType == Enum.UserInputType.Keyboard then
		guiToggleKey = input.KeyCode
		guiKeyLabel.Text = guiToggleKey.Name
		waitingForGuiKeyInput = false
		return
	end

	if input.KeyCode == toggleKey then
		toggleFly()
	end
end)

-- GUI Toggle
UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == guiToggleKey then
		frame.Visible = not frame.Visible
	end
end)

-- Flight logic
RunService.RenderStepped:Connect(function()
	if flying and bodyVelocity and bodyGyro then
		local cam = workspace.CurrentCamera
		local move = Vector3.zero

		if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= cam.CFrame.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= cam.CFrame.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += cam.CFrame.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move += cam.CFrame.UpVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move -= cam.CFrame.UpVector end

		if move.Magnitude > 0 then
			move = move.Unit * flySpeed
		end

		bodyVelocity.Velocity = move
		bodyGyro.CFrame = cam.CFrame
	end
end)

-- Live speed update
speedBox:GetPropertyChangedSignal("Text"):Connect(function()
	local n = tonumber(speedBox.Text)
	if n and n >= 0 then
		flySpeed = n
	end
end)

-- Reset on respawn
player.CharacterAdded:Connect(function(char)
	character = char
	humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	stopFlying()
end)

   end,
})

local Hubs = Window:CreateTab("Game Hubs", nil) -- Title, Image

local Button = Hubs:CreateButton({
   Name = "sdvhvetctt5 menu v2",
   Callback = function()
        -- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Page1 = Instance.new("Folder")
local ClickTP = Instance.new("TextButton")
local Page2Button = Instance.new("TextButton")
local Rejoin = Instance.new("TextButton")
local Floatpad = Instance.new("TextButton")
local HatHub = Instance.new("TextButton")
local InfJump = Instance.new("TextButton")
local InfiniteYield = Instance.new("TextButton")
local Music = Instance.new("TextButton")
local NamelessAdmin = Instance.new("TextButton")
local PrizzLife = Instance.new("TextButton")
local Rejoin_2 = Instance.new("TextButton")
local Ring = Instance.new("TextButton")
local Snail = Instance.new("TextButton")
local SpamDecal = Instance.new("TextButton")
local Useless = Instance.new("TextButton")
local Useless_2 = Instance.new("TextButton")
local Useless_3 = Instance.new("TextButton")
local Useless_4 = Instance.new("TextButton")
local Useless_5 = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local Hide = Instance.new("TextButton")
local Page2 = Instance.new("Folder")
local Message = Instance.new("TextButton")
local TextLabel_4 = Instance.new("TextLabel")
local Hint = Instance.new("TextButton")
local CrashServerLifeInParadise = Instance.new("TextButton")
local KillAll = Instance.new("TextButton")
local TextLabel_5 = Instance.new("TextLabel")
local Page2Button_2 = Instance.new("TextButton")
local TextLabel_6 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.2463267, 0, 0.309927374, 0)
Frame.Size = UDim2.new(0, 594, 0, 368)
Frame.Active = true
Frame.Draggable = true

Page1.Name = "Page1"
Page1.Parent = Frame

ClickTP.Name = "ClickTP"
ClickTP.Parent = Page1
ClickTP.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ClickTP.BorderColor3 = Color3.fromRGB(255, 255, 255)
ClickTP.Position = UDim2.new(0.00229148986, 0, 0.722826064, 0)
ClickTP.Size = UDim2.new(0, 99, 0, 50)
ClickTP.Font = Enum.Font.SourceSans
ClickTP.Text = "Click TP"
ClickTP.TextColor3 = Color3.fromRGB(255, 255, 255)
ClickTP.TextSize = 14.000
ClickTP.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Click%20Teleport.lua"))()
end)

Page2Button.Name = "Page2Button"
Page2Button.Parent = Page1
Page2Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Page2Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
Page2Button.Position = UDim2.new(0.931584418, 0, 0.907608688, 0)
Page2Button.Size = UDim2.new(0, 39, 0, 34)
Page2Button.Font = Enum.Font.SourceSans
Page2Button.Text = ">"
Page2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Page2Button.TextScaled = true
Page2Button.TextSize = 14.000
Page2Button.TextWrapped = true
Page2Button.MouseButton1Click:Connect(function()
	for _, child in pairs(Page1:GetChildren()) do
		if child:IsA("GuiObject") then
			child.Visible = false
		end
	end

	for _, child in pairs(Page2:GetChildren()) do
		if child:IsA("GuiObject") then
			child.Visible = true
		end
	end
end)


Rejoin.Name = "Rejoin"
Rejoin.Parent = Page1
Rejoin.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Rejoin.BorderColor3 = Color3.fromRGB(255, 255, 255)
Rejoin.Position = UDim2.new(0.337308317, 0, 0.722826064, 0)
Rejoin.Size = UDim2.new(0, 99, 0, 50)
Rejoin.Font = Enum.Font.SourceSans
Rejoin.Text = "Rejoin"
Rejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
Rejoin.TextSize = 14.000
Rejoin.MouseButton1Click:Connect(function()
	--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
	local ts = game:GetService("TeleportService")



	local p = game:GetService("Players").LocalPlayer







	ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
end)

Floatpad.Name = "Floatpad"
Floatpad.Parent = Page1
Floatpad.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Floatpad.BorderColor3 = Color3.fromRGB(255, 255, 255)
Floatpad.Position = UDim2.new(0.506734014, 0, 0.475652277, 0)
Floatpad.Size = UDim2.new(0, 99, 0, 50)
Floatpad.Font = Enum.Font.SourceSans
Floatpad.Text = "Float Pad"
Floatpad.TextColor3 = Color3.fromRGB(255, 255, 255)
Floatpad.TextSize = 14.000

HatHub.Name = "HatHub"
HatHub.Parent = Page1
HatHub.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HatHub.BorderColor3 = Color3.fromRGB(255, 255, 255)
HatHub.Position = UDim2.new(0, 0, 0.478260875, 0)
HatHub.Size = UDim2.new(0, 99, 0, 50)
HatHub.Font = Enum.Font.SourceSans
HatHub.Text = "Hat Hub"
HatHub.TextColor3 = Color3.fromRGB(255, 255, 255)
HatHub.TextSize = 14.000
HatHub.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/inkdupe/hat-scripts/refs/heads/main/updatedhathub.lua"))()
end)

InfJump.Name = "InfJump"
InfJump.Parent = Page1
InfJump.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InfJump.BorderColor3 = Color3.fromRGB(255, 255, 255)
InfJump.Position = UDim2.new(0.165591151, 0, 0.722826064, 0)
InfJump.Size = UDim2.new(0, 99, 0, 50)
InfJump.Font = Enum.Font.SourceSans
InfJump.Text = "Infinite Jump"
InfJump.TextColor3 = Color3.fromRGB(255, 255, 255)
InfJump.TextSize = 14.000
InfJump.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Jump.lua"))()
end)

InfiniteYield.Name = "InfiniteYield"
InfiniteYield.Parent = Page1
InfiniteYield.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InfiniteYield.BorderColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.Position = UDim2.new(0, 0, 0.25, 0)
InfiniteYield.Size = UDim2.new(0, 99, 0, 50)
InfiniteYield.Font = Enum.Font.SourceSans
InfiniteYield.Text = "Infinite Yield"
InfiniteYield.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.TextSize = 14.000
InfiniteYield.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

Music.Name = "Music"
Music.Parent = Page1
Music.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Music.BorderColor3 = Color3.fromRGB(255, 255, 255)
Music.Position = UDim2.new(0.674616635, 0, 0.475652277, 0)
Music.Size = UDim2.new(0, 99, 0, 50)
Music.Font = Enum.Font.SourceSans
Music.Text = "Music"
Music.TextColor3 = Color3.fromRGB(255, 255, 255)
Music.TextSize = 14.000

NamelessAdmin.Name = "NamelessAdmin"
NamelessAdmin.Parent = Page1
NamelessAdmin.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NamelessAdmin.BorderColor3 = Color3.fromRGB(255, 255, 255)
NamelessAdmin.Position = UDim2.new(0.168654174, 0, 0.25, 0)
NamelessAdmin.Size = UDim2.new(0, 99, 0, 50)
NamelessAdmin.Font = Enum.Font.SourceSans
NamelessAdmin.Text = "Nameless Admin"
NamelessAdmin.TextColor3 = Color3.fromRGB(255, 255, 255)
NamelessAdmin.TextSize = 14.000
NamelessAdmin.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)

PrizzLife.Name = "Prizz Life"
PrizzLife.Parent = Page1
PrizzLife.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PrizzLife.BorderColor3 = Color3.fromRGB(255, 255, 255)
PrizzLife.Position = UDim2.new(0.337308347, 0, 0.25, 0)
PrizzLife.Size = UDim2.new(0, 99, 0, 50)
PrizzLife.Font = Enum.Font.SourceSans
PrizzLife.Text = "Prizz"
PrizzLife.TextColor3 = Color3.fromRGB(255, 255, 255)
PrizzLife.TextSize = 14.000
PrizzLife.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua'))()
end)

Rejoin_2.Name = "Rejoin"
Rejoin_2.Parent = Page1
Rejoin_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Rejoin_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Rejoin_2.Position = UDim2.new(0.507341981, 0, 0.722826064, 0)
Rejoin_2.Size = UDim2.new(0, 99, 0, 50)
Rejoin_2.Font = Enum.Font.SourceSans
Rejoin_2.Text = "Reset"
Rejoin_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Rejoin_2.TextSize = 14.000
Rejoin_2.MouseButton1Click:Connect(function()
	
end)

Ring.Name = "Ring"
Ring.Parent = Page1
Ring.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Ring.BorderColor3 = Color3.fromRGB(255, 255, 255)
Ring.Position = UDim2.new(0.338383824, 0, 0.475652277, 0)
Ring.Size = UDim2.new(0, 99, 0, 50)
Ring.Font = Enum.Font.SourceSans
Ring.Text = "Ring"
Ring.TextColor3 = Color3.fromRGB(255, 255, 255)
Ring.TextSize = 14.000
Ring.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://rscripts.net/raw/super-ring-parts-v4-by-lukas_1741980981842_td0ummjymf.txt",true))()
end)

Snail.Name = "Snail"
Snail.Parent = Page1
Snail.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Snail.BorderColor3 = Color3.fromRGB(255, 255, 255)
Snail.Position = UDim2.new(0.170033664, 0, 0.475652277, 0)
Snail.Size = UDim2.new(0, 99, 0, 50)
Snail.Font = Enum.Font.SourceSans
Snail.Text = "Snail"
Snail.TextColor3 = Color3.fromRGB(255, 255, 255)
Snail.TextSize = 14.000
Snail.MouseButton1Click:Connect(function()
	--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]

--[[
	           ,."""""""""""""".,
	        .d"                  "b.
	      .d                        b.
	    ."         .. depso ..        ".
	   P        z$*"        "*e.        9.
	  A       d"                "b       A
	 J       J    .e*""""""%c     A       L
	A       A    d"          $     L      A
	#       %   d      d**y  'L    %      #
	#       %   $     $ ,, Y  .$   %      #       _ _ 
	#       %   $     *  """   F   %      #      (@)@)
	#       V    4.    $.   .e"    Y      #        % %
	#        $    *.    """"     .Y      V         $ $
	#        'b     "b.      ..e*       Y         .eeee
	V         '$      ""eeee""        eP         A     %
	 Y         eb                ..d*"         _#    O %
	 I    _e%*""""*$ee......ee$*"eeeeeeeezee$**"       $
	  V ,"                                            B
	  J'                                        _,e=""
	.'#######################################DWB''

	Made by Depso - not mine lmao
	The SNAIL Script V2
	
	To update the config, run the script again.
]]

	_G.Snail_Config = {
		Speed = 0.4,
		TunnelSpeed = 2,

		--// Offsets
		Offset = CFrame.new(0,-1,0),
		TunnelOffset = CFrame.new(0,-2,0), -- This is added to the Offset

		--// Control
		Teleport = Enum.KeyCode.E,
		Tunnel = Enum.KeyCode.Q,
		ResetCamera = Enum.KeyCode.R,

		TunnelIsToggle = false,
		DistanceChangesSpeed = true,
		UseCameraRotaton = false, -- Old movement

		Distance = 5,

		--// Animations
		RotationEffect = false,
		Enabled = true, -- If disabled, the script will not run after death
		DirtParticles = true,
		Sounds = true,

		--// Trail Style
		Color = ColorSequence.new{ -- Time Position, Value
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 171, 3)), 
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(132, 255, 0))
		},
		Transparency = NumberSequence.new{ 
			NumberSequenceKeypoint.new(0.00, 0.40), 
			NumberSequenceKeypoint.new(1.00, 1.00)
		},
		Length = 0.3, -- 0: Disabled

		--// Dirt style
		DirtColor = ColorSequence.new{ -- Time Position, Value
			ColorSequenceKeypoint.new(0, Color3.fromRGB(193, 135, 0)), 
			ColorSequenceKeypoint.new(1, Color3.fromRGB(158, 84, 0))
		},
		DirtSize = NumberSequence.new{ 
			NumberSequenceKeypoint.new(0, 0.2), 
			NumberSequenceKeypoint.new(1, 0.25)
		},

		--// Sounds
		Audios = {
			Teleport = {
				SoundId = 507863457
			},
			Tunnel = {
				SoundId = 9114127078,
				Looped = true,
				PlaybackSpeed = 1.2
			},
		},

		--// Misc (Advanced)
		Max_Height = 15,
		Root_Height = 4,
	}

	------------------------------

	if _G.Snail_Ran then return end
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MastersMZ-Scripts/Scripts/master/Snail%20Script/Snail%20Script%20V2.lua'))()

end)

SpamDecal.Name = "SpamDecal"
SpamDecal.Parent = Page1
SpamDecal.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpamDecal.BorderColor3 = Color3.fromRGB(255, 255, 255)
SpamDecal.Position = UDim2.new(0.841283321, 0, 0.475652277, 0)
SpamDecal.Size = UDim2.new(0, 94, 0, 50)
SpamDecal.Font = Enum.Font.SourceSans
SpamDecal.Text = "Spam Decal"
SpamDecal.TextColor3 = Color3.fromRGB(255, 255, 255)
SpamDecal.TextSize = 14.000
SpamDecal.MouseButton1Click:Connect(function()
	local decalId = "rbxassetid://141747285"

	local faces = {
		Enum.NormalId.Front,
		Enum.NormalId.Back,
		Enum.NormalId.Left,
		Enum.NormalId.Right,
		Enum.NormalId.Top,
		Enum.NormalId.Bottom,
	}

	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") then
			for _, face in ipairs(faces) do
				local decal = Instance.new("Decal")
				decal.Texture = decalId
				decal.Face = face
				decal.Parent = obj
			end
		end
	end
end)

Useless.Name = "Useless"
Useless.Parent = Page1
Useless.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless.Position = UDim2.new(0.505962551, 0, 0.247391418, 0)
Useless.Size = UDim2.new(0, 99, 0, 50)
Useless.Font = Enum.Font.SourceSans
Useless.Text = "Empty"
Useless.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless.TextSize = 14.000

Useless_2.Name = "Useless"
Useless_2.Parent = Page1
Useless_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless_2.Position = UDim2.new(0.674616694, 0, 0.247391418, 0)
Useless_2.Size = UDim2.new(0, 99, 0, 50)
Useless_2.Font = Enum.Font.SourceSans
Useless_2.Text = "Empty"
Useless_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless_2.TextSize = 14.000

Useless_3.Name = "Useless"
Useless_3.Parent = Page1
Useless_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless_3.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless_3.Position = UDim2.new(0.841283321, 0, 0.247391418, 0)
Useless_3.Size = UDim2.new(0, 94, 0, 50)
Useless_3.Font = Enum.Font.SourceSans
Useless_3.Text = "Empty"
Useless_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless_3.TextSize = 14.000

Useless_4.Name = "Useless"
Useless_4.Parent = Page1
Useless_4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless_4.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless_4.Position = UDim2.new(0.674312711, 0, 0.720217526, 0)
Useless_4.Size = UDim2.new(0, 99, 0, 50)
Useless_4.Font = Enum.Font.SourceSans
Useless_4.Text = "Empty"
Useless_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless_4.TextSize = 14.000

Useless_5.Name = "Useless"
Useless_5.Parent = Page1
Useless_5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Useless_5.BorderColor3 = Color3.fromRGB(255, 255, 255)
Useless_5.Position = UDim2.new(0.840979397, 0, 0.720217526, 0)
Useless_5.Size = UDim2.new(0, 93, 0, 50)
Useless_5.Font = Enum.Font.SourceSans
Useless_5.Text = "Empty"
Useless_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Useless_5.TextSize = 14.000

TextLabel.Parent = Page1
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.328790426, 0, 0.630434811, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 34)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Other"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = Page1
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.325423419, 0, 0.385869563, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 34)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Troll"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

TextLabel_3.Parent = Page1
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.328790456, 0, 0.135869563, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 34)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Admin Commands"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

Hide.Name = "Hide"
Hide.Parent = Frame
Hide.BackgroundColor3 = Color3.fromRGB(77, 0, 1)
Hide.BorderColor3 = Color3.fromRGB(255, 255, 255)
Hide.Position = UDim2.new(0.906331897, 0, 0, 0)
Hide.Size = UDim2.new(0, 55, 0, 50)
Hide.ZIndex = 2
Hide.Font = Enum.Font.SourceSans
Hide.Text = "-"
Hide.TextColor3 = Color3.fromRGB(255, 255, 255)
Hide.TextSize = 14.000
Hide.MouseButton1Click:Connect(function()
	Frame.Visible = false
	game.StarterGui:SetCore("SendNotification", {
		Title = "Notification",
		Text = "Press H to show",
		Duration = 5
	})
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
		Frame.Visible = true
	end
end)


Page2.Name = "Page2"
Page2.Parent = Frame

Message.Name = "Message"
Message.Parent = Page2
Message.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Message.BorderColor3 = Color3.fromRGB(255, 255, 255)
Message.Position = UDim2.new(-0.00107551343, 0, 0.228260875, 0)
Message.Size = UDim2.new(0, 99, 0, 50)
Message.Visible = false
Message.Font = Enum.Font.SourceSans
Message.Text = "Message"
Message.TextColor3 = Color3.fromRGB(255, 255, 255)
Message.TextSize = 14.000
Message.MouseButton1Click:Connect(function()
	local messageinstance = game.Instance == Instance.new("Message")
	messageinstance.Text = "SDVHVETCTT IS BACK"
end)

TextLabel_4.Parent = Page2
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.328790456, 0, 0.135869563, 0)
TextLabel_4.Size = UDim2.new(0, 200, 0, 34)
TextLabel_4.Visible = false
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "More"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

Hint.Name = "Hint"
Hint.Parent = Page2
Hint.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Hint.BorderColor3 = Color3.fromRGB(255, 255, 255)
Hint.Position = UDim2.new(0.165591151, 0, 0.228260875, 0)
Hint.Size = UDim2.new(0, 99, 0, 50)
Hint.Visible = false
Hint.Font = Enum.Font.SourceSans
Hint.Text = "Hint"
Hint.TextColor3 = Color3.fromRGB(255, 255, 255)
Hint.TextSize = 14.000
Hint.MouseButton1Click:Connect(function()
	local hintinstance = game.Instance == Instance.new("Hint")
	hintinstance.Text = "SDVHVETCTT IS BACK"
end)

CrashServerLifeInParadise.Name = "Crash Server (Life In Paradise)"
CrashServerLifeInParadise.Parent = Page2
CrashServerLifeInParadise.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CrashServerLifeInParadise.BorderColor3 = Color3.fromRGB(255, 255, 255)
CrashServerLifeInParadise.Position = UDim2.new(0.327207327, 0, 0.228260875, 0)
CrashServerLifeInParadise.Size = UDim2.new(0, 99, 0, 50)
CrashServerLifeInParadise.Visible = false
CrashServerLifeInParadise.Font = Enum.Font.SourceSans
CrashServerLifeInParadise.Text = "Crash Server (life in paradise)"
CrashServerLifeInParadise.TextColor3 = Color3.fromRGB(255, 255, 255)
CrashServerLifeInParadise.TextScaled = true
CrashServerLifeInParadise.TextSize = 14.000
CrashServerLifeInParadise.TextWrapped = true
CrashServerLifeInParadise.MouseButton1Click:Connect(function()
	--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
	-- join my discord
	game:GetService'RunService'.RenderStepped:Connect(function()
		task.spawn(function() -- prevent blocking frame render
			for i=0,1000,1 do


				local args = {
					[1] = {
						[1] = "Wear",
						[2] = "11297746",
						[3] = "Hats"
					}
				}

				game:GetService("ReplicatedStorage").WearItem:FireServer(unpack(args))
			end
		end)
	end)
end)

KillAll.Name = "Kill All"
KillAll.Parent = Page2
KillAll.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
KillAll.BorderColor3 = Color3.fromRGB(255, 255, 255)
KillAll.Position = UDim2.new(0.49724099, 0, 0.228260875, 0)
KillAll.Size = UDim2.new(0, 99, 0, 50)
KillAll.Visible = false
KillAll.Font = Enum.Font.SourceSans
KillAll.Text = "Kill All (only if game has weapons)"
KillAll.TextColor3 = Color3.fromRGB(255, 255, 255)
KillAll.TextScaled = true
KillAll.TextSize = 14.000
KillAll.TextWrapped = true
KillAll.MouseButton1Click:Connect(function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Not finished yet!",
		Text = "This feature isn't finished yet.",
		Duration = 5
	})
end)

TextLabel_5.Parent = Page2
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0.184009284, 0, 0.663043499, 0)
TextLabel_5.Size = UDim2.new(0, 361, 0, 46)
TextLabel_5.Visible = false
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = "This is all in my hack panel. More features will be added. You may suggest features in the comments :)"
TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14.000
TextLabel_5.TextWrapped = true

Page2Button_2.Name = "Page2Button"
Page2Button_2.Parent = Page2
Page2Button_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Page2Button_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Page2Button_2.Position = UDim2.new(-0.00107551343, 0, 0.907608688, 0)
Page2Button_2.Size = UDim2.new(0, 39, 0, 34)
Page2Button_2.Visible = false
Page2Button_2.Font = Enum.Font.SourceSans
Page2Button_2.Text = "<"
Page2Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Page2Button_2.TextScaled = true
Page2Button_2.TextSize = 14.000
Page2Button_2.TextWrapped = true
Page2Button_2.MouseButton1Click:Connect(function()
	for _, child in pairs(Page1:GetChildren()) do
		if child:IsA("GuiObject") then
			child.Visible = true
		end
	end

	for _, child in pairs(Page2:GetChildren()) do
		if child:IsA("GuiObject") then
			child.Visible = false
		end
	end
end)

TextLabel_6.Parent = Frame
TextLabel_6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_6.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.Position = UDim2.new(-5.13763929e-08, 0, 0, 0)
TextLabel_6.Size = UDim2.new(0, 594, 0, 50)
TextLabel_6.Font = Enum.Font.SourceSans
TextLabel_6.Text = "sdvhvetctt5 hack panel"
TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.TextScaled = true
TextLabel_6.TextSize = 14.000
TextLabel_6.TextWrapped = true
TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left
   end,
})

local Button = Hubs:CreateButton({
   Name = "Orca hub",
   Callback = function()
        --[[
-- Orca, a free and open-source Roblox script hub.
-- This script was generated by ci/bundle.lua, and is not intended to be modified.
-- To view the source code, see the 'src' folder on GitHub!
--
-- Author: 0866
-- License: MIT
-- Version: "1.1.1"
-- GitHub: https://github.com/richie0866/orca
--]]

-- Runtime module

---@class Module
---@field fn function
---@field isLoaded boolean
---@field value any

---@type table<string, Instance>
local instanceFromId = {}

---@type table<Instance, string>
local idFromInstance = {}

---@type table<Instance, Module>
local modules = {}

---Stores currently loading modules.
---@type table<LocalScript | ModuleScript, ModuleScript>
local currentlyLoading = {}

-- Module resolution

---@param module LocalScript | ModuleScript
---@param caller? LocalScript | ModuleScript
---@return function | nil cleanup
local function validateRequire(module, caller)
	currentlyLoading[caller] = module

	local currentModule = module
	local depth = 0

	-- If the module is loaded, requiring it will not cause a circular dependency.
	if not modules[module] then
		while currentModule do
			depth = depth + 1
			currentModule = currentlyLoading[currentModule]

			if currentModule == module then
				local str = currentModule.Name -- Get the string traceback

				for _ = 1, depth do
					currentModule = currentlyLoading[currentModule]
					str = str .. "  ⇒ " .. currentModule.Name
				end

				error("Failed to load '" .. module.Name .. "'; Detected a circular dependency chain: " .. str, 2)
			end
		end
	end

	return function ()
		if currentlyLoading[caller] == module then -- Thread-safe cleanup!
			currentlyLoading[caller] = nil
		end
	end
end

---@param obj LocalScript | ModuleScript
---@param this? LocalScript | ModuleScript
---@return any
local function loadModule(obj, this)
	local cleanup = this and validateRequire(obj, this)
	local module = modules[obj]

	if module.isLoaded then
		if cleanup then
			cleanup()
		end
		return module.value
	else
		local data = module.fn()
		module.value = data
		module.isLoaded = true
		if cleanup then
			cleanup()
		end
		return data
	end
end

---@param target ModuleScript
---@param this? LocalScript | ModuleScript
---@return any
local function requireModuleInternal(target, this)
	if modules[target] and target:IsA("ModuleScript") then
		return loadModule(target, this)
	else
		return require(target)
	end
end

-- Instance creation

---@param id string
---@return table<string, any> environment
local function newEnv(id)
	return setmetatable({
		VERSION = "1.1.1",
		script = instanceFromId[id],
		require = function (module)
			return requireModuleInternal(module, instanceFromId[id])
		end,
	}, {
		__index = getfenv(0),
		__metatable = "This metatable is locked",
	})
end

---@param name string
---@param className string
---@param path string
---@param parent string | nil
---@param fn function
local function newModule(name, className, path, parent, fn)
	local instance = Instance.new(className)
	instance.Name = name
	instance.Parent = instanceFromId[parent]

	instanceFromId[path] = instance
	idFromInstance[instance] = path

	modules[instance] = {
		fn = fn,
		isLoaded = false,
		value = nil,
	}
end

---@param name string
---@param className string
---@param path string
---@param parent string | nil
local function newInstance(name, className, path, parent)
	local instance = Instance.new(className)
	instance.Name = name
	instance.Parent = instanceFromId[parent]

	instanceFromId[path] = instance
	idFromInstance[instance] = path
end

-- Runtime

local function init()
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
	for object in pairs(modules) do
		if object:IsA("LocalScript") and not object.Disabled then
			task.spawn(loadModule, object)
		end
	end
end


newInstance("Orca","Folder","Orca",nil)newModule("App","ModuleScript","Orca.App","Orca",function()return setfenv(function()local a=require(script.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local c=a.import(script,script.Parent,"views","Dashboard").default;local d=7;local function e()return b.createElement("ScreenGui",{IgnoreGuiInset=true,ResetOnSpawn=false,ZIndexBehavior="Sibling",DisplayOrder=d},{b.createElement(c)})end;local f=e;return{default=f}end,newEnv("Orca.App"))()end)newInstance("components","Folder","Orca.components","Orca")newModule("Acrylic","ModuleScript","Orca.components.Acrylic","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Acrylic").default;return g end,newEnv("Orca.components.Acrylic"))()end)newModule("Acrylic","ModuleScript","Orca.components.Acrylic.Acrylic","Orca.components.Acrylic",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local j=h.useCallback;local k=h.useEffect;local l=h.useMemo;local m=h.useMutable;local n=a.import(script,a.getModule(script,"@rbxts","services")).Workspace;local o=a.import(script,script.Parent,"acrylic-instance").acrylicInstance;local p=a.import(script,script.Parent.Parent.Parent,"hooks","common","rodux-hooks").useAppSelector;local q=a.import(script,script.Parent.Parent.Parent,"utils","number-util").map;local r=a.import(script,script.Parent.Parent.Parent,"utils","udim2").scale;local s=CFrame.Angles(0,math.rad(90),0)local function t(u,v)local w=n.CurrentCamera:ScreenPointToRay(u.X,u.Y)local x=w.Origin;local y=w.Direction*v;return x+y end;local function z()return q(n.CurrentCamera.ViewportSize.Y,0,2560,8,56)end;local A;local function B(C)local D=C.radius;local v=C.distance;local E=p(function(F)return F.options.config.acrylicBlur end)local G={}local H=#G;local I=E and b.createElement(A,{radius=D,distance=v})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;return b.createFragment(G)end;local f=i(B)local function L(C)local D=C.radius;if D==nil then D=0 end;local v=C.distance;if v==nil then v=0.001 end;local M=m({topleft2d=Vector2.new(),topright2d=Vector2.new(),bottomright2d=Vector2.new(),topleftradius2d=Vector2.new()})local N=l(function()local O=o:Clone()O.Parent=n;return O end,{})k(function()return function()return N:Destroy()end end,{})local P=j(function(Q,R)local y=Q/2;local S=R-y;local T=M.current;T.topleft2d=Vector2.new(math.ceil(S.X),math.ceil(S.Y))local U=T.topleft2d;local V=Vector2.new(Q.X,0)T.topright2d=U+V;T.bottomright2d=T.topleft2d+Q;local W=T.topleft2d;local X=Vector2.new(D,0)T.topleftradius2d=W+X end,{v,D})local Y=j(function()local Z=M.current;local _=Z.topleft2d;local a0=Z.topright2d;local a1=Z.bottomright2d;local a2=Z.topleftradius2d;local a3=t(_,v)local a4=t(a0,v)local a5=t(a1,v)local a6=t(a2,v)local a7=(a6-a3).Magnitude;local a8=(a4-a3).Magnitude;local a9=(a4-a5).Magnitude;local aa=CFrame.fromMatrix((a3+a5)/2,n.CurrentCamera.CFrame.XVector,n.CurrentCamera.CFrame.YVector,n.CurrentCamera.CFrame.ZVector)if D~=nil and D>0 then N.Horizontal.CFrame=aa;N.Horizontal.Mesh.Scale=Vector3.new(a8-a7*2,a9,0)N.Vertical.CFrame=aa;N.Vertical.Mesh.Scale=Vector3.new(a8,a9-a7*2,0)else N.Horizontal.CFrame=aa;N.Horizontal.Mesh.Scale=Vector3.new(a8,a9,0)end;if D~=nil and D>0 then local ab=CFrame.new(-a8/2+a7,a9/2-a7,0)N.TopLeft.CFrame=aa*ab*s;N.TopLeft.Mesh.Scale=Vector3.new(0,a7*2,a7*2)local ac=CFrame.new(a8/2-a7,a9/2-a7,0)N.TopRight.CFrame=aa*ac*s;N.TopRight.Mesh.Scale=Vector3.new(0,a7*2,a7*2)local ad=CFrame.new(-a8/2+a7,-a9/2+a7,0)N.BottomLeft.CFrame=aa*ad*s;N.BottomLeft.Mesh.Scale=Vector3.new(0,a7*2,a7*2)local ae=CFrame.new(a8/2-a7,-a9/2+a7,0)N.BottomRight.CFrame=aa*ae*s;N.BottomRight.Mesh.Scale=Vector3.new(0,a7*2,a7*2)end end,{D,v})k(function()Y()local af=n.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(Y)local ag=n.CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(Y)local ah=n.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(Y)return function()af:Disconnect()ag:Disconnect()ah:Disconnect()end end,{Y})return b.createElement("Frame",{[b.Change.AbsoluteSize]=function(ai)local aj=z()local ak=ai.AbsoluteSize;local V=Vector2.new(aj,aj)local Q=ak-V;local al=ai.AbsolutePosition;local y=ai.AbsoluteSize/2;local R=al+y;P(Q,R)task.spawn(Y)end,[b.Change.AbsolutePosition]=function(ai)local aj=z()local ak=ai.AbsoluteSize;local V=Vector2.new(aj,aj)local Q=ak-V;local al=ai.AbsolutePosition;local y=ai.AbsoluteSize/2;local R=al+y;P(Q,R)task.spawn(Y)end,Size=r(1,1),BackgroundTransparency=1})end;A=i(L)return{default=f}end,newEnv("Orca.components.Acrylic.Acrylic"))()end)newModule("Acrylic.story","ModuleScript","Orca.components.Acrylic.Acrylic.story","Orca.components.Acrylic",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local am=a.import(script,a.getModule(script,"@rbxts","roact-rodux-hooked").out).Provider;local B=a.import(script,script.Parent,"Acrylic").default;local an=a.import(script,script.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ao=a.import(script,script.Parent.Parent.Parent,"store","store").configureStore;local ap=a.import(script,script.Parent.Parent.Parent,"utils","color3").hex;local aq=a.import(script,script.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;return function(as)local at=b.mount(b.createElement(am,{store=ao({dashboard={isOpen=true,page=an.Apps,hint=nil,apps={}}})},{b.createElement("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=r(0.3,0.7),Size=ar(250,350),BackgroundColor3=ap("#000000"),BackgroundTransparency=0.5,BorderSizePixel=0},{b.createElement("UICorner",{CornerRadius=UDim.new(0,64)}),b.createElement(B,{radius=52})})}),as,"Acrylic")return function()return b.unmount(at)end end end,newEnv("Orca.components.Acrylic.Acrylic.story"))()end)newModule("acrylic-instance","ModuleScript","Orca.components.Acrylic.acrylic-instance","Orca.components.Acrylic",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local au=a.import(script,a.getModule(script,"@rbxts","make"))local av={Color=Color3.new(0,0,0),Material=Enum.Material.Glass,Size=Vector3.new(1,1,0),Anchored=true,CanCollide=false,Locked=true,CastShadow=false,Transparency=0.999}local aw={Color=Color3.new(0,0,0),Material=Enum.Material.Glass,Size=Vector3.new(0,1,1),Anchored=true,CanCollide=false,Locked=true,CastShadow=false,Transparency=0.999}local ax={}local ay="Children"local az={Name="Horizontal",Children={au("SpecialMesh",{MeshType=Enum.MeshType.Brick,Offset=Vector3.new(0,0,-0.000001)})}}for J,K in pairs(av)do az[J]=K end;local aA=au("Part",az)local aB={Name="Vertical",Children={au("SpecialMesh",{MeshType=Enum.MeshType.Brick,Offset=Vector3.new(0,0,0.000001)})}}for J,K in pairs(av)do aB[J]=K end;local aC=au("Part",aB)local aD={Name="TopRight",Children={au("SpecialMesh",{MeshType=Enum.MeshType.Cylinder})}}for J,K in pairs(aw)do aD[J]=K end;local aE=au("Part",aD)local aF={Name="TopLeft",Children={au("SpecialMesh",{MeshType=Enum.MeshType.Cylinder})}}for J,K in pairs(aw)do aF[J]=K end;local aG=au("Part",aF)local aH={Name="BottomRight",Children={au("SpecialMesh",{MeshType=Enum.MeshType.Cylinder})}}for J,K in pairs(aw)do aH[J]=K end;local aI=au("Part",aH)local aJ={Name="BottomLeft",Children={au("SpecialMesh",{MeshType=Enum.MeshType.Cylinder})}}for J,K in pairs(aw)do aJ[J]=K end;ax[ay]={aA,aC,aE,aG,aI,au("Part",aJ)}local o=au("Model",ax)return{acrylicInstance=o}end,newEnv("Orca.components.Acrylic.acrylic-instance"))()end)newModule("ActionButton","ModuleScript","Orca.components.ActionButton","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local aK=h.useState;local aL=a.import(script,script.Parent,"BrightButton").default;local aM=a.import(script,script.Parent.Parent,"hooks","common","rodux-hooks")local aN=aM.useAppDispatch;local p=aM.useAppSelector;local aO=a.import(script,script.Parent.Parent,"hooks","common","use-spring").useSpring;local aP=a.import(script,script.Parent.Parent,"store","actions","dashboard.action")local aQ=aP.clearHint;local aR=aP.setHint;local aS=a.import(script,script.Parent.Parent,"store","actions","jobs.action").setJobActive;local ar=a.import(script,script.Parent.Parent,"utils","udim2").px;local function aT(C)local aU=C.action;local aV=C.hint;local aW=C.theme;local aX=C.image;local R=C.position;local aY=C.canDeactivate;local aZ=aN()local a_=p(function(F)return F.jobs[aU].active end)local Z=aK(false)local b0=Z[1]local b1=Z[2]local b2=aW.highlight[aU]~=nil and aW.highlight[aU]or aW.background;if not(aW.highlight[aU]~=nil)then warn("ActionButton: "..aU.." is not in theme.highlight")end;local b3;if a_ then b3=b2 else local b4;if b0 then local b5=aW.button.backgroundHovered;if b5==nil then b5=aW.button.background:Lerp(b2,0.1)end;b4=b5 else b4=aW.button.background end;b3=b4 end;local b6=aO(b3,{})local b7=aO(a_ and aW.button.foregroundAccent and aW.button.foregroundAccent or aW.button.foreground,{})return b.createElement(aL,{onActivate=function()if a_ and aY then aZ(aS(aU,false))elseif not a_ then aZ(aS(aU,true))end end,onHover=function(b0)if b0 then b1(true)aZ(aR(aV))else b1(false)aZ(aQ())end end,size=ar(61,49),position=R,radius=8,color=b6,borderEnabled=aW.button.outlined,borderColor=b7,transparency=aW.button.backgroundTransparency},{b.createElement("ImageLabel",{Image=aX,ImageColor3=b7,ImageTransparency=aO(a_ and 0 or(b0 and aW.button.foregroundTransparency-0.25 or aW.button.foregroundTransparency),{}),Size=ar(36,36),Position=ar(12,6),BackgroundTransparency=1})})end;local f=i(aT)return{default=f}end,newEnv("Orca.components.ActionButton"))()end)newModule("Border","ModuleScript","Orca.components.Border","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local b8=a.import(script,script.Parent.Parent,"utils","binding-util")local b9=b8.asBinding;local ba=b8.mapBinding;local ap=a.import(script,script.Parent.Parent,"utils","color3").hex;local ar=a.import(script,script.Parent.Parent,"utils","udim2").px;local function bb(C)local Q=C.size;if Q==nil then Q=1 end;local D=C.radius;if D==nil then D=0 end;local bc=C.color;if bc==nil then bc=ap("#ffffff")end;local bd=C.transparency;if bd==nil then bd=0 end;local be=C[b.Children]local bf={Size=ba(Q,function(bg)return UDim2.new(1,-bg*2,1,-bg*2)end),Position=ba(Q,function(bg)return ar(bg,bg)end),BackgroundTransparency=1}local G={}local H=#G;local bh={Thickness=Q,Color=bc,Transparency=bd}local bi={}local bj=#bi;if be then for J,K in pairs(be)do if type(J)=="number"then bi[bj+J]=K else bi[J]=K end end end;G[H+1]=b.createElement("UIStroke",bh,bi)G[H+2]=b.createElement("UICorner",{CornerRadius=b.joinBindings({radius=b9(D),size=b9(Q)}):map(function(bk)local D=bk.radius;local Q=bk.size;return D=="circular"and UDim.new(1,0)or UDim.new(0,D-Q*2)end)})return b.createElement("Frame",bf,G)end;local f=i(bb)return{default=f}end,newEnv("Orca.components.Border"))()end)newModule("BrightButton","ModuleScript","Orca.components.BrightButton","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local bb=a.import(script,script.Parent,"Border").default;local bl=a.import(script,script.Parent,"Canvas").default;local bm=a.import(script,script.Parent,"Fill").default;local bn=a.import(script,script.Parent,"Glow")local bo=bn.default;local bp=bn.GlowRadius;local ap=a.import(script,script.Parent.Parent,"utils","color3").hex;local aq=a.import(script,script.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local function aL(C)local Q=C.size;if Q==nil then Q=ar(100,100)end;local R=C.position;if R==nil then R=ar(0,0)end;local D=C.radius;if D==nil then D=8 end;local bc=C.color;if bc==nil then bc=ap("#FFFFFF")end;local bq=C.borderEnabled;local br=C.borderColor;if br==nil then br=ap("#FFFFFF")end;local bd=C.transparency;if bd==nil then bd=0 end;local bs=C.onActivate;local bt=C.onPress;local bu=C.onRelease;local bv=C.onHover;local be=C[b.Children]local bf={size=Q,position=R}local G={b.createElement(bo,{radius=bp.Size70,color=bc,size=UDim2.new(1,36,1,36),position=ar(-18,5-18),transparency=bd}),b.createElement(bm,{color=bc,radius=D,transparency=bd})}local H=#G;local I=bq and b.createElement(bb,{color=br,radius=D,transparency=0.8})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement("TextButton",{Text="",AutoButtonColor=false,Size=r(1,1),BackgroundTransparency=1,[b.Event.Activated]=function()local b3=bs;if b3~=nil then b3=b3()end;return b3 end,[b.Event.MouseButton1Down]=function()local b3=bt;if b3~=nil then b3=b3()end;return b3 end,[b.Event.MouseButton1Up]=function()local b3=bu;if b3~=nil then b3=b3()end;return b3 end,[b.Event.MouseEnter]=function()local b3=bv;if b3~=nil then b3=b3(true)end;return b3 end,[b.Event.MouseLeave]=function()local b3=bv;if b3~=nil then b3=b3(false)end;return b3 end})if be then for J,K in pairs(be)do if type(J)=="number"then G[H+1+J]=K else G[J]=K end end end;return b.createElement(bl,bf,G)end;local f=i(aL)return{default=f}end,newEnv("Orca.components.BrightButton"))()end)newModule("BrightSlider","ModuleScript","Orca.components.BrightSlider","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local bw=a.import(script,a.getModule(script,"@rbxts","flipper").src).Spring;local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local j=h.useCallback;local k=h.useEffect;local aK=h.useState;local bx=a.import(script,a.getModule(script,"@rbxts","services")).UserInputService;local by=a.import(script,script.Parent.Parent,"hooks","common","flipper-hooks")local bz=by.getBinding;local bA=by.useMotor;local aq=a.import(script,script.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local bb=a.import(script,script.Parent,"Border").default;local bl=a.import(script,script.Parent,"Canvas").default;local bm=a.import(script,script.Parent,"Fill").default;local bn=a.import(script,script.Parent,"Glow")local bo=bn.default;local bp=bn.GlowRadius;local bB={frequency=8}local bC;local function bD(C)local bE=C.min;local bF=C.max;local bG=C.initialValue;local Q=C.size;local R=C.position;local D=C.radius;local bc=C.color;local bH=C.accentColor;local bq=C.borderEnabled;local br=C.borderColor;local bd=C.transparency;local bI=C.indicatorTransparency;local bJ=C.onValueChanged;local bu=C.onRelease;local be=C[b.Children]local bK=bA(bG)local bL=bz(bK)k(function()local b3=bJ;if b3~=nil then b3(bG)end end,{})k(function()return function()return bK:destroy()end end,{})local bf={size=Q,position=R}local G={b.createElement(bo,{radius=bp.Size70,color=bH,size=bL:map(function(bM)return UDim2.new((bM-bE)/(bF-bE),36,1,36)end),position=ar(-18,5-18),transparency=0,maintainCornerRadius=true}),b.createElement(bm,{color=bc,radius=D,transparency=bd}),b.createElement(bl,{size=bL:map(function(bM)return r((bM-bE)/(bF-bE),1)end),clipsDescendants=true},{b.createElement("Frame",{Size=Q,BackgroundColor3=bH,BackgroundTransparency=bI},{b.createElement("UICorner",{CornerRadius=UDim.new(0,D)})})})}local H=#G;local I=bq and b.createElement(bb,{color=br,radius=D,transparency=0.8})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement(bC,{onChange=function(bN)bK:setGoal(bw.new(bN*(bF-bE)+bE,bB))local b3=bJ;if b3~=nil then b3(bN*(bF-bE)+bE)end end,onRelease=function(bN)local b3=bu;if b3~=nil then b3=b3(bN*(bF-bE)+bE)end;return b3 end})if be then for J,K in pairs(be)do if type(J)=="number"then G[H+1+J]=K else G[J]=K end end end;return b.createElement(bl,bf,G)end;local f=i(bD)local function bO(C)local bP=C.onChange;local bu=C.onRelease;local Z=aK()local bQ=Z[1]local bR=Z[2]local bS=j(function(bN)bN=math.clamp(bN,0,1)bP(bN)end,{})local bT=j(function(bU,ai)return(bU-ai.AbsolutePosition.X)/ai.AbsoluteSize.X end,{})k(function()return function()local b3=bQ;if b3~=nil then b3:Disconnect()end end end,{})return b.createElement("Frame",{Active=true,Size=r(1,1),BackgroundTransparency=1,[b.Event.InputBegan]=function(ai,bV)if bV.UserInputType==Enum.UserInputType.MouseButton1 then local b3=bQ;if b3~=nil then b3:Disconnect()end;local at=bx.InputChanged:Connect(function(bV)if bV.UserInputType==Enum.UserInputType.MouseMovement then bS(bT(bV.Position.X,ai))end end)bR(at)bS(bT(bV.Position.X,ai))end end,[b.Event.InputEnded]=function(ai,bV)if bV.UserInputType==Enum.UserInputType.MouseButton1 then local b3=bQ;if b3~=nil then b3:Disconnect()end;bR(nil)bu(bT(bV.Position.X,ai))end end})end;bC=i(bO)return{default=f}end,newEnv("Orca.components.BrightSlider"))()end)newModule("Canvas","ModuleScript","Orca.components.Canvas","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local ba=a.import(script,script.Parent.Parent,"utils","binding-util").mapBinding;local r=a.import(script,script.Parent.Parent,"utils","udim2").scale;local function bl(C)local Q=C.size;if Q==nil then Q=r(1,1)end;local R=C.position;if R==nil then R=r(0,0)end;local bW=C.anchor;local bX=C.padding;local bY=C.clipsDescendants;local bZ=C.zIndex;local bP=C.onChange;if bP==nil then bP={}end;local be=C[b.Children]local bf={Size=Q,Position=R,AnchorPoint=bW,ClipsDescendants=bY,BackgroundTransparency=1,ZIndex=bZ}for J,K in pairs(bP)do bf[b.Change[J]]=K end;local G={}local H=#G;local I=bX~=nil and b.createFragment({padding=b.createElement("UIPadding",{PaddingTop=ba(bX.top,function(ar)return UDim.new(0,ar)end),PaddingRight=ba(bX.right,function(ar)return UDim.new(0,ar)end),PaddingBottom=ba(bX.bottom,function(ar)return UDim.new(0,ar)end),PaddingLeft=ba(bX.left,function(ar)return UDim.new(0,ar)end)})})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;if be then for J,K in pairs(be)do if type(J)=="number"then G[H+J]=K else G[J]=K end end end;return b.createElement("Frame",bf,G)end;local f=i(bl)return{default=f}end,newEnv("Orca.components.Canvas"))()end)newModule("Card","ModuleScript","Orca.components.Card","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local B=a.import(script,script.Parent,"Acrylic").default;local bb=a.import(script,script.Parent,"Border").default;local bl=a.import(script,script.Parent,"Canvas").default;local bm=a.import(script,script.Parent,"Fill").default;local bn=a.import(script,script.Parent,"Glow")local bo=bn.default;local bp=bn.GlowRadius;local b_=a.import(script,script.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local aO=a.import(script,script.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local ar=a.import(script,script.Parent.Parent,"utils","udim2").px;local function c1(C)local c2=C.index;local c3=C.page;local aW=C.theme;local Q=C.size;local R=C.position;local be=C[b.Children]local c4=c0(c3)local c5=b_(c4,c2*40)local c6=UDim2.new(UDim.new(),R.Y)local y=ar((Q.X.Offset+48)*2-R.X.Offset,0)local c7=ar(Q.X.Offset+48*2,0)local c8=c6-y-c7;local bf={anchor=Vector2.new(0,1),size=Q,position=aO(c5 and R or c8,{frequency=2,dampingRatio=0.8})}local G={b.createElement(bo,{radius=bp.Size198,size=UDim2.new(1,100,1,96),position=ar(-50,-28),color=aW.dropshadow,gradient=aW.dropshadowGradient,transparency=aW.dropshadowTransparency}),b.createElement(bm,{color=aW.background,gradient=aW.backgroundGradient,transparency=aW.transparency,radius=16})}local H=#G;if be then for J,K in pairs(be)do if type(J)=="number"then G[H+J]=K else G[J]=K end end end;H=#G;local I=aW.acrylic and b.createFragment({acrylic=b.createElement(B)})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;local c9=aW.outlined and b.createElement(bb,{color=aW.foreground,radius=16,transparency=0.8})if c9 then if c9.elements~=nil or c9.props~=nil and c9.component~=nil then G[H+1]=c9 else for J,K in ipairs(c9)do G[H+J]=K end end end;return b.createElement(bl,bf,G)end;local f=i(c1)return{default=f}end,newEnv("Orca.components.Card"))()end)newModule("Fill","ModuleScript","Orca.components.Fill","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local ba=a.import(script,script.Parent.Parent,"utils","binding-util").mapBinding;local ap=a.import(script,script.Parent.Parent,"utils","color3").hex;local r=a.import(script,script.Parent.Parent,"utils","udim2").scale;local function bm(C)local bc=C.color;if bc==nil then bc=ap("#ffffff")end;local ca=C.gradient;local bd=C.transparency;if bd==nil then bd=0 end;local D=C.radius;if D==nil then D=0 end;local be=C[b.Children]local bf={Size=r(1,1),BackgroundColor3=bc,BackgroundTransparency=bd}local G={}local H=#G;local I=ca and b.createFragment({gradient=b.createElement("UIGradient",{Color=ca.color,Transparency=ca.transparency,Rotation=ca.rotation})})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;local c9=D~=nil and b.createFragment({corner=b.createElement("UICorner",{CornerRadius=ba(D,function(cb)return cb=="circular"and UDim.new(1,0)or UDim.new(0,cb)end)})})if c9 then if c9.elements~=nil or c9.props~=nil and c9.component~=nil then G[H+1]=c9 else for J,K in ipairs(c9)do G[H+J]=K end end end;H=#G;if be then for J,K in pairs(be)do if type(J)=="number"then G[H+J]=K else G[J]=K end end end;return b.createElement("Frame",bf,G)end;local f=i(bm)return{default=f}end,newEnv("Orca.components.Fill"))()end)newModule("Glow","ModuleScript","Orca.components.Glow","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local cc=h.useBinding;local cd=a.import(script,script.Parent.Parent,"hooks","use-scale").useScale;local b9=a.import(script,script.Parent.Parent,"utils","binding-util").asBinding;local q=a.import(script,script.Parent.Parent,"utils","number-util").map;local aq=a.import(script,script.Parent.Parent,"utils","udim2")local ce=aq.applyUDim2;local ar=aq.px;local bl=a.import(script,script.Parent,"Canvas").default;local bp;do local cf={}bp=setmetatable({},{__index=cf})bp.Size70="rbxassetid://8992230903"cf["rbxassetid://8992230903"]="Size70"bp.Size146="rbxassetid://8992584561"cf["rbxassetid://8992584561"]="Size146"bp.Size198="rbxassetid://8992230677"cf["rbxassetid://8992230677"]="Size198"end;local cg={[bp.Size70]=70/2,[bp.Size146]=146/2,[bp.Size198]=198/2}local function bo(C)local D=C.radius;local Q=C.size;local R=C.position;local bc=C.color;local ca=C.gradient;local bd=C.transparency;if bd==nil then bd=0 end;local ch=C.maintainCornerRadius;local be=C[b.Children]local Z=cc(Vector2.new())local ci=Z[1]local cj=Z[2]local ck=cd()local cl=cg[D]local cm=ch and b.joinBindings({absoluteSize=ci,scaleFactor=ck,size=b9(Q)}):map(function(bk)local ci=bk.absoluteSize;local Q=bk.size;local ck=bk.scaleFactor;local cn=ce(ci,Q,ck)return ar(math.max(cn.X,cl*2),math.max(cn.Y,cl*2))end)or Q;local co=ch and b.joinBindings({absoluteSize=ci,scaleFactor=ck,size=b9(Q),transparency=b9(bd)}):map(function(bk)local ci=bk.absoluteSize;local Q=bk.size;local bd=bk.transparency;local ck=bk.scaleFactor;local cp=cl*2;local cn=ce(ci,UDim2.fromScale(Q.X.Scale,Q.Y.Scale),ck).X;if cn<cp then return 1-(1-bd)*q(cn,0,cp,0,1)else return bd end end)or bd;local bf={onChange={AbsoluteSize=ch and function(ai)return cj(ai.AbsoluteSize)end or nil}}local G={}local H=#G;local bh={Image=D,ImageColor3=bc,ImageTransparency=co,ScaleType="Slice",SliceCenter=Rect.new(Vector2.new(cl,cl),Vector2.new(cl,cl)),SliceScale=ck:map(function(cq)return cq*0.1+0.9 end),Size=cm,Position=R,BackgroundTransparency=1}local bi={}local bj=#bi;local I=ca and b.createFragment({gradient=b.createElement("UIGradient",{Color=ca.color,Transparency=ca.transparency,Rotation=ca.rotation})})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then bi[bj+1]=I else for J,K in ipairs(I)do bi[bj+J]=K end end end;bj=#bi;if be then for J,K in pairs(be)do if type(J)=="number"then bi[bj+J]=K else bi[J]=K end end end;G[H+1]=b.createElement("ImageLabel",bh,bi)return b.createElement(bl,bf,G)end;local f=i(bo)return{GlowRadius=bp,RADIUS_TO_CENTER_OFFSET=cg,default=f}end,newEnv("Orca.components.Glow"))()end)newModule("ParallaxImage","ModuleScript","Orca.components.ParallaxImage","Orca.components",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local ba=a.import(script,script.Parent.Parent,"utils","binding-util").mapBinding;local r=a.import(script,script.Parent.Parent,"utils","udim2").scale;local function cr(C)local aX=C.image;local cs=C.imageSize;local ct=C.offset;local bX=C.padding;local be=C[b.Children]local bf={Image=aX}local y=bX*2;bf.ImageRectSize=cs-y;bf.ImageRectOffset=ba(ct,function(cu)local c7=cu*bX;return bX+c7 end)bf.ScaleType="Crop"bf.Size=r(1,1)bf.BackgroundTransparency=1;local G={}local H=#G;if be then for J,K in pairs(be)do if type(J)=="number"then G[H+J]=K else G[J]=K end end end;return b.createElement("ImageLabel",bf,G)end;local f=cr;return{default=f}end,newEnv("Orca.components.ParallaxImage"))()end)newModule("constants","ModuleScript","Orca.constants","Orca",function()return setfenv(function()local cv=getgenv==nil;local b5=VERSION;if b5==nil then b5="studio"end;local cw=b5;return{IS_DEV=cv,VERSION_TAG=cw}end,newEnv("Orca.constants"))()end)newInstance("context","Folder","Orca.context","Orca")newModule("scale-context","ModuleScript","Orca.context.scale-context","Orca.context",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local cx=b.createContext(b.createBinding(1))return{ScaleContext=cx}end,newEnv("Orca.context.scale-context"))()end)newInstance("hooks","Folder","Orca.hooks","Orca")newInstance("common","Folder","Orca.hooks.common","Orca.hooks")newModule("flipper-hooks","ModuleScript","Orca.hooks.common.flipper-hooks","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local g={}g.getBinding=a.import(script,script,"get-binding").getBinding;g.useGoal=a.import(script,script,"use-goal").useGoal;g.useInstant=a.import(script,script,"use-instant").useInstant;g.useLinear=a.import(script,script,"use-linear").useLinear;g.useMotor=a.import(script,script,"use-motor").useMotor;g.useSpring=a.import(script,script,"use-spring").useSpring;return g end,newEnv("Orca.hooks.common.flipper-hooks"))()end)newModule("get-binding","ModuleScript","Orca.hooks.common.flipper-hooks.get-binding","Orca.hooks.common.flipper-hooks",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local cy=a.import(script,a.getModule(script,"@rbxts","flipper").src).isMotor;local cz=a.import(script,a.getModule(script,"@rbxts","roact").src).createBinding;local cA=setmetatable({},{__tostring=function()return"AssignedBinding"end})local function bz(cB)assert(cB,"Missing argument #1: motor")local y=cy(cB)assert(y,"Provided value is not a motor")if cB[cA]~=nil then return cB[cA]end;local cC,cD=cz(cB:getValue())cB:onStep(cD)cB[cA]=cC;return cC end;return{getBinding=bz}end,newEnv("Orca.hooks.common.flipper-hooks.get-binding"))()end)newModule("use-goal","ModuleScript","Orca.hooks.common.flipper-hooks.use-goal","Orca.hooks.common.flipper-hooks",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local bz=a.import(script,script.Parent,"get-binding").getBinding;local bA=a.import(script,script.Parent,"use-motor").useMotor;local function cE(cF)local cB=bA(cF._targetValue)cB:setGoal(cF)return bz(cB)end;return{useGoal=cE}end,newEnv("Orca.hooks.common.flipper-hooks.use-goal"))()end)newModule("use-instant","ModuleScript","Orca.hooks.common.flipper-hooks.use-instant","Orca.hooks.common.flipper-hooks",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local cG=a.import(script,a.getModule(script,"@rbxts","flipper").src).Instant;local cE=a.import(script,script.Parent,"use-goal").useGoal;local function cH(cI)return cE(cG.new(cI))end;return{useInstant=cH}end,newEnv("Orca.hooks.common.flipper-hooks.use-instant"))()end)newModule("use-linear","ModuleScript","Orca.hooks.common.flipper-hooks.use-linear","Orca.hooks.common.flipper-hooks",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local cJ=a.import(script,a.getModule(script,"@rbxts","flipper").src).Linear;local cE=a.import(script,script.Parent,"use-goal").useGoal;local function cK(cI,cL)return cE(cJ.new(cI,cL))end;return{useLinear=cK}end,newEnv("Orca.hooks.common.flipper-hooks.use-linear"))()end)newModule("use-motor","ModuleScript","Orca.hooks.common.flipper-hooks.use-motor","Orca.hooks.common.flipper-hooks",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local cM=a.import(script,a.getModule(script,"@rbxts","flipper").src)local cN=cM.GroupMotor;local cO=cM.SingleMotor;local m=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out.hooks).useMutable;local function cP(bG)if type(bG)=="number"then return cO.new(bG)elseif type(bG)=="table"then return cN.new(bG)else error("Invalid type for initialValue. Expected 'number' or 'table', got '"..tostring(bG).."'")end end;local function bA(bG)return m(cP(bG)).current end;return{useMotor=bA}end,newEnv("Orca.hooks.common.flipper-hooks.use-motor"))()end)newModule("use-spring","ModuleScript","Orca.hooks.common.flipper-hooks.use-spring","Orca.hooks.common.flipper-hooks",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local bw=a.import(script,a.getModule(script,"@rbxts","flipper").src).Spring;local cE=a.import(script,script.Parent,"use-goal").useGoal;local function aO(cI,cL)return cE(bw.new(cI,cL))end;return{useSpring=aO}end,newEnv("Orca.hooks.common.flipper-hooks.use-spring"))()end)newModule("rodux-hooks","ModuleScript","Orca.hooks.common.rodux-hooks","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local cQ=a.import(script,a.getModule(script,"@rbxts","roact-rodux-hooked").out)local cR=cQ.useDispatch;local cS=cQ.useSelector;local cT=cQ.useStore;local p=cS;local aN=function()return cR()end;local cU=function()return cT()end;return{useAppSelector=p,useAppDispatch=aN,useAppStore=cU}end,newEnv("Orca.hooks.common.rodux-hooks"))()end)newModule("use-delayed-update","ModuleScript","Orca.hooks.common.use-delayed-update","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local k=h.useEffect;local m=h.useMutable;local aK=h.useState;local cV=a.import(script,script.Parent.Parent.Parent,"utils","timeout")local cW=cV.clearTimeout;local cX=cV.setTimeout;local cY=0;local function cZ(c_,d0)for d1,d2 in pairs(c_)do if d0==nil or d2.resolveTime>=d0 then c_[d1]=nil;cW(d2.timeout)end end end;local function b_(d3,d4,d5)local Z=aK(d3)local d6=Z[1]local d7=Z[2]local c_=m({})k(function()local b3=d5;if b3~=nil then b3=b3(d3)end;if b3 then cZ(c_.current)d7(d3)return nil end;local d8=cY;cY=cY+1;local d1=d8;local d2={timeout=cX(function()d7(d3)c_.current[d1]=nil end,d4),resolveTime=os.clock()+d4}cZ(c_.current,d2.resolveTime)c_.current[d1]=d2 end,{d3})k(function()return function()return cZ(c_.current)end end,{})return d6 end;return{useDelayedUpdate=b_}end,newEnv("Orca.hooks.common.use-delayed-update"))()end)newModule("use-did-mount","ModuleScript","Orca.hooks.common.use-did-mount","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local k=h.useEffect;local m=h.useMutable;local function d9(da)local db=m(da)k(function()if db.current then db.current()end end,{})return db end;local function dc()local db=m(true)k(function()db.current=false end,{})return db.current end;return{useDidMount=d9,useIsMount=dc}end,newEnv("Orca.hooks.common.use-did-mount"))()end)newModule("use-forced-update","ModuleScript","Orca.hooks.common.use-forced-update","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local j=h.useCallback;local aK=h.useState;local function dd()local Z=aK(0)local de=Z[2]return j(function()return de(function(F)return F+1 end)end,{})end;return{useForcedUpdate=dd}end,newEnv("Orca.hooks.common.use-forced-update"))()end)newModule("use-interval","ModuleScript","Orca.hooks.common.use-interval","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local k=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).useEffect;local cV=a.import(script,script.Parent.Parent.Parent,"utils","timeout")local df=cV.clearInterval;local dg=cV.setInterval;local function dh(da,d4,di)if di==nil then di={}end;local aA=function()if d4~=nil then local dj=dg(da,d4)return function()return df(dj)end end end;local dk={da,d4}local H=#dk;table.move(di,1,#di,H+1,dk)k(aA,dk)return dg end;return{useInterval=dh}end,newEnv("Orca.hooks.common.use-interval"))()end)newModule("use-mouse-location","ModuleScript","Orca.hooks.common.use-mouse-location","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local cc=h.useBinding;local k=h.useEffect;local bx=a.import(script,a.getModule(script,"@rbxts","services")).UserInputService;local function dl(bP)local Z=cc(bx:GetMouseLocation())local u=Z[1]local dm=Z[2]k(function()local at=bx.InputChanged:Connect(function(bV)if bV.UserInputType==Enum.UserInputType.MouseMovement then dm(Vector2.new(bV.Position.X,bV.Position.Y))local b3=bP;if b3~=nil then b3(Vector2.new(bV.Position.X,bV.Position.Y))end end end)return function()at:Disconnect()end end,{})return u end;return{useMouseLocation=dl}end,newEnv("Orca.hooks.common.use-mouse-location"))()end)newModule("use-promise","ModuleScript","Orca.hooks.common.use-promise","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local k=h.useEffect;local dn=h.useReducer;local function dp(dq)if type(dq)=="function"then return dq()end;return dq end;local dr={pending="pending",rejected="rejected",resolved="resolved"}local ds={err=nil,result=nil,state=dr.pending}local function dt(F,aU)local aA=aU.type;repeat if aA==dr.pending then return ds end;if aA==dr.resolved then return{err=nil,result=aU.payload,state=dr.resolved}end;if aA==dr.rejected then return{err=aU.payload,result=nil,state=dr.rejected}end;return F until true end;local function du(dq,di)if di==nil then di={}end;local Z=dn(dt,ds)local dv=Z[1]local dw=dv.err;local dx=dv.result;local F=dv.state;local aZ=Z[2]k(function()dq=dp(dq)if not dq then return nil end;local dy=false;aZ({type=dr.pending})local y=function(dx)return not dy and aZ({payload=dx,type=dr.resolved})end;local dz=function(dw)return not dy and aZ({payload=dw,type=dr.rejected})end;dq:andThen(y,dz)return function()dy=true end end,di)return{dx,dw,F}end;return{usePromise=du}end,newEnv("Orca.hooks.common.use-promise"))()end)newModule("use-set-state","ModuleScript","Orca.hooks.common.use-set-state","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local aK=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).useState;local function dA(dB)local Z=aK(dB)local F=Z[1]local de=Z[2]local dC=function(aU)return de(function(bg)local ax={}if type(bg)=="table"then for J,K in pairs(bg)do ax[J]=K end end;local b3;if type(aU)=="function"then b3=aU(bg)else b3=aU end;if type(b3)=="table"then for J,K in pairs(b3)do ax[J]=K end end;return ax end)end;return{F,dC}end;return{default=dA}end,newEnv("Orca.hooks.common.use-set-state"))()end)newModule("use-spring","ModuleScript","Orca.hooks.common.use-spring","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local bw=a.import(script,a.getModule(script,"@rbxts","flipper").src).Spring;local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local by=a.import(script,script.Parent,"flipper-hooks")local bz=by.getBinding;local bA=by.useMotor;local dD=by.useSpring;local dE={number=dD,Color3=function(bc,cL)local cB=bA({bc.R,bc.G,bc.B})cB:setGoal({bw.new(bc.R,cL),bw.new(bc.G,cL),bw.new(bc.B,cL)})return bz(cB):map(function(C)local cb=C[1]local dF=C[2]local dG=C[3]return Color3.new(cb,dF,dG)end)end,UDim=function(dH,cL)local cB=bA({dH.Scale,dH.Offset})cB:setGoal({bw.new(dH.Scale,cL),bw.new(dH.Offset,cL)})return bz(cB):map(function(C)local bg=C[1]local cu=C[2]return UDim.new(bg,cu)end)end,UDim2=function(dI,cL)local cB=bA({dI.X.Scale,dI.X.Offset,dI.Y.Scale,dI.Y.Offset})cB:setGoal({bw.new(dI.X.Scale,cL),bw.new(dI.X.Offset,cL),bw.new(dI.Y.Scale,cL),bw.new(dI.Y.Offset,cL)})return bz(cB):map(function(C)local dJ=C[1]local dK=C[2]local dL=C[3]local dM=C[4]return UDim2.new(dJ,math.round(dK),dL,math.round(dM))end)end,Vector2=function(dN,cL)local cB=bA({dN.X,dN.Y})cB:setGoal({bw.new(dN.X,cL),bw.new(dN.Y,cL)})return bz(cB):map(function(C)local dO=C[1]local dP=C[2]return Vector2.new(dO,dP)end)end}local function aO(d3,cL)if not cL then return b.createBinding(d3)end;local aO=dE[typeof(d3)]local dz="useAnySpring: "..typeof(d3).." is not supported"assert(aO,dz)return aO(d3,cL)end;return{useSpring=aO}end,newEnv("Orca.hooks.common.use-spring"))()end)newModule("use-viewport-size","ModuleScript","Orca.hooks.common.use-viewport-size","Orca.hooks.common",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local cc=h.useBinding;local k=h.useEffect;local aK=h.useState;local n=a.import(script,a.getModule(script,"@rbxts","services")).Workspace;local function dQ(bP)local Z=aK(n.CurrentCamera)local dR=Z[1]local dS=Z[2]local dv=cc(dR.ViewportSize)local Q=dv[1]local dT=dv[2]k(function()local at=n:GetPropertyChangedSignal("CurrentCamera"):Connect(function()if n.CurrentCamera then dS(n.CurrentCamera)dT(n.CurrentCamera.ViewportSize)local b3=bP;if b3~=nil then b3(n.CurrentCamera.ViewportSize)end end end)return function()at:Disconnect()end end,{})k(function()local at=dR:GetPropertyChangedSignal("ViewportSize"):Connect(function()dT(dR.ViewportSize)local b3=bP;if b3~=nil then b3(dR.ViewportSize)end end)return function()at:Disconnect()end end,{dR})return Q end;return{useViewportSize=dQ}end,newEnv("Orca.hooks.common.use-viewport-size"))()end)newModule("use-current-page","ModuleScript","Orca.hooks.use-current-page","Orca.hooks",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local p=a.import(script,script.Parent,"common","rodux-hooks").useAppSelector;local function dU()return p(function(F)return F.dashboard.page end)end;local function c0(c3)return p(function(F)return F.dashboard.isOpen and F.dashboard.page==c3 end)end;return{useCurrentPage=dU,useIsPageOpen=c0}end,newEnv("Orca.hooks.use-current-page"))()end)newModule("use-friends","ModuleScript","Orca.hooks.use-friends","Orca.hooks",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local l=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).useMemo;local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local du=a.import(script,script.Parent,"common","use-promise").usePromise;local function dW(di)return du(a.async(function()return dV.LocalPlayer:GetFriendsOnline()end),di)end;local function dX(di)local Z=dW(di)local dY=Z[1]local dw=Z[2]local dZ=Z[3]local d_=dY;if d_~=nil then local y=function(e0)return e0.PlaceId~=nil and e0.GameId~=nil end;local e1={}local H=0;for J,K in ipairs(d_)do if y(K,J-1,d_)==true then H=H+1;e1[H]=K end end;d_=e1 end;local e2=d_;return{e2,dw,dZ}end;local function e3(di)local Z=dX(di)local dY=Z[1]local dw=Z[2]local dZ=Z[3]local e4=l(function()return{}end,di)if not dY or#e4>0 then return{e4,dw,dZ}end;local y=function(e0)local c7=function(dF)return dF.placeId==e0.PlaceId end;local b3=nil;for e5,K in ipairs(e4)do if c7(K,e5-1,e4)==true then b3=K;break end end;local e6=b3;if not e6 then e6={friends={e0},placeId=e0.PlaceId,thumbnail="https://www.roblox.com/asset-thumbnail/image?assetId="..tostring(e0.PlaceId).."&width=768&height=432&format=png"}local e7=e6;e4[#e4+1]=e7 else local e8=e6.friends;e8[#e8+1]=e0 end end;for J,K in ipairs(dY)do y(K,J-1,dY)end;return{e4,dw,dZ}end;return{useFriends=dW,useFriendsPlaying=dX,useFriendActivity=e3}end,newEnv("Orca.hooks.use-friends"))()end)newModule("use-parallax-offset","ModuleScript","Orca.hooks.use-parallax-offset","Orca.hooks",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local bw=a.import(script,a.getModule(script,"@rbxts","flipper").src).Spring;local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local by=a.import(script,script.Parent,"common","flipper-hooks")local bz=by.getBinding;local bA=by.useMotor;local dl=a.import(script,script.Parent,"common","use-mouse-location").useMouseLocation;local dQ=a.import(script,script.Parent,"common","use-viewport-size").useViewportSize;local function e9()local ea=bA({0,0})local eb=bz(ea)local ec=dQ()local ct=b.joinBindings({viewportSize=ec,mouseLocation=eb}):map(function(C)local ec=C.viewportSize;local Z=C.mouseLocation;local bU=Z[1]local ed=Z[2]return Vector2.new((bU-ec.X/2)/ec.X,(ed-ec.Y/2)/ec.Y)end)dl(function(u)ea:setGoal({bw.new(u.X,{dampingRatio=5}),bw.new(u.Y,{dampingRatio=5})})end)return ct end;return{useParallaxOffset=e9}end,newEnv("Orca.hooks.use-parallax-offset"))()end)newModule("use-scale","ModuleScript","Orca.hooks.use-scale","Orca.hooks",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local ee=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).useContext;local cx=a.import(script,script.Parent.Parent,"context","scale-context").ScaleContext;local ef=b.createBinding(1)local function cd()local b5=ee(cx)if b5==nil then b5=ef end;return b5 end;return{useScale=cd}end,newEnv("Orca.hooks.use-scale"))()end)newModule("use-theme","ModuleScript","Orca.hooks.use-theme","Orca.hooks",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local p=a.import(script,script.Parent,"common","rodux-hooks").useAppSelector;local eg=a.import(script,script.Parent.Parent,"themes").getThemes;local eh=a.import(script,script.Parent.Parent,"themes","dark-theme").darkTheme;local function ei(ej)return p(function(F)local aA=eg()local y=function(ek)return ek.name==F.options.currentTheme end;local b3=nil;for e5,K in ipairs(aA)do if y(K,e5-1,aA)==true then b3=K;break end end;local aW=b3;return aW and aW[ej]or eh[ej]end)end;return{useTheme=ei}end,newEnv("Orca.hooks.use-theme"))()end)newModule("jobs","ModuleScript","Orca.jobs","Orca",function()return setfenv(function()local a=require(script.Parent.include.RuntimeLib)local g={}g.setStore=a.import(script,script,"helpers","job-store").setStore;return g end,newEnv("Orca.jobs"))()end)newModule("acrylic","LocalScript","Orca.jobs.acrylic","Orca.jobs",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local au=a.import(script,a.getModule(script,"@rbxts","make"))local el=a.import(script,a.getModule(script,"@rbxts","services")).Lighting;local em=a.import(script,script.Parent,"helpers","job-store").getStore;local cX=a.import(script,script.Parent.Parent,"utils","timeout").setTimeout;local en=au("DepthOfFieldEffect",{FarIntensity=0,InFocusRadius=0.1,NearIntensity=1})local eo={}local function ep()for eq in pairs(eo)do eq.Enabled=false end;en.Parent=el end;local function er()for eq,es in pairs(eo)do eq.Enabled=es.enabled end;en.Parent=nil end;local et=a.async(function()local eu=a.await(em())for ev,eq in ipairs(el:GetChildren())do if eq:IsA("DepthOfFieldEffect")then local dz={enabled=eq.Enabled}eo[eq]=dz end end;local ew;eu.changed:connect(function(ex)local b3=ew;if b3~=nil then b3:clear()end;ew=nil;if not ex.dashboard.isOpen then ew=cX(er,500)return nil end;if ex.options.config.acrylicBlur then ep()else er()end end)end)et():catch(function(dw)warn("[acrylic-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.acrylic"))()end)newInstance("character","Folder","Orca.jobs.character","Orca.jobs")newModule("flight","LocalScript","Orca.jobs.character.flight","Orca.jobs.character",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local cM=a.import(script,a.getModule(script,"@rbxts","flipper").src)local cN=cM.GroupMotor;local bw=cM.Spring;local ey=a.import(script,a.getModule(script,"@rbxts","services"))local dV=ey.Players;local ez=ey.RunService;local bx=ey.UserInputService;local n=ey.Workspace;local eA=a.import(script,script.Parent.Parent,"helpers","job-store").onJobChange;local eB=dV.LocalPlayer;local eC={forward=Vector3.new(),backward=Vector3.new(),left=Vector3.new(),right=Vector3.new(),up=Vector3.new(),down=Vector3.new()}local eD=false;local eE=16;local eF;local eG;local eH=cN.new({0,0,0},false)local eI,eJ,eK,eL;local et=a.async(function()a.await(eA("flight",function(eM)eD=eM.active;eE=eM.value;if eD then eI()eJ()end end))bx.InputBegan:Connect(function(bV,eN)if eN then return nil end;eK(bV.KeyCode,true)end)bx.InputEnded:Connect(function(bV)eK(bV.KeyCode,false)end)ez.Heartbeat:Connect(function(eO)if eD and(eF and eG)then eL(eO)eH:setGoal({bw.new(eG.X),bw.new(eG.Y),bw.new(eG.Z)})eH:step(eO)local Z=eH:getValue()local bU=Z[1]local ed=Z[2]local eP=Z[3]eF.AssemblyLinearVelocity=Vector3.new()local eQ=n.CurrentCamera.CFrame.Rotation;local eR=Vector3.new(bU,ed,eP)eF.CFrame=eQ+eR end end)ez.RenderStepped:Connect(function()if eD and(eF and eG)then local eQ=n.CurrentCamera.CFrame.Rotation;local eS=eF.CFrame.Position;eF.CFrame=eQ+eS end end)eB.CharacterAdded:Connect(function(eT)local eU=eT:WaitForChild("HumanoidRootPart",5)if eU and eU:IsA("BasePart")then eF=eU end;eI()eJ()end)local eV=eB.Character;if eV~=nil then eV=eV:FindFirstChild("HumanoidRootPart")end;local eW=eV;if eW and eW:IsA("BasePart")then eF=eW;eI()end end)local function eX()local eY=Vector3.new()for ev,eZ in pairs(eC)do eY=eY+eZ end;return eY.Magnitude>0 and eY.Unit or eY end;function eI()if not eF then return nil end;local Z=n.CurrentCamera.CFrame;local e_=Z.XVector;local f0=Z.YVector;local f1=Z.ZVector;eG=CFrame.fromMatrix(eF.Position,e_,f0,f1)end;function eJ()if not eG then return nil end;eH=cN.new({eG.X,eG.Y,eG.Z},false)end;function eL(eO)if not eG then return nil end;local Z=n.CurrentCamera.CFrame;local e_=Z.XVector;local f0=Z.YVector;local f1=Z.ZVector;local f2=eX()if f2.Magnitude>0 then local y=eE*eO;local dv=f2*y;local dO=dv.X;local dP=dv.Y;local f3=dv.Z;local aA=CFrame.fromMatrix(eG.Position,e_,f0,f1)local ab=CFrame.new(dO,dP,f3)eG=aA*ab else eG=CFrame.fromMatrix(eG.Position,e_,f0,f1)end end;function eK(f4,f5)repeat if f4==Enum.KeyCode.W then eC.forward=f5 and Vector3.new(0,0,-1)or Vector3.new()break end;if f4==Enum.KeyCode.S then eC.backward=f5 and Vector3.new(0,0,1)or Vector3.new()break end;if f4==Enum.KeyCode.A then eC.left=f5 and Vector3.new(-1,0,0)or Vector3.new()break end;if f4==Enum.KeyCode.D then eC.right=f5 and Vector3.new(1,0,0)or Vector3.new()break end;if f4==Enum.KeyCode.Q then eC.up=f5 and Vector3.new(0,-1,0)or Vector3.new()break end;if f4==Enum.KeyCode.E then eC.down=f5 and Vector3.new(0,1,0)or Vector3.new()break end until true end;et():catch(function(dw)warn("[flight-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.character.flight"))()end)newModule("ghost","LocalScript","Orca.jobs.character.ghost","Orca.jobs.character",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local ey=a.import(script,a.getModule(script,"@rbxts","services"))local dV=ey.Players;local n=ey.Workspace;local f6=a.import(script,script.Parent.Parent,"helpers","job-store")local em=f6.getStore;local eA=f6.onJobChange;local eB=dV.LocalPlayer;local f7={}local f8;local f9;local fa;local function fb()local fc=eB:FindFirstChildWhichIsA("PlayerGui")if fc then for ev,fd in ipairs(fc:GetChildren())do if fd:IsA("ScreenGui")and fd.ResetOnSpawn then f7[#f7+1]=fd;fd.ResetOnSpawn=false end end end end;local function fe()for ev,ff in ipairs(f7)do ff.ResetOnSpawn=true end;table.clear(f7)end;local fg,fh,fi,fj;local et=a.async(function()a.await(eA("ghost",function(eM,F)if F.jobs.refresh.active and eM.active then fg()elseif eM.active then fh():andThen(fi):catch(function(dw)warn("[ghost-worker-active] "..tostring(dw))fg()end)elseif not F.jobs.refresh.active then fj():catch(function(dw)warn("[ghost-worker-inactive] "..tostring(dw))end)end end))end)fg=a.async(function()local eu=a.await(em())eu:dispatch({type="jobs/setJobActive",jobName="ghost",active=false})end)fi=a.async(function()a.await(a.Promise.fromEvent(eB.CharacterAdded,function(eT)return eT~=f8 and eT~=f9 end))a.await(fg())end)fh=a.async(function()local eT=eB.Character;local fk=eT;if fk~=nil then fk=fk:FindFirstChildWhichIsA("Humanoid")end;local fl=fk;if not eT or not fl then error("Character or Humanoid is null")end;eT.Archivable=true;f9=eT:Clone()eT.Archivable=false;local fm=eT:FindFirstChild("HumanoidRootPart")local b3=fm;if b3~=nil then b3=b3:IsA("BasePart")end;fa=b3 and fm.CFrame or nil;f8=eT;local fn=f9:FindFirstChildWhichIsA("Humanoid")for ev,fo in ipairs(f9:GetDescendants())do if fo:IsA("BasePart")then fo.Transparency=1-(1-fo.Transparency)*0.5 end end;if fn then fn.DisplayName=utf8.char(128123)end;local b4=f9:FindFirstChild("Animate")if b4~=nil then b4:Destroy()end;local fp=f8:FindFirstChild("Animate")if fp then fp.Disabled=true;fp.Parent=f9 end;fb()f9.Parent=eT.Parent;eB.Character=f9;n.CurrentCamera.CameraSubject=fn;fe()if fp then fp.Disabled=false end;local at;at=fl.Died:Connect(function()at:Disconnect()fg()end)end)fj=a.async(function()if not f8 or not f9 then return nil end;local fm=f8:FindFirstChild("HumanoidRootPart")local fq=f9:FindFirstChild("HumanoidRootPart")local b3=fq;if b3~=nil then b3=b3:IsA("BasePart")end;local fr=b3 and fq.CFrame or nil;local fp=f9:FindFirstChild("Animate")if fp then fp.Disabled=true;fp.Parent=nil end;f9:Destroy()local fl=f8:FindFirstChildWhichIsA("Humanoid")local b4=fl;if b4~=nil then local aA=b4:GetPlayingAnimationTracks()local y=function(fs)return fs:Stop()end;for J,K in ipairs(aA)do y(K,J-1,aA)end end;local R=fr or fa;local ft=fm;if ft~=nil then ft=ft:IsA("BasePart")end;local b5=ft;if b5 then b5=R end;if b5 then fm.CFrame=R end;fb()eB.Character=f8;n.CurrentCamera.CameraSubject=fl;fe()if fp then fp.Parent=f8;fp.Disabled=false end;f8=nil;f9=nil;fa=nil end)et():catch(function(dw)warn("[ghost-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.character.ghost"))()end)newModule("godmode","LocalScript","Orca.jobs.character.godmode","Orca.jobs.character",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local ey=a.import(script,a.getModule(script,"@rbxts","services"))local dV=ey.Players;local n=ey.Workspace;local f6=a.import(script,script.Parent.Parent,"helpers","job-store")local em=f6.getStore;local eA=f6.onJobChange;local eB=dV.LocalPlayer;local fu;local fg,fv,fi;local et=a.async(function()local function fw(dw)warn("[godmode-worker] "..tostring(dw))fg()end;a.await(eA("godmode",function(eM,F)if F.jobs.ghost.active and eM.active then fg()elseif eM.active then fv():andThen(fi):catch(fw)end end))end)fg=a.async(function()local eu=a.await(em())eu:dispatch({type="jobs/setJobActive",jobName="godmode",active=false})end)fi=a.async(function()local eu=a.await(em())a.await(a.Promise.fromEvent(eB.CharacterAdded,function(eT)local fx=eu:getState().jobs;return not fx.ghost.active and eT~=fu end))a.await(fg())end)fv=a.async(function()local fy=n.CurrentCamera.CFrame;local eT=eB.Character;if not eT then error("Character is null")end;local fl=eT:FindFirstChildWhichIsA("Humanoid")if not fl then error("No humanoid found")end;local fz=fl:Clone()fz.Parent=eT;fu=eT;eB.Character=nil;fz:SetStateEnabled(Enum.HumanoidStateType.Dead,false)fz:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)fz:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)fz.BreakJointsOnDeath=true;fz.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None;fl:Destroy()eB.Character=eT;n.CurrentCamera.CameraSubject=fz;task.defer(function()n.CurrentCamera.CFrame=fy end)local fp=eT:FindFirstChild("Animate")if fp then fp.Disabled=true;fp.Disabled=false end;fz.MaxHealth=math.huge;fz.Health=fz.MaxHealth end)et():catch(function(dw)warn("[godmode-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.character.godmode"))()end)newModule("humanoid","LocalScript","Orca.jobs.character.humanoid","Orca.jobs.character",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local f6=a.import(script,script.Parent.Parent,"helpers","job-store")local em=f6.getStore;local eA=f6.onJobChange;local fA=349.24;local eB=dV.LocalPlayer;local es={walkSpeed=16,jumpHeight=7.2}local fB,fC,fD,fE;local et=a.async(function()local eu=a.await(em())local fk=eB.Character;if fk~=nil then fk=fk:FindFirstChildWhichIsA("Humanoid")end;local fl=fk;local F=eu:getState()local fF=F.jobs.walkSpeed;local fG=F.jobs.jumpHeight;a.await(eA("walkSpeed",function(eM)if eM.active and not fF.active then fB(fl)end;fF=eM;fC(fl,fF)end))a.await(eA("jumpHeight",function(eM)if eM.active and not fG.active then fD(fl)end;fG=eM;fE(fl,fG)end))eB.CharacterAdded:Connect(function(eT)local fH=eT:WaitForChild("Humanoid",5)if fH and fH:IsA("Humanoid")then fl=fH;fB(fH)fD(fH)if fF.active then fC(fH,fF)end;if fG.active then fE(fH,fG)end end end)fB(fl)fD(fl)end)function fB(fl)if fl then es.walkSpeed=fl.WalkSpeed end end;function fD(fl)if fl then es.jumpHeight=fl.JumpHeight end end;function fC(fl,fF)if not fl then return nil end;if fF.active then fl.WalkSpeed=fF.value else fl.WalkSpeed=es.walkSpeed end end;function fE(fl,fG)if not fl then return nil end;if fG.active then fl.JumpHeight=fG.value;if fl.UseJumpPower then fl.JumpPower=math.sqrt(fA*fG.value)end else fl.JumpHeight=es.jumpHeight;if fl.UseJumpPower then fl.JumpPower=math.sqrt(fA*es.jumpHeight)end end end;et():catch(function(dw)warn("[humanoid-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.character.humanoid"))()end)newModule("refresh","LocalScript","Orca.jobs.character.refresh","Orca.jobs.character",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local ey=a.import(script,a.getModule(script,"@rbxts","services"))local dV=ey.Players;local n=ey.Workspace;local f6=a.import(script,script.Parent.Parent,"helpers","job-store")local em=f6.getStore;local eA=f6.onJobChange;local fI=10;local eB=dV.LocalPlayer;local fJ;local et=a.async(function()local eu=a.await(em())local function fg()eu:dispatch({type="jobs/setJobActive",jobName="refresh",active=false})end;a.await(eA("refresh",function(eM,F)if F.jobs.ghost.active and eM.active then fg()elseif eM.active then fJ():catch(function(dw)return warn("[refresh-worker-respawn] "..tostring(dw))end):finally(function()return fg()end)end end))end)fJ=a.async(function()local eT=eB.Character;if not eT then error("Character is null")end;local fK=eT:FindFirstChild("HumanoidRootPart")if fK~=nil then fK=fK.CFrame end;local fL=fK;local fl=eT:FindFirstAncestorWhichIsA("Humanoid")local b3=fl;if b3~=nil then b3:ChangeState(Enum.HumanoidStateType.Dead)end;eT:ClearAllChildren()local fM=Instance.new("Model",n)eB.Character=fM;eB.Character=eT;fM:Destroy()if not fL then return nil end;local fN=a.await(a.Promise.fromEvent(eB.CharacterAdded):timeout(fI,"CharacterAdded event timed out"))local eF=fN:WaitForChild("HumanoidRootPart",5)if eF and(eF:IsA("BasePart")and fL)then task.delay(0.1,function()eF.CFrame=fL end)end end)et():catch(function(dw)warn("[refresh-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.character.refresh"))()end)newModule("freecam","LocalScript","Orca.jobs.freecam","Orca.jobs",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local fO=a.import(script,script.Parent,"helpers","freecam")local fP=fO.DisableFreecam;local fQ=fO.EnableFreecam;local eA=a.import(script,script.Parent,"helpers","job-store").onJobChange;local et=a.async(function()a.await(eA("freecam",function(eM)if eM.active then fQ()else fP()end end))end)et():catch(function(dw)warn("[freecam-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.freecam"))()end)newInstance("helpers","Folder","Orca.jobs.helpers","Orca.jobs")newModule("freecam","ModuleScript","Orca.jobs.helpers.freecam","Orca.jobs.helpers",function()return setfenv(function()local fR=math.pi;local fS=math.abs;local fT=math.clamp;local fU=math.exp;local fV=math.rad;local fW=math.sign;local fX=math.sqrt;local fY=math.tan;local fZ=game:GetService("ContextActionService")local dV=game:GetService("Players")local ez=game:GetService("RunService")local f_=game:GetService("StarterGui")local bx=game:GetService("UserInputService")local n=game:GetService("Workspace")local g0=dV.LocalPlayer;if not g0 then dV:GetPropertyChangedSignal("LocalPlayer"):Wait()g0=dV.LocalPlayer end;local g1=n.CurrentCamera;n:GetPropertyChangedSignal("CurrentCamera"):Connect(function()local g2=n.CurrentCamera;if g2 then g1=g2 end end)local g3=Enum.ContextActionPriority.Low.Value;local g4=Enum.ContextActionPriority.High.Value;local g5={Enum.KeyCode.LeftShift,Enum.KeyCode.P}local g6=game:GetService("HttpService"):GenerateGUID(false)local g7=Vector3.new(1,1,1)*64;local g8=Vector2.new(0.75,1)*8;local g9=300;local ga=fV(90)local gb=2.0;local gc=3.0;local gd=4.0;local bw={}do bw.__index=bw;function bw.new(ge,gf)local self=setmetatable({},bw)self.f=ge;self.p=gf;self.v=gf*0;return self end;function bw:Update(gg,cF)local gh=self.f*2*fR;local gi=self.p;local gj=self.v;local ct=cF-gi;local gk=fU(-gh*gg)local gl=cF+(gj*gg-ct*(gh*gg+1))*gk;local gm=(gh*gg*(ct*gh-gj)+gj)*gk;self.p=gl;self.v=gm;return gl end;function bw:Reset(gf)self.p=gf;self.v=gf*0 end end;local gn=Vector3.new()local go=Vector2.new()local gp=0;local gq=bw.new(gb,Vector3.new())local gr=bw.new(gc,Vector2.new())local gs=bw.new(gd,0)local gt={}do local gu;do local gv=2.0;local gw=0.15;local function gx(bU)return(fU(gv*bU)-1)/(fU(gv)-1)end;local function gy(bU)return gx((bU-gw)/(1-gw))end;function gu(bU)return fW(bU)*fT(gy(fS(bU)),0,1)end end;local gz={ButtonX=0,ButtonY=0,DPadDown=0,DPadUp=0,ButtonL2=0,ButtonR2=0,Thumbstick1=Vector2.new(),Thumbstick2=Vector2.new()}local gA={W=0,A=0,S=0,D=0,E=0,Q=0,U=0,H=0,J=0,K=0,I=0,Y=0,Up=0,Down=0,LeftShift=0,RightShift=0}local gB={Delta=Vector2.new(),MouseWheel=0}local gC=Vector3.new(1,1,1)local gD=Vector3.new(1,1,1)local gE=Vector2.new(1,1)*fR/64;local gF=Vector2.new(1,1)*fR/8;local gG=1.0;local gH=0.25;local gI=0.75;local gJ=0.25;local gK=1;function gt.Vel(gg)gK=fT(gK+gg*(gA.Up-gA.Down)*gI,0.01,4)local gL=Vector3.new(gu(gz.Thumbstick1.X),gu(gz.ButtonR2)-gu(gz.ButtonL2),gu(-gz.Thumbstick1.Y))*gC;local gM=Vector3.new(gA.D-gA.A+gA.K-gA.H,gA.E-gA.Q+gA.I-gA.Y,gA.S-gA.W+gA.J-gA.U)*gD;local gN=bx:IsKeyDown(Enum.KeyCode.LeftShift)or bx:IsKeyDown(Enum.KeyCode.RightShift)return(gL+gM)*gK*(gN and gJ or 1)end;function gt.Pan(gg)local gL=Vector2.new(gu(gz.Thumbstick2.Y),gu(-gz.Thumbstick2.X))*gF;local gO=gB.Delta*gE/(gg*60)gB.Delta=Vector2.new()return gL+gO end;function gt.Fov(gg)local gL=(gz.ButtonX-gz.ButtonY)*gH;local gO=gB.MouseWheel*gG;gB.MouseWheel=0;return gL+gO end;do local function gP(aU,F,bV)gA[bV.KeyCode.Name]=F==Enum.UserInputState.Begin and 1 or 0;return Enum.ContextActionResult.Sink end;local function gQ(aU,F,bV)gz[bV.KeyCode.Name]=F==Enum.UserInputState.Begin and 1 or 0;return Enum.ContextActionResult.Sink end;local function gR(aU,F,bV)local gS=bV.Delta;gB.Delta=Vector2.new(-gS.y,-gS.x)return Enum.ContextActionResult.Sink end;local function gT(aU,F,bV)gz[bV.KeyCode.Name]=bV.Position;return Enum.ContextActionResult.Sink end;local function gU(aU,F,bV)gz[bV.KeyCode.Name]=bV.Position.z;return Enum.ContextActionResult.Sink end;local function gV(aU,F,bV)gB[bV.UserInputType.Name]=-bV.Position.z;return Enum.ContextActionResult.Sink end;local function gW(ek)for gX,bM in pairs(ek)do ek[gX]=bM*0 end end;function gt.StartCapture()fZ:BindActionAtPriority(g6 .."FreecamKeyboard",gP,false,g4,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.E,Enum.KeyCode.Q,Enum.KeyCode.Up,Enum.KeyCode.Down)fZ:BindActionAtPriority(g6 .."FreecamMousePan",gR,false,g4,Enum.UserInputType.MouseMovement)fZ:BindActionAtPriority(g6 .."FreecamMouseWheel",gV,false,g4,Enum.UserInputType.MouseWheel)fZ:BindActionAtPriority(g6 .."FreecamGamepadButton",gQ,false,g4,Enum.KeyCode.ButtonX,Enum.KeyCode.ButtonY)fZ:BindActionAtPriority(g6 .."FreecamGamepadTrigger",gU,false,g4,Enum.KeyCode.ButtonR2,Enum.KeyCode.ButtonL2)fZ:BindActionAtPriority(g6 .."FreecamGamepadThumbstick",gT,false,g4,Enum.KeyCode.Thumbstick1,Enum.KeyCode.Thumbstick2)end;function gt.StopCapture()gK=1;gW(gz)gW(gA)gW(gB)fZ:UnbindAction(g6 .."FreecamKeyboard")fZ:UnbindAction(g6 .."FreecamMousePan")fZ:UnbindAction(g6 .."FreecamMouseWheel")fZ:UnbindAction(g6 .."FreecamGamepadButton")fZ:UnbindAction(g6 .."FreecamGamepadTrigger")fZ:UnbindAction(g6 .."FreecamGamepadThumbstick")end end end;local function gY(gZ)local g_=0.1;local h0=g1.ViewportSize;local h1=2*fY(gp/2)local h2=h0.x/h0.y*h1;local h3=gZ.rightVector;local h4=gZ.upVector;local h5=gZ.lookVector;local h6=Vector3.new()local h7=512;for bU=0,1,0.5 do for ed=0,1,0.5 do local h8=(bU-0.5)*h2;local h9=(ed-0.5)*h1;local ct=h3*h8-h4*h9+h5;local ha=gZ.p+ct*g_;local ev,hb=n:FindPartOnRay(Ray.new(ha,ct.unit*h7))local hc=(hb-ha).magnitude;if h7>hc then h7=hc;h6=ct.unit end end end;return h5:Dot(h6)*h7 end;local function hd(gg)local he=gq:Update(gg,gt.Vel(gg))local hf=gr:Update(gg,gt.Pan(gg))local hg=gs:Update(gg,gt.Fov(gg))local hh=fX(fY(fV(70/2))/fY(fV(gp/2)))gp=fT(gp+hg*g9*gg/hh,1,120)go=go+hf*g8*gg/hh;go=Vector2.new(fT(go.x,-ga,ga),go.y%(2*fR))local fy=CFrame.new(gn)*CFrame.fromOrientation(go.x,go.y,0)*CFrame.new(he*g7*gg)gn=fy.p;g1.CFrame=fy;g1.Focus=fy*CFrame.new(0,0,-gY(fy))g1.FieldOfView=gp end;local hi={}do local hj;local hk;local hl;local hm;local fy;local hn;local ho={}local hp={Backpack=true,Chat=true,Health=true,PlayerList=true}local hq={BadgesNotificationsActive=true,PointsNotificationsActive=true}function hi.Push()hn=g1.FieldOfView;g1.FieldOfView=70;fy=g1.CFrame;hm=g1.Focus;hj=bx.MouseBehavior;bx.MouseBehavior=Enum.MouseBehavior.Default end;function hi.Pop()g1.FieldOfView=hn;hn=nil;g1.CFrame=fy;fy=nil;g1.Focus=hm;hm=nil;bx.MouseBehavior=hj;hj=nil end end;local function hr()local fy=g1.CFrame;go=Vector2.new(fy:toEulerAnglesYXZ())gn=fy.p;gp=g1.FieldOfView;gq:Reset(Vector3.new())gr:Reset(Vector2.new())gs:Reset(0)hi.Push()ez:BindToRenderStep(g6,Enum.RenderPriority.Camera.Value+1,hd)gt.StartCapture()end;local function hs()gt.StopCapture()ez:UnbindFromRenderStep(g6)hi.Pop()end;local eD=false;local function fQ()if not eD then hr()eD=true end end;local function fP()if eD then hs()eD=false end end;return{EnableFreecam=fQ,DisableFreecam=fP}end,newEnv("Orca.jobs.helpers.freecam"))()end)newModule("get-selected-player","ModuleScript","Orca.jobs.helpers.get-selected-player","Orca.jobs.helpers",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local em=a.import(script,script.Parent,"job-store").getStore;local ht=a.async(function(bP)local eu=a.await(em())local hu={current=nil}eu.changed:connect(function(ex)local hv=ex.dashboard.apps.playerSelected;local b3=hu.current;if b3~=nil then b3=b3.Name end;if b3~=hv then hu.current=hv~=nil and dV:FindFirstChild(hv)or nil;if bP then task.defer(bP,hu.current)end end end)return hu end)return{getSelectedPlayer=ht}end,newEnv("Orca.jobs.helpers.get-selected-player"))()end)newModule("job-store","ModuleScript","Orca.jobs.helpers.job-store","Orca.jobs.helpers",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local dg=a.import(script,script.Parent.Parent.Parent,"utils","timeout").setInterval;local eu={}local function hw(hx)if eu.current then error("Store has already been set")end;eu.current=hx end;local em=a.async(function()if eu.current then return eu.current end;return a.Promise.new(function(hy,ev,hz)local dj;dj=dg(function()if eu.current then hy(eu.current)dj:clear()end end,100)hz(function()dj:clear()end)end)end)local hA;local eA=a.async(function(hB,da)local eu=a.await(em())local hC=eu:getState().jobs[hB]return eu.changed:connect(function(ex)local eM=ex.jobs[hB]if not hA(eM,hC)then hC=eM;task.defer(da,eM,ex)end end)end)function hA(hD,dG)for ej in pairs(hD)do if hD[ej]~=dG[ej]then return false end end;return true end;return{setStore=hw,getStore=em,onJobChange=eA}end,newEnv("Orca.jobs.helpers.job-store"))()end)newInstance("players","Folder","Orca.jobs.players","Orca.jobs")newModule("hide","LocalScript","Orca.jobs.players.hide","Orca.jobs.players",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local ht=a.import(script,script.Parent.Parent,"helpers","get-selected-player").getSelectedPlayer;local f6=a.import(script,script.Parent.Parent,"helpers","job-store")local em=f6.getStore;local eA=f6.onJobChange;local aS=a.import(script,script.Parent.Parent.Parent,"store","actions","jobs.action").setJobActive;local hE={}local function hF(eB)if hE[eB]~=nil then return nil end;local eT=eB.Character;local hG;hG={character=eT,parent=eT.Parent,handle=eB.CharacterAdded:Connect(function(fN)fN.Parent=nil;hG.character=eT end)}hE[eB]=hG;eT.Parent=nil end;local function hH(eB,hI)if not(hE[eB]~=nil)then return nil end;local hG=hE[eB]if hI then hG.character.Parent=hG.parent end;hG.handle:Disconnect()hE[eB]=nil end;local et=a.async(function()local eu=a.await(em())local hu=a.await(ht(function(eB)local hJ=eu;local b3;if eB then b3=hE[eB]~=nil else b3=false end;hJ:dispatch(aS("hide",b3))end))dV.PlayerRemoving:Connect(function(eB)if eB==hu.current then eu:dispatch(aS("hide",false))else hH(eB,false)end end)a.await(eA("hide",function(eM)local eB=hu.current;if not eB then eu:dispatch(aS("hide",false))return nil end;if eM.active and eB.Character then hF(eB)elseif not eM.active then hH(eB,true)end end))end)et():catch(function(dw)warn("[hide-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.players.hide"))()end)newModule("kill","LocalScript","Orca.jobs.players.kill","Orca.jobs.players",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local ey=a.import(script,a.getModule(script,"@rbxts","services"))local dV=ey.Players;local n=ey.Workspace;local ht=a.import(script,script.Parent.Parent,"helpers","get-selected-player").getSelectedPlayer;local f6=a.import(script,script.Parent.Parent,"helpers","job-store")local em=f6.getStore;local eA=f6.onJobChange;local aS=a.import(script,script.Parent.Parent.Parent,"store","actions","jobs.action").setJobActive;local eB=dV.LocalPlayer;local hK=a.async(function(hL)local hM=eB:FindFirstChildWhichIsA("Backpack")if not hM then error("No inventory found")end;local hN=eB.Character;local hO=hL.Character;if not hN or not hO then error("Victim or local player has no character")end;local hP=hN:FindFirstChildWhichIsA("Humanoid")local hQ=hN:FindFirstChild("HumanoidRootPart")local hR=hO:FindFirstChild("HumanoidRootPart")if not hP or(not hQ or not hR)then error("Victim or local player has no Humanoid or root part")end;local dk={}local H=#dk;local hS=hN:GetChildren()local hT=#hS;table.move(hS,1,hT,H+1,dk)H=H+hT;local hU=hM:GetChildren()table.move(hU,1,#hU,H+1,dk)local y=function(hV)return hV:IsA("Tool")and hV:FindFirstChild("Handle")~=nil end;local b3=nil;for e5,K in ipairs(dk)do if y(K,e5-1,dk)==true then b3=K;break end end;local hW=b3;if not hW then error("A tool with a handle is required to kill this victim")end;hP.Name=""local fz=hP:Clone()fz.DisplayName=utf8.char(128298)fz.Parent=hN;fz.Name="Humanoid"task.wait()hP:Destroy()n.CurrentCamera.CameraSubject=fz;hW.Parent=hN;do local hX=0;local hY=false;while true do if hY then hX=hX+1 else hY=true end;if not(hX<250)then break end;if hR.Parent~=hO or hQ.Parent~=hN then error("Victim or local player has no root part; did a player respawn?")end;if hW.Parent~=hN then return hQ end;hQ.CFrame=hR.CFrame;task.wait(0.1)end end;error("Failed to attach to victim")end)local hZ=a.async(function(hL)local eu=a.await(em())local h_=eB.Character;if h_~=nil then h_=h_:FindFirstChild("HumanoidRootPart")end;local i0=h_;local b3=i0;if b3~=nil then b3=b3:IsA("BasePart")end;local u=b3 and i0.CFrame or nil;eu:dispatch(aS("refresh",true))a.await(a.Promise.fromEvent(eB.CharacterAdded,function(eT)return eT:WaitForChild("HumanoidRootPart",5)~=nil end))task.wait(0.3)local fm=a.await(hK(hL))local Z={hL.Character,eB.Character}local hO=Z[1]local hN=Z[2]repeat do task.wait(0.1)fm.CFrame=CFrame.new(1000000,n.FallenPartsDestroyHeight+5,1000000)end;local b4=hO;if b4~=nil then b4=b4:FindFirstChild("HumanoidRootPart")end;local b5=b4~=nil;if b5 then local ft=hN;if ft~=nil then ft=ft:FindFirstChild("HumanoidRootPart")end;b5=ft~=nil end until not b5;local fN=a.await(a.Promise.fromEvent(eB.CharacterAdded,function(eT)return eT:WaitForChild("HumanoidRootPart",5)~=nil end))if u then fN.HumanoidRootPart.CFrame=u end end)local et=a.async(function()local eu=a.await(em())local hu=a.await(ht())a.await(eA("kill",function(eM)if eM.active then if not hu.current then eu:dispatch(aS("kill",false))return nil end;hZ(hu.current):catch(function(dw)return warn("[kill-worker] "..tostring(dw))end):finally(function()return eu:dispatch(aS("kill",false))end)end end))end)et():catch(function(dw)warn("[kill-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.players.kill"))()end)newModule("spectate","LocalScript","Orca.jobs.players.spectate","Orca.jobs.players",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local n=a.import(script,a.getModule(script,"@rbxts","services")).Workspace;local ht=a.import(script,script.Parent.Parent,"helpers","get-selected-player").getSelectedPlayer;local f6=a.import(script,script.Parent.Parent,"helpers","job-store")local em=f6.getStore;local eA=f6.onJobChange;local aS=a.import(script,script.Parent.Parent.Parent,"store","actions","jobs.action").setJobActive;local et=a.async(function()local eu=a.await(em())local hu=a.await(ht(function()eu:dispatch(aS("spectate",false))end))local i1=false;local i2;local i3;local function i4(dR)dR:GetPropertyChangedSignal("CameraSubject"):Connect(function()if i2~=dR.CameraSubject and eu:getState().jobs.spectate.active then i1=false;eu:dispatch(aS("spectate",false))end end)end;n:GetPropertyChangedSignal("CurrentCamera"):Connect(function()i4(n.CurrentCamera)end)i4(n.CurrentCamera)a.await(eA("spectate",function(eM)local dR=n.CurrentCamera;if eM.active then local i5=hu.current;if i5~=nil then i5=i5.Character;if i5~=nil then i5=i5:FindFirstChildWhichIsA("Humanoid")end end;local i6=i5;if not i6 then eu:dispatch(aS("spectate",false))else i1=true;i3=dR.CameraSubject;i2=i6;dR.CameraSubject=i6 end elseif i1 then i1=false;dR.CameraSubject=i3;i3=nil;i2=nil end end))end)et():catch(function(dw)warn("[spectate-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.players.spectate"))()end)newModule("teleport","LocalScript","Orca.jobs.players.teleport","Orca.jobs.players",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local ht=a.import(script,script.Parent.Parent,"helpers","get-selected-player").getSelectedPlayer;local f6=a.import(script,script.Parent.Parent,"helpers","job-store")local em=f6.getStore;local eA=f6.onJobChange;local aS=a.import(script,script.Parent.Parent.Parent,"store","actions","jobs.action").setJobActive;local cX=a.import(script,script.Parent.Parent.Parent,"utils","timeout").setTimeout;local et=a.async(function()local eu=a.await(em())local hu=a.await(ht(function()eu:dispatch(aS("teleport",false))end))local ew;a.await(eA("teleport",function(eM)local b3=ew;if b3~=nil then b3:clear()end;ew=nil;if eM.active then local i7=dV.LocalPlayer.Character;if i7~=nil then i7=i7:FindFirstChild("HumanoidRootPart")end;local fm=i7;local i8=hu.current;if i8~=nil then i8=i8.Character;if i8~=nil then i8=i8:FindFirstChild("HumanoidRootPart")end end;local i9=i8;if not i9 or(not fm or(not fm:IsA("BasePart")or not i9:IsA("BasePart")))then eu:dispatch(aS("teleport",false))warn("[teleport-worker] Failed to find root parts ("..tostring(fm).." -> "..tostring(i9)..")")return nil end;ew=cX(function()eu:dispatch(aS("teleport",false))local ab=i9.CFrame;local ac=CFrame.new(0,0,1)fm.CFrame=ab*ac end,1000)end end))end)et():catch(function(dw)warn("[teleport-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.players.teleport"))()end)newModule("server","LocalScript","Orca.jobs.server","Orca.jobs",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local ey=a.import(script,a.getModule(script,"@rbxts","services"))local ia=ey.HttpService;local dV=ey.Players;local ib=ey.TeleportService;local f6=a.import(script,script.Parent,"helpers","job-store")local em=f6.getStore;local eA=f6.onJobChange;local aS=a.import(script,script.Parent.Parent,"store","actions","jobs.action").setJobActive;local ic=a.import(script,script.Parent.Parent,"utils","http")local cX=a.import(script,script.Parent.Parent,"utils","timeout").setTimeout;local id;local ie=a.async(function()id()local ig=ia:JSONDecode(a.await(ic.get("https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder=Asc&limit=100")))local ih=ig.data;local y=function(ii)return ii.playing<ii.maxPlayers and ii.id~=game.JobId end;local e1={}local H=0;for J,K in ipairs(ih)do if y(K,J-1,ih)==true then H=H+1;e1[H]=K end end;local ij=e1;if#ij==0 then error("[server-worker-switch] No servers available.")else local ii=ij[math.random(#ij-1)+1]ib:TeleportToPlaceInstance(game.PlaceId,ii.id)end end)local ik=a.async(function()id()if#dV:GetPlayers()==1 then ib:Teleport(game.PlaceId,dV.LocalPlayer)else ib:TeleportToPlaceInstance(game.PlaceId,game.JobId)end end)function id()local il={string.match(VERSION,"^.+%..+%..+$")}~=nil;local f4=il and'loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()'or'loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/snapshot.lua"))()'local b3=syn;if b3~=nil then b3=b3.queue_on_teleport end;local b5=b3;if b5==nil then b5=queue_on_teleport end;local b4=b5;if b4~=nil then b4(f4)end end;local et=a.async(function()local eu=a.await(em())local ew;local function cW()local b3=ew;if b3~=nil then b3:clear()end;ew=nil end;a.await(eA("rejoinServer",function(eM,F)cW()if F.jobs.switchServer.active then aS("switchServer",false)end;if eM.active then ew=cX(function()ik():catch(function(dw)warn("[server-worker-rejoin] "..tostring(dw))eu:dispatch(aS("rejoinServer",false))end)end,1000)end end))a.await(eA("switchServer",function(eM,F)cW()if F.jobs.rejoinServer.active then aS("rejoinServer",false)end;if eM.active then ew=cX(function()ie():catch(function(dw)warn("[server-worker-switch] "..tostring(dw))eu:dispatch(aS("switchServer",false))end)end,1000)end end))end)et():catch(function(dw)warn("[server-worker] "..tostring(dw))end)end,newEnv("Orca.jobs.server"))()end)newModule("main","LocalScript","Orca.main","Orca",function()return setfenv(function()local a=require(script.Parent.include.RuntimeLib)local au=a.import(script,a.getModule(script,"@rbxts","make"))local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local am=a.import(script,a.getModule(script,"@rbxts","roact-rodux-hooked").out).Provider;local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local cv=a.import(script,script.Parent,"constants").IS_DEV;local hw=a.import(script,script.Parent,"jobs").setStore;local im=a.import(script,script.Parent,"store","actions","dashboard.action").toggleDashboard;local ao=a.import(script,script.Parent,"store","store").configureStore;local e=a.import(script,script.Parent,"App").default;local eu=ao()hw(eu)local io=a.async(function()local ip=au("Folder",{})b.mount(b.createElement(am,{store=eu},{b.createElement(e)}),ip)return ip:WaitForChild(1)end)local function iq(ir)local is=syn and syn.protect_gui or protect_gui;if is then is(ir)end;if cv then ir.Parent=dV.LocalPlayer:WaitForChild("PlayerGui")elseif gethui then ir.Parent=gethui()else ir.Parent=game:GetService("CoreGui")end end;local et=a.async(function()if getgenv and getgenv()._ORCA_IS_LOADED~=nil then error("Orca is already loaded!")end;local ir=a.await(io())iq(ir)if time()>3 then task.defer(function()return eu:dispatch(im())end)end;if getgenv then getgenv()._ORCA_IS_LOADED=true end end)et():catch(function(dw)warn("Orca failed to load: "..tostring(dw))end)end,newEnv("Orca.main"))()end)newInstance("store","Folder","Orca.store","Orca")newInstance("actions","Folder","Orca.store.actions","Orca.store")newModule("dashboard.action","ModuleScript","Orca.store.actions.dashboard.action","Orca.store.actions",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local it=a.import(script,a.getModule(script,"@rbxts","rodux").src)local iu=it.makeActionCreator("dashboard/setDashboardPage",function(c3)return{page=c3}end)local im=it.makeActionCreator("dashboard/toggleDashboard",function()return{}end)local aR=it.makeActionCreator("dashboard/setHint",function(aV)return{hint=aV}end)local aQ=it.makeActionCreator("dashboard/clearHint",function()return{}end)local hu=it.makeActionCreator("dashboard/playerSelected",function(eB)return{name=eB.Name}end)local iv=it.makeActionCreator("dashboard/playerDeselected",function()return{}end)return{setDashboardPage=iu,toggleDashboard=im,setHint=aR,clearHint=aQ,playerSelected=hu,playerDeselected=iv}end,newEnv("Orca.store.actions.dashboard.action"))()end)newModule("jobs.action","ModuleScript","Orca.store.actions.jobs.action","Orca.store.actions",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local it=a.import(script,a.getModule(script,"@rbxts","rodux").src)local aS=it.makeActionCreator("jobs/setJobActive",function(hB,a_)return{jobName=hB,active=a_}end)local iw=it.makeActionCreator("jobs/setJobValue",function(hB,d3)return{jobName=hB,value=d3}end)return{setJobActive=aS,setJobValue=iw}end,newEnv("Orca.store.actions.jobs.action"))()end)newModule("options.action","ModuleScript","Orca.store.actions.options.action","Orca.store.actions",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local it=a.import(script,a.getModule(script,"@rbxts","rodux").src)local ix=it.makeActionCreator("options/setConfig",function(hv,a_)return{name=hv,active=a_}end)local iy=it.makeActionCreator("options/setShortcut",function(iz,iA)return{shortcut=iz,keycode=iA}end)local iB=it.makeActionCreator("options/removeShortcut",function(iz)return{shortcut=iz}end)local iC=it.makeActionCreator("options/setTheme",function(aW)return{theme=aW}end)return{setConfig=ix,setShortcut=iy,removeShortcut=iB,setTheme=iC}end,newEnv("Orca.store.actions.options.action"))()end)newInstance("models","Folder","Orca.store.models","Orca.store")newModule("dashboard.model","ModuleScript","Orca.store.models.dashboard.model","Orca.store.models",function()return setfenv(function()local an;do local cf={}an=setmetatable({},{__index=cf})an.Home="home"cf.home="Home"an.Apps="apps"cf.apps="Apps"an.Scripts="scripts"cf.scripts="Scripts"an.Options="options"cf.options="Options"end;local iD={[an.Home]=0,[an.Apps]=1,[an.Scripts]=2,[an.Options]=3}local iE={[an.Home]="rbxassetid://8992031167",[an.Apps]="rbxassetid://8992031246",[an.Scripts]="rbxassetid://8992030918",[an.Options]="rbxassetid://8992031056"}return{DashboardPage=an,PAGE_TO_INDEX=iD,PAGE_TO_ICON=iE}end,newEnv("Orca.store.models.dashboard.model"))()end)newModule("jobs.model","ModuleScript","Orca.store.models.jobs.model","Orca.store.models",function()return setfenv(function()end,newEnv("Orca.store.models.jobs.model"))()end)newModule("options.model","ModuleScript","Orca.store.models.options.model","Orca.store.models",function()return setfenv(function()end,newEnv("Orca.store.models.options.model"))()end)newModule("persistent-state","ModuleScript","Orca.store.persistent-state","Orca.store",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local ey=a.import(script,a.getModule(script,"@rbxts","services"))local ia=ey.HttpService;local dV=ey.Players;local em=a.import(script,script.Parent.Parent,"jobs","helpers","job-store").getStore;local dg=a.import(script,script.Parent.Parent,"utils","timeout").setInterval;if makefolder and not isfolder("_orca")then makefolder("_orca")end;local function iF(iG)if readfile then return isfile(iG)and readfile(iG)or nil else print("READ   "..iG)return nil end end;local function iH(iG,iI)if writefile then return writefile(iG,iI)else print("WRITE  "..iG.." => \n"..iI)return nil end end;local iJ;local function iK(hv,iL,iM)local iN,iO=a.try(function()local iP=iF("_orca/"..hv..".json")if iP==nil then iH("_orca/"..hv..".json",ia:JSONEncode(iM))return a.TRY_RETURN,{iM}end;local d3=ia:JSONDecode(iP)iJ(hv,iL):catch(function()warn("Autosave failed")end)return a.TRY_RETURN,{d3}end,function(dw)warn("Failed to load "..hv..".json: "..tostring(dw))return a.TRY_RETURN,{iM}end)if iN then return unpack(iO)end end;iJ=a.async(function(hv,iL)local eu=a.await(em())local function iQ()local F=iL(eu:getState())iH("_orca/"..hv..".json",ia:JSONEncode(F))end;dg(function()return iQ end,60000)dV.PlayerRemoving:Connect(function(eB)if eB==dV.LocalPlayer then iQ()end end)end)return{persistentState=iK}end,newEnv("Orca.store.persistent-state"))()end)newInstance("reducers","Folder","Orca.store.reducers","Orca.store")newModule("dashboard.reducer","ModuleScript","Orca.store.reducers.dashboard.reducer","Orca.store.reducers",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local it=a.import(script,a.getModule(script,"@rbxts","rodux").src)local an=a.import(script,script.Parent.Parent,"models","dashboard.model").DashboardPage;local dB={page=an.Home,isOpen=false,hint=nil,apps={playerSelected=nil}}local iR=it.createReducer(dB,{["dashboard/setDashboardPage"]=function(F,aU)local ax={}for J,K in pairs(F)do ax[J]=K end;ax.page=aU.page;return ax end,["dashboard/toggleDashboard"]=function(F)local ax={}for J,K in pairs(F)do ax[J]=K end;ax.isOpen=not F.isOpen;return ax end,["dashboard/setHint"]=function(F,aU)local ax={}for J,K in pairs(F)do ax[J]=K end;ax.hint=aU.hint;return ax end,["dashboard/clearHint"]=function(F)local ax={}for J,K in pairs(F)do ax[J]=K end;ax.hint=nil;return ax end,["dashboard/playerSelected"]=function(F,aU)local ax={}for J,K in pairs(F)do ax[J]=K end;local ay="apps"local az={}for J,K in pairs(F.apps)do az[J]=K end;az.playerSelected=aU.name;ax[ay]=az;return ax end,["dashboard/playerDeselected"]=function(F)local ax={}for J,K in pairs(F)do ax[J]=K end;local ay="apps"local az={}for J,K in pairs(F.apps)do az[J]=K end;az.playerSelected=nil;ax[ay]=az;return ax end})return{dashboardReducer=iR}end,newEnv("Orca.store.reducers.dashboard.reducer"))()end)newModule("jobs.reducer","ModuleScript","Orca.store.reducers.jobs.reducer","Orca.store.reducers",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local it=a.import(script,a.getModule(script,"@rbxts","rodux").src)local dB={flight={value=60,active=false},walkSpeed={value=80,active=false},jumpHeight={value=200,active=false},refresh={active=false},ghost={active=false},godmode={active=false},freecam={active=false},teleport={active=false},hide={active=false},kill={active=false},spectate={active=false},rejoinServer={active=false},switchServer={active=false}}local iS=it.createReducer(dB,{["jobs/setJobActive"]=function(F,aU)local ax={}for J,K in pairs(F)do ax[J]=K end;local ay=aU.jobName;local az={}for J,K in pairs(F[aU.jobName])do az[J]=K end;az.active=aU.active;ax[ay]=az;return ax end,["jobs/setJobValue"]=function(F,aU)local ax={}for J,K in pairs(F)do ax[J]=K end;local ay=aU.jobName;local az={}for J,K in pairs(F[aU.jobName])do az[J]=K end;az.value=aU.value;ax[ay]=az;return ax end})return{jobsReducer=iS}end,newEnv("Orca.store.reducers.jobs.reducer"))()end)newModule("options.reducer","ModuleScript","Orca.store.reducers.options.reducer","Orca.store.reducers",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local it=a.import(script,a.getModule(script,"@rbxts","rodux").src)local iK=a.import(script,script.Parent.Parent,"persistent-state").persistentState;local dB=iK("options",function(F)return F.options end,{currentTheme="Sorbet",config={acrylicBlur=true},shortcuts={toggleDashboard=Enum.KeyCode.K.Value}})local iT=it.createReducer(dB,{["options/setConfig"]=function(F,aU)local ax={}for J,K in pairs(F)do ax[J]=K end;local ay="config"local az={}for J,K in pairs(F.config)do az[J]=K end;az[aU.name]=aU.active;ax[ay]=az;return ax end,["options/setTheme"]=function(F,aU)local ax={}for J,K in pairs(F)do ax[J]=K end;ax.currentTheme=aU.theme;return ax end,["options/setShortcut"]=function(F,aU)local ax={}for J,K in pairs(F)do ax[J]=K end;local ay="shortcuts"local az={}for J,K in pairs(F.shortcuts)do az[J]=K end;az[aU.shortcut]=aU.keycode;ax[ay]=az;return ax end,["options/removeShortcut"]=function(F,aU)local ax={}for J,K in pairs(F)do ax[J]=K end;local ay="shortcuts"local az={}for J,K in pairs(F.shortcuts)do az[J]=K end;az[aU.shortcut]=nil;ax[ay]=az;return ax end})return{optionsReducer=iT}end,newEnv("Orca.store.reducers.options.reducer"))()end)newModule("store","ModuleScript","Orca.store.store","Orca.store",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local it=a.import(script,a.getModule(script,"@rbxts","rodux").src)local iR=a.import(script,script.Parent,"reducers","dashboard.reducer").dashboardReducer;local iS=a.import(script,script.Parent,"reducers","jobs.reducer").jobsReducer;local iT=a.import(script,script.Parent,"reducers","options.reducer").optionsReducer;local iU=it.combineReducers({dashboard=iR,jobs=iS,options=iT})local function ao(dB)return it.Store.new(iU,dB)end;return{configureStore=ao}end,newEnv("Orca.store.store"))()end)newModule("themes","ModuleScript","Orca.themes","Orca",function()return setfenv(function()local a=require(script.Parent.include.RuntimeLib)local eh=a.import(script,script,"dark-theme").darkTheme;local iV=a.import(script,script,"frosted-glass").frostedGlass;local iW=a.import(script,script,"high-contrast").highContrast;local iX=a.import(script,script,"light-theme").lightTheme;local iY=a.import(script,script,"obsidian").obsidian;local iZ=a.import(script,script,"sorbet").sorbet;local i_={iZ,eh,iX,iV,iY,iW}local function eg()return i_ end;return{getThemes=eg}end,newEnv("Orca.themes"))()end)newModule("dark-theme","ModuleScript","Orca.themes.dark-theme","Orca.themes",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local ap=a.import(script,script.Parent.Parent,"utils","color3").hex;local eh={name="Dark theme",preview={foreground={color=ColorSequence.new(ap("#ffffff"))},background={color=ColorSequence.new(ap("#232428"))},accent={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#F6BD29")),ColorSequenceKeypoint.new(0.5,ap("#F64229")),ColorSequenceKeypoint.new(1,ap("#9029F6"))}),rotation=25}},navbar={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#232428"),transparency=0,accentGradient={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#f629c6")),ColorSequenceKeypoint.new(0.25,ap("#F64229")),ColorSequenceKeypoint.new(0.5,ap("#ffd42a")),ColorSequenceKeypoint.new(0.75,ap("#37CC95")),ColorSequenceKeypoint.new(1,ap("#3789cc"))})},dropshadow=ap("#232428"),dropshadowTransparency=0.3,glowTransparency=0},clock={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#232428"),transparency=0,dropshadow=ap("#232428"),dropshadowTransparency=0.3},home={title={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#ffffff"),backgroundGradient={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#F6BD29")),ColorSequenceKeypoint.new(0.5,ap("#F64229")),ColorSequenceKeypoint.new(1,ap("#9029F6"))}),rotation=25},transparency=0,dropshadow=ap("#ffffff"),dropshadowGradient={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#F6BD29")),ColorSequenceKeypoint.new(0.5,ap("#F64229")),ColorSequenceKeypoint.new(1,ap("#9029F6"))}),rotation=25},dropshadowTransparency=0.3},profile={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#232428"),transparency=0,dropshadow=ap("#232428"),dropshadowTransparency=0.3,avatar={background=ap("#1B1C20"),gradient={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#F6BD29")),ColorSequenceKeypoint.new(0.5,ap("#F64229")),ColorSequenceKeypoint.new(1,ap("#9029F6"))}),rotation=25},transparency=0},button={outlined=true,foreground=ap("#ffffff"),foregroundTransparency=0.5,background=ap("#1B1C20"),backgroundTransparency=0},slider={outlined=true,foreground=ap("#ffffff"),foregroundTransparency=0,background=ap("#1B1C20"),backgroundTransparency=0},highlight={flight=ap("#a22df0"),walkSpeed=ap("#EC423D"),jumpHeight=ap("#37CC95"),refresh=ap("#a22df0"),ghost=ap("#FF4040"),godmode=ap("#f09c2d"),freecam=ap("#37CC95")}},server={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#37CC95"),transparency=0,dropshadow=ap("#37CC95"),dropshadowTransparency=0.3,rejoinButton={outlined=true,foreground=ap("#ffffff"),background=ap("#37CC95"),accent=ap("#232428"),foregroundTransparency=0,backgroundTransparency=0},switchButton={outlined=true,foreground=ap("#ffffff"),background=ap("#37CC95"),accent=ap("#232428"),foregroundTransparency=0,backgroundTransparency=0}},friendActivity={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#232428"),transparency=0,dropshadow=ap("#232428"),dropshadowTransparency=0.3,friendButton={outlined=true,accent=ap("#37CC95"),foreground=ap("#ffffff"),foregroundTransparency=0,background=ap("#1B1C20"),backgroundTransparency=0,dropshadow=ap("#000000"),dropshadowTransparency=0.4,glowTransparency=0.6}}},apps={players={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#232428"),transparency=0,dropshadow=ap("#232428"),dropshadowTransparency=0.3,avatar={background=ap("#1B1C20"),gradient={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#37CC95")),ColorSequenceKeypoint.new(1,ap("#37CC95"))}),rotation=25},transparency=0},button={outlined=true,foreground=ap("#ffffff"),foregroundTransparency=0.5,background=ap("#1B1C20"),backgroundTransparency=0},highlight={teleport=ap("#37CC95"),hide=ap("#f09c2d"),kill=ap("#EC423D"),spectate=ap("#a22df0")},playerButton={outlined=true,accent=ap("#37CC95"),foreground=ap("#ffffff"),foregroundTransparency=0.5,background=ap("#1B1C20"),backgroundTransparency=0,dropshadow=ap("#000000"),dropshadowTransparency=0.5,glowTransparency=0.2}}},options={themes={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#232428"),transparency=0,dropshadow=ap("#232428"),dropshadowTransparency=0.3,themeButton={outlined=true,accent=ap("#37a4cc"),foreground=ap("#ffffff"),foregroundTransparency=0.5,background=ap("#1B1C20"),backgroundTransparency=0,dropshadow=ap("#000000"),dropshadowTransparency=0.5,glowTransparency=0.2}},shortcuts={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#232428"),transparency=0,dropshadow=ap("#232428"),dropshadowTransparency=0.3,shortcutButton={outlined=true,accent=ap("#37CC95"),foreground=ap("#ffffff"),foregroundTransparency=0.5,background=ap("#1B1C20"),backgroundTransparency=0,dropshadow=ap("#000000"),dropshadowTransparency=0.5,glowTransparency=0.2}},config={outlined=true,acrylic=false,foreground=ap("#ffffff"),background=ap("#232428"),transparency=0,dropshadow=ap("#232428"),dropshadowTransparency=0.3,configButton={outlined=true,accent=ap("#37CC95"),foreground=ap("#ffffff"),foregroundTransparency=0.5,background=ap("#1B1C20"),backgroundTransparency=0,dropshadow=ap("#000000"),dropshadowTransparency=0.5,glowTransparency=0.2}}}}return{darkTheme=eh}end,newEnv("Orca.themes.dark-theme"))()end)newModule("frosted-glass","ModuleScript","Orca.themes.frosted-glass","Orca.themes",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local eh=a.import(script,script.Parent,"dark-theme").darkTheme;local ap=a.import(script,script.Parent.Parent,"utils","color3").hex;local b2=ap("#000000")local j0=ColorSequence.new(ap("#000000"))local j1={acrylic=true,outlined=true,foreground=ap("#ffffff"),background=ap("#ffffff"),backgroundGradient=nil,transparency=0.9,dropshadow=ap("#ffffff"),dropshadowTransparency=0,dropshadowGradient={color=ColorSequence.new(ap("#000000")),transparency=NumberSequence.new(1,0.8),rotation=90}}local ax={}for J,K in pairs(eh)do ax[J]=K end;ax.name="Frosted glass"ax.preview={foreground={color=ColorSequence.new(ap("#ffffff"))},background={color=ColorSequence.new(ap("#ffffff"))},accent={color=j0}}local ay="navbar"local az={}for J,K in pairs(eh.navbar)do az[J]=K end;az.outlined=true;az.acrylic=true;az.foreground=ap("#ffffff")az.background=ap("#ffffff")az.backgroundGradient=nil;az.transparency=0.9;az.dropshadow=ap("#000000")az.dropshadowTransparency=0.2;az.accentGradient={color=ColorSequence.new(ap("#ffffff")),transparency=NumberSequence.new(0.8),rotation=90}az.glowTransparency=0.5;ax[ay]=az;ax.clock={outlined=true,acrylic=true,foreground=ap("#ffffff"),background=ap("#ffffff"),backgroundGradient=nil,transparency=0.9,dropshadow=ap("#000000"),dropshadowTransparency=0.2}local j2="home"local aB={}local j3="title"local aD={}for J,K in pairs(j1)do aD[J]=K end;aB[j3]=aD;local j4="profile"local aF={}for J,K in pairs(j1)do aF[J]=K end;local j5="avatar"local aH={}for J,K in pairs(eh.home.profile.avatar)do aH[J]=K end;aH.background=ap("#ffffff")aH.transparency=0.7;aH.gradient={color=ColorSequence.new(ap("#ffffff"),ap("#ffffff")),transparency=NumberSequence.new(0.5,1),rotation=45}aF[j5]=aH;aF.highlight={flight=b2,walkSpeed=b2,jumpHeight=b2,refresh=b2,ghost=b2,godmode=b2,freecam=b2}local j6="slider"local aJ={}for J,K in pairs(eh.home.profile.slider)do aJ[J]=K end;aJ.outlined=false;aJ.foreground=ap("#ffffff")aJ.background=ap("#ffffff")aJ.backgroundTransparency=0.8;aJ.indicatorTransparency=0.3;aF[j6]=aJ;local j7="button"local j8={}for J,K in pairs(eh.home.profile.button)do j8[J]=K end;j8.outlined=false;j8.foreground=ap("#ffffff")j8.background=ap("#ffffff")j8.backgroundTransparency=0.8;aF[j7]=j8;aB[j4]=aF;local j9="server"local ja={}for J,K in pairs(j1)do ja[J]=K end;local jb="rejoinButton"local jc={}for J,K in pairs(eh.home.server.rejoinButton)do jc[J]=K end;jc.outlined=false;jc.foreground=ap("#ffffff")jc.background=ap("#ffffff")jc.foregroundTransparency=0.5;jc.backgroundTransparency=0.8;jc.accent=b2;ja[jb]=jc;local jd="switchButton"local je={}for J,K in pairs(eh.home.server.switchButton)do je[J]=K end;je.outlined=false;je.foreground=ap("#ffffff")je.background=ap("#ffffff")je.foregroundTransparency=0.5;je.backgroundTransparency=0.8;je.accent=b2;ja[jd]=je;aB[j9]=ja;local jf="friendActivity"local jg={}for J,K in pairs(j1)do jg[J]=K end;local jh="friendButton"local ji={}for J,K in pairs(eh.home.friendActivity.friendButton)do ji[J]=K end;ji.outlined=false;ji.foreground=ap("#ffffff")ji.background=ap("#ffffff")ji.dropshadow=ap("#ffffff")ji.backgroundTransparency=0.7;jg[jh]=ji;aB[jf]=jg;ax[j2]=aB;local jj="apps"local jk={}local jl="players"local jm={}for J,K in pairs(j1)do jm[J]=K end;jm.highlight={teleport=b2,hide=b2,kill=b2,spectate=b2}local jn="avatar"local jo={}for J,K in pairs(eh.apps.players.avatar)do jo[J]=K end;jo.background=ap("#ffffff")jo.transparency=0.7;jo.gradient={color=ColorSequence.new(ap("#ffffff"),ap("#ffffff")),transparency=NumberSequence.new(0.5,1),rotation=45}jm[jn]=jo;local jp="button"local jq={}for J,K in pairs(eh.apps.players.button)do jq[J]=K end;jq.outlined=false;jq.foreground=ap("#ffffff")jq.background=ap("#ffffff")jq.backgroundTransparency=0.8;jm[jp]=jq;local jr="playerButton"local js={}for J,K in pairs(eh.apps.players.playerButton)do js[J]=K end;js.outlined=false;js.foreground=ap("#ffffff")js.background=ap("#ffffff")js.dropshadow=ap("#ffffff")js.accent=b2;js.backgroundTransparency=0.8;js.dropshadowTransparency=0.7;jm[jr]=js;jk[jl]=jm;ax[jj]=jk;local jt="options"local ju={}local jv="config"local jw={}for J,K in pairs(j1)do jw[J]=K end;local jx="configButton"local jy={}for J,K in pairs(eh.options.config.configButton)do jy[J]=K end;jy.outlined=false;jy.foreground=ap("#ffffff")jy.background=ap("#ffffff")jy.dropshadow=ap("#ffffff")jy.accent=b2;jy.backgroundTransparency=0.8;jy.dropshadowTransparency=0.7;jw[jx]=jy;ju[jv]=jw;local jz="shortcuts"local jA={}for J,K in pairs(j1)do jA[J]=K end;local jB="shortcutButton"local jC={}for J,K in pairs(eh.options.shortcuts.shortcutButton)do jC[J]=K end;jC.outlined=false;jC.foreground=ap("#ffffff")jC.background=ap("#ffffff")jC.dropshadow=ap("#ffffff")jC.accent=b2;jC.backgroundTransparency=0.8;jC.dropshadowTransparency=0.7;jA[jB]=jC;ju[jz]=jA;local jD="themes"local jE={}for J,K in pairs(j1)do jE[J]=K end;local jF="themeButton"local jG={}for J,K in pairs(eh.options.themes.themeButton)do jG[J]=K end;jG.outlined=false;jG.foreground=ap("#ffffff")jG.background=ap("#ffffff")jG.dropshadow=ap("#ffffff")jG.accent=b2;jG.backgroundTransparency=0.8;jG.dropshadowTransparency=0.7;jE[jF]=jG;ju[jD]=jE;ax[jt]=ju;local iV=ax;return{frostedGlass=iV}end,newEnv("Orca.themes.frosted-glass"))()end)newModule("high-contrast","ModuleScript","Orca.themes.high-contrast","Orca.themes",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local eh=a.import(script,script.Parent,"dark-theme").darkTheme;local ap=a.import(script,script.Parent.Parent,"utils","color3").hex;local ax={}for J,K in pairs(eh)do ax[J]=K end;ax.name="High contrast"ax.preview={foreground={color=ColorSequence.new(ap("#ffffff"))},background={color=ColorSequence.new(ap("#000000"))},accent={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#F6BD29")),ColorSequenceKeypoint.new(0.5,ap("#F64229")),ColorSequenceKeypoint.new(1,ap("#9029F6"))}),rotation=25}}local ay="navbar"local az={}for J,K in pairs(eh.navbar)do az[J]=K end;az.foreground=ap("#ffffff")az.background=ap("#000000")az.dropshadow=ap("#000000")ax[ay]=az;local j2="clock"local aB={}for J,K in pairs(eh.clock)do aB[J]=K end;aB.foreground=ap("#ffffff")aB.background=ap("#000000")aB.dropshadow=ap("#000000")ax[j2]=aB;local j3="home"local aD={}local j4="title"local aF={}for J,K in pairs(eh.home.title)do aF[J]=K end;aF.foreground=ap("#ffffff")aF.background=ap("#000000")aF.dropshadow=ap("#000000")aD[j4]=aF;local j5="profile"local aH={}for J,K in pairs(eh.home.profile)do aH[J]=K end;aH.foreground=ap("#ffffff")aH.background=ap("#000000")aH.dropshadow=ap("#000000")local j6="avatar"local aJ={}for J,K in pairs(eh.home.profile.avatar)do aJ[J]=K end;aJ.background=ap("#ffffff")aJ.transparency=0.9;aJ.gradient={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#F6BD29")),ColorSequenceKeypoint.new(0.5,ap("#F64229")),ColorSequenceKeypoint.new(1,ap("#9029F6"))})}aH[j6]=aJ;local j7="slider"local j8={}for J,K in pairs(eh.home.profile.slider)do j8[J]=K end;j8.foreground=ap("#ffffff")j8.background=ap("#000000")aH[j7]=j8;local j9="button"local ja={}for J,K in pairs(eh.home.profile.button)do ja[J]=K end;ja.foreground=ap("#ffffff")ja.background=ap("#000000")aH[j9]=ja;aD[j5]=aH;local jb="server"local jc={}for J,K in pairs(eh.home.server)do jc[J]=K end;jc.foreground=ap("#ffffff")jc.background=ap("#000000")jc.dropshadow=ap("#000000")local jd="rejoinButton"local je={}for J,K in pairs(eh.home.server.rejoinButton)do je[J]=K end;je.foreground=ap("#ffffff")je.background=ap("#000000")je.foregroundTransparency=0.5;je.accent=ap("#ff3f6c")jc[jd]=je;local jf="switchButton"local jg={}for J,K in pairs(eh.home.server.switchButton)do jg[J]=K end;jg.foreground=ap("#ffffff")jg.background=ap("#000000")jg.foregroundTransparency=0.5;jg.accent=ap("#ff3f6c")jc[jf]=jg;aD[jb]=jc;local jh="friendActivity"local ji={}for J,K in pairs(eh.home.friendActivity)do ji[J]=K end;ji.foreground=ap("#ffffff")ji.background=ap("#000000")ji.dropshadow=ap("#000000")local jj="friendButton"local jk={}for J,K in pairs(eh.home.friendActivity.friendButton)do jk[J]=K end;jk.foreground=ap("#ffffff")jk.background=ap("#000000")ji[jj]=jk;aD[jh]=ji;ax[j3]=aD;local jl="apps"local jm={}local jn="players"local jo={}for J,K in pairs(eh.apps.players)do jo[J]=K end;jo.foreground=ap("#ffffff")jo.background=ap("#000000")jo.dropshadow=ap("#000000")local jp="avatar"local jq={}for J,K in pairs(eh.apps.players.avatar)do jq[J]=K end;jq.background=ap("#ffffff")jq.transparency=0.9;jq.gradient={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#F6BD29")),ColorSequenceKeypoint.new(0.5,ap("#F64229")),ColorSequenceKeypoint.new(1,ap("#9029F6"))})}jo[jp]=jq;local jr="button"local js={}for J,K in pairs(eh.apps.players.button)do js[J]=K end;js.foreground=ap("#ffffff")js.background=ap("#000000")jo[jr]=js;local jt="playerButton"local ju={}for J,K in pairs(eh.apps.players.playerButton)do ju[J]=K end;ju.foreground=ap("#ffffff")ju.background=ap("#000000")ju.accent=ap("#ff3f6c")ju.dropshadowTransparency=0.7;jo[jt]=ju;jm[jn]=jo;ax[jl]=jm;local jv="options"local jw={}local jx="config"local jy={}for J,K in pairs(eh.options.config)do jy[J]=K end;jy.foreground=ap("#ffffff")jy.background=ap("#000000")jy.dropshadow=ap("#000000")local jz="configButton"local jA={}for J,K in pairs(eh.options.config.configButton)do jA[J]=K end;jA.foreground=ap("#ffffff")jA.background=ap("#000000")jA.accent=ap("#ff3f6c")jA.dropshadowTransparency=0.7;jy[jz]=jA;jw[jx]=jy;local jB="shortcuts"local jC={}for J,K in pairs(eh.options.shortcuts)do jC[J]=K end;jC.foreground=ap("#ffffff")jC.background=ap("#000000")jC.dropshadow=ap("#000000")local jD="shortcutButton"local jE={}for J,K in pairs(eh.options.shortcuts.shortcutButton)do jE[J]=K end;jE.foreground=ap("#ffffff")jE.background=ap("#000000")jE.accent=ap("#ff3f6c")jE.dropshadowTransparency=0.7;jC[jD]=jE;jw[jB]=jC;local jF="themes"local jG={}for J,K in pairs(eh.options.themes)do jG[J]=K end;jG.foreground=ap("#ffffff")jG.background=ap("#000000")jG.dropshadow=ap("#000000")local jH="themeButton"local jI={}for J,K in pairs(eh.options.themes.themeButton)do jI[J]=K end;jI.foreground=ap("#ffffff")jI.background=ap("#000000")jI.accent=ap("#ff3f6c")jI.dropshadowTransparency=0.7;jG[jH]=jI;jw[jF]=jG;ax[jv]=jw;local iW=ax;return{highContrast=iW}end,newEnv("Orca.themes.high-contrast"))()end)newModule("light-theme","ModuleScript","Orca.themes.light-theme","Orca.themes",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local eh=a.import(script,script.Parent,"dark-theme").darkTheme;local ap=a.import(script,script.Parent.Parent,"utils","color3").hex;local ax={}for J,K in pairs(eh)do ax[J]=K end;ax.name="Light theme"ax.preview={foreground={color=ColorSequence.new(ap("#000000"))},background={color=ColorSequence.new(ap("#ffffff"))},accent={color=ColorSequence.new({ColorSequenceKeypoint.new(0,ap("#F6BD29")),ColorSequenceKeypoint.new(0.5,ap("#F64229")),ColorSequenceKeypoint.new(1,ap("#9029F6"))}),rotation=25}}local ay="navbar"local az={}for J,K in pairs(eh.navbar)do az[J]=K end;az.foreground=ap("#000000")az.background=ap("#ffffff")ax[ay]=az;local j2="clock"local aB={}for J,K in pairs(eh.clock)do aB[J]=K end;aB.foreground=ap("#000000")aB.background=ap("#ffffff")ax[j2]=aB;local j3="home"local aD={}local j4="title"local aF={}for J,K in pairs(eh.home.title)do aF[J]=K end;aF.foreground=ap("#000000")aF.background=ap("#ffffff")aD[j4]=aF;local j5="profile"local aH={}for J,K in pairs(eh.home.profile)do aH[J]=K end;aH.foreground=ap("#000000")aH.background=ap("#ffffff")local j6="avatar"local aJ={}for J,K in pairs(eh.home.profile.avatar)do aJ[J]=K end;aJ.background=ap("#000000")aJ.transparency=0.9;aJ.gradient={color=ColorSequence.new(ap("#3ce09b"))}aH[j6]=aJ;local j7="slider"local j8={}for J,K in pairs(eh.home.profile.slider)do j8[J]=K end;j8.foreground=ap("#000000")j8.background=ap("#ffffff")aH[j7]=j8;local j9="button"local ja={}for J,K in pairs(eh.home.profile.button)do ja[J]=K end;ja.foreground=ap("#000000")ja.background=ap("#ffffff")aH[j9]=ja;aD[j5]=aH;local jb="server"local jc={}for J,K in pairs(eh.home.server)do jc[J]=K end;jc.foreground=ap("#000000")jc.background=ap("#ff3f6c")jc.dropshadow=ap("#ff3f6c")local jd="rejoinButton"local je={}for J,K in pairs(eh.home.server.rejoinButton)do je[J]=K end;je.foreground=ap("#000000")je.background=ap("#ff3f6c")je.accent=ap("#ffffff")jc[jd]=je;local jf="switchButton"local jg={}for J,K in pairs(eh.home.server.switchButton)do jg[J]=K end;jg.foreground=ap("#000000")jg.background=ap("#ff3f6c")jg.accent=ap("#ffffff")jc[jf]=jg;aD[jb]=jc;local jh="friendActivity"local ji={}for J,K in pairs(eh.home.friendActivity)do ji[J]=K end;ji.foreground=ap("#000000")ji.background=ap("#ffffff")local jj="friendButton"local jk={}for J,K in pairs(eh.home.friendActivity.friendButton)do jk[J]=K end;jk.foreground=ap("#ffffff")jk.background=ap("#ffffff")ji[jj]=jk;aD[jh]=ji;ax[j3]=aD;local jl="apps"local jm={}local jn="players"local jo={}for J,K in pairs(eh.apps.players)do jo[J]=K end;jo.foreground=ap("#000000")jo.background=ap("#ffffff")local jp="avatar"local jq={}for J,K in pairs(eh.apps.players.avatar)do jq[J]=K end;jq.background=ap("#000000")jq.transparency=0.9;jq.gradient={color=ColorSequence.new(ap("#3ce09b"))}jo[jp]=jq;local jr="button"local js={}for J,K in pairs(eh.apps.players.button)do js[J]=K end;js.foreground=ap("#000000")js.background=ap("#ffffff")jo[jr]=js;local jt="playerButton"local ju={}for J,K in pairs(eh.apps.players.playerButton)do ju[J]=K end;ju.foreground=ap("#000000")ju.background=ap("#ffffff")ju.backgroundHovered=ap("#eeeeee")ju.accent=ap("#3ce09b")ju.dropshadowTransparency=0.7;jo[jt]=ju;jm[jn]=jo;ax[jl]=jm;local jv="options"local jw={}local jx="config"local jy={}for J,K in pairs(eh.options.config)do jy[J]=K end;jy.foreground=ap("#000000")jy.background=ap("#ffffff")local jz="configButton"local jA={}for J,K in pairs(eh.options.config.configButton)do jA[J]=K end;jA.foreground=ap("#000000")jA.background=ap("#ffffff")jA.backgroundHovered=ap("#eeeeee")jA.accent=ap("#3ce09b")jA.dropshadowTransparency=0.7;jy[jz]=jA;jw[jx]=jy;local jB="shortcuts"local jC={}for J,K in pairs(eh.options.shortcuts)do jC[J]=K end;jC.foreground=ap("#000000")jC.background=ap("#ffffff")local jD="shortcutButton"local jE={}for J,K in pairs(eh.options.shortcuts.shortcutButton)do jE[J]=K end;jE.foreground=ap("#000000")jE.background=ap("#ffffff")jE.backgroundHovered=ap("#eeeeee")jE.accent=ap("#3ce09b")jE.dropshadowTransparency=0.7;jC[jD]=jE;jw[jB]=jC;local jF="themes"local jG={}for J,K in pairs(eh.options.themes)do jG[J]=K end;jG.foreground=ap("#000000")jG.background=ap("#ffffff")local jH="themeButton"local jI={}for J,K in pairs(eh.options.themes.themeButton)do jI[J]=K end;jI.foreground=ap("#000000")jI.background=ap("#ffffff")jI.backgroundHovered=ap("#eeeeee")jI.accent=ap("#3ce09b")jI.dropshadowTransparency=0.7;jG[jH]=jI;jw[jF]=jG;ax[jv]=jw;local iX=ax;return{lightTheme=iX}end,newEnv("Orca.themes.light-theme"))()end)newModule("obsidian","ModuleScript","Orca.themes.obsidian","Orca.themes",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local eh=a.import(script,script.Parent,"dark-theme").darkTheme;local ap=a.import(script,script.Parent.Parent,"utils","color3").hex;local b2=ap("#9029F6")local j0=ColorSequence.new(ap("#9029F6"))local ax={}for J,K in pairs(eh)do ax[J]=K end;ax.name="Obsidian"ax.preview={foreground={color=ColorSequence.new(ap("#ffffff"))},background={color=ColorSequence.new(ap("#000000"))},accent={color=j0}}local ay="navbar"local az={}for J,K in pairs(eh.navbar)do az[J]=K end;az.acrylic=true;az.outlined=false;az.foreground=ap("#ffffff")az.background=ap("#000000")az.dropshadow=ap("#000000")az.transparency=0.7;az.accentGradient={color=j0,transparency=NumberSequence.new(0.5)}ax[ay]=az;local j2="clock"local aB={}for J,K in pairs(eh.clock)do aB[J]=K end;aB.acrylic=true;aB.outlined=false;aB.foreground=ap("#ffffff")aB.background=ap("#000000")aB.dropshadow=ap("#000000")aB.transparency=0.7;ax[j2]=aB;local j3="home"local aD={}local j4="title"local aF={}for J,K in pairs(eh.home.title)do aF[J]=K end;aF.acrylic=true;aF.outlined=false;aF.foreground=ap("#ffffff")aF.background=ap("#000000")aF.dropshadow=ap("#000000")aF.transparency=0.7;aF.dropshadowTransparency=0.65;aD[j4]=aF;local j5="profile"local aH={}for J,K in pairs(eh.home.profile)do aH[J]=K end;aH.acrylic=true;aH.outlined=false;aH.foreground=ap("#ffffff")aH.background=ap("#000000")aH.dropshadow=ap("#000000")aH.transparency=0.7;aH.dropshadowTransparency=0.65;local j6="avatar"local aJ={}for J,K in pairs(eh.home.profile.avatar)do aJ[J]=K end;aJ.background=ap("#000000")aJ.transparency=0.7;aJ.gradient={color=j0}aH[j6]=aJ;aH.highlight={flight=b2,walkSpeed=b2,jumpHeight=b2,refresh=b2,ghost=b2,godmode=b2,freecam=b2}local j7="slider"local j8={}for J,K in pairs(eh.home.profile.slider)do j8[J]=K end;j8.outlined=false;j8.foreground=ap("#ffffff")j8.background=ap("#000000")j8.backgroundTransparency=0.5;j8.indicatorTransparency=0.5;aH[j7]=j8;local j9="button"local ja={}for J,K in pairs(eh.home.profile.button)do ja[J]=K end;ja.outlined=false;ja.foreground=ap("#ffffff")ja.background=ap("#000000")ja.backgroundTransparency=0.5;aH[j9]=ja;aD[j5]=aH;local jb="server"local jc={}for J,K in pairs(eh.home.server)do jc[J]=K end;jc.acrylic=true;jc.outlined=false;jc.foreground=ap("#ffffff")jc.background=ap("#000000")jc.dropshadow=ap("#000000")jc.transparency=0.7;jc.dropshadowTransparency=0.65;local jd="rejoinButton"local je={}for J,K in pairs(eh.home.server.rejoinButton)do je[J]=K end;je.outlined=false;je.foreground=ap("#ffffff")je.background=ap("#000000")je.backgroundTransparency=0.5;je.foregroundTransparency=0.5;je.accent=b2;jc[jd]=je;local jf="switchButton"local jg={}for J,K in pairs(eh.home.server.switchButton)do jg[J]=K end;jg.outlined=false;jg.foreground=ap("#ffffff")jg.background=ap("#000000")jg.backgroundTransparency=0.5;jg.foregroundTransparency=0.5;jg.accent=b2;jc[jf]=jg;aD[jb]=jc;local jh="friendActivity"local ji={}for J,K in pairs(eh.home.friendActivity)do ji[J]=K end;ji.acrylic=true;ji.outlined=false;ji.foreground=ap("#ffffff")ji.background=ap("#000000")ji.dropshadow=ap("#000000")ji.transparency=0.7;ji.dropshadowTransparency=0.65;local jj="friendButton"local jk={}for J,K in pairs(eh.home.friendActivity.friendButton)do jk[J]=K end;jk.outlined=false;jk.foreground=ap("#ffffff")jk.background=ap("#000000")jk.dropshadow=ap("#000000")jk.backgroundTransparency=0.7;ji[jj]=jk;aD[jh]=ji;ax[j3]=aD;local jl="apps"local jm={}local jn="players"local jo={}for J,K in pairs(eh.apps.players)do jo[J]=K end;jo.acrylic=true;jo.outlined=false;jo.foreground=ap("#ffffff")jo.background=ap("#000000")jo.dropshadow=ap("#000000")jo.transparency=0.7;jo.dropshadowTransparency=0.65;jo.highlight={teleport=b2,hide=b2,kill=b2,spectate=b2}local jp="avatar"local jq={}for J,K in pairs(eh.apps.players.avatar)do jq[J]=K end;jq.background=ap("#000000")jq.transparency=0.7;jq.gradient={color=j0}jo[jp]=jq;local jr="button"local js={}for J,K in pairs(eh.apps.players.button)do js[J]=K end;js.outlined=false;js.foreground=ap("#ffffff")js.background=ap("#000000")js.backgroundTransparency=0.5;jo[jr]=js;local jt="playerButton"local ju={}for J,K in pairs(eh.apps.players.playerButton)do ju[J]=K end;ju.outlined=false;ju.foreground=ap("#ffffff")ju.background=ap("#000000")ju.accent=b2;ju.backgroundTransparency=0.5;ju.dropshadowTransparency=0.7;jo[jt]=ju;jm[jn]=jo;ax[jl]=jm;local jv="options"local jw={}local jx="config"local jy={}for J,K in pairs(eh.options.config)do jy[J]=K end;jy.acrylic=true;jy.outlined=false;jy.foreground=ap("#ffffff")jy.background=ap("#000000")jy.dropshadow=ap("#000000")jy.transparency=0.7;jy.dropshadowTransparency=0.65;local jz="configButton"local jA={}for J,K in pairs(eh.options.config.configButton)do jA[J]=K end;jA.outlined=false;jA.foreground=ap("#ffffff")jA.background=ap("#000000")jA.accent=b2;jA.backgroundTransparency=0.5;jA.dropshadowTransparency=0.7;jy[jz]=jA;jw[jx]=jy;local jB="shortcuts"local jC={}for J,K in pairs(eh.options.shortcuts)do jC[J]=K end;jC.acrylic=true;jC.outlined=false;jC.foreground=ap("#ffffff")jC.background=ap("#000000")jC.dropshadow=ap("#000000")jC.transparency=0.7;jC.dropshadowTransparency=0.65;local jD="shortcutButton"local jE={}for J,K in pairs(eh.options.shortcuts.shortcutButton)do jE[J]=K end;jE.outlined=false;jE.foreground=ap("#ffffff")jE.background=ap("#000000")jE.accent=b2;jE.backgroundTransparency=0.5;jE.dropshadowTransparency=0.7;jC[jD]=jE;jw[jB]=jC;local jF="themes"local jG={}for J,K in pairs(eh.options.themes)do jG[J]=K end;jG.acrylic=true;jG.outlined=false;jG.foreground=ap("#ffffff")jG.background=ap("#000000")jG.dropshadow=ap("#000000")jG.transparency=0.7;jG.dropshadowTransparency=0.65;local jH="themeButton"local jI={}for J,K in pairs(eh.options.themes.themeButton)do jI[J]=K end;jI.outlined=false;jI.foreground=ap("#ffffff")jI.background=ap("#000000")jI.accent=b2;jI.backgroundTransparency=0.5;jI.dropshadowTransparency=0.7;jG[jH]=jI;jw[jF]=jG;ax[jv]=jw;local iY=ax;return{obsidian=iY}end,newEnv("Orca.themes.obsidian"))()end)newModule("sorbet","ModuleScript","Orca.themes.sorbet","Orca.themes",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local eh=a.import(script,script.Parent,"dark-theme").darkTheme;local ap=a.import(script,script.Parent.Parent,"utils","color3").hex;local jJ=ap("#C6428E")local jK=ap("#484fd7")local jL=ap("#9a3fe5")local j0=ColorSequence.new({ColorSequenceKeypoint.new(0,jJ),ColorSequenceKeypoint.new(0.5,jL),ColorSequenceKeypoint.new(1,jK)})local b6=ap("#181818")local jM=ap("#242424")local j1={acrylic=false,outlined=false,foreground=ap("#ffffff"),background=b6,backgroundGradient=nil,transparency=0,dropshadow=b6,dropshadowTransparency=0.3}local ax={}for J,K in pairs(eh)do ax[J]=K end;ax.name="Sorbet"ax.preview={foreground={color=ColorSequence.new(ap("#ffffff"))},background={color=ColorSequence.new(b6)},accent={color=j0}}local ay="navbar"local az={}for J,K in pairs(eh.navbar)do az[J]=K end;az.outlined=false;az.background=b6;az.dropshadow=b6;az.accentGradient={color=j0}ax[ay]=az;local j2="clock"local aB={}for J,K in pairs(eh.clock)do aB[J]=K end;aB.outlined=false;aB.background=b6;aB.dropshadow=b6;ax[j2]=aB;local j3="home"local aD={}local j4="title"local aF={}for J,K in pairs(j1)do aF[J]=K end;aF.background=ap("#ffffff")aF.backgroundGradient={color=j0,rotation=30}aF.dropshadow=ap("#ffffff")aF.dropshadowGradient={color=j0,rotation=30}aD[j4]=aF;local j5="profile"local aH={}for J,K in pairs(j1)do aH[J]=K end;local j6="avatar"local aJ={}for J,K in pairs(eh.home.profile.avatar)do aJ[J]=K end;aJ.background=jM;aJ.transparency=0;aJ.gradient={color=j0,rotation=45}aH[j6]=aJ;aH.highlight={flight=jJ,walkSpeed=jL,jumpHeight=jK,refresh=jJ,ghost=jK,godmode=jJ,freecam=jK}local j7="slider"local j8={}for J,K in pairs(eh.home.profile.slider)do j8[J]=K end;j8.outlined=false;j8.foreground=ap("#ffffff")j8.background=jM;aH[j7]=j8;local j9="button"local ja={}for J,K in pairs(eh.home.profile.button)do ja[J]=K end;ja.outlined=false;ja.foreground=ap("#ffffff")ja.background=jM;aH[j9]=ja;aD[j5]=aH;local jb="server"local jc={}for J,K in pairs(j1)do jc[J]=K end;local jd="rejoinButton"local je={}for J,K in pairs(eh.home.server.rejoinButton)do je[J]=K end;je.outlined=false;je.foreground=ap("#ffffff")je.background=jM;je.foregroundTransparency=0.5;je.accent=jJ;jc[jd]=je;local jf="switchButton"local jg={}for J,K in pairs(eh.home.server.switchButton)do jg[J]=K end;jg.outlined=false;jg.foreground=ap("#ffffff")jg.background=jM;jg.foregroundTransparency=0.5;jg.accent=jK;jc[jf]=jg;aD[jb]=jc;local jh="friendActivity"local ji={}for J,K in pairs(j1)do ji[J]=K end;local jj="friendButton"local jk={}for J,K in pairs(eh.home.friendActivity.friendButton)do jk[J]=K end;jk.outlined=false;jk.foreground=ap("#ffffff")jk.background=jM;ji[jj]=jk;aD[jh]=ji;ax[j3]=aD;local jl="apps"local jm={}local jn="players"local jo={}for J,K in pairs(j1)do jo[J]=K end;jo.highlight={teleport=jJ,hide=jK,kill=jJ,spectate=jK}local jp="avatar"local jq={}for J,K in pairs(eh.apps.players.avatar)do jq[J]=K end;jq.background=jM;jq.transparency=0;jq.gradient={color=j0,rotation=45}jo[jp]=jq;local jr="button"local js={}for J,K in pairs(eh.apps.players.button)do js[J]=K end;js.outlined=false;js.foreground=ap("#ffffff")js.background=jM;jo[jr]=js;local jt="playerButton"local ju={}for J,K in pairs(eh.apps.players.playerButton)do ju[J]=K end;ju.outlined=false;ju.foreground=ap("#ffffff")ju.background=jM;ju.dropshadow=jM;ju.accent=jK;jo[jt]=ju;jm[jn]=jo;ax[jl]=jm;local jv="options"local jw={}local jx="config"local jy={}for J,K in pairs(j1)do jy[J]=K end;local jz="configButton"local jA={}for J,K in pairs(eh.options.config.configButton)do jA[J]=K end;jA.outlined=false;jA.foreground=ap("#ffffff")jA.background=jM;jA.dropshadow=jM;jA.accent=jJ;jy[jz]=jA;jw[jx]=jy;local jB="shortcuts"local jC={}for J,K in pairs(j1)do jC[J]=K end;local jD="shortcutButton"local jE={}for J,K in pairs(eh.options.shortcuts.shortcutButton)do jE[J]=K end;jE.outlined=false;jE.foreground=ap("#ffffff")jE.background=jM;jE.dropshadow=jM;jE.accent=jL;jC[jD]=jE;jw[jB]=jC;local jF="themes"local jG={}for J,K in pairs(j1)do jG[J]=K end;local jH="themeButton"local jI={}for J,K in pairs(eh.options.themes.themeButton)do jI[J]=K end;jI.outlined=false;jI.foreground=ap("#ffffff")jI.background=jM;jI.dropshadow=jM;jI.accent=jK;jG[jH]=jI;jw[jF]=jG;ax[jv]=jw;local iZ=ax;return{sorbet=iZ}end,newEnv("Orca.themes.sorbet"))()end)newModule("theme.interface","ModuleScript","Orca.themes.theme.interface","Orca.themes",function()return setfenv(function()end,newEnv("Orca.themes.theme.interface"))()end)newInstance("utils","Folder","Orca.utils","Orca")newModule("array-util","ModuleScript","Orca.utils.array-util","Orca.utils",function()return setfenv(function()local function jN(jO,jP)local e1=table.create(#jO)for J,K in ipairs(jO)do e1[J]=jP(K,J-1,jO)end;local jQ={}for ev,K in ipairs(e1)do jQ[K[1]]=K[2]end;return jQ end;return{arrayToMap=jN}end,newEnv("Orca.utils.array-util"))()end)newModule("binding-util","ModuleScript","Orca.utils.binding-util","Orca.utils",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local function jR(cC)return type(cC)=="table"and cC.getValue~=nil end;local function ba(d3,jS)return jR(d3)and d3:map(jS)or b.createBinding(jS(d3))end;local function b9(d3)return jR(d3)and d3 or b.createBinding(d3)end;return{isBinding=jR,mapBinding=ba,asBinding=b9}end,newEnv("Orca.utils.binding-util"))()end)newModule("color3","ModuleScript","Orca.utils.color3","Orca.utils",function()return setfenv(function()local function jT(bc)if typeof(bc)=="ColorSequence"then bc=bc.Keypoints[1].Value end;return bc.R*0.2126+bc.G*0.7152+bc.B*0.0722 end;local function jU(jV,bN)local c2=math.floor(bN*(#jV.Keypoints-1))local jW=math.min(c2+1,#jV.Keypoints-1)local b5=jV.Keypoints[c2+1]if b5==nil then b5=jV.Keypoints[1]end;local jX=b5;local jY=jV.Keypoints[jW+1]if jY==nil then jY=jX end;local jZ=jY;return jX.Value:Lerp(jZ.Value,bN*(#jV.Keypoints-1)-c2)end;local j_=function(ap)local k0=string.gsub(ap,"#","0x",1)local b5=tonumber(k0)if b5==nil then b5=0 end;return b5 end;local k1=function(k2)return Color3.fromRGB(math.floor(k2/65536)%256,math.floor(k2/256)%256,k2%256)end;local ap=function(ap)return k1(j_(ap))end;local k3=function(cb,dF,dG)return Color3.fromRGB(cb,dF,dG)end;local k4=function(k5,bg,bM)return Color3.fromHSV(k5/360,bg/100,bM/100)end;local k6=function(k5,bg,k7)local k8=bg*(k7<50 and k7 or 100-k7)/100;local k9=k8==0 and 0 or 2*k8/(k7+k8)*100;local ka=k7+k8;return Color3.fromHSV(k5/255,k9/100,ka/100)end;return{getLuminance=jT,getColorInSequence=jU,hex=ap,rgb=k3,hsv=k4,hsl=k6}end,newEnv("Orca.utils.color3"))()end)newModule("debug","ModuleScript","Orca.utils.debug","Orca.utils",function()return setfenv(function()local kb=os.clock()local kc="clock"local kd={}local function ke(hv)local b5=kd[hv]if b5==nil then b5=0 end;kd[hv]=b5+1;kc=hv;kb=os.clock()end;local function kf()local kg=os.clock()-kb;local b5=kd[kc]if b5==nil then b5=0 end;local hX=b5;print("\n["..kc.." "..tostring(hX).."]\n"..tostring(kg*1000).." ms\n\n")end;return{startTimer=ke,endTimer=kf}end,newEnv("Orca.utils.debug"))()end)newModule("http","ModuleScript","Orca.utils.http","Orca.utils",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local ia=a.import(script,a.getModule(script,"@rbxts","services")).HttpService;local cv=a.import(script,script.Parent.Parent,"constants").IS_DEV;local kh;kh=a.async(function(ki)if cv then return ia:RequestAsync(ki)else local kj=syn and syn.request or kh;if not kj then error("request/syn.request is not available")end;return kj(ki)end end)local kk=a.async(function(kl,km)return game:HttpGetAsync(kl,km)end)local kn=a.async(function(kl,hG,ko,km)return game:HttpPostAsync(kl,hG,ko,km)end)return{request=kh,get=kk,post=kn}end,newEnv("Orca.utils.http"))()end)newModule("number-util","ModuleScript","Orca.utils.number-util","Orca.utils",function()return setfenv(function()local function q(kp,kq,kr,ks,kt)return ks+(kp-kq)*(kt-ks)/(kr-kq)end;local function ku(hD,dG,ek)return hD+(dG-hD)*ek end;return{map=q,lerp=ku}end,newEnv("Orca.utils.number-util"))()end)newModule("timeout","ModuleScript","Orca.utils.timeout","Orca.utils",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local ez=a.import(script,a.getModule(script,"@rbxts","services")).RunService;local kv;do kv=setmetatable({},{__tostring=function()return"Timeout"end})kv.__index=kv;function kv.new(...)local self=setmetatable({},kv)return self:constructor(...)or self end;function kv:constructor(da,kw,...)local kx={...}self.running=true;task.delay(kw/1000,function()if self.running then da(unpack(kx))end end)end;function kv:clear()self.running=false end end;local function cX(da,kw,...)local kx={...}return kv.new(da,kw,unpack(kx))end;local function cW(ew)ew:clear()end;local ky;do ky=setmetatable({},{__tostring=function()return"Interval"end})ky.__index=ky;function ky.new(...)local self=setmetatable({},ky)return self:constructor(...)or self end;function ky:constructor(da,kw,...)local kx={...}self.running=true;task.defer(function()local kb=0;local kz;kz=ez.Heartbeat:Connect(function(kA)kb=kb+kA;if not self.running then kz:Disconnect()elseif kb>=kw/1000 then kb=kb-kw/1000;da(unpack(kx))end end)end)end;function ky:clear()self.running=false end end;local function dg(da,kw,...)local kx={...}return ky.new(da,kw,unpack(kx))end;local function df(dj)dj:clear()end;return{setTimeout=cX,clearTimeout=cW,setInterval=dg,clearInterval=df,Timeout=kv,Interval=ky}end,newEnv("Orca.utils.timeout"))()end)newModule("udim2","ModuleScript","Orca.utils.udim2","Orca.utils",function()return setfenv(function()local function ar(bU,ed)return UDim2.new(0,bU,0,ed)end;local function r(bU,ed)return UDim2.new(bU,0,ed,0)end;local function ce(Q,dI,ck)if ck==nil then ck=1 end;return Vector2.new(dI.X.Offset+dI.X.Scale/ck*Q.X,dI.Y.Offset+dI.Y.Scale/ck*Q.Y)end;return{px=ar,scale=r,applyUDim2=ce}end,newEnv("Orca.utils.udim2"))()end)newInstance("views","Folder","Orca.views","Orca")newModule("Clock","ModuleScript","Orca.views.Clock","Orca.views",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Clock").default;return g end,newEnv("Orca.views.Clock"))()end)newModule("Clock","ModuleScript","Orca.views.Clock.Clock","Orca.views.Clock",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local k=h.useEffect;local l=h.useMemo;local aK=h.useState;local kB=a.import(script,a.getModule(script,"@rbxts","services")).TextService;local B=a.import(script,script.Parent.Parent.Parent,"components","Acrylic").default;local bb=a.import(script,script.Parent.Parent.Parent,"components","Border").default;local bm=a.import(script,script.Parent.Parent.Parent,"components","Fill").default;local bn=a.import(script,script.Parent.Parent.Parent,"components","Glow")local bo=bn.default;local bp=bn.GlowRadius;local p=a.import(script,script.Parent.Parent.Parent,"hooks","common","rodux-hooks").useAppSelector;local aO=a.import(script,script.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local ei=a.import(script,script.Parent.Parent.Parent,"hooks","use-theme").useTheme;local dg=a.import(script,script.Parent.Parent.Parent,"utils","timeout").setInterval;local ar=a.import(script,script.Parent.Parent.Parent,"utils","udim2").px;local kC=ar(56,56)local kD=14;local function kE()return string.gsub(os.date("%I:%M %p"),"^0([0-9])","%1")end;local function kF()local c4=p(function(F)return F.dashboard.isOpen end)local aW=ei("clock")local Z=aK(kE())local kG=Z[1]local kH=Z[2]local kI=l(function()return kB:GetTextSize(kG,20,"GothamBold",Vector2.new(200,56))end,{kG})k(function()local dj=dg(function()return kH(kE())end,1000)return function()return dj:clear()end end,{})local bf={}local y=ar(kI.X+kD,0)bf.Size=kC+y;bf.Position=aO(c4 and UDim2.new(0,0,1,0)or UDim2.new(0,0,1,48+56+20),{})bf.AnchorPoint=Vector2.new(0,1)bf.BackgroundTransparency=1;local G={b.createElement(bo,{radius=bp.Size146,size=UDim2.new(1,80,0,146),position=ar(-40,-20),color=aW.dropshadow,gradient=aW.dropshadowGradient,transparency=aW.transparency}),b.createElement(bm,{color=aW.background,gradient=aW.backgroundGradient,transparency=aW.transparency,radius=8})}local H=#G;local I=aW.outlined and b.createFragment({border=b.createElement(bb,{color=aW.foreground,radius=8,transparency=0.8})})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement("ImageLabel",{Image="rbxassetid://8992234911",ImageColor3=aW.foreground,Size=ar(36,36),Position=ar(10,10),BackgroundTransparency=1})G[H+2]=b.createElement("TextLabel",{Text=kG,Font="GothamBold",TextColor3=aW.foreground,TextSize=20,TextXAlignment="Left",TextYAlignment="Center",Size=ar(0,0),Position=ar(51,27),BackgroundTransparency=1})local c9=aW.acrylic and b.createElement(B)if c9 then if c9.elements~=nil or c9.props~=nil and c9.component~=nil then G[H+3]=c9 else for J,K in ipairs(c9)do G[H+2+J]=K end end end;return b.createElement("Frame",bf,G)end;local f=i(kF)return{default=f}end,newEnv("Orca.views.Clock.Clock"))()end)newModule("Dashboard","ModuleScript","Orca.views.Dashboard","Orca.views",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Dashboard").default;return g end,newEnv("Orca.views.Dashboard"))()end)newModule("Dashboard","ModuleScript","Orca.views.Dashboard.Dashboard","Orca.views.Dashboard",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local l=h.useMemo;local bl=a.import(script,script.Parent.Parent.Parent,"components","Canvas").default;local cx=a.import(script,script.Parent.Parent.Parent,"context","scale-context").ScaleContext;local p=a.import(script,script.Parent.Parent.Parent,"hooks","common","rodux-hooks").useAppSelector;local aO=a.import(script,script.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local dQ=a.import(script,script.Parent.Parent.Parent,"hooks","common","use-viewport-size").useViewportSize;local ap=a.import(script,script.Parent.Parent.Parent,"utils","color3").hex;local q=a.import(script,script.Parent.Parent.Parent,"utils","number-util").map;local r=a.import(script,script.Parent.Parent.Parent,"utils","udim2").scale;local kJ=a.import(script,script.Parent.Parent,"Hint").default;local kF=a.import(script,script.Parent.Parent,"Clock").default;local kK=a.import(script,script.Parent.Parent,"Navbar").default;local kL=a.import(script,script.Parent.Parent,"Pages").default;local kM=980;local kN=1080;local kO=14;local kP=48;local function kQ(a9)if a9<kN and a9>=kM then return q(a9,kM,kN,kO,kP)elseif a9<kM then return kO else return kP end end;local function kR(a9)if a9<kM then return q(a9,kM,130,1,0)else return 1 end end;local function c()local ec=dQ()local c4=p(function(F)return F.dashboard.isOpen end)local Z=l(function()return{ec:map(function(bg)return kR(bg.Y)end),ec:map(function(bg)return kQ(bg.Y)end)}end,{ec})local ck=Z[1]local bX=Z[2]return b.createElement(cx.Provider,{value=ck},{b.createElement("Frame",{Size=r(1,1),BackgroundColor3=ap("#000000"),BackgroundTransparency=aO(c4 and 0 or 1,{}),BorderSizePixel=0},{b.createElement("UIGradient",{Transparency=NumberSequence.new(1,0.25),Rotation=90})}),b.createElement(bl,{padding={top=48,bottom=bX,left=48,right=48}},{b.createElement(bl,{padding={bottom=bX:map(function(kS)return 56+kS end)}},{b.createElement(kL),b.createElement(kJ)}),b.createElement(kK),b.createElement(kF)})})end;local f=i(c)return{default=f}end,newEnv("Orca.views.Dashboard.Dashboard"))()end)newModule("Dashboard.story","ModuleScript","Orca.views.Dashboard.Dashboard.story","Orca.views.Dashboard",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local am=a.import(script,a.getModule(script,"@rbxts","roact-rodux-hooked").out).Provider;local an=a.import(script,script.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ao=a.import(script,script.Parent.Parent.Parent,"store","store").configureStore;local c=a.import(script,script.Parent,"Dashboard").default;return function(as)local at=b.mount(b.createElement(am,{store=ao({dashboard={isOpen=true,page=an.Home,hint=nil,apps={}}})},{b.createElement(c)}),as,"Dashboard")return function()return b.unmount(at)end end end,newEnv("Orca.views.Dashboard.Dashboard.story"))()end)newModule("Hint","ModuleScript","Orca.views.Hint","Orca.views",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Hint").default;return g end,newEnv("Orca.views.Hint"))()end)newModule("Hint","ModuleScript","Orca.views.Hint.Hint","Orca.views.Hint",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local k=h.useEffect;local aK=h.useState;local p=a.import(script,script.Parent.Parent.Parent,"hooks","common","rodux-hooks").useAppSelector;local b_=a.import(script,script.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local aO=a.import(script,script.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local cd=a.import(script,script.Parent.Parent.Parent,"hooks","use-scale").useScale;local ap=a.import(script,script.Parent.Parent.Parent,"utils","color3").hex;local r=a.import(script,script.Parent.Parent.Parent,"utils","udim2").scale;local function kJ()local ck=cd()local aV=p(function(F)return F.dashboard.hint end)local kT=p(function(F)return F.dashboard.isOpen end)local b5=aV;if b5==nil then b5=""end;local Z=aK(b5)local kU=Z[1]local kV=Z[2]local kW=b_(aV~=nil and kT,500,function(kX)return not kX end)k(function()if kW and aV~=nil then kV(aV)end end,{aV,kW})return b.createElement("TextLabel",{RichText=true,Text=kU,TextXAlignment="Right",TextYAlignment="Bottom",TextColor3=ap("#FFFFFF"),TextTransparency=aO(kW and 0.4 or 1,{}),Font="GothamSemibold",TextSize=18,BackgroundTransparency=1,Position=aO(kW and r(1,1)or UDim2.new(1,0,1,48),{})},{b.createElement("UIScale",{Scale=ck})})end;local f=i(kJ)return{default=f}end,newEnv("Orca.views.Hint.Hint"))()end)newModule("Navbar","ModuleScript","Orca.views.Navbar","Orca.views",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Navbar").default;return g end,newEnv("Orca.views.Navbar"))()end)newModule("Navbar","ModuleScript","Orca.views.Navbar.Navbar","Orca.views.Navbar",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local B=a.import(script,script.Parent.Parent.Parent,"components","Acrylic").default;local bb=a.import(script,script.Parent.Parent.Parent,"components","Border").default;local bl=a.import(script,script.Parent.Parent.Parent,"components","Canvas").default;local bm=a.import(script,script.Parent.Parent.Parent,"components","Fill").default;local bn=a.import(script,script.Parent.Parent.Parent,"components","Glow")local bo=bn.default;local bp=bn.GlowRadius;local p=a.import(script,script.Parent.Parent.Parent,"hooks","common","rodux-hooks").useAppSelector;local aO=a.import(script,script.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local dU=a.import(script,script.Parent.Parent.Parent,"hooks","use-current-page").useCurrentPage;local ei=a.import(script,script.Parent.Parent.Parent,"hooks","use-theme").useTheme;local kY=a.import(script,script.Parent.Parent.Parent,"store","models","dashboard.model")local an=kY.DashboardPage;local iD=kY.PAGE_TO_INDEX;local kZ=a.import(script,script.Parent.Parent.Parent,"utils","color3")local jU=kZ.getColorInSequence;local ap=kZ.hex;local aq=a.import(script,script.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local k_=a.import(script,script.Parent,"NavbarTab").default;local l0=ar(400,56)local l1;local function kK()local aW=ei("navbar")local c3=dU()local c4=p(function(F)return F.dashboard.isOpen end)local bN=aO(iD[c3]/4,{frequency=3.9,dampingRatio=0.76})local bf={Size=l0,Position=aO(c4 and UDim2.new(0.5,0,1,0)or UDim2.new(0.5,0,1,48+56+20),{}),AnchorPoint=Vector2.new(0.5,1),BackgroundTransparency=1}local G={b.createElement(bo,{radius=bp.Size146,size=UDim2.new(1,80,0,146),position=ar(-40,-20),color=aW.dropshadow,gradient=aW.dropshadowGradient,transparency=aW.transparency}),b.createElement(l1,{transparency=aW.glowTransparency,position=bN:map(function(hD)return hD+0.125 end),sequenceColor=bN:map(function(hD)return jU(aW.accentGradient.color,hD+0.125)end)}),b.createElement(bm,{color=aW.background,gradient=aW.backgroundGradient,radius=8,transparency=aW.transparency}),b.createElement(bl,{size=ar(100,56),position=bN:map(function(hD)return r(math.round(hD*800)/800,0)end),clipsDescendants=true},{b.createElement("Frame",{Size=l0,Position=bN:map(function(hD)return r(-4*math.round(hD*800)/800,0)end),BackgroundColor3=ap("#FFFFFF"),BorderSizePixel=0},{b.createElement("UIGradient",{Color=aW.accentGradient.color,Transparency=aW.accentGradient.transparency,Rotation=aW.accentGradient.rotation}),b.createElement("UICorner",{CornerRadius=UDim.new(0,8)})})})}local H=#G;local I=aW.outlined and b.createFragment({border=b.createElement(bb,{color=aW.foreground,radius=8,transparency=0.8})})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement(k_,{page=an.Home})G[H+2]=b.createElement(k_,{page=an.Apps})G[H+3]=b.createElement(k_,{page=an.Scripts})G[H+4]=b.createElement(k_,{page=an.Options})local c9=aW.acrylic and b.createElement(B)if c9 then if c9.elements~=nil or c9.props~=nil and c9.component~=nil then G[H+5]=c9 else for J,K in ipairs(c9)do G[H+4+J]=K end end end;return b.createElement("Frame",bf,G)end;local f=i(kK)function l1(l2)return b.createElement("ImageLabel",{Image="rbxassetid://8992238178",ImageColor3=l2.sequenceColor,ImageTransparency=l2.transparency,Size=ar(148,104),Position=l2.position:map(function(hD)return UDim2.new(hD,0,0,-18)end),AnchorPoint=Vector2.new(0.5,0),BackgroundTransparency=1})end;return{default=f}end,newEnv("Orca.views.Navbar.Navbar"))()end)newModule("Navbar.story","ModuleScript","Orca.views.Navbar.Navbar.story","Orca.views.Navbar",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local am=a.import(script,a.getModule(script,"@rbxts","roact-rodux-hooked").out).Provider;local an=a.import(script,script.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ao=a.import(script,script.Parent.Parent.Parent,"store","store").configureStore;local kK=a.import(script,script.Parent,"Navbar").default;return function(as)local at=b.mount(b.createElement(am,{store=ao({dashboard={isOpen=true,page=an.Home,hint=nil,apps={}}})},{b.createElement(kK)}),as,"Navbar")return function()return b.unmount(at)end end end,newEnv("Orca.views.Navbar.Navbar.story"))()end)newModule("NavbarTab","ModuleScript","Orca.views.Navbar.NavbarTab","Orca.views.Navbar",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local aK=h.useState;local aN=a.import(script,script.Parent.Parent.Parent,"hooks","common","rodux-hooks").useAppDispatch;local aO=a.import(script,script.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local ei=a.import(script,script.Parent.Parent.Parent,"hooks","use-theme").useTheme;local iu=a.import(script,script.Parent.Parent.Parent,"store","actions","dashboard.action").setDashboardPage;local kY=a.import(script,script.Parent.Parent.Parent,"store","models","dashboard.model")local iE=kY.PAGE_TO_ICON;local iD=kY.PAGE_TO_INDEX;local aq=a.import(script,script.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local l3=ar(100,56)local function k_(C)local c3=C.page;local aW=ei("navbar")local c5=c0(c3)local aZ=aN()local Z=aK(false)local l4=Z[1]local b1=Z[2]return b.createElement("TextButton",{Text="",AutoButtonColor=false,Active=not c5,Size=l3,Position=r(iD[c3]/4,0),BackgroundTransparency=1,[b.Event.Activated]=function()return aZ(iu(c3))end,[b.Event.MouseEnter]=function()return b1(true)end,[b.Event.MouseLeave]=function()return b1(false)end},{b.createElement("ImageLabel",{Image=iE[c3],ImageColor3=aW.foreground,ImageTransparency=aO(c5 and 0 or(l4 and 0.5 or 0.75),{}),Size=ar(36,36),Position=r(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1})})end;local f=i(k_)return{default=f}end,newEnv("Orca.views.Navbar.NavbarTab"))()end)newModule("Pages","ModuleScript","Orca.views.Pages","Orca.views",function()return setfenv(function()local a=require(script.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Pages").default;return g end,newEnv("Orca.views.Pages"))()end)newModule("Apps","ModuleScript","Orca.views.Pages.Apps","Orca.views.Pages",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Apps").default;return g end,newEnv("Orca.views.Pages.Apps"))()end)newModule("Apps","ModuleScript","Orca.views.Pages.Apps.Apps","Orca.views.Pages.Apps",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local l5=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).pure;local bl=a.import(script,script.Parent.Parent.Parent.Parent,"components","Canvas").default;local cd=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","use-scale").useScale;local r=a.import(script,script.Parent.Parent.Parent.Parent,"utils","udim2").scale;local dV=a.import(script,script.Parent,"Players").default;local function l6()local ck=cd()return b.createElement(bl,{position=r(0,1),anchor=Vector2.new(0,1)},{b.createElement("UIScale",{Scale=ck}),b.createElement(dV)})end;local f=l5(l6)return{default=f}end,newEnv("Orca.views.Pages.Apps.Apps"))()end)newModule("Players","ModuleScript","Orca.views.Pages.Apps.Players","Orca.views.Pages.Apps",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Players").default;return g end,newEnv("Orca.views.Pages.Apps.Players"))()end)newModule("Actions","ModuleScript","Orca.views.Pages.Apps.Players.Actions","Orca.views.Pages.Apps.Players",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local aT=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","ActionButton").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local function l7()local aW=ei("apps").players;return b.createElement(bl,{anchor=Vector2.new(0.5,0),size=ar(278,49),position=UDim2.new(0.5,0,0,304)},{b.createElement(aT,{action="teleport",hint="<font face='GothamBlack'>Teleport to</font> this player, tap again to cancel",theme=aW,image="rbxassetid://8992042585",position=ar(0,0),canDeactivate=true}),b.createElement(aT,{action="hide",hint="<font face='GothamBlack'>Hide</font> this player's character; persists between players",theme=aW,image="rbxassetid://8992042653",position=ar(72,0),canDeactivate=true}),b.createElement(aT,{action="kill",hint="<font face='GothamBlack'>Kill</font> this player with a tool handle",theme=aW,image="rbxassetid://8992042471",position=ar(145,0)}),b.createElement(aT,{action="spectate",hint="<font face='GothamBlack'>Spectate</font> this player",theme=aW,image="rbxassetid://8992042721",position=ar(217,0),canDeactivate=true})})end;local f=i(l7)return{default=f}end,newEnv("Orca.views.Pages.Apps.Players.Actions"))()end)newModule("Avatar","ModuleScript","Orca.views.Pages.Apps.Players.Avatar","Orca.views.Pages.Apps.Players",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local bb=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Border").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local p=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","rodux-hooks").useAppSelector;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local function l8()local aW=ei("apps").players;local hu=p(function(F)local b3;if F.dashboard.apps.playerSelected~=nil then b3=dV:FindFirstChild(F.dashboard.apps.playerSelected)else b3=nil end;return b3 end)return b.createElement(bl,{anchor=Vector2.new(0.5,0),size=ar(186,186),position=UDim2.new(0.5,0,0,24)},{b.createElement("ImageLabel",{Image="https://www.roblox.com/headshot-thumbnail/image?userId="..tostring(hu and hu.UserId or dV.LocalPlayer.UserId).."&width=150&height=150&format=png",Size=ar(150,150),Position=ar(18,18),BackgroundColor3=aW.avatar.background,BackgroundTransparency=aW.avatar.transparency},{b.createElement("UICorner",{CornerRadius=UDim.new(1,0)})}),b.createElement(bb,{size=4,radius="circular"},{b.createElement("UIGradient",{Color=aW.avatar.gradient.color,Transparency=aW.avatar.gradient.transparency,Rotation=aW.avatar.gradient.rotation})})})end;local f=i(l8)return{default=f}end,newEnv("Orca.views.Pages.Apps.Players.Avatar"))()end)newModule("Players","ModuleScript","Orca.views.Pages.Apps.Players.Players","Orca.views.Pages.Apps.Players",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local c1=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Card").default;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local l7=a.import(script,script.Parent,"Actions").default;local l8=a.import(script,script.Parent,"Avatar").default;local l9=a.import(script,script.Parent,"Selection").default;local la=a.import(script,script.Parent,"Username").default;local function dV()local aW=ei("apps").players;return b.createElement(c1,{index=1,page=an.Apps,theme=aW,size=ar(326,648),position=UDim2.new(0,0,1,0)},{b.createElement(l8),b.createElement(la),b.createElement(l7),b.createElement(l9)})end;local f=i(dV)return{default=f}end,newEnv("Orca.views.Pages.Apps.Players.Players"))()end)newModule("Selection","ModuleScript","Orca.views.Pages.Apps.Players.Selection","Orca.views.Pages.Apps.Players",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local k=h.useEffect;local l=h.useMemo;local aK=h.useState;local ey=a.import(script,a.getModule(script,"@rbxts","services"))local dV=ey.Players;local kB=ey.TextService;local bb=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Border").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local bm=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Fill").default;local bn=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Glow")local bo=bn.default;local bp=bn.GlowRadius;local cv=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"constants").IS_DEV;local cK=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","flipper-hooks").useLinear;local aM=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","rodux-hooks")local aN=aM.useAppDispatch;local p=aM.useAppSelector;local b_=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local aP=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","dashboard.action")local iv=aP.playerDeselected;local hu=aP.playerSelected;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local jN=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","array-util").arrayToMap;local ku=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","number-util").lerp;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local lb=20;local lc=60;local ld=326-24*2;local le=60;local lf=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.05,0),NumberSequenceKeypoint.new(0.9,0),NumberSequenceKeypoint.new(0.95,1),NumberSequenceKeypoint.new(1,1)})local function lg()local Z=aK(dV:GetPlayers())local lh=Z[1]local li=Z[2]k(function()local lj=dV.PlayerAdded:Connect(function()li(dV:GetPlayers())end)local lk=dV.PlayerRemoving:Connect(function()li(dV:GetPlayers())end)return function()lj:Disconnect()lk:Disconnect()end end,{})return lh end;local ll;local function l9()local aZ=aN()local lh=lg()local hu=p(function(F)return F.dashboard.apps.playerSelected end)local lm=l(function()local y=function(kS)return kS.Name==hu end;local b3=nil;for e5,K in ipairs(lh)do if y(K,e5-1,lh)==true then b3=K;break end end;local ln=b3;local c7=function(kS)return kS.Name~=hu and(kS~=dV.LocalPlayer or cv)end;local e1={}local H=0;for J,K in ipairs(lh)do if c7(K,J-1,lh)==true then H=H+1;e1[H]=K end end;local lo=function(hD,dG)return string.lower(hD.Name)<string.lower(dG.Name)end;table.sort(e1,lo)local lp=e1;local b4;if ln then local dk={ln}local bj=#dk;table.move(lp,1,#lp,bj+1,dk)b4=dk else b4=lp end;return b4 end,{lh,hu})k(function()local b5=hu~=nil;if b5 then local y=function(eB)return eB.Name==hu end;local b3=nil;for e5,K in ipairs(lm)do if y(K,e5-1,lm)==true then b3=K;break end end;b5=not b3 end;if b5 then aZ(iv())end end,{lh,hu})local bf={size=ar(326,280),position=ar(0,368),padding={left=24,right=24,top=8},clipsDescendants=true}local G={}local H=#G;local bh={Size=r(1,1),CanvasSize=ar(0,#lm*(lc+lb)+lb),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarImageTransparency=1,ScrollBarThickness=0,ClipsDescendants=false}local bi={}local bj=#bi;for J,K in pairs(jN(lm,function(eB,c2)return{eB.Name,b.createElement(ll,{name=eB.Name,displayName=eB.DisplayName,userId=eB.UserId,index=c2})}end))do bi[J]=K end;G[H+1]=b.createElement("ScrollingFrame",bh,bi)return b.createElement(bl,bf,G)end;local f=i(l9)local function lq(C)local hv=C.name;local lr=C.userId;local ls=C.displayName;local c2=C.index;local aZ=aN()local aW=ei("apps").players.playerButton;local c4=c0(an.Apps)local lt=b_(c4,c4 and 170+c2*40 or 150)local lu=p(function(F)return F.dashboard.apps.playerSelected==hv end)local Z=aK(false)local b0=Z[1]local b1=Z[2]local lv="  "..ls.." (@"..hv..")"local lw=l(function()return kB:GetTextSize(lv,14,Enum.Font.GothamBold,Vector2.new(1000,lc))end,{lv})local lx=cK(b0 and ld-le-20-lw.X or 0,{velocity=b0 and 40 or 150}):map(function(bU)return UDim.new(0,math.min(bU,0))end)local b3;if lu then b3=aW.accent else local b4;if b0 then local b5=aW.backgroundHovered;if b5==nil then b5=aW.background:Lerp(aW.accent,0.1)end;b4=b5 else b4=aW.background end;b3=b4 end;local b6=aO(b3,{})local b4;if lu then b4=aW.accent else local ft;if b0 then local b5=aW.backgroundHovered;if b5==nil then b5=aW.dropshadow:Lerp(aW.accent,0.5)end;ft=b5 else ft=aW.dropshadow end;b4=ft end;local ly=aO(b4,{})local b7=aO(lu and aW.foregroundAccent and aW.foregroundAccent or aW.foreground,{})local bf={size=ar(ld,lc),position=aO(lt and ar(0,(lb+lc)*c2)or ar(-ld-24,(lb+lc)*c2),{}),zIndex=c2}local G={b.createElement(bo,{radius=bp.Size70,color=ly,size=UDim2.new(1,36,1,36),position=ar(-18,5-18),transparency=aO(lu and aW.glowTransparency or(b0 and ku(aW.dropshadowTransparency,aW.glowTransparency,0.5)or aW.dropshadowTransparency),{})}),b.createElement(bm,{color=b6,transparency=aO(aW.backgroundTransparency,{}),radius=8}),b.createElement("TextLabel",{Text=lv,Font="GothamBold",TextSize=14,TextColor3=b7,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=aO(lu and 0 or(b0 and aW.foregroundTransparency/2 or aW.foregroundTransparency),{}),BackgroundTransparency=1,Position=ar(le,1),Size=UDim2.new(1,-le,1,-1),ClipsDescendants=true},{b.createElement("UIPadding",{PaddingLeft=lx}),b.createElement("UIGradient",{Transparency=lf})}),b.createElement("ImageLabel",{Image="https://www.roblox.com/headshot-thumbnail/image?userId="..tostring(lr).."&width=60&height=60&format=png",Size=UDim2.new(0,lc,0,lc),BackgroundTransparency=1},{b.createElement("UICorner",{CornerRadius=UDim.new(0,8)})})}local H=#G;local I=aW.outlined and b.createElement(bb,{color=b7,transparency=0.8,radius=8})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement("TextButton",{[b.Event.Activated]=function()local eB=dV:FindFirstChild(hv)local b5=not lu;if b5 then local ft=eB;if ft~=nil then ft=ft:IsA("Player")end;b5=ft end;if b5 then aZ(hu(eB))else aZ(iv())end end,[b.Event.MouseEnter]=function()return b1(true)end,[b.Event.MouseLeave]=function()return b1(false)end,Text="",Transparency=1,Size=r(1,1)})return b.createElement(bl,bf,G)end;ll=i(lq)return{default=f}end,newEnv("Orca.views.Pages.Apps.Players.Selection"))()end)newModule("Username","ModuleScript","Orca.views.Pages.Apps.Players.Username","Orca.views.Pages.Apps.Players",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local p=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","rodux-hooks").useAppSelector;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local function la()local aW=ei("apps").players;local hu=p(function(F)local b3;if F.dashboard.apps.playerSelected~=nil then b3=dV:FindFirstChild(F.dashboard.apps.playerSelected)else b3=nil end;return b3 end)return b.createElement(bl,{anchor=Vector2.new(0.5,0),size=ar(278,49),position=UDim2.new(0.5,0,0,231)},{b.createElement("TextLabel",{Font="GothamBlack",Text=hu and hu.DisplayName or"N/A",TextSize=20,TextColor3=aW.foreground,TextXAlignment="Center",TextYAlignment="Top",Size=r(1,1),BackgroundTransparency=1}),b.createElement("TextLabel",{Font="GothamBold",Text=hu and hu.Name or"Select a player",TextSize=16,TextColor3=aW.foreground,TextXAlignment="Center",TextYAlignment="Bottom",TextTransparency=0.7,Size=r(1,1),BackgroundTransparency=1})})end;local f=i(la)return{default=f}end,newEnv("Orca.views.Pages.Apps.Players.Username"))()end)newModule("Home","ModuleScript","Orca.views.Pages.Home","Orca.views.Pages",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Home").default;return g end,newEnv("Orca.views.Pages.Home"))()end)newModule("FriendActivity","ModuleScript","Orca.views.Pages.Home.FriendActivity","Orca.views.Pages.Home",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"FriendActivity").default;return g end,newEnv("Orca.views.Pages.Home.FriendActivity"))()end)newModule("FriendActivity","ModuleScript","Orca.views.Pages.Home.FriendActivity.FriendActivity","Orca.views.Pages.Home.FriendActivity",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local k=h.useEffect;local dn=h.useReducer;local aK=h.useState;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local c1=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Card").default;local dh=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-interval").useInterval;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local e3=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-friends").useFriendActivity;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local jN=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","array-util").arrayToMap;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local lz=a.import(script,script.Parent,"GameItem")local lA=lz.default;local lB=lz.GAME_PADDING;local function lC()local aW=ei("home").friendActivity;local Z=dn(function(F)return F+1 end,0)local d2=Z[1]local lD=Z[2]local dv=e3({d2})local lE=dv[1]local dZ=dv[3]local lF=aK(lE)local e4=lF[1]local lG=lF[2]k(function()if#lE>0 then local y=function(hD,dG)return#hD.friends>#dG.friends end;table.sort(lE,y)lG(lE)end end,{lE})dh(function()return lD()end,#lE==0 and dZ~="pending"and 5000 or 30000)local bf={index=3,page=an.Home,theme=aW,size=ar(326,416),position=UDim2.new(0,374,1,0)}local G={b.createElement("TextLabel",{Text="Friend Activity",Font="GothamBlack",TextSize=20,TextColor3=aW.foreground,TextXAlignment="Left",TextYAlignment="Top",Position=ar(24,24),BackgroundTransparency=1})}local H=#G;local bh={anchor=Vector2.new(0,1),size=aO(#e4>0 and UDim2.new(1,0,0,344)or UDim2.new(1,0,0,0),{}),position=r(0,1)}local bi={}local bj=#bi;local lH={Size=r(1,1),ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection="Y",CanvasSize=ar(0,#e4*(lB+156)+lB),BackgroundTransparency=1,BorderSizePixel=0}local lI={}local lJ=#lI;for J,K in pairs(jN(e4,function(e6,c2)return{tostring(e6.placeId),b.createElement(lA,{gameActivity=e6,index=c2})}end))do lI[J]=K end;bi[bj+1]=b.createElement("ScrollingFrame",lH,lI)G[H+1]=b.createElement(bl,bh,bi)return b.createElement(c1,bf,G)end;local f=i(lC)return{default=f}end,newEnv("Orca.views.Pages.Home.FriendActivity.FriendActivity"))()end)newModule("FriendItem","ModuleScript","Orca.views.Pages.Home.FriendActivity.FriendItem","Orca.views.Pages.Home.FriendActivity",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local aK=h.useState;local ey=a.import(script,a.getModule(script,"@rbxts","services"))local dV=ey.Players;local ib=ey.TeleportService;local bb=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Border").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local bm=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Fill").default;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local lK={frequency=6}local function lL(C)local e0=C.friend;local c2=C.index;local aW=ei("home").friendActivity.friendButton;local Z=aK(false)local l4=Z[1]local b1=Z[2]local lM="https://www.roblox.com/headshot-thumbnail/image?userId="..tostring(e0.VisitorId).."&width=48&height=48&format=png"local bf={size=aO(l4 and ar(96,48)or ar(48,48),lK)}local G={b.createElement("ImageLabel",{Image="rbxassetid://8992244272",ImageColor3=aO(l4 and aW.accent or aW.dropshadow,lK),ImageTransparency=aO(l4 and aW.glowTransparency or aW.dropshadowTransparency,lK),Size=aO(l4 and ar(88+36,74)or ar(76,74),lK),Position=ar(-14,-10),ScaleType="Slice",SliceCenter=Rect.new(Vector2.new(42,42),Vector2.new(42,42)),BackgroundTransparency=1}),b.createElement(bm,{radius=24,color=aO(l4 and aW.accent or aW.background,lK),transparency=aW.backgroundTransparency})}local H=#G;local I=aW.outlined and b.createFragment({border=b.createElement(bb,{radius=23,color=l4 and aW.foregroundAccent and aW.foregroundAccent or aW.foreground,transparency=0.7})})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement("ImageLabel",{Image=lM,ScaleType="Crop",Size=ar(48,48),LayoutOrder=c2,BackgroundTransparency=1},{b.createElement("UICorner",{CornerRadius=UDim.new(1,0)})})G[H+2]=b.createElement(bl,{clipsDescendants=true},{b.createElement("ImageLabel",{Image="rbxassetid://8992244380",ImageColor3=l4 and aW.foregroundAccent and aW.foregroundAccent or aW.foreground,ImageTransparency=aW.foregroundTransparency,Size=ar(36,36),Position=ar(48,6),BackgroundTransparency=1})})G[H+3]=b.createElement("TextButton",{Text="",AutoButtonColor=false,Size=r(1,1),BackgroundTransparency=1,[b.Event.Activated]=function()pcall(function()ib:TeleportToPlaceInstance(e0.PlaceId,e0.GameId,dV.LocalPlayer)end)end,[b.Event.MouseEnter]=function()return b1(true)end,[b.Event.MouseLeave]=function()return b1(false)end})return b.createElement(bl,bf,G)end;local f=i(lL)return{default=f}end,newEnv("Orca.views.Pages.Home.FriendActivity.FriendItem"))()end)newModule("GameItem","ModuleScript","Orca.views.Pages.Home.FriendActivity.GameItem","Orca.views.Pages.Home.FriendActivity",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local l5=h.pure;local l=h.useMemo;local bb=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Border").default;local b_=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local jN=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","array-util").arrayToMap;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local lL=a.import(script,script.Parent,"FriendItem").default;local lB=48;local function lA(C)local e6=C.gameActivity;local c2=C.index;local aW=ei("home").friendActivity;local c4=c0(an.Home)local lt=b_(c4,c4 and 330+c2*100 or 300)local lN=l(function()return#e6.friends*(48+10)+96 end,{#e6.friends})local bf={Image=e6.thumbnail,ScaleType="Crop",Size=ar(278,156),Position=aO(lt and ar(24,c2*(lB+156))or ar(-278,c2*(lB+156)),{}),BackgroundTransparency=1}local G={b.createElement(bb,{color=aW.foreground,radius=8,transparency=0.8}),b.createElement("UICorner",{CornerRadius=UDim.new(0,8)})}local H=#G;local bh={Size=UDim2.new(1,0,0,64),Position=UDim2.new(0,0,1,-24),CanvasSize=ar(lN,0),ScrollingDirection="X",ScrollBarThickness=0,ScrollBarImageTransparency=1,BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=false}local bi={b.createElement("UIListLayout",{SortOrder="LayoutOrder",FillDirection="Horizontal",HorizontalAlignment="Left",VerticalAlignment="Top",Padding=UDim.new(0,10)}),b.createElement("UIPadding",{PaddingLeft=UDim.new(0,10)})}local bj=#bi;for J,K in pairs(jN(e6.friends,function(e0,c2)return{tostring(e0.VisitorId),b.createElement(lL,{friend=e0,index=c2})}end))do bi[J]=K end;G[H+1]=b.createElement("ScrollingFrame",bh,bi)return b.createElement("ImageLabel",bf,G)end;local f=l5(lA)return{GAME_PADDING=lB,default=f}end,newEnv("Orca.views.Pages.Home.FriendActivity.GameItem"))()end)newModule("Home","ModuleScript","Orca.views.Pages.Home.Home","Orca.views.Pages.Home",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local l5=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).pure;local bl=a.import(script,script.Parent.Parent.Parent.Parent,"components","Canvas").default;local cd=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","use-scale").useScale;local r=a.import(script,script.Parent.Parent.Parent.Parent,"utils","udim2").scale;local lC=a.import(script,script.Parent,"FriendActivity").default;local lO=a.import(script,script.Parent,"Profile").default;local lP=a.import(script,script.Parent,"Server").default;local lQ=a.import(script,script.Parent,"Title").default;local function lR()local ck=cd()return b.createElement(bl,{position=r(0,1),anchor=Vector2.new(0,1)},{b.createElement("UIScale",{Scale=ck}),b.createElement(lQ),b.createElement(lP),b.createElement(lC),b.createElement(lO)})end;local f=l5(lR)return{default=f}end,newEnv("Orca.views.Pages.Home.Home"))()end)newModule("Profile","ModuleScript","Orca.views.Pages.Home.Profile","Orca.views.Pages.Home",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Profile").default;return g end,newEnv("Orca.views.Pages.Home.Profile"))()end)newModule("Actions","ModuleScript","Orca.views.Pages.Home.Profile.Actions","Orca.views.Pages.Home.Profile",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local aT=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","ActionButton").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local function l7()local aW=ei("home").profile;return b.createElement(bl,{anchor=Vector2.new(0.5,0),size=ar(278,49),position=UDim2.new(0.5,0,0,575)},{b.createElement(aT,{action="refresh",hint="<font face='GothamBlack'>Refresh</font> your character at this location",theme=aW,image="rbxassetid://8992253511",position=ar(0,0)}),b.createElement(aT,{action="ghost",hint="<font face='GothamBlack'>Spawn a ghost</font> and go to it when disabled",theme=aW,image="rbxassetid://8992253792",position=ar(72,0),canDeactivate=true}),b.createElement(aT,{action="godmode",hint="<font face='GothamBlack'>Set godmode</font>, may break respawn",theme=aW,image="rbxassetid://8992253678",position=ar(145,0)}),b.createElement(aT,{action="freecam",hint="<font face='GothamBlack'>Set freecam</font>, use Q & E to move vertically",theme=aW,image="rbxassetid://8992253933",position=ar(217,0),canDeactivate=true})})end;local f=i(l7)return{default=f}end,newEnv("Orca.views.Pages.Home.Profile.Actions"))()end)newModule("Avatar","ModuleScript","Orca.views.Pages.Home.Profile.Avatar","Orca.views.Pages.Home.Profile",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local bb=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Border").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local lS="https://www.roblox.com/headshot-thumbnail/image?userId="..tostring(dV.LocalPlayer.UserId).."&width=150&height=150&format=png"local function l8()local aW=ei("home").profile;return b.createElement(bl,{anchor=Vector2.new(0.5,0),size=ar(186,186),position=UDim2.new(0.5,0,0,24)},{b.createElement("ImageLabel",{Image=lS,Size=ar(150,150),Position=ar(18,18),BackgroundColor3=aW.avatar.background,BackgroundTransparency=aW.avatar.transparency},{b.createElement("UICorner",{CornerRadius=UDim.new(1,0)})}),b.createElement(bb,{size=4,radius="circular"},{b.createElement("UIGradient",{Color=aW.avatar.gradient.color,Transparency=aW.avatar.gradient.transparency,Rotation=aW.avatar.gradient.rotation})})})end;local f=i(l8)return{default=f}end,newEnv("Orca.views.Pages.Home.Profile.Avatar"))()end)newModule("Info","ModuleScript","Orca.views.Pages.Home.Profile.Info","Orca.views.Pages.Home.Profile",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local b_=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local dW=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-friends").useFriends;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local function lT()local aW=ei("home").profile;local c4=c0(an.Home)local Z=dW()local dY=Z[1]if dY==nil then dY={}end;local dZ=Z[3]local lU=#dY;local y=function(e0)return e0.PlaceId~=nil and e0.PlaceId==game.PlaceId end;local e1={}local H=0;for J,K in ipairs(dY)do if y(K,J-1,dY)==true then H=H+1;e1[H]=K end end;local lV=#e1;local lW=b_(c4,400,function(lX)return not lX end)local lY=b_(c4 and dZ~="pending",500,function(lX)return not lX end)local lZ=b_(c4 and dZ~="pending",600,function(lX)return not lX end)return b.createElement(bl,{anchor=Vector2.new(0.5,0),size=ar(278,48),position=UDim2.new(0.5,0,0,300)},{b.createElement("Frame",{Size=ar(0,26),Position=ar(90,11),BackgroundTransparency=1},{b.createElement("UIStroke",{Thickness=0.5,Color=aW.foreground,Transparency=0.7})}),b.createElement("Frame",{Size=ar(0,26),Position=ar(187,11),BackgroundTransparency=1},{b.createElement("UIStroke",{Thickness=0.5,Color=aW.foreground,Transparency=0.7})}),b.createElement("TextLabel",{Font="GothamBold",Text="Joined\n"..tostring(os.date("%m/%d/%Y",os.time()-dV.LocalPlayer.AccountAge*24*60*60)),TextSize=13,TextColor3=aW.foreground,TextXAlignment="Center",TextYAlignment="Center",TextTransparency=aO(lW and 0.2 or 1,{}),Size=ar(85,48),Position=aO(lW and ar(0,0)or ar(-20,0),{}),BackgroundTransparency=1}),b.createElement("TextLabel",{Font="GothamBold",Text=lV==1 and"1 friend\njoined"or tostring(lV).." friends\njoined",TextSize=13,TextColor3=aW.foreground,TextXAlignment="Center",TextYAlignment="Center",TextTransparency=aO(lY and 0.2 or 1,{}),Size=ar(85,48),Position=aO(lY and ar(97,0)or ar(97-20,0),{}),BackgroundTransparency=1}),b.createElement("TextLabel",{Font="GothamBold",Text=lU==1 and"1 friend\nonline"or tostring(lU).." friends\nonline",TextSize=13,TextColor3=aW.foreground,TextXAlignment="Center",TextYAlignment="Center",TextTransparency=aO(lZ and 0.2 or 1,{}),Size=ar(85,48),Position=aO(lZ and ar(193,0)or ar(193-20,0),{}),BackgroundTransparency=1})})end;local f=i(lT)return{default=f}end,newEnv("Orca.views.Pages.Home.Profile.Info"))()end)newModule("Profile","ModuleScript","Orca.views.Pages.Home.Profile.Profile","Orca.views.Pages.Home.Profile",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local c1=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Card").default;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local l7=a.import(script,script.Parent,"Actions").default;local l8=a.import(script,script.Parent,"Avatar").default;local lT=a.import(script,script.Parent,"Info").default;local l_=a.import(script,script.Parent,"Sliders").default;local la=a.import(script,script.Parent,"Username").default;local function lO()local aW=ei("home").profile;return b.createElement(c1,{index=1,page=an.Home,theme=aW,size=ar(326,648),position=UDim2.new(0,0,1,0)},{b.createElement(bl,{padding={left=24,right=24}},{b.createElement(l8),b.createElement(la),b.createElement(lT),b.createElement(l_),b.createElement(l7)})})end;local f=i(lO)return{default=f}end,newEnv("Orca.views.Pages.Home.Profile.Profile"))()end)newModule("Sliders","ModuleScript","Orca.views.Pages.Home.Profile.Sliders","Orca.views.Pages.Home.Profile",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local cc=h.useBinding;local aK=h.useState;local aL=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","BrightButton").default;local bD=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","BrightSlider").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local aM=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","rodux-hooks")local aN=aM.useAppDispatch;local p=aM.useAppSelector;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local aP=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","dashboard.action")local aQ=aP.clearHint;local aR=aP.setHint;local m0=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","jobs.action")local aS=m0.setJobActive;local iw=m0.setJobValue;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local bB={frequency=5}local m1;local function l_()return b.createElement(bl,{size=ar(278,187),position=ar(0,368)},{b.createElement(m1,{display="Flight",hint="<font face='GothamBlack'>Configure flight</font> in studs per second",jobName="flight",units="studs/s",min=10,max=100,position=0}),b.createElement(m1,{display="Speed",hint="<font face='GothamBlack'>Configure speed</font> in studs per second",jobName="walkSpeed",units="studs/s",min=0,max=100,position=69}),b.createElement(m1,{display="Jump",hint="<font face='GothamBlack'>Configure height</font> in studs",jobName="jumpHeight",units="studs",min=0,max=500,position=138})})end;local f=l_;local function m2(l2)local aW=ei("home").profile;local aZ=aN()local eM=p(function(F)return F.jobs[l2.jobName]end)local Z=cc(eM.value)local d3=Z[1]local m3=Z[2]local dv=aK(false)local b0=dv[1]local b1=dv[2]local b2=aW.highlight[l2.jobName]local b3;if eM.active then b3=b2 else local b4;if b0 then local b5=aW.button.backgroundHovered;if b5==nil then b5=aW.button.background:Lerp(b2,0.1)end;b4=b5 else b4=aW.button.background end;b3=b4 end;local m4=aO(b3,{})local m5=aO(eM.active and aW.button.foregroundAccent and aW.button.foregroundAccent or aW.foreground,{})return b.createElement(bl,{size=ar(278,49),position=ar(0,l2.position)},{b.createElement(bD,{onValueChanged=m3,onRelease=function()return aZ(iw(l2.jobName,math.round(d3:getValue())))end,min=l2.min,max=l2.max,initialValue=eM.value,size=ar(181,49),position=ar(0,0),radius=8,color=aW.slider.background,accentColor=b2,borderEnabled=aW.slider.outlined,borderColor=aW.slider.foreground,transparency=aW.slider.backgroundTransparency,indicatorTransparency=aW.slider.indicatorTransparency},{b.createElement("TextLabel",{Font="GothamBold",Text=d3:map(function(d3)return tostring(math.round(d3)).." "..l2.units end),TextSize=15,TextColor3=aW.slider.foreground,TextXAlignment="Center",TextYAlignment="Center",TextTransparency=aW.slider.foregroundTransparency,Size=r(1,1),BackgroundTransparency=1})}),b.createElement(aL,{onActivate=function()return aZ(aS(l2.jobName,not eM.active))end,onHover=function(b0)if b0 then b1(true)aZ(aR(l2.hint))else b1(false)aZ(aQ())end end,size=ar(85,49),position=ar(193,0),radius=8,color=m4,borderEnabled=aW.button.outlined,borderColor=m5,transparency=aW.button.backgroundTransparency},{b.createElement("TextLabel",{Font="GothamBold",Text=l2.display,TextSize=15,TextColor3=m5,TextXAlignment="Center",TextYAlignment="Center",TextTransparency=aO(eM.active and 0 or(b0 and aW.button.foregroundTransparency-0.25 or aW.button.foregroundTransparency),{}),Size=r(1,1),BackgroundTransparency=1})})})end;m1=i(m2)return{default=f}end,newEnv("Orca.views.Pages.Home.Profile.Sliders"))()end)newModule("Username","ModuleScript","Orca.views.Pages.Home.Profile.Username","Orca.views.Pages.Home.Profile",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local function la()local aW=ei("home").profile;return b.createElement(bl,{anchor=Vector2.new(0.5,0),size=ar(278,49),position=UDim2.new(0.5,0,0,231)},{b.createElement("TextLabel",{Font="GothamBlack",Text=dV.LocalPlayer.DisplayName,TextSize=20,TextColor3=aW.foreground,TextXAlignment="Center",TextYAlignment="Top",Size=r(1,1),BackgroundTransparency=1}),b.createElement("TextLabel",{Font="GothamBold",Text=dV.LocalPlayer.Name,TextSize=16,TextColor3=aW.foreground,TextXAlignment="Center",TextYAlignment="Bottom",TextTransparency=0.7,Size=r(1,1),BackgroundTransparency=1})})end;local f=i(la)return{default=f}end,newEnv("Orca.views.Pages.Home.Profile.Username"))()end)newModule("Server","ModuleScript","Orca.views.Pages.Home.Server","Orca.views.Pages.Home",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Server").default;return g end,newEnv("Orca.views.Pages.Home.Server"))()end)newModule("Server","ModuleScript","Orca.views.Pages.Home.Server.Server","Orca.views.Pages.Home.Server",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local dV=a.import(script,a.getModule(script,"@rbxts","services")).Players;local c1=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Card").default;local cv=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"constants").IS_DEV;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local m6=a.import(script,script.Parent,"ServerAction").default;local m7=a.import(script,script.Parent,"StatusLabel").default;local function lP()local aW=ei("home").server;return b.createElement(c1,{index=2,page=an.Home,theme=aW,size=ar(326,184),position=UDim2.new(0,374,1,-416-48)},{b.createElement("TextLabel",{Text="Server",Font="GothamBlack",TextSize=20,TextColor3=aW.foreground,TextXAlignment="Left",TextYAlignment="Top",Position=ar(24,24),BackgroundTransparency=1}),b.createElement(m7,{index=0,offset=69,units="players",getValue=function()return tostring(#dV:GetPlayers()).." / "..tostring(dV.MaxPlayers)end}),b.createElement(m7,{index=1,offset=108,units="elapsed",getValue=function()local m8=cv and os.clock()or time()local m9=math.floor(m8/86400)local ma=math.floor((m8-m9*86400)/3600)local mb=math.floor((m8-m9*86400-ma*3600)/60)local mc=math.floor(m8-m9*86400-ma*3600-mb*60)return m9>0 and tostring(m9).." days"or(ma>0 and tostring(ma).." hours"or(mb>0 and tostring(mb).." minutes"or tostring(mc).." seconds"))end}),b.createElement(m7,{index=2,offset=147,units="ping",getValue=function()return tostring(math.round(dV.LocalPlayer:GetNetworkPing()*1000)).." ms"end}),b.createElement(m6,{action="switchServer",hint="<font face='GothamBlack'>Switch</font> to a different server",icon="rbxassetid://8992259774",size=ar(66,50),position=UDim2.new(1,-66-24,1,-100-16-12)}),b.createElement(m6,{action="rejoinServer",hint="<font face='GothamBlack'>Rejoin</font> this server",icon="rbxassetid://8992259894",size=ar(66,50),position=UDim2.new(1,-66-24,1,-50-16)})})end;local f=i(lP)return{default=f}end,newEnv("Orca.views.Pages.Home.Server.Server"))()end)newModule("ServerAction","ModuleScript","Orca.views.Pages.Home.Server.ServerAction","Orca.views.Pages.Home.Server",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local aK=h.useState;local aL=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","BrightButton").default;local aM=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","rodux-hooks")local aN=aM.useAppDispatch;local p=aM.useAppSelector;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local aP=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","dashboard.action")local aQ=aP.clearHint;local aR=aP.setHint;local aS=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","jobs.action").setJobActive;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local function m6(C)local aU=C.action;local aV=C.hint;local md=C.icon;local Q=C.size;local R=C.position;local aZ=aN()local aW=ei("home").server[aU=="switchServer"and"switchButton"or"rejoinButton"]local a_=p(function(F)return F.jobs[aU].active end)local Z=aK(false)local b0=Z[1]local b1=Z[2]local b3;if a_ then b3=aW.accent else local b4;if b0 then local b5=aW.backgroundHovered;if b5==nil then b5=aW.background:Lerp(aW.accent,0.1)end;b4=b5 else b4=aW.background end;b3=b4 end;local b6=aO(b3,{})local b7=aO(a_ and aW.foregroundAccent and aW.foregroundAccent or aW.foreground,{})return b.createElement(aL,{onActivate=function()return aZ(aS(aU,not a_))end,onHover=function(b0)if b0 then b1(true)aZ(aR(aV))else b1(false)aZ(aQ())end end,size=Q,position=R,radius=8,color=b6,borderEnabled=aW.outlined,borderColor=b7,transparency=aW.backgroundTransparency},{b.createElement("ImageLabel",{Image=md,ImageColor3=b7,ImageTransparency=aO(a_ and 0 or(b0 and aW.foregroundTransparency-0.25 or aW.foregroundTransparency),{}),AnchorPoint=Vector2.new(0.5,0.5),Size=ar(36,36),Position=r(0.5,0.5),BackgroundTransparency=1})})end;local f=i(m6)return{default=f}end,newEnv("Orca.views.Pages.Home.Server.ServerAction"))()end)newModule("StatusLabel","ModuleScript","Orca.views.Pages.Home.Server.StatusLabel","Orca.views.Pages.Home.Server",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local l=h.useMemo;local aK=h.useState;local kB=a.import(script,a.getModule(script,"@rbxts","services")).TextService;local b_=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local dh=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-interval").useInterval;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ar=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2").px;local function m7(C)local ct=C.offset;local c2=C.index;local me=C.units;local mf=C.getValue;local aW=ei("home").server;local Z=aK(mf)local d3=Z[1]local m3=Z[2]local c4=c0(an.Home)local lt=b_(c4,c4 and 330+c2*100 or 300)local mg=l(function()return kB:GetTextSize(d3 .." ",16,"GothamBold",Vector2.new()).X end,{d3})dh(function()m3(mf())end,1000)return b.createFragment({b.createElement("TextLabel",{Text=d3,RichText=true,Font="GothamBold",TextSize=16,TextColor3=aW.foreground,TextTransparency=aO(lt and 0 or 1,{frequency=2}),TextXAlignment="Left",TextYAlignment="Top",Position=aO(lt and ar(24,ct)or ar(0,ct),{}),BackgroundTransparency=1}),b.createElement("TextLabel",{Text=me,RichText=true,Font="GothamBold",TextSize=16,TextColor3=aW.foreground,TextTransparency=aO(lt and 0.4 or 1,{}),TextXAlignment="Left",TextYAlignment="Top",Position=aO(lt and ar(24+mg,ct)or ar(0+mg,ct),{}),BackgroundTransparency=1})})end;local f=i(m7)return{default=f}end,newEnv("Orca.views.Pages.Home.Server.StatusLabel"))()end)newModule("Title","ModuleScript","Orca.views.Pages.Home.Title","Orca.views.Pages.Home",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local bl=a.import(script,script.Parent.Parent.Parent.Parent,"components","Canvas").default;local c1=a.import(script,script.Parent.Parent.Parent.Parent,"components","Card").default;local cr=a.import(script,script.Parent.Parent.Parent.Parent,"components","ParallaxImage").default;local cw=a.import(script,script.Parent.Parent.Parent.Parent,"constants").VERSION_TAG;local b_=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local aO=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local e9=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","use-parallax-offset").useParallaxOffset;local ei=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local aq=a.import(script,script.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local mh;local function lQ()local aW=ei("home").title;local ct=e9()return b.createElement(c1,{index=0,page=an.Home,theme=aW,size=ar(326,184),position=UDim2.new(0,0,1,-648-48)},{b.createElement(cr,{image="rbxassetid://9049308243",imageSize=Vector2.new(652,368),padding=Vector2.new(30,30),offset=ct},{b.createElement("UICorner",{CornerRadius=UDim.new(0,12)})}),b.createElement("ImageLabel",{Image="rbxassetid://9048947177",Size=r(1,1),ImageTransparency=0.3,BackgroundTransparency=1},{b.createElement("UICorner",{CornerRadius=UDim.new(0,12)})}),b.createElement(bl,{padding={top=24,left=24}},{b.createElement(mh,{index=0,text="Orca",font=Enum.Font.GothamBlack,size=20,position=ar(0,0)}),b.createElement(mh,{index=1,text=cw,position=ar(0,40)}),b.createElement(mh,{index=2,text="By 0866",position=ar(0,63),transparency=0.15}),b.createElement(mh,{index=3,text="Pls star repo",position=ar(0,86),transparency=0.3}),b.createElement(mh,{index=4,text="richie0866/orca",position=UDim2.new(0,0,1,-40),transparency=0.45})})})end;local f=i(lQ)local function mi(l2)local Z=l2;local c2=Z.index;local lv=Z.text;local mj=Z.font;if mj==nil then mj=Enum.Font.GothamBold end;local Q=Z.size;if Q==nil then Q=16 end;local R=Z.position;local bd=Z.transparency;if bd==nil then bd=0 end;local aW=ei("home").title;local c4=c0(an.Home)local c5=b_(c4,c2*100+300,function(hE)return not hE end)local bf={Text=lv,Font=mj,TextColor3=aW.foreground,TextSize=Q,TextTransparency=aO(c5 and bd or 1,{frequency=2}),TextXAlignment="Left",TextYAlignment="Top",Size=ar(200,24)}local b3;if c5 then b3=R else local y=ar(24,0)b3=R-y end;bf.Position=aO(b3,{})bf.BackgroundTransparency=1;return b.createElement("TextLabel",bf)end;mh=i(mi)return{default=f}end,newEnv("Orca.views.Pages.Home.Title"))()end)newModule("Options","ModuleScript","Orca.views.Pages.Options","Orca.views.Pages",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Options").default;return g end,newEnv("Orca.views.Pages.Options"))()end)newModule("Config","ModuleScript","Orca.views.Pages.Options.Config","Orca.views.Pages.Options",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Config").default;return g end,newEnv("Orca.views.Pages.Options.Config"))()end)newModule("Config","ModuleScript","Orca.views.Pages.Options.Config.Config","Orca.views.Pages.Options.Config",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local c1=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Card").default;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local mk=a.import(script,script.Parent,"ConfigItem")local ml=mk.default;local lc=mk.ENTRY_HEIGHT;local lb=mk.PADDING;local mm=1;local function mn()local aW=ei("options").config;return b.createElement(c1,{index=0,page=an.Options,theme=aW,size=ar(326,184),position=UDim2.new(0,0,1,-416-48)},{b.createElement("TextLabel",{Text="Options",Font="GothamBlack",TextSize=20,TextColor3=aW.foreground,TextXAlignment="Left",TextYAlignment="Top",Position=ar(24,24),BackgroundTransparency=1}),b.createElement(bl,{size=ar(326,348),position=ar(0,68),padding={left=24,right=24,top=8},clipsDescendants=true},{b.createElement("ScrollingFrame",{Size=r(1,1),CanvasSize=ar(0,mm*(lc+lb)+lb),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarImageTransparency=1,ScrollBarThickness=0,ClipsDescendants=false},{b.createElement(ml,{action="acrylicBlur",description="Acrylic background blurring",hint="<font face='GothamBlack'>Toggle BG blur</font> in some themes. May be detectable when enabled.",index=0})})})})end;local f=i(mn)return{default=f}end,newEnv("Orca.views.Pages.Options.Config.Config"))()end)newModule("ConfigItem","ModuleScript","Orca.views.Pages.Options.Config.ConfigItem","Orca.views.Pages.Options.Config",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local l5=h.pure;local aK=h.useState;local bb=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Border").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local bm=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Fill").default;local bn=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Glow")local bo=bn.default;local bp=bn.GlowRadius;local aM=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","rodux-hooks")local aN=aM.useAppDispatch;local p=aM.useAppSelector;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local aP=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","dashboard.action")local aQ=aP.clearHint;local aR=aP.setHint;local ix=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","options.action").setConfig;local ku=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","number-util").lerp;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local lb=20;local lc=60;local ld=326-24*2;local le=16;local function ml(C)local aU=C.action;local mo=C.description;local aV=C.hint;local c2=C.index;local aZ=aN()local mp=ei("options").config.configButton;local a_=p(function(F)return F.options.config[aU]end)local Z=aK(false)local b0=Z[1]local b1=Z[2]local b3;if a_ then b3=mp.accent else local b4;if b0 then local b5=mp.backgroundHovered;if b5==nil then b5=mp.background:Lerp(mp.accent,0.1)end;b4=b5 else b4=mp.background end;b3=b4 end;local b6=aO(b3,{})local b4;if a_ then b4=mp.accent else local ft;if b0 then local b5=mp.backgroundHovered;if b5==nil then b5=mp.dropshadow:Lerp(mp.accent,0.5)end;ft=b5 else ft=mp.dropshadow end;b4=ft end;local ly=aO(b4,{})local b7=aO(a_ and mp.foregroundAccent and mp.foregroundAccent or mp.foreground,{})local bf={size=ar(ld,lc),position=ar(0,(lb+lc)*c2),zIndex=c2}local G={b.createElement(bo,{radius=bp.Size70,color=ly,size=UDim2.new(1,36,1,36),position=ar(-18,5-18),transparency=aO(a_ and mp.glowTransparency or(b0 and ku(mp.dropshadowTransparency,mp.glowTransparency,0.5)or mp.dropshadowTransparency),{})}),b.createElement(bm,{color=b6,transparency=mp.backgroundTransparency,radius=8}),b.createElement("TextLabel",{Text=mo,Font="GothamBold",TextSize=16,TextColor3=b7,TextXAlignment="Left",TextYAlignment="Center",TextTransparency=aO(a_ and 0 or(b0 and mp.foregroundTransparency/2 or mp.foregroundTransparency),{}),Position=ar(le,1),Size=UDim2.new(1,-le,1,-1),BackgroundTransparency=1,ClipsDescendants=true})}local H=#G;local I=mp.outlined and b.createElement(bb,{color=b7,transparency=0.8,radius=8})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement("TextButton",{[b.Event.Activated]=function()return aZ(ix(aU,not a_))end,[b.Event.MouseEnter]=function()b1(true)aZ(aR(aV))end,[b.Event.MouseLeave]=function()b1(false)aZ(aQ())end,Text="",Size=r(1,1),Transparency=1})return b.createElement(bl,bf,G)end;local f=l5(ml)return{PADDING=lb,ENTRY_HEIGHT=lc,ENTRY_WIDTH=ld,ENTRY_TEXT_PADDING=le,default=f}end,newEnv("Orca.views.Pages.Options.Config.ConfigItem"))()end)newModule("Options","ModuleScript","Orca.views.Pages.Options.Options","Orca.views.Pages.Options",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local l5=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).pure;local bl=a.import(script,script.Parent.Parent.Parent.Parent,"components","Canvas").default;local cd=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","use-scale").useScale;local r=a.import(script,script.Parent.Parent.Parent.Parent,"utils","udim2").scale;local mn=a.import(script,script.Parent,"Config").default;local mq=a.import(script,script.Parent,"Shortcuts").default;local mr=a.import(script,script.Parent,"Themes").default;local function ms()local ck=cd()return b.createElement(bl,{position=r(0,1),anchor=Vector2.new(0,1)},{b.createElement("UIScale",{Scale=ck}),b.createElement(mn),b.createElement(mr),b.createElement(mq)})end;local f=l5(ms)return{default=f}end,newEnv("Orca.views.Pages.Options.Options"))()end)newModule("Shortcuts","ModuleScript","Orca.views.Pages.Options.Shortcuts","Orca.views.Pages.Options",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Shortcuts").default;return g end,newEnv("Orca.views.Pages.Options.Shortcuts"))()end)newModule("ShortcutItem","ModuleScript","Orca.views.Pages.Options.Shortcuts.ShortcutItem","Orca.views.Pages.Options.Shortcuts",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local l5=h.pure;local k=h.useEffect;local aK=h.useState;local bx=a.import(script,a.getModule(script,"@rbxts","services")).UserInputService;local bb=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Border").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local bm=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Fill").default;local bn=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Glow")local bo=bn.default;local bp=bn.GlowRadius;local aM=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","rodux-hooks")local aN=aM.useAppDispatch;local p=aM.useAppSelector;local b_=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local mt=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","options.action")local iB=mt.removeShortcut;local iy=mt.setShortcut;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ku=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","number-util").lerp;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local lb=20;local lc=60;local ld=326-24*2;local le=16;local function mu(C)local bs=C.onActivate;local mv=C.onSelect;local mw=C.selectedItem;local aU=C.action;local mo=C.description;local c2=C.index;local aZ=aN()local mp=ei("options").shortcuts.shortcutButton;local c4=c0(an.Options)local lt=b_(c4,c4 and 250+c2*40 or 230)local iz=p(function(F)return F.options.shortcuts[aU]end)local aA=Enum.KeyCode:GetEnumItems()local y=function(mx)return mx.Value==iz end;local b3=nil;for e5,K in ipairs(aA)do if y(K,e5-1,aA)==true then b3=K;break end end;local my=b3;local ln=mw==aU;local Z=aK(false)local b0=Z[1]local b1=Z[2]k(function()if mw~=nil then return nil end;local at=bx.InputBegan:Connect(function(bV,eN)if not eN and bV.KeyCode.Value==iz then bs()end end)return function()at:Disconnect()end end,{mw,iz})k(function()if not ln then return nil end;local at=bx.InputBegan:Connect(function(bV,eN)if eN then return nil end;if bV.UserInputType==Enum.UserInputType.MouseButton1 then mv(nil)return nil end;local aC=bV.KeyCode;repeat if aC==Enum.KeyCode.Unknown then break end;if aC==Enum.KeyCode.Escape then aZ(iB(aU))mv(nil)break end;if aC==Enum.KeyCode.Backspace then aZ(iB(aU))mv(nil)break end;if aC==Enum.KeyCode.Return then mv(nil)break end;aZ(iy(aU,bV.KeyCode.Value))mv(nil)break until true end)return function()at:Disconnect()end end,{ln})local b4;if ln then b4=mp.accent else local ft;if b0 then local b5=mp.backgroundHovered;if b5==nil then b5=mp.background:Lerp(mp.accent,0.1)end;ft=b5 else ft=mp.background end;b4=ft end;local b6=aO(b4,{})local ft;if ln then ft=mp.accent else local mz;if b0 then local b5=mp.backgroundHovered;if b5==nil then b5=mp.dropshadow:Lerp(mp.accent,0.5)end;mz=b5 else mz=mp.dropshadow end;ft=mz end;local ly=aO(ft,{})local b7=aO(ln and mp.foregroundAccent and mp.foregroundAccent or mp.foreground,{})local bf={size=ar(ld,lc),position=aO(lt and ar(0,(lb+lc)*c2)or ar(-ld-24,(lb+lc)*c2),{}),zIndex=c2}local G={b.createElement(bo,{radius=bp.Size70,color=ly,size=UDim2.new(1,36,1,36),position=ar(-18,5-18),transparency=aO(ln and mp.glowTransparency or(b0 and ku(mp.dropshadowTransparency,mp.glowTransparency,0.5)or mp.dropshadowTransparency),{})}),b.createElement(bm,{color=b6,transparency=mp.backgroundTransparency,radius=8}),b.createElement("TextLabel",{Text=mo,Font="GothamBold",TextSize=16,TextColor3=b7,TextXAlignment="Left",TextYAlignment="Center",TextTransparency=aO(ln and 0 or(b0 and mp.foregroundTransparency/2 or mp.foregroundTransparency),{}),Position=ar(le,1),Size=UDim2.new(1,-le,1,-1),BackgroundTransparency=1,ClipsDescendants=true}),b.createElement("TextLabel",{Text=my and my.Name or"Not bound",Font="GothamBold",TextSize=16,TextColor3=b7,TextXAlignment="Center",TextYAlignment="Center",TextTransparency=aO(ln and 0 or(b0 and mp.foregroundTransparency/2 or mp.foregroundTransparency),{}),TextTruncate="AtEnd",AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,0,0,1),Size=UDim2.new(0,124,1,-1),BackgroundTransparency=1,ClipsDescendants=true}),b.createElement("Frame",{Size=mp.outlined and UDim2.new(0,1,1,-2)or UDim2.new(0,1,1,-36),Position=mp.outlined and UDim2.new(1,-124,0,1)or UDim2.new(1,-124,0,18),BackgroundColor3=b7,BackgroundTransparency=0.8,BorderSizePixel=0})}local H=#G;local I=mp.outlined and b.createElement(bb,{color=b7,transparency=0.8,radius=8})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement("TextButton",{[b.Event.Activated]=function()return mv(aU)end,[b.Event.MouseEnter]=function()return b1(true)end,[b.Event.MouseLeave]=function()return b1(false)end,Text="",Size=r(1,1),Transparency=1})return b.createElement(bl,bf,G)end;local f=l5(mu)return{PADDING=lb,ENTRY_HEIGHT=lc,ENTRY_WIDTH=ld,ENTRY_TEXT_PADDING=le,default=f}end,newEnv("Orca.views.Pages.Options.Shortcuts.ShortcutItem"))()end)newModule("Shortcuts","ModuleScript","Orca.views.Pages.Options.Shortcuts.Shortcuts","Orca.views.Pages.Options.Shortcuts",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local aK=h.useState;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local c1=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Card").default;local aM=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","rodux-hooks")local aN=aM.useAppDispatch;local cU=aM.useAppStore;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local im=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","dashboard.action").toggleDashboard;local aS=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","jobs.action").setJobActive;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local mA=a.import(script,script.Parent,"ShortcutItem")local mu=mA.default;local lc=mA.ENTRY_HEIGHT;local lb=mA.PADDING;local mm=6;local function mq()local eu=cU()local aZ=aN()local aW=ei("options").shortcuts;local Z=aK(nil)local mw=Z[1]local mB=Z[2]return b.createElement(c1,{index=1,page=an.Options,theme=aW,size=ar(326,416),position=UDim2.new(0,0,1,0)},{b.createElement("TextLabel",{Text="Shortcuts",Font="GothamBlack",TextSize=20,TextColor3=aW.foreground,TextXAlignment="Left",TextYAlignment="Top",Position=ar(24,24),BackgroundTransparency=1}),b.createElement(bl,{size=ar(326,348),position=ar(0,68),padding={left=24,right=24,top=8},clipsDescendants=true},{b.createElement("ScrollingFrame",{Size=r(1,1),CanvasSize=ar(0,mm*(lc+lb)+lb),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarImageTransparency=1,ScrollBarThickness=0,ClipsDescendants=false},{b.createElement(mu,{onActivate=function()aZ(im())end,onSelect=mB,selectedItem=mw,action="toggleDashboard",description="Open Orca",index=0}),b.createElement(mu,{onActivate=function()aZ(aS("flight",not eu:getState().jobs.flight.active))end,onSelect=mB,selectedItem=mw,action="toggleFlight",description="Toggle flight",index=1}),b.createElement(mu,{onActivate=function()aZ(aS("freecam",not eu:getState().jobs.freecam.active))end,onSelect=mB,selectedItem=mw,action="setFreecam",description="Set freecam",index=2}),b.createElement(mu,{onActivate=function()aZ(aS("ghost",not eu:getState().jobs.ghost.active))end,onSelect=mB,selectedItem=mw,action="setGhost",description="Set ghost mode",index=3}),b.createElement(mu,{onActivate=function()aZ(aS("walkSpeed",not eu:getState().jobs.walkSpeed.active))end,onSelect=mB,selectedItem=mw,action="setSpeed",description="Set walk speed",index=4}),b.createElement(mu,{onActivate=function()aZ(aS("jumpHeight",not eu:getState().jobs.jumpHeight.active))end,onSelect=mB,selectedItem=mw,action="setJumpHeight",description="Set jump height",index=5})})})})end;local f=i(mq)return{default=f}end,newEnv("Orca.views.Pages.Options.Shortcuts.Shortcuts"))()end)newModule("Themes","ModuleScript","Orca.views.Pages.Options.Themes","Orca.views.Pages.Options",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Themes").default;return g end,newEnv("Orca.views.Pages.Options.Themes"))()end)newModule("ThemeItem","ModuleScript","Orca.views.Pages.Options.Themes.ThemeItem","Orca.views.Pages.Options.Themes",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local aK=h.useState;local bb=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Border").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local bm=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Fill").default;local bn=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Glow")local bo=bn.default;local bp=bn.GlowRadius;local aM=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","rodux-hooks")local aN=aM.useAppDispatch;local p=aM.useAppSelector;local b_=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local aO=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local iC=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","actions","options.action").setTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local kZ=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","color3")local jT=kZ.getLuminance;local ap=kZ.hex;local ku=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","number-util").lerp;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local lb=20;local lc=60;local ld=326-24*2;local le=16;local mC;local function mD(C)local aW=C.theme;local c2=C.index;local aZ=aN()local mp=ei("options").themes.themeButton;local c4=c0(an.Options)local lt=b_(c4,c4 and 300+c2*40 or 280)local lu=p(function(F)return F.options.currentTheme==aW.name end)local Z=aK(false)local b0=Z[1]local b1=Z[2]local b3;if lu then b3=mp.accent else local b4;if b0 then local b5=mp.backgroundHovered;if b5==nil then b5=mp.background:Lerp(mp.accent,0.1)end;b4=b5 else b4=mp.background end;b3=b4 end;local b6=aO(b3,{})local b4;if lu then b4=mp.accent else local ft;if b0 then local b5=mp.backgroundHovered;if b5==nil then b5=mp.dropshadow:Lerp(mp.accent,0.5)end;ft=b5 else ft=mp.dropshadow end;b4=ft end;local ly=aO(b4,{})local b7=aO(lu and mp.foregroundAccent and mp.foregroundAccent or mp.foreground,{})local bf={size=ar(ld,lc),position=aO(lt and ar(0,(lb+lc)*c2)or ar(-ld-24,(lb+lc)*c2),{}),zIndex=c2}local G={b.createElement(bo,{radius=bp.Size70,color=ly,size=UDim2.new(1,36,1,36),position=ar(-18,5-18),transparency=aO(lu and mp.glowTransparency or(b0 and ku(mp.dropshadowTransparency,mp.glowTransparency,0.5)or mp.dropshadowTransparency),{})}),b.createElement(bm,{color=b6,transparency=mp.backgroundTransparency,radius=8}),b.createElement("TextLabel",{Text=aW.name,Font="GothamBold",TextSize=16,TextColor3=b7,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=aO(lu and 0 or(b0 and mp.foregroundTransparency/2 or mp.foregroundTransparency),{}),BackgroundTransparency=1,Position=ar(le,1),Size=UDim2.new(1,-le,1,-1),ClipsDescendants=true}),b.createElement(mC,{color=b6,previewTheme=aW.preview})}local H=#G;local I=mp.outlined and b.createElement(bb,{color=b7,transparency=0.8,radius=8})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement("TextButton",{[b.Event.Activated]=function()return not lu and aZ(iC(aW.name))end,[b.Event.MouseEnter]=function()return b1(true)end,[b.Event.MouseLeave]=function()return b1(false)end,Text="",Transparency=1,Size=r(1,1)})return b.createElement(bl,bf,G)end;local f=i(mD)function mC(C)local bc=C.color;local mE=C.previewTheme;return b.createElement("Frame",{AnchorPoint=Vector2.new(1,0),Size=UDim2.new(0,114,1,-4),Position=UDim2.new(1,-2,0,2),BackgroundColor3=bc,Transparency=1,BorderSizePixel=0},{b.createElement("UICorner",{CornerRadius=UDim.new(0,6)}),b.createElement("Frame",{AnchorPoint=Vector2.new(0,0.5),Size=ar(25,25),Position=UDim2.new(0,12,0.5,0),BackgroundColor3=ap("#ffffff"),BorderSizePixel=0},{b.createElement("UICorner",{CornerRadius=UDim.new(1,0)}),b.createElement("UIGradient",{Color=mE.foreground.color,Transparency=mE.foreground.transparency,Rotation=mE.foreground.rotation}),b.createElement("UIStroke",{Color=jT(mE.foreground.color)>0.5 and ap("#000000")or ap("#ffffff"),Transparency=0.5,Thickness=2})}),b.createElement("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Size=ar(25,25),Position=UDim2.new(0.5,0,0.5,0),BackgroundColor3=ap("#ffffff"),BorderSizePixel=0},{b.createElement("UICorner",{CornerRadius=UDim.new(1,0)}),b.createElement("UIGradient",{Color=mE.background.color,Transparency=mE.background.transparency,Rotation=mE.background.rotation}),b.createElement("UIStroke",{Color=jT(mE.background.color)>0.5 and ap("#000000")or ap("#ffffff"),Transparency=0.5,Thickness=2})}),b.createElement("Frame",{AnchorPoint=Vector2.new(1,0.5),Size=ar(25,25),Position=UDim2.new(1,-12,0.5,0),BackgroundColor3=ap("#ffffff"),BorderSizePixel=0},{b.createElement("UICorner",{CornerRadius=UDim.new(1,0)}),b.createElement("UIGradient",{Color=mE.accent.color,Transparency=mE.accent.transparency,Rotation=mE.accent.rotation}),b.createElement("UIStroke",{Color=jT(mE.accent.color)>0.5 and ap("#000000")or ap("#ffffff"),Transparency=0.5,Thickness=2})})})end;return{PADDING=lb,ENTRY_HEIGHT=lc,ENTRY_WIDTH=ld,ENTRY_TEXT_PADDING=le,default=f}end,newEnv("Orca.views.Pages.Options.Themes.ThemeItem"))()end)newModule("Themes","ModuleScript","Orca.views.Pages.Options.Themes.Themes","Orca.views.Pages.Options.Themes",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local l=h.useMemo;local bl=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Canvas").default;local c1=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"components","Card").default;local ei=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"hooks","use-theme").useTheme;local an=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local eg=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"themes").getThemes;local jN=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","array-util").arrayToMap;local aq=a.import(script,script.Parent.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local mF=a.import(script,script.Parent,"ThemeItem")local mD=mF.default;local lc=mF.ENTRY_HEIGHT;local lb=mF.PADDING;local function mr()local aW=ei("options").themes;local i_=l(eg,{})local bf={index=2,page=an.Options,theme=aW,size=ar(326,416),position=UDim2.new(0,374,1,0)}local G={b.createElement("TextLabel",{Text="Themes",Font="GothamBlack",TextSize=20,TextColor3=aW.foreground,TextXAlignment="Left",TextYAlignment="Top",Position=ar(24,24),BackgroundTransparency=1})}local H=#G;local bh={size=ar(326,348),position=ar(0,68),padding={left=24,right=24,top=8},clipsDescendants=true}local bi={}local bj=#bi;local lH={Size=r(1,1),CanvasSize=ar(0,#i_*(lc+lb)+lb),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarImageTransparency=1,ScrollBarThickness=0,ClipsDescendants=false}local lI={}local lJ=#lI;for J,K in pairs(jN(i_,function(aW,c2)return{aW.name,b.createElement(mD,{theme=aW,index=c2})}end))do lI[J]=K end;bi[bj+1]=b.createElement("ScrollingFrame",lH,lI)G[H+1]=b.createElement(bl,bh,bi)return b.createElement(c1,bf,G)end;local f=i(mr)return{default=f}end,newEnv("Orca.views.Pages.Options.Themes.Themes"))()end)newModule("Pages","ModuleScript","Orca.views.Pages.Pages","Orca.views.Pages",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local b_=a.import(script,script.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local dU=a.import(script,script.Parent.Parent.Parent,"hooks","use-current-page").useCurrentPage;local an=a.import(script,script.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local l6=a.import(script,script.Parent,"Apps").default;local lR=a.import(script,script.Parent,"Home").default;local ms=a.import(script,script.Parent,"Options").default;local mG=a.import(script,script.Parent,"Scripts").default;local function kL()local mH=dU()local mI=b_(mH==an.Scripts,2000,function(lt)return lt end)local G={home=b.createFragment({home=b.createElement(lR)}),apps=b.createFragment({apps=b.createElement(l6)})}local H=#G;local I=mI and b.createFragment({scripts=b.createElement(mG)})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;G.options=b.createFragment({options=b.createElement(ms)})return b.createFragment(G)end;local f=i(kL)return{default=f}end,newEnv("Orca.views.Pages.Pages"))()end)newModule("Scripts","ModuleScript","Orca.views.Pages.Scripts","Orca.views.Pages",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.include.RuntimeLib)local g={}g.default=a.import(script,script,"Scripts").default;return g end,newEnv("Orca.views.Pages.Scripts"))()end)newModule("Content","ModuleScript","Orca.views.Pages.Scripts.Content","Orca.views.Pages.Scripts",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local i=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).hooked;local bl=a.import(script,script.Parent.Parent.Parent.Parent,"components","Canvas").default;local cd=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","use-scale").useScale;local ap=a.import(script,script.Parent.Parent.Parent.Parent,"utils","color3").hex;local aq=a.import(script,script.Parent.Parent.Parent.Parent,"utils","udim2")local ar=aq.px;local r=aq.scale;local mJ,mK;local function mL(C)local mM=C.header;local mN=C.body;local mO=C.footer;local ck=cd()local bf={padding={top=ck:map(function(bg)return bg*48 end),left=ck:map(function(bg)return bg*48 end),bottom=ck:map(function(bg)return bg*48 end),right=ck:map(function(bg)return bg*48 end)}}local G={}local H=#G;local I=mN==nil and b.createElement(mJ,{header=mM,scaleFactor=ck})if I then if I.elements~=nil or I.props~=nil and I.component~=nil then G[H+1]=I else for J,K in ipairs(I)do G[H+J]=K end end end;H=#G;local c9=mN~=nil and b.createElement(mK,{header=mM,scaleFactor=ck})if c9 then if c9.elements~=nil or c9.props~=nil and c9.component~=nil then G[H+1]=c9 else for J,K in ipairs(c9)do G[H+J]=K end end end;H=#G;local mP=mN~=nil and b.createElement("TextLabel",{Text=mN,TextColor3=ap("#FFFFFF"),Font="GothamBlack",TextSize=36,TextXAlignment="Left",TextYAlignment="Top",Size=r(1,70/416),Position=ck:map(function(bg)return ar(0,110*bg)end),BackgroundTransparency=1},{b.createElement("UIScale",{Scale=ck})})if mP then if mP.elements~=nil or mP.props~=nil and mP.component~=nil then G[H+1]=mP else for J,K in ipairs(mP)do G[H+J]=K end end end;H=#G;G[H+1]=b.createElement("TextLabel",{Text=mO,TextColor3=ap("#FFFFFF"),Font="GothamBlack",TextSize=18,TextXAlignment="Center",TextYAlignment="Bottom",AnchorPoint=Vector2.new(0.5,1),Size=r(1,20/416),Position=r(0.5,1),BackgroundTransparency=1},{b.createElement("UIScale",{Scale=ck})})return b.createElement(bl,bf,G)end;function mK(l2)return b.createElement("TextLabel",{Text=l2.header,TextColor3=ap("#FFFFFF"),Font="GothamBlack",TextSize=64,TextXAlignment="Left",TextYAlignment="Top",Size=r(1,70/416),BackgroundTransparency=1},{b.createElement("UIScale",{Scale=l2.scaleFactor})})end;function mJ(l2)return b.createElement("TextLabel",{Text=l2.header,TextColor3=ap("#FFFFFF"),Font="GothamBlack",TextSize=48,TextXAlignment="Center",TextYAlignment="Center",AnchorPoint=Vector2.new(0.5,0.5),Size=r(1,1),Position=r(0.5,0.5),BackgroundTransparency=1},{b.createElement("UIScale",{Scale=l2.scaleFactor})})end;local f=i(mL)return{default=f}end,newEnv("Orca.views.Pages.Scripts.Content"))()end)newModule("ScriptCard","ModuleScript","Orca.views.Pages.Scripts.ScriptCard","Orca.views.Pages.Scripts",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local k=h.useEffect;local bb=a.import(script,script.Parent.Parent.Parent.Parent,"components","Border").default;local bl=a.import(script,script.Parent.Parent.Parent.Parent,"components","Canvas").default;local bm=a.import(script,script.Parent.Parent.Parent.Parent,"components","Fill").default;local cr=a.import(script,script.Parent.Parent.Parent.Parent,"components","ParallaxImage").default;local b_=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","common","use-delayed-update").useDelayedUpdate;local dc=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","common","use-did-mount").useIsMount;local dd=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","common","use-forced-update").useForcedUpdate;local dA=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","common","use-set-state").default;local aO=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","common","use-spring").useSpring;local c0=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","use-current-page").useIsPageOpen;local e9=a.import(script,script.Parent.Parent.Parent.Parent,"hooks","use-parallax-offset").useParallaxOffset;local an=a.import(script,script.Parent.Parent.Parent.Parent,"store","models","dashboard.model").DashboardPage;local ap=a.import(script,script.Parent.Parent.Parent.Parent,"utils","color3").hex;local r=a.import(script,script.Parent.Parent.Parent.Parent,"utils","udim2").scale;local mQ={dampingRatio=3,frequency=2}local function mR(C)local c2=C.index;local mS=C.backgroundImage;local mT=C.backgroundImageSize;local ly=C.dropshadow;local mU=C.dropshadowSize;local mV=C.dropshadowPosition;local mW=C.anchorPoint;local Q=C.size;local R=C.position;local bs=C.onActivate;local be=C[b.Children]local mX=dd()local mY=c0(an.Scripts)local b3;if dc()then b3=false else b3=mY end;local c4=b3;local mZ=b_(c4,c2*30)k(function()return mX()end,{})local ct=e9()local Z=dA({isHovered=false,isPressed=false})local dv=Z[1]local l4=dv.isHovered;local m_=dv.isPressed;local n0=Z[2]local bf={anchor=mW,size=Q}local b4;if mZ then b4=R else local c6=UDim2.new(0,0,1,48*3+56)b4=R+c6 end;bf.position=aO(b4,{frequency=2.2,dampingRatio=0.75})local G={}local H=#G;local bh={anchor=Vector2.new(0.5,0.5),size=aO(l4 and not m_ and UDim2.new(1,48,1,48)or r(1,1),{frequency=2}),position=r(0.5,0.5)}local bi={b.createElement("ImageLabel",{Image=ly,AnchorPoint=Vector2.new(0.5,0.5),Size=r(mU.X,mU.Y),Position=r(mV.X,mV.Y),BackgroundTransparency=1}),b.createElement(cr,{image=mS,imageSize=mT,padding=Vector2.new(50,50),offset=ct},{b.createElement("UICorner",{CornerRadius=UDim.new(0,16)})})}local bj=#bi;local lH={clipsDescendants=true}local lI={}local lJ=#lI;if be then for J,K in pairs(be)do if type(J)=="number"then lI[lJ+J]=K else lI[J]=K end end end;bi[bj+1]=b.createElement(bl,lH,lI)bi[bj+2]=b.createElement(bm,{radius=16,color=ap("#ffffff"),transparency=aO(l4 and 0 or 1,mQ)},{b.createElement("UIGradient",{Transparency=NumberSequence.new(0.75,1),Offset=aO(l4 and Vector2.new(0,0)or Vector2.new(-1,-1),mQ),Rotation=45})})bi[bj+3]=b.createElement(bb,{radius=18,size=3,color=ap("#ffffff"),transparency=aO(l4 and 0 or 1,mQ)},{b.createElement("UIGradient",{Transparency=NumberSequence.new(0.7,0.9),Offset=aO(l4 and Vector2.new(0,0)or Vector2.new(-1,-1),mQ),Rotation=45})})bi[bj+4]=b.createElement(bb,{color=ap("#ffffff"),radius=16,transparency=aO(l4 and 1 or 0.8,{})})G[H+1]=b.createElement(bl,bh,bi)G[H+2]=b.createElement("TextButton",{[b.Event.Activated]=function()return bs()end,[b.Event.MouseEnter]=function()return n0({isHovered=true})end,[b.Event.MouseLeave]=function()return n0({isHovered=false,isPressed=false})end,[b.Event.MouseButton1Down]=function()return n0({isPressed=true})end,[b.Event.MouseButton1Up]=function()return n0({isPressed=false})end,Size=r(1,1),Text="",Transparency=1})return b.createElement(bl,bf,G)end;local f=i(mR)return{default=f}end,newEnv("Orca.views.Pages.Scripts.ScriptCard"))()end)newModule("Scripts","ModuleScript","Orca.views.Pages.Scripts.Scripts","Orca.views.Pages.Scripts",function()return setfenv(function()local a=require(script.Parent.Parent.Parent.Parent.include.RuntimeLib)local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local l5=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).pure;local bl=a.import(script,script.Parent.Parent.Parent.Parent,"components","Canvas").default;local ic=a.import(script,script.Parent.Parent.Parent.Parent,"utils","http")local r=a.import(script,script.Parent.Parent.Parent.Parent,"utils","udim2").scale;local n1=a.import(script,script.Parent,"constants")local n2=n1.BASE_PADDING;local n3=n1.BASE_WINDOW_HEIGHT;local mL=a.import(script,script.Parent,"Content").default;local mR=a.import(script,script.Parent,"ScriptCard").default;local n4=a.async(function(kl,n5)local iN,iO=a.try(function()local iI=a.await(ic.get(kl))local kj,dw=loadstring(iI,"@"..n5)local dz="Failed to call loadstring on Lua script from '"..kl.."': "..tostring(dw)assert(kj,dz)task.defer(kj)end,function(n6)warn("Failed to run Lua script from '"..kl.."': "..tostring(n6))return a.TRY_RETURN,{""}end)if iN then return unpack(iO)end end)local function mG()return b.createElement(bl,{position=r(0,1),anchor=Vector2.new(0,1)},{b.createElement(mR,{onActivate=function()return n4("https://solarishub.dev/script.lua","Solaris")end,index=4,backgroundImage="rbxassetid://8992292705",backgroundImageSize=Vector2.new(1023,682),dropshadow="rbxassetid://8992292536",dropshadowSize=Vector2.new(1.15,1.25),dropshadowPosition=Vector2.new(0.5,0.55),anchorPoint=Vector2.new(0,0),size=UDim2.new(1/3,-n2*2/3,(416+n2/2)/n3,-n2/2),position=r(0,0)},{b.createElement(mL,{header="Solaris",body="A collection\nof your favorite\nscripts.",footer="solarishub.dev"})}),b.createElement(mR,{onActivate=function()return n4("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub","V.G Hub")end,index=1,backgroundImage="rbxassetid://8992292381",backgroundImageSize=Vector2.new(1021,1023),dropshadow="rbxassetid://8992291993",dropshadowSize=Vector2.new(1.15,1.25),dropshadowPosition=Vector2.new(0.5,0.55),anchorPoint=Vector2.new(0,1),size=UDim2.new(1/3,-n2*2/3,(416+n2/2)/n3,-n2/2),position=r(0,1)},{b.createElement(mL,{header="V.G Hub",body="Featuring over\n100 games.",footer="github.com/1201for"})}),b.createElement(mR,{onActivate=function()return n4("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source","CMD-X")end,index=5,backgroundImage="rbxassetid://8992291779",backgroundImageSize=Vector2.new(818,1023),dropshadow="rbxassetid://8992291581",dropshadowSize=Vector2.new(1.15,1.4),dropshadowPosition=Vector2.new(0.5,0.6),anchorPoint=Vector2.new(0.5,0),size=UDim2.new(1/3,-n2*2/3,(242+n2/2)/n3,-n2/2),position=r(0.5,0)},{b.createElement(mL,{header="CMD-X",footer="github.com/CMD-X"})}),b.createElement(mR,{onActivate=function()return n4("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source","Infinite Yield")end,index=3,backgroundImage="rbxassetid://8992291444",backgroundImageSize=Vector2.new(1023,682),dropshadow="rbxassetid://8992291268",dropshadowSize=Vector2.new(1.15,1.4),dropshadowPosition=Vector2.new(0.5,0.6),anchorPoint=Vector2.new(0.5,0),size=UDim2.new(1/3,-n2*2/3,(242+n2)/n3,-n2),position=UDim2.new(0.5,0,1-(590+n2/2)/n3,n2/2)},{b.createElement(mL,{header="Infinite Yield",footer="github.com/EdgeIY"})}),b.createElement(mR,{onActivate=function()return n4("https://pastebin.com/raw/mMbsHWiQ","Dex Explorer")end,index=1,backgroundImage="rbxassetid://8992290931",backgroundImageSize=Vector2.new(818,1023),dropshadow="rbxassetid://8992291101",dropshadowSize=Vector2.new(1.15,1.35),dropshadowPosition=Vector2.new(0.5,0.55),anchorPoint=Vector2.new(0.5,1),size=UDim2.new(1/3,-n2*2/3,(300+n2/2)/n3,-n2/2),position=r(0.5,1)},{b.createElement(mL,{header="Dex Explorer",footer="github.com/LorekeeperZinnia"})}),b.createElement(mR,{onActivate=function()return n4("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua","Unnamed ESP")end,index=6,backgroundImage="rbxassetid://8992290714",backgroundImageSize=Vector2.new(1023,682),dropshadow="rbxassetid://8992290570",dropshadowSize=Vector2.new(1.15,1.35),dropshadowPosition=Vector2.new(0.5,0.55),anchorPoint=Vector2.new(1,0),size=UDim2.new(1/3,-n2*2/3,(300+n2/2)/n3,-n2/2),position=r(1,0)},{b.createElement(mL,{header="Unnamed ESP",footer="github.com/ic3w0lf22"})}),b.createElement(mR,{onActivate=function()return n4("https://projectevo.xyz/script/loader.lua","EvoV2")end,index=2,backgroundImage="rbxassetid://8992290314",backgroundImageSize=Vector2.new(682,1023),dropshadow="rbxassetid://8992290105",dropshadowSize=Vector2.new(1.15,1.22),dropshadowPosition=Vector2.new(0.5,0.53),anchorPoint=Vector2.new(1,1),size=UDim2.new(1/3,-n2*2/3,(532+n2/2)/n3,-n2/2),position=r(1,1)},{b.createElement(mL,{header="EvoV2",body="Reliable cheats for\nRoblox's top shooter\ngames, reimagined.",footer="projectevo.xyz"})})})end;local f=l5(mG)return{default=f}end,newEnv("Orca.views.Pages.Scripts.Scripts"))()end)newModule("constants","ModuleScript","Orca.views.Pages.Scripts.constants","Orca.views.Pages.Scripts",function()return setfenv(function()local n3=880;local n7=1824;local n2=48;return{BASE_WINDOW_HEIGHT=n3,BASE_WINDOW_WIDTH=n7,BASE_PADDING=n2}end,newEnv("Orca.views.Pages.Scripts.constants"))()end)newInstance("include","Folder","Orca.include","Orca")newModule("Promise","ModuleScript","Orca.include.Promise","Orca.include",function()return setfenv(function()local n8="Non-promise value passed into %s at index %s"local n9="Please pass a list of promises to %s"local na="Please pass a handler function to %s!"local nb={__mode="k"}local function nc(nd,ne)local nf={}for ev,ng in ipairs(ne)do nf[ng]=ng end;return setmetatable(nf,{__index=function(ev,gX)error(string.format("%s is not in %s!",gX,nd),2)end,__newindex=function()error(string.format("Creating new members in %s is not allowed!",nd),2)end})end;local nh;do nh={Kind=nc("Promise.Error.Kind",{"ExecutionError","AlreadyCancelled","NotResolvedInTime","TimedOut"})}nh.__index=nh;function nh.new(cL,ni)cL=cL or{}return setmetatable({error=tostring(cL.error)or"[This error has no error text.]",trace=cL.trace,context=cL.context,kind=cL.kind,parent=ni,createdTick=os.clock(),createdTrace=debug.traceback()},nh)end;function nh.is(nj)if type(nj)=="table"then local nk=getmetatable(nj)if type(nk)=="table"then return rawget(nj,"error")~=nil and type(rawget(nk,"extend"))=="function"end end;return false end;function nh.isKind(nj,nl)assert(nl~=nil,"Argument #2 to Promise.Error.isKind must not be nil")return nh.is(nj)and nj.kind==nl end;function nh:extend(cL)cL=cL or{}cL.kind=cL.kind or self.kind;return nh.new(cL,self)end;function nh:getErrorChain()local nm={self}while nm[#nm].parent do table.insert(nm,nm[#nm].parent)end;return nm end;function nh:__tostring()local nn={string.format("-- Promise.Error(%s) --",self.kind or"?")}for ev,no in ipairs(self:getErrorChain())do table.insert(nn,table.concat({no.trace or no.error,no.context},"\n"))end;return table.concat(nn,"\n")end end;local function np(...)return select("#",...),{...}end;local function nq(nr,...)return nr,select("#",...),{...}end;local function ns(nt)assert(nt~=nil)return function(dw)if type(dw)=="table"then return dw end;return nh.new({error=dw,kind=nh.Kind.ExecutionError,trace=debug.traceback(tostring(dw),2),context="Promise created at:\n\n"..nt})end end;local function nu(nt,da,...)return nq(xpcall(da,ns(nt),...))end;local function nv(nt,da,hy,nw)return function(...)local nx,ny,dx=nu(nt,da,...)if nx then hy(unpack(dx,1,ny))else nw(dx[1])end end end;local function nz(ek)return next(ek)==nil end;local nA={Error=nh,Status=nc("Promise.Status",{"Started","Resolved","Rejected","Cancelled"}),_getTime=os.clock,_timeEvent=game:GetService("RunService").Heartbeat}nA.prototype={}nA.__index=nA.prototype;function nA._new(nt,da,ni)if ni~=nil and not nA.is(ni)then error("Argument #2 to Promise.new must be a promise or nil",2)end;local self={_source=nt,_status=nA.Status.Started,_values=nil,_valuesLength=-1,_unhandledRejection=true,_queuedResolve={},_queuedReject={},_queuedFinally={},_cancellationHook=nil,_parent=ni,_consumers=setmetatable({},nb)}if ni and ni._status==nA.Status.Started then ni._consumers[self]=true end;setmetatable(self,nA)local function hy(...)self:_resolve(...)end;local function nw(...)self:_reject(...)end;local function hz(nB)if nB then if self._status==nA.Status.Cancelled then nB()else self._cancellationHook=nB end end;return self._status==nA.Status.Cancelled end;coroutine.wrap(function()local nx,ev,dx=nu(self._source,da,hy,nw,hz)if not nx then nw(dx[1])end end)()return self end;function nA.new(nC)return nA._new(debug.traceback(nil,2),nC)end;function nA:__tostring()return string.format("Promise(%s)",self:getStatus())end;function nA.defer(da)local nt=debug.traceback(nil,2)local dq;dq=nA._new(nt,function(hy,nw,hz)local nD;nD=nA._timeEvent:Connect(function()nD:Disconnect()local nx,ev,dx=nu(nt,da,hy,nw,hz)if not nx then nw(dx[1])end end)end)return dq end;nA.async=nA.defer;function nA.resolve(...)local nE,nF=np(...)return nA._new(debug.traceback(nil,2),function(hy)hy(unpack(nF,1,nE))end)end;function nA.reject(...)local nE,nF=np(...)return nA._new(debug.traceback(nil,2),function(ev,nw)nw(unpack(nF,1,nE))end)end;function nA._try(nt,da,...)local nG,nF=np(...)return nA._new(nt,function(hy)hy(da(unpack(nF,1,nG)))end)end;function nA.try(...)return nA._try(debug.traceback(nil,2),...)end;function nA._all(nt,nH,nI)if type(nH)~="table"then error(string.format(n9,"Promise.all"),3)end;for k2,dq in pairs(nH)do if not nA.is(dq)then error(string.format(n8,"Promise.all",tostring(k2)),3)end end;if#nH==0 or nI==0 then return nA.resolve({})end;return nA._new(nt,function(hy,nw,hz)local nJ={}local nK={}local nL=0;local nM=0;local nN=false;local function nO()for ev,dq in ipairs(nK)do dq:cancel()end end;local function nP(k2,...)if nN then return end;nL=nL+1;if nI==nil then nJ[k2]=...else nJ[nL]=...end;if nL>=(nI or#nH)then nN=true;hy(nJ)nO()end end;hz(nO)for k2,dq in ipairs(nH)do nK[k2]=dq:andThen(function(...)nP(k2,...)end,function(...)nM=nM+1;if nI==nil or#nH-nM<nI then nO()nN=true;nw(...)end end)end;if nN then nO()end end)end;function nA.all(nH)return nA._all(debug.traceback(nil,2),nH)end;function nA.fold(nQ,da,bG)assert(type(nQ)=="table","Bad argument #1 to Promise.fold: must be a table")assert(type(da)=="function","Bad argument #2 to Promise.fold: must be a function")local nR=nA.resolve(bG)return nA.each(nQ,function(nS,k2)nR=nR:andThen(function(nT)return da(nT,nS,k2)end)end):andThenReturn(nR)end;function nA.some(nH,nI)assert(type(nI)=="number","Bad argument #2 to Promise.some: must be a number")return nA._all(debug.traceback(nil,2),nH,nI)end;function nA.any(nH)return nA._all(debug.traceback(nil,2),nH,1):andThen(function(nF)return nF[1]end)end;function nA.allSettled(nH)if type(nH)~="table"then error(string.format(n9,"Promise.allSettled"),2)end;for k2,dq in pairs(nH)do if not nA.is(dq)then error(string.format(n8,"Promise.allSettled",tostring(k2)),2)end end;if#nH==0 then return nA.resolve({})end;return nA._new(debug.traceback(nil,2),function(hy,ev,hz)local nU={}local nK={}local nV=0;local function nP(k2,...)nV=nV+1;nU[k2]=...if nV>=#nH then hy(nU)end end;hz(function()for ev,dq in ipairs(nK)do dq:cancel()end end)for k2,dq in ipairs(nH)do nK[k2]=dq:finally(function(...)nP(k2,...)end)end end)end;function nA.race(nH)assert(type(nH)=="table",string.format(n9,"Promise.race"))for k2,dq in pairs(nH)do assert(nA.is(dq),string.format(n8,"Promise.race",tostring(k2)))end;return nA._new(debug.traceback(nil,2),function(hy,nw,hz)local nK={}local nW=false;local function nO()for ev,dq in ipairs(nK)do dq:cancel()end end;local function nX(da)return function(...)nO()nW=true;return da(...)end end;if hz(nX(nw))then return end;for k2,dq in ipairs(nH)do nK[k2]=dq:andThen(nX(hy),nX(nw))end;if nW then nO()end end)end;function nA.each(nQ,nY)assert(type(nQ)=="table",string.format(n9,"Promise.each"))assert(type(nY)=="function",string.format(na,"Promise.each"))return nA._new(debug.traceback(nil,2),function(hy,nw,hz)local nZ={}local n_={}local o0=false;local function nO()for ev,o1 in ipairs(n_)do o1:cancel()end end;hz(function()o0=true;nO()end)local o2={}for c2,d3 in ipairs(nQ)do if nA.is(d3)then if d3:getStatus()==nA.Status.Cancelled then nO()return nw(nh.new({error="Promise is cancelled",kind=nh.Kind.AlreadyCancelled,context=string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s",c2,d3._source)}))elseif d3:getStatus()==nA.Status.Rejected then nO()return nw(select(2,d3:await()))end;local o3=d3:andThen(function(...)return...end)table.insert(n_,o3)o2[c2]=o3 else o2[c2]=d3 end end;for c2,d3 in ipairs(o2)do if nA.is(d3)then local nr;nr,d3=d3:await()if not nr then nO()return nw(d3)end end;if o0 then return end;local o4=nA.resolve(nY(d3,c2))table.insert(n_,o4)local nr,dx=o4:await()if not nr then nO()return nw(dx)end;nZ[c2]=dx end;hy(nZ)end)end;function nA.is(fd)if type(fd)~="table"then return false end;local o5=getmetatable(fd)if o5==nA then return true elseif o5==nil then return type(fd.andThen)=="function"elseif type(o5)=="table"and type(rawget(o5,"__index"))=="table"and type(rawget(rawget(o5,"__index"),"andThen"))=="function"then return true end;return false end;function nA.promisify(da)return function(...)return nA._try(debug.traceback(nil,2),da,...)end end;do local o6;local nD;function nA.delay(mc)assert(type(mc)=="number","Bad argument #1 to Promise.delay, must be a number.")if not(mc>=1/60)or mc==math.huge then mc=1/60 end;return nA._new(debug.traceback(nil,2),function(hy,ev,hz)local o7=nA._getTime()local o8=o7+mc;local o9={resolve=hy,startTime=o7,endTime=o8}if nD==nil then o6=o9;nD=nA._timeEvent:Connect(function()local oa=nA._getTime()while o6~=nil and o6.endTime<oa do local hE=o6;o6=hE.next;if o6==nil then nD:Disconnect()nD=nil else o6.previous=nil end;hE.resolve(nA._getTime()-hE.startTime)end end)else if o6.endTime<o8 then local hE=o6;local next=hE.next;while next~=nil and next.endTime<o8 do hE=next;next=hE.next end;hE.next=o9;o9.previous=hE;if next~=nil then o9.next=next;next.previous=o9 end else o9.next=o6;o6.previous=o9;o6=o9 end end;hz(function()local next=o9.next;if o6==o9 then if next==nil then nD:Disconnect()nD=nil else next.previous=nil end;o6=next else local ob=o9.previous;ob.next=next;if next~=nil then next.previous=ob end end end)end)end end;function nA.prototype:timeout(mc,oc)local nt=debug.traceback(nil,2)return nA.race({nA.delay(mc):andThen(function()return nA.reject(oc==nil and nh.new({kind=nh.Kind.TimedOut,error="Timed out",context=string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s",mc,nt)})or oc)end),self})end;function nA.prototype:getStatus()return self._status end;function nA.prototype:_andThen(nt,od,oe)self._unhandledRejection=false;return nA._new(nt,function(hy,nw)local of=hy;if od then of=nv(nt,od,hy,nw)end;local og=nw;if oe then og=nv(nt,oe,hy,nw)end;if self._status==nA.Status.Started then table.insert(self._queuedResolve,of)table.insert(self._queuedReject,og)elseif self._status==nA.Status.Resolved then of(unpack(self._values,1,self._valuesLength))elseif self._status==nA.Status.Rejected then og(unpack(self._values,1,self._valuesLength))elseif self._status==nA.Status.Cancelled then nw(nh.new({error="Promise is cancelled",kind=nh.Kind.AlreadyCancelled,context="Promise created at\n\n"..nt}))end end,self)end;function nA.prototype:andThen(od,oe)assert(od==nil or type(od)=="function",string.format(na,"Promise:andThen"))assert(oe==nil or type(oe)=="function",string.format(na,"Promise:andThen"))return self:_andThen(debug.traceback(nil,2),od,oe)end;function nA.prototype:catch(og)assert(og==nil or type(og)=="function",string.format(na,"Promise:catch"))return self:_andThen(debug.traceback(nil,2),nil,og)end;function nA.prototype:tap(oh)assert(type(oh)=="function",string.format(na,"Promise:tap"))return self:_andThen(debug.traceback(nil,2),function(...)local oi=oh(...)if nA.is(oi)then local nE,nF=np(...)return oi:andThen(function()return unpack(nF,1,nE)end)end;return...end)end;function nA.prototype:andThenCall(da,...)assert(type(da)=="function",string.format(na,"Promise:andThenCall"))local nE,nF=np(...)return self:_andThen(debug.traceback(nil,2),function()return da(unpack(nF,1,nE))end)end;function nA.prototype:andThenReturn(...)local nE,nF=np(...)return self:_andThen(debug.traceback(nil,2),function()return unpack(nF,1,nE)end)end;function nA.prototype:cancel()if self._status~=nA.Status.Started then return end;self._status=nA.Status.Cancelled;if self._cancellationHook then self._cancellationHook()end;if self._parent then self._parent:_consumerCancelled(self)end;for fo in pairs(self._consumers)do fo:cancel()end;self:_finalize()end;function nA.prototype:_consumerCancelled(oj)if self._status~=nA.Status.Started then return end;self._consumers[oj]=nil;if next(self._consumers)==nil then self:cancel()end end;function nA.prototype:_finally(nt,ok,ol)if not ol then self._unhandledRejection=false end;return nA._new(nt,function(hy,nw)local om=hy;if ok then om=nv(nt,ok,hy,nw)end;if ol then local da=om;om=function(...)if self._status==nA.Status.Rejected then return hy(self)end;return da(...)end end;if self._status==nA.Status.Started then table.insert(self._queuedFinally,om)else om(self._status)end end,self)end;function nA.prototype:finally(ok)assert(ok==nil or type(ok)=="function",string.format(na,"Promise:finally"))return self:_finally(debug.traceback(nil,2),ok)end;function nA.prototype:finallyCall(da,...)assert(type(da)=="function",string.format(na,"Promise:finallyCall"))local nE,nF=np(...)return self:_finally(debug.traceback(nil,2),function()return da(unpack(nF,1,nE))end)end;function nA.prototype:finallyReturn(...)local nE,nF=np(...)return self:_finally(debug.traceback(nil,2),function()return unpack(nF,1,nE)end)end;function nA.prototype:done(ok)assert(ok==nil or type(ok)=="function",string.format(na,"Promise:done"))return self:_finally(debug.traceback(nil,2),ok,true)end;function nA.prototype:doneCall(da,...)assert(type(da)=="function",string.format(na,"Promise:doneCall"))local nE,nF=np(...)return self:_finally(debug.traceback(nil,2),function()return da(unpack(nF,1,nE))end,true)end;function nA.prototype:doneReturn(...)local nE,nF=np(...)return self:_finally(debug.traceback(nil,2),function()return unpack(nF,1,nE)end,true)end;function nA.prototype:awaitStatus()self._unhandledRejection=false;if self._status==nA.Status.Started then local on=Instance.new("BindableEvent")self:finally(function()on:Fire()end)on.Event:Wait()on:Destroy()end;if self._status==nA.Status.Resolved then return self._status,unpack(self._values,1,self._valuesLength)elseif self._status==nA.Status.Rejected then return self._status,unpack(self._values,1,self._valuesLength)end;return self._status end;local function oo(dZ,...)return dZ==nA.Status.Resolved,...end;function nA.prototype:await()return oo(self:awaitStatus())end;local function op(dZ,...)if dZ~=nA.Status.Resolved then error(...==nil and"Expected Promise rejected with no value."or...,3)end;return...end;function nA.prototype:expect()return op(self:awaitStatus())end;nA.prototype.awaitValue=nA.prototype.expect;function nA.prototype:_unwrap()if self._status==nA.Status.Started then error("Promise has not resolved or rejected.",2)end;local nr=self._status==nA.Status.Resolved;return nr,unpack(self._values,1,self._valuesLength)end;function nA.prototype:_resolve(...)if self._status~=nA.Status.Started then if nA.is(...)then(...):_consumerCancelled(self)end;return end;if nA.is(...)then if select("#",...)>1 then local oq=string.format("When returning a Promise from andThen, extra arguments are ".."discarded! See:\n\n%s",self._source)warn(oq)end;local ot=...local dq=ot:andThen(function(...)self:_resolve(...)end,function(...)local ou=ot._values[1]if ot._error then ou=nh.new({error=ot._error,kind=nh.Kind.ExecutionError,context="[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"})end;if nh.isKind(ou,nh.Kind.ExecutionError)then return self:_reject(ou:extend({error="This Promise was chained to a Promise that errored.",trace="",context=string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n",self._source)}))end;self:_reject(...)end)if dq._status==nA.Status.Cancelled then self:cancel()elseif dq._status==nA.Status.Started then self._parent=dq;dq._consumers[self]=true end;return end;self._status=nA.Status.Resolved;self._valuesLength,self._values=np(...)for ev,da in ipairs(self._queuedResolve)do coroutine.wrap(da)(...)end;self:_finalize()end;function nA.prototype:_reject(...)if self._status~=nA.Status.Started then return end;self._status=nA.Status.Rejected;self._valuesLength,self._values=np(...)if not nz(self._queuedReject)then for ev,da in ipairs(self._queuedReject)do coroutine.wrap(da)(...)end else local dw=tostring(...)coroutine.wrap(function()nA._timeEvent:Wait()if not self._unhandledRejection then return end;local oq=string.format("Unhandled Promise rejection:\n\n%s\n\n%s",dw,self._source)if nA.TEST then return end;warn(oq)end)()end;self:_finalize()end;function nA.prototype:_finalize()for ev,da in ipairs(self._queuedFinally)do coroutine.wrap(da)(self._status)end;self._queuedFinally=nil;self._queuedReject=nil;self._queuedResolve=nil;if not nA.TEST then self._parent=nil;self._consumers=nil end end;function nA.prototype:now(oc)local nt=debug.traceback(nil,2)if self:getStatus()==nA.Status.Resolved then return self:_andThen(nt,function(...)return...end)else return nA.reject(oc==nil and nh.new({kind=nh.Kind.NotResolvedInTime,error="This Promise was not resolved in time for :now()",context=":now() was called at:\n\n"..nt})or oc)end end;function nA.retry(da,ov,...)assert(type(da)=="function","Parameter #1 to Promise.retry must be a function")assert(type(ov)=="number","Parameter #2 to Promise.retry must be a number")local kx,nE={...},select("#",...)return nA.resolve(da(...)):catch(function(...)if ov>0 then return nA.retry(da,ov-1,unpack(kx,1,nE))else return nA.reject(...)end end)end;function nA.fromEvent(ow,nY)nY=nY or function()return true end;return nA._new(debug.traceback(nil,2),function(hy,nw,hz)local nD;local ox=false;local function oy()nD:Disconnect()nD=nil end;nD=ow:Connect(function(...)local oz=nY(...)if oz==true then hy(...)if nD then oy()else ox=true end elseif type(oz)~="boolean"then error("Promise.fromEvent predicate should always return a boolean")end end)if ox and nD then return oy()end;hz(function()oy()end)end)end;return nA end,newEnv("Orca.include.Promise"))()end)newModule("RuntimeLib","ModuleScript","Orca.include.RuntimeLib","Orca.include",function()return setfenv(function()local nA=require(script.Parent.Promise)local ez=game:GetService("RunService")local oA=game:GetService("ReplicatedFirst")local a={}a.Promise=nA;local function oB(fd)return ez:IsStudio()and fd:FindFirstAncestorWhichIsA("Plugin")~=nil end;function a.getModule(fd,oC,oD)if oD==nil then oD=oC;oC="@rbxts"end;if ez:IsRunning()and fd:IsDescendantOf(oA)then warn("roblox-ts packages should not be used from ReplicatedFirst!")end;if ez:IsRunning()and ez:IsClient()and not oB(fd)and not game:IsLoaded()then game.Loaded:Wait()end;local oE=script.Parent:FindFirstChild("node_modules")if not oE then error("Could not find any modules!",2)end;repeat local oF=fd:FindFirstChild("node_modules")if oF and oF~=oE then oF=oF:FindFirstChild("@rbxts")end;if oF then local oG=oF:FindFirstChild(oD)if oG then return oG end end;fd=fd.Parent until fd==nil or fd==oE;local oH=oE:FindFirstChild(oC or"@rbxts")return(oH or oE):FindFirstChild(oD)or error("Could not find module: "..oD,2)end;local oI={}local oJ={}function a.import(oK,oG,...)for k2=1,select("#",...)do oG=oG:WaitForChild(select(k2,...))end;if oG.ClassName~="ModuleScript"then error("Failed to import! Expected ModuleScript, got "..oG.ClassName,2)end;oI[oK]=oG;local oL=oG;local oM=0;while oL do oM=oM+1;oL=oI[oL]if oL==oG then local oN=oL.Name;for ev=1,oM do oL=oI[oL]oN=oN.."  ⇒ "..oL.Name end;error("Failed to import! Detected a circular dependency chain: "..oN,2)end end;if not oJ[oG]then if _G[oG]then error("Invalid module access! Do you have two TS runtimes trying to import this? "..oG:GetFullName(),2)end;_G[oG]=a;oJ[oG]=true end;local hG=require(oG)if oI[oK]==oG then oI[oK]=nil end;return hG end;function a.instanceof(hV,oO)if type(oO)=="table"and type(oO.instanceof)=="function"then return oO.instanceof(hV)end;if type(hV)=="table"then hV=getmetatable(hV)while hV~=nil do if hV==oO then return true end;local oP=getmetatable(hV)if oP then hV=oP.__index else hV=nil end end end;return false end;function a.async(da)return function(...)local kp=select("#",...)local kx={...}return nA.new(function(hy,nw)coroutine.wrap(function()local nx,dx=pcall(da,unpack(kx,1,kp))if nx then hy(dx)else nw(dx)end end)()end)end end;function a.await(dq)if not nA.is(dq)then return dq end;local dZ,d3=dq:awaitStatus()if dZ==nA.Status.Resolved then return d3 elseif dZ==nA.Status.Rejected then error(d3,2)else error("The awaited Promise was cancelled",2)end end;function a.bit_lrsh(hD,dG)local oQ=math.abs(hD)local dx=bit32.rshift(oQ,dG)if hD==oQ then return dx else return-dx-1 end end;a.TRY_RETURN=1;a.TRY_BREAK=2;a.TRY_CONTINUE=3;function a.try(oR,oS,oT)local dw,nt;local nr,oU,oV=xpcall(oR,function(oW)dw=oW;nt=debug.traceback()end)if not nr and oS then local oX,oY=oS(dw,nt)if oX then oU,oV=oX,oY end end;if oT then local oX,oY=oT()if oX then oU,oV=oX,oY end end;return oU,oV end;function a.generator(da)local oZ=coroutine.create(da)return{next=function(...)if coroutine.status(oZ)=="dead"then return{done=true}else local nr,d3=coroutine.resume(oZ,...)if nr==false then error(d3,2)end;return{value=d3,done=coroutine.status(oZ)=="dead"}end end}end;return a end,newEnv("Orca.include.RuntimeLib"))()end)newInstance("node_modules","Folder","Orca.include.node_modules","Orca.include")newInstance("compiler-types","Folder","Orca.include.node_modules.compiler-types","Orca.include.node_modules")newInstance("types","Folder","Orca.include.node_modules.compiler-types.types","Orca.include.node_modules.compiler-types")newInstance("exploit-types","Folder","Orca.include.node_modules.exploit-types","Orca.include.node_modules")newInstance("types","Folder","Orca.include.node_modules.exploit-types.types","Orca.include.node_modules.exploit-types")newInstance("flipper","Folder","Orca.include.node_modules.flipper","Orca.include.node_modules")newModule("src","ModuleScript","Orca.include.node_modules.flipper.src","Orca.include.node_modules.flipper",function()return setfenv(function()local o_={SingleMotor=require(script.SingleMotor),GroupMotor=require(script.GroupMotor),Instant=require(script.Instant),Linear=require(script.Linear),Spring=require(script.Spring),isMotor=require(script.isMotor)}return o_ end,newEnv("Orca.include.node_modules.flipper.src"))()end)newModule("BaseMotor","ModuleScript","Orca.include.node_modules.flipper.src.BaseMotor","Orca.include.node_modules.flipper.src",function()return setfenv(function()local ez=game:GetService("RunService")local p0=require(script.Parent.Signal)local p1=function()end;local p2={}p2.__index=p2;function p2.new()return setmetatable({_onStep=p0.new(),_onStart=p0.new(),_onComplete=p0.new()},p2)end;function p2:onStep(p3)return self._onStep:connect(p3)end;function p2:onStart(p3)return self._onStart:connect(p3)end;function p2:onComplete(p3)return self._onComplete:connect(p3)end;function p2:start()if not self._connection then self._connection=ez.RenderStepped:Connect(function(eO)self:step(eO)end)end end;function p2:stop()if self._connection then self._connection:Disconnect()self._connection=nil end end;p2.destroy=p2.stop;p2.step=p1;p2.getValue=p1;p2.setGoal=p1;function p2:__tostring()return"Motor"end;return p2 end,newEnv("Orca.include.node_modules.flipper.src.BaseMotor"))()end)newModule("GroupMotor","ModuleScript","Orca.include.node_modules.flipper.src.GroupMotor","Orca.include.node_modules.flipper.src",function()return setfenv(function()local p2=require(script.Parent.BaseMotor)local cO=require(script.Parent.SingleMotor)local cy=require(script.Parent.isMotor)local cN=setmetatable({},p2)cN.__index=cN;local function p4(d3)if cy(d3)then return d3 end;local p5=typeof(d3)if p5=="number"then return cO.new(d3,false)elseif p5=="table"then return cN.new(d3,false)end;error(("Unable to convert %q to motor; type %s is unsupported"):format(d3,p5),2)end;function cN.new(p6,p7)assert(p6,"Missing argument #1: initialValues")assert(typeof(p6)=="table","initialValues must be a table!")assert(not p6.step,"initialValues contains disallowed property \"step\". Did you mean to put a table of values here?")local self=setmetatable(p2.new(),cN)if p7~=nil then self._useImplicitConnections=p7 else self._useImplicitConnections=true end;self._complete=true;self._motors={}for ej,d3 in pairs(p6)do self._motors[ej]=p4(d3)end;return self end;function cN:step(eO)if self._complete then return true end;local p8=true;for ev,cB in pairs(self._motors)do local p9=cB:step(eO)if not p9 then p8=false end end;self._onStep:fire(self:getValue())if p8 then if self._useImplicitConnections then self:stop()end;self._complete=true;self._onComplete:fire()end;return p8 end;function cN:setGoal(pa)assert(not pa.step,"goals contains disallowed property \"step\". Did you mean to put a table of goals here?")self._complete=false;self._onStart:fire()for ej,cF in pairs(pa)do local cB=assert(self._motors[ej],("Unknown motor for key %s"):format(ej))cB:setGoal(cF)end;if self._useImplicitConnections then self:start()end end;function cN:getValue()local nF={}for ej,cB in pairs(self._motors)do nF[ej]=cB:getValue()end;return nF end;function cN:__tostring()return"Motor(Group)"end;return cN end,newEnv("Orca.include.node_modules.flipper.src.GroupMotor"))()end)newModule("Instant","ModuleScript","Orca.include.node_modules.flipper.src.Instant","Orca.include.node_modules.flipper.src",function()return setfenv(function()local cG={}cG.__index=cG;function cG.new(cI)return setmetatable({_targetValue=cI},cG)end;function cG:step()return{complete=true,value=self._targetValue}end;return cG end,newEnv("Orca.include.node_modules.flipper.src.Instant"))()end)newModule("Linear","ModuleScript","Orca.include.node_modules.flipper.src.Linear","Orca.include.node_modules.flipper.src",function()return setfenv(function()local cJ={}cJ.__index=cJ;function cJ.new(cI,cL)assert(cI,"Missing argument #1: targetValue")cL=cL or{}return setmetatable({_targetValue=cI,_velocity=cL.velocity or 1},cJ)end;function cJ:step(F,gg)local R=F.value;local pb=self._velocity;local cF=self._targetValue;local pc=gg*pb;local p9=pc>=math.abs(cF-R)R=R+pc*(cF>R and 1 or-1)if p9 then R=self._targetValue;pb=0 end;return{complete=p9,value=R,velocity=pb}end;return cJ end,newEnv("Orca.include.node_modules.flipper.src.Linear"))()end)newModule("Signal","ModuleScript","Orca.include.node_modules.flipper.src.Signal","Orca.include.node_modules.flipper.src",function()return setfenv(function()local pd={}pd.__index=pd;function pd.new(pe,p3)return setmetatable({signal=pe,connected=true,_handler=p3},pd)end;function pd:disconnect()if self.connected then self.connected=false;for c2,nD in pairs(self.signal._connections)do if nD==self then table.remove(self.signal._connections,c2)return end end end end;local p0={}p0.__index=p0;function p0.new()return setmetatable({_connections={},_threads={}},p0)end;function p0:fire(...)for ev,nD in pairs(self._connections)do nD._handler(...)end;for ev,pf in pairs(self._threads)do coroutine.resume(pf,...)end;self._threads={}end;function p0:connect(p3)local nD=pd.new(self,p3)table.insert(self._connections,nD)return nD end;function p0:wait()table.insert(self._threads,coroutine.running())return coroutine.yield()end;return p0 end,newEnv("Orca.include.node_modules.flipper.src.Signal"))()end)newModule("SingleMotor","ModuleScript","Orca.include.node_modules.flipper.src.SingleMotor","Orca.include.node_modules.flipper.src",function()return setfenv(function()local p2=require(script.Parent.BaseMotor)local cO=setmetatable({},p2)cO.__index=cO;function cO.new(bG,p7)assert(bG,"Missing argument #1: initialValue")assert(typeof(bG)=="number","initialValue must be a number!")local self=setmetatable(p2.new(),cO)if p7~=nil then self._useImplicitConnections=p7 else self._useImplicitConnections=true end;self._goal=nil;self._state={complete=true,value=bG}return self end;function cO:step(eO)if self._state.complete then return true end;local ex=self._goal:step(self._state,eO)self._state=ex;self._onStep:fire(ex.value)if ex.complete then if self._useImplicitConnections then self:stop()end;self._onComplete:fire()end;return ex.complete end;function cO:getValue()return self._state.value end;function cO:setGoal(cF)self._state.complete=false;self._goal=cF;self._onStart:fire()if self._useImplicitConnections then self:start()end end;function cO:__tostring()return"Motor(Single)"end;return cO end,newEnv("Orca.include.node_modules.flipper.src.SingleMotor"))()end)newModule("Spring","ModuleScript","Orca.include.node_modules.flipper.src.Spring","Orca.include.node_modules.flipper.src",function()return setfenv(function()local pg=0.001;local ph=0.001;local pi=0.0001;local bw={}bw.__index=bw;function bw.new(cI,cL)assert(cI,"Missing argument #1: targetValue")cL=cL or{}return setmetatable({_targetValue=cI,_frequency=cL.frequency or 4,_dampingRatio=cL.dampingRatio or 1},bw)end;function bw:step(F,gg)local pj=self._dampingRatio;local gh=self._frequency*2*math.pi;local dF=self._targetValue;local gi=F.value;local gj=F.velocity or 0;local ct=gi-dF;local gk=math.exp(-pj*gh*gg)local gl,gm;if pj==1 then gl=(ct*(1+gh*gg)+gj*gg)*gk+dF;gm=(gj*(1-gh*gg)-ct*gh*gh*gg)*gk elseif pj<1 then local pk=math.sqrt(1-pj*pj)local k2=math.cos(gh*pk*gg)local pl=math.sin(gh*pk*gg)local eP;if pk>pi then eP=pl/pk else local hD=gg*gh;eP=hD+(hD*hD*pk*pk*pk*pk/20-pk*pk)*hD*hD*hD/6 end;local ed;if gh*pk>pi then ed=pl/(gh*pk)else local dG=gh*pk;ed=gg+(gg*gg*dG*dG*dG*dG/20-dG*dG)*gg*gg*gg/6 end;gl=(ct*(k2+pj*eP)+gj*ed)*gk+dF;gm=(gj*(k2-eP*pj)-ct*eP*gh)*gk else local pk=math.sqrt(pj*pj-1)local pm=-gh*(pj-pk)local pn=-gh*(pj+pk)local po=(gj-ct*pm)/(2*gh*pk)local pp=ct-po;local pq=pp*math.exp(pm*gg)local pr=po*math.exp(pn*gg)gl=pq+pr+dF;gm=pq*pm+pr*pn end;local p9=math.abs(gm)<pg and math.abs(gl-dF)<ph;return{complete=p9,value=p9 and dF or gl,velocity=gm}end;return bw end,newEnv("Orca.include.node_modules.flipper.src.Spring"))()end)newModule("isMotor","ModuleScript","Orca.include.node_modules.flipper.src.isMotor","Orca.include.node_modules.flipper.src",function()return setfenv(function()local function cy(d3)local ps=tostring(d3):match("^Motor%((.+)%)$")if ps then return true,ps else return false end end;return cy end,newEnv("Orca.include.node_modules.flipper.src.isMotor"))()end)newInstance("typings","Folder","Orca.include.node_modules.flipper.typings","Orca.include.node_modules.flipper")newModule("make","ModuleScript","Orca.include.node_modules.make","Orca.include.node_modules",function()return setfenv(function()local function au(pt,pu)local Z=pu;local be=Z.Children;local ni=Z.Parent;local pv=Instance.new(pt)for pw,d3 in pairs(pu)do if pw~="Children"and pw~="Parent"then local dv=pv;local px=dv[pw]if typeof(px)=="RBXScriptSignal"then px:Connect(d3)else pv[pw]=d3 end end end;if be then for ev,fo in ipairs(be)do fo.Parent=pv end end;pv.Parent=ni;return pv end;return au end,newEnv("Orca.include.node_modules.make"))()end)newInstance("node_modules","Folder","Orca.include.node_modules.make.node_modules","Orca.include.node_modules.make")newInstance("@rbxts","Folder","Orca.include.node_modules.make.node_modules.@rbxts","Orca.include.node_modules.make.node_modules")newInstance("compiler-types","Folder","Orca.include.node_modules.make.node_modules.@rbxts.compiler-types","Orca.include.node_modules.make.node_modules.@rbxts")newInstance("types","Folder","Orca.include.node_modules.make.node_modules.@rbxts.compiler-types.types","Orca.include.node_modules.make.node_modules.@rbxts.compiler-types")newModule("object-utils","ModuleScript","Orca.include.node_modules.object-utils","Orca.include.node_modules",function()return setfenv(function()local ia=game:GetService("HttpService")local py={}function py.keys(fd)local dx=table.create(#fd)for ej in pairs(fd)do dx[#dx+1]=ej end;return dx end;function py.values(fd)local dx=table.create(#fd)for ev,d3 in pairs(fd)do dx[#dx+1]=d3 end;return dx end;function py.entries(fd)local dx=table.create(#fd)for ej,d3 in pairs(fd)do dx[#dx+1]={ej,d3}end;return dx end;function py.assign(pz,...)for k2=1,select("#",...)do local pA=select(k2,...)if type(pA)=="table"then for ej,d3 in pairs(pA)do pz[ej]=d3 end end end;return pz end;function py.copy(fd)local dx=table.create(#fd)for gX,bM in pairs(fd)do dx[gX]=bM end;return dx end;local function pB(fd,pC)local dx=table.create(#fd)pC[fd]=dx;for gX,bM in pairs(fd)do if type(gX)=="table"then gX=pC[gX]or pB(gX,pC)end;if type(bM)=="table"then bM=pC[bM]or pB(bM,pC)end;dx[gX]=bM end;return dx end;function py.deepCopy(fd)return pB(fd,{})end;function py.deepEquals(hD,dG)for gX in pairs(hD)do local pD=hD[gX]local pE=dG[gX]if type(pD)=="table"and type(pE)=="table"then local dx=py.deepEquals(pD,pE)if not dx then return false end elseif pD~=pE then return false end end;for gX in pairs(dG)do if hD[gX]==nil then return false end end;return true end;function py.toString(hG)return ia:JSONEncode(hG)end;function py.isEmpty(fd)return next(fd)==nil end;function py.fromEntries(pF)local pG=#pF;local dx=table.create(pG)if pF then for k2=1,pG do local pH=pF[k2]dx[pH[1]]=pH[2]end end;return dx end;return py end,newEnv("Orca.include.node_modules.object-utils"))()end)newInstance("roact","Folder","Orca.include.node_modules.roact","Orca.include.node_modules")newModule("src","ModuleScript","Orca.include.node_modules.roact.src","Orca.include.node_modules.roact",function()return setfenv(function()local pI=require(script.GlobalConfig)local pJ=require(script.createReconciler)local pK=require(script.createReconcilerCompat)local pL=require(script.RobloxRenderer)local pM=require(script.strict)local pN=require(script.Binding)local pO=pJ(pL)local pP=pK(pO)local b=pM{Component=require(script.Component),createElement=require(script.createElement),createFragment=require(script.createFragment),oneChild=require(script.oneChild),PureComponent=require(script.PureComponent),None=require(script.None),Portal=require(script.Portal),createRef=require(script.createRef),forwardRef=require(script.forwardRef),createBinding=pN.create,joinBindings=pN.join,createContext=require(script.createContext),Change=require(script.PropMarkers.Change),Children=require(script.PropMarkers.Children),Event=require(script.PropMarkers.Event),Ref=require(script.PropMarkers.Ref),mount=pO.mountVirtualTree,unmount=pO.unmountVirtualTree,update=pO.updateVirtualTree,reify=pP.reify,teardown=pP.teardown,reconcile=pP.reconcile,setGlobalConfig=pI.set,UNSTABLE={}}return b end,newEnv("Orca.include.node_modules.roact.src"))()end)newModule("Binding","ModuleScript","Orca.include.node_modules.roact.src.Binding","Orca.include.node_modules.roact.src",function()return setfenv(function()local pQ=require(script.Parent.createSignal)local pR=require(script.Parent.Symbol)local pS=require(script.Parent.Type)local pT=require(script.Parent.GlobalConfig).get()local pU=pR.named("BindingImpl")local pV={}local pW={}function pW:getValue()return pV.getValue(self)end;function pW:map(nY)return pV.map(self,nY)end;local pX={__index=pW,__tostring=function(self)return string.format("RoactBinding(%s)",tostring(self:getValue()))end}function pV.update(cC,pY)return cC[pU].update(pY)end;function pV.subscribe(cC,da)return cC[pU].subscribe(da)end;function pV.getValue(cC)return cC[pU].getValue()end;function pV.create(bG)local pZ={value=bG,changeSignal=pQ()}function pZ.subscribe(da)return pZ.changeSignal:subscribe(da)end;function pZ.update(pY)pZ.value=pY;pZ.changeSignal:fire(pY)end;function pZ.getValue()return pZ.value end;return setmetatable({[pS]=pS.Binding,[pU]=pZ},pX),pZ.update end;function pV.map(p_,nY)if pT.typeChecks then assert(pS.of(p_)==pS.Binding,"Expected arg #1 to be a binding")assert(typeof(nY)=="function","Expected arg #1 to be a function")end;local pZ={}function pZ.subscribe(da)return pV.subscribe(p_,function(pY)da(nY(pY))end)end;function pZ.update(pY)error("Bindings created by Binding:map(fn) cannot be updated directly",2)end;function pZ.getValue()return nY(p_:getValue())end;return setmetatable({[pS]=pS.Binding,[pU]=pZ},pX)end;function pV.join(q0)if pT.typeChecks then assert(typeof(q0)=="table","Expected arg #1 to be of type table")for ej,d3 in pairs(q0)do if pS.of(d3)~=pS.Binding then local oq=("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format(tostring(ej))error(oq,2)end end end;local pZ={}local function mf()local d3={}for ej,q1 in pairs(q0)do d3[ej]=q1:getValue()end;return d3 end;function pZ.subscribe(da)local q2={}for ej,q1 in pairs(q0)do q2[ej]=pV.subscribe(q1,function(pY)da(mf())end)end;return function()if q2==nil then return end;for ev,oy in pairs(q2)do oy()end;q2=nil end end;function pZ.update(pY)error("Bindings created by joinBindings(...) cannot be updated directly",2)end;function pZ.getValue()return mf()end;return setmetatable({[pS]=pS.Binding,[pU]=pZ},pX)end;return pV end,newEnv("Orca.include.node_modules.roact.src.Binding"))()end)newModule("Component","ModuleScript","Orca.include.node_modules.roact.src.Component","Orca.include.node_modules.roact.src",function()return setfenv(function()local q3=require(script.Parent.assign)local q4=require(script.Parent.ComponentLifecyclePhase)local pS=require(script.Parent.Type)local pR=require(script.Parent.Symbol)local q5=require(script.Parent.invalidSetStateMessages)local q6=require(script.Parent.internalAssert)local pT=require(script.Parent.GlobalConfig).get()local q7=100;local q8=pR.named("InternalData")local q9=[[
The component %q is missing the `render` method.
`render` must be defined when creating a Roact component!]]local qa=[[
The component %q has reached the setState update recursion limit.
When using `setState` in `didUpdate`, make sure that it won't repeat infinitely!]]local qb={}function qb:__tostring()return self.__componentName end;local qc={}setmetatable(qc,qb)qc[pS]=pS.StatefulComponentClass;qc.__index=qc;qc.__componentName="Component"function qc:extend(hv)if pT.typeChecks then assert(pS.of(self)==pS.StatefulComponentClass,"Invalid `self` argument to `extend`.")assert(typeof(hv)=="string","Component class name must be a string")end;local oO={}for ej,d3 in pairs(self)do if ej~="extend"then oO[ej]=d3 end end;oO[pS]=pS.StatefulComponentClass;oO.__index=oO;oO.__componentName=hv;setmetatable(oO,qb)return oO end;function qc:__getDerivedState(qd,qe)if pT.internalTypeChecks then q6(pS.of(self)==pS.StatefulComponentInstance,"Invalid use of `__getDerivedState`")end;local qf=self[q8]local qg=qf.componentClass;if qg.getDerivedStateFromProps~=nil then local qh=qg.getDerivedStateFromProps(qd,qe)if qh~=nil then if pT.typeChecks then assert(typeof(qh)=="table","getDerivedStateFromProps must return a table!")end;return qh end end;return nil end;function qc:setState(qi)if pT.typeChecks then assert(pS.of(self)==pS.StatefulComponentInstance,"Invalid `self` argument to `extend`.")end;local qf=self[q8]local qj=qf.lifecyclePhase;if qj==q4.ShouldUpdate or qj==q4.WillUpdate or qj==q4.Render or qj==q4.WillUnmount then local qk=q5[qf.lifecyclePhase]local oq=qk:format(tostring(qf.componentClass))error(oq,2)end;local ql=qf.pendingState;local qm;if typeof(qi)=="function"then qm=qi(ql or self.state,self.props)if qm==nil then return end elseif typeof(qi)=="table"then qm=qi else error("Invalid argument to setState, expected function or table",2)end;local ex;if ql~=nil then ex=q3(ql,qm)else ex=q3({},self.state,qm)end;if qj==q4.Init then local qh=self:__getDerivedState(self.props,ex)self.state=q3(ex,qh)elseif qj==q4.DidMount or qj==q4.DidUpdate or qj==q4.ReconcileChildren then local qh=self:__getDerivedState(self.props,ex)qf.pendingState=q3(ex,qh)elseif qj==q4.Idle then local qn=qf.virtualNode;local qo=qf.reconciler;if pT.tempFixUpdateChildrenReEntrancy then qo.suspendParentEvents(qn)end;self:__update(nil,ex)if pT.tempFixUpdateChildrenReEntrancy then qo.resumeParentEvents(qn)end else local qk=q5.default;local oq=qk:format(tostring(qf.componentClass))error(oq,2)end end;function qc:getElementTraceback()return self[q8].virtualNode.currentElement.source end;function qc:render()local qf=self[q8]local oq=q9:format(tostring(qf.componentClass))error(oq,0)end;function qc:__getContext(ej)if pT.internalTypeChecks then q6(pS.of(self)==pS.StatefulComponentInstance,"Invalid use of `__getContext`")q6(ej~=nil,"Context key cannot be nil")end;local qn=self[q8].virtualNode;local qp=qn.context;return qp[ej]end;function qc:__addContext(ej,d3)if pT.internalTypeChecks then q6(pS.of(self)==pS.StatefulComponentInstance,"Invalid use of `__addContext`")end;local qn=self[q8].virtualNode;if qn.originalContext==nil then qn.originalContext=qn.context end;local qq=qn.context;qn.context=q3({},qq,{[ej]=d3})end;function qc:__validateProps(l2)if not pT.propValidation then return end;local qr=self[q8].componentClass.validateProps;if qr==nil then return end;if typeof(qr)~="function"then error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(qr),self.__componentName))end;local nr,qs=qr(l2)if not nr then qs=qs or"<Validator function did not supply a message>"error(("Property validation failed in %s: %s\n\n%s"):format(self.__componentName,tostring(qs),self:getElementTraceback()or"<enable element tracebacks>"),0)end end;function qc:__mount(qo,qn)if pT.internalTypeChecks then q6(pS.of(self)==pS.StatefulComponentClass,"Invalid use of `__mount`")q6(pS.of(qn)==pS.VirtualNode,"Expected arg #2 to be of type VirtualNode")end;local qt=qn.currentElement;local qu=qn.hostParent;local qf={reconciler=qo,virtualNode=qn,componentClass=self,lifecyclePhase=q4.Init}local pv={[pS]=pS.StatefulComponentInstance,[q8]=qf}setmetatable(pv,self)qn.instance=pv;local l2=qt.props;if self.defaultProps~=nil then l2=q3({},self.defaultProps,l2)end;pv:__validateProps(l2)pv.props=l2;local qv=q3({},qn.legacyContext)pv._context=qv;pv.state=q3({},pv:__getDerivedState(pv.props,{}))if pv.init~=nil then pv:init(pv.props)q3(pv.state,pv:__getDerivedState(pv.props,pv.state))end;qn.legacyContext=pv._context;qf.lifecyclePhase=q4.Render;local qw=pv:render()qf.lifecyclePhase=q4.ReconcileChildren;qo.updateVirtualNodeWithRenderResult(qn,qu,qw)if pv.didMount~=nil then qf.lifecyclePhase=q4.DidMount;pv:didMount()end;if qf.pendingState~=nil then pv:__update(nil,nil)end;qf.lifecyclePhase=q4.Idle end;function qc:__unmount()if pT.internalTypeChecks then q6(pS.of(self)==pS.StatefulComponentInstance,"Invalid use of `__unmount`")end;local qf=self[q8]local qn=qf.virtualNode;local qo=qf.reconciler;if self.willUnmount~=nil then qf.lifecyclePhase=q4.WillUnmount;self:willUnmount()end;for ev,qx in pairs(qn.children)do qo.unmountVirtualNode(qx)end end;function qc:__update(qy,qz)if pT.internalTypeChecks then q6(pS.of(self)==pS.StatefulComponentInstance,"Invalid use of `__update`")q6(pS.of(qy)==pS.Element or qy==nil,"Expected arg #1 to be of type Element or nil")q6(typeof(qz)=="table"or qz==nil,"Expected arg #2 to be of type table or nil")end;local qf=self[q8]local qg=qf.componentClass;local qA=self.props;if qy~=nil then qA=qy.props;if qg.defaultProps~=nil then qA=q3({},qg.defaultProps,qA)end;self:__validateProps(qA)end;local qB=0;repeat local qC;local ql=nil;if qf.pendingState~=nil then ql=qf.pendingState;qf.pendingState=nil end;if qz~=nil or qA~=self.props then if ql==nil then qC=qz or self.state else qC=q3(ql,qz)end;local qh=self:__getDerivedState(qA,qC)if qh~=nil then qC=q3({},qC,qh)end;qz=nil else qC=ql end;if not self:__resolveUpdate(qA,qC)then return false end;qB=qB+1;if qB>q7 then error(qa:format(tostring(qf.componentClass)),3)end until qf.pendingState==nil;return true end;function qc:__resolveUpdate(qd,qe)if pT.internalTypeChecks then q6(pS.of(self)==pS.StatefulComponentInstance,"Invalid use of `__resolveUpdate`")end;local qf=self[q8]local qn=qf.virtualNode;local qo=qf.reconciler;local qD=self.props;local qE=self.state;if qd==nil then qd=qD end;if qe==nil then qe=qE end;if self.shouldUpdate~=nil then qf.lifecyclePhase=q4.ShouldUpdate;local qF=self:shouldUpdate(qd,qe)if not qF then qf.lifecyclePhase=q4.Idle;return false end end;if self.willUpdate~=nil then qf.lifecyclePhase=q4.WillUpdate;self:willUpdate(qd,qe)end;qf.lifecyclePhase=q4.Render;self.props=qd;self.state=qe;local qw=qn.instance:render()qf.lifecyclePhase=q4.ReconcileChildren;qo.updateVirtualNodeWithRenderResult(qn,qn.hostParent,qw)if self.didUpdate~=nil then qf.lifecyclePhase=q4.DidUpdate;self:didUpdate(qD,qE)end;qf.lifecyclePhase=q4.Idle;return true end;return qc end,newEnv("Orca.include.node_modules.roact.src.Component"))()end)newModule("ComponentLifecyclePhase","ModuleScript","Orca.include.node_modules.roact.src.ComponentLifecyclePhase","Orca.include.node_modules.roact.src",function()return setfenv(function()local pR=require(script.Parent.Symbol)local pM=require(script.Parent.strict)local q4=pM({Init=pR.named("init"),Render=pR.named("render"),ShouldUpdate=pR.named("shouldUpdate"),WillUpdate=pR.named("willUpdate"),DidMount=pR.named("didMount"),DidUpdate=pR.named("didUpdate"),WillUnmount=pR.named("willUnmount"),ReconcileChildren=pR.named("reconcileChildren"),Idle=pR.named("idle")},"ComponentLifecyclePhase")return q4 end,newEnv("Orca.include.node_modules.roact.src.ComponentLifecyclePhase"))()end)newModule("Config","ModuleScript","Orca.include.node_modules.roact.src.Config","Orca.include.node_modules.roact.src",function()return setfenv(function()local qG={["internalTypeChecks"]=false,["typeChecks"]=false,["elementTracing"]=false,["propValidation"]=false,["tempFixUpdateChildrenReEntrancy"]=false}local qH={}for ej in pairs(qG)do table.insert(qH,ej)end;local mn={}function mn.new()local self={}self._currentConfig=setmetatable({},{__index=function(ev,ej)local oq=("Invalid global configuration key %q. Valid configuration keys are: %s"):format(tostring(ej),table.concat(qH,", "))error(oq,3)end})self.set=function(...)return mn.set(self,...)end;self.get=function(...)return mn.get(self,...)end;self.scoped=function(...)return mn.scoped(self,...)end;self.set(qG)return self end;function mn:set(qI)for ej,d3 in pairs(qI)do if qG[ej]==nil then local oq=("Invalid global configuration key %q (type %s). Valid configuration keys are: %s"):format(tostring(ej),typeof(ej),table.concat(qH,", "))error(oq,3)end;if typeof(d3)~="boolean"then local oq=("Invalid value %q (type %s) for global configuration key %q. Valid values are: true, false"):format(tostring(d3),typeof(d3),tostring(ej))error(oq,3)end;self._currentConfig[ej]=d3 end end;function mn:get()return self._currentConfig end;function mn:scoped(qI,da)local qJ={}for ej,d3 in pairs(self._currentConfig)do qJ[ej]=d3 end;self.set(qI)local nr,dx=pcall(da)self.set(qJ)assert(nr,dx)end;return mn end,newEnv("Orca.include.node_modules.roact.src.Config"))()end)newModule("ElementKind","ModuleScript","Orca.include.node_modules.roact.src.ElementKind","Orca.include.node_modules.roact.src",function()return setfenv(function()local pR=require(script.Parent.Symbol)local pM=require(script.Parent.strict)local qK=require(script.Parent.Portal)local qL=newproxy(true)local qM={Portal=pR.named("Portal"),Host=pR.named("Host"),Function=pR.named("Function"),Stateful=pR.named("Stateful"),Fragment=pR.named("Fragment")}function qM.of(d3)if typeof(d3)~="table"then return nil end;return d3[qL]end;local qN={["string"]=qM.Host,["function"]=qM.Function,["table"]=qM.Stateful}function qM.fromComponent(qO)if qO==qK then return qL.Portal else return qN[typeof(qO)]end end;getmetatable(qL).__index=qM;pM(qM,"ElementKind")return qL end,newEnv("Orca.include.node_modules.roact.src.ElementKind"))()end)newModule("ElementUtils","ModuleScript","Orca.include.node_modules.roact.src.ElementUtils","Orca.include.node_modules.roact.src",function()return setfenv(function()local pS=require(script.Parent.Type)local pR=require(script.Parent.Symbol)local function p1()return nil end;local qP={}qP.UseParentKey=pR.named("UseParentKey")function qP.iterateElements(qQ)local qR=pS.of(qQ)if qR==pS.Element then local qS=false;return function()if qS then return nil else qS=true;return qP.UseParentKey,qQ end end end;local qT=typeof(qQ)if qQ==nil or qT=="boolean"then return p1 end;if qT=="table"then return pairs(qQ)end;error("Invalid elements")end;function qP.getElementByKey(qU,qV)if qU==nil or typeof(qU)=="boolean"then return nil end;if pS.of(qU)==pS.Element then if qV==qP.UseParentKey then return qU end;return nil end;if typeof(qU)=="table"then return qU[qV]end;error("Invalid elements")end;return qP end,newEnv("Orca.include.node_modules.roact.src.ElementUtils"))()end)newModule("GlobalConfig","ModuleScript","Orca.include.node_modules.roact.src.GlobalConfig","Orca.include.node_modules.roact.src",function()return setfenv(function()local mn=require(script.Parent.Config)return mn.new()end,newEnv("Orca.include.node_modules.roact.src.GlobalConfig"))()end)newModule("Logging","ModuleScript","Orca.include.node_modules.roact.src.Logging","Orca.include.node_modules.roact.src",function()return setfenv(function()local qW=true;local qX={}local qY={}local function qZ(q_,r0)local r1=("\t"):rep(r0)return r1 ..q_:gsub("\n","\n"..r1)end;local function r2(r3,r0)local r4={}for ev,r5 in ipairs(r3)do table.insert(r4,qZ(r5,r0))end;return table.concat(r4,"\n")end;local r6={}function r6:__tostring()local r4={"LogInfo {"}local r7=#self.errors;local r8=#self.warnings;local r9=#self.infos;if r7+r8+r9==0 then table.insert(r4,"\t(no messages)")end;if r7>0 then table.insert(r4,("\tErrors (%d) {"):format(r7))table.insert(r4,r2(self.errors,2))table.insert(r4,"\t}")end;if r8>0 then table.insert(r4,("\tWarnings (%d) {"):format(r8))table.insert(r4,r2(self.warnings,2))table.insert(r4,"\t}")end;if r9>0 then table.insert(r4,("\tInfos (%d) {"):format(r9))table.insert(r4,r2(self.infos,2))table.insert(r4,"\t}")end;table.insert(r4,"}")return table.concat(r4,"\n")end;local function ra()local rb={errors={},warnings={},infos={}}setmetatable(rb,r6)return rb end;local rc={}function rc.capture(da)local rd=ra()local re=qW;qW=false;qX[rd]=true;local nr,dx=pcall(da)qX[rd]=nil;qW=re;assert(nr,dx)return rd end;function rc.warn(qk,...)local oq=qk:format(...)for rd in pairs(qX)do table.insert(rd.warnings,oq)end;local rf=debug.traceback("",2):sub(2)local rg=("%s\n%s"):format(oq,qZ(rf,1))if qW then warn(rg)end end;function rc.warnOnce(qk,...)local rf=debug.traceback()if qY[rf]then return end;qY[rf]=true;rc.warn(qk,...)end;return rc end,newEnv("Orca.include.node_modules.roact.src.Logging"))()end)newModule("None","ModuleScript","Orca.include.node_modules.roact.src.None","Orca.include.node_modules.roact.src",function()return setfenv(function()local pR=require(script.Parent.Symbol)local rh=pR.named("None")return rh end,newEnv("Orca.include.node_modules.roact.src.None"))()end)newModule("NoopRenderer","ModuleScript","Orca.include.node_modules.roact.src.NoopRenderer","Orca.include.node_modules.roact.src",function()return setfenv(function()local ri={}function ri.isHostObject(as)return as==nil end;function ri.mountHostNode(qo,o9)end;function ri.unmountHostNode(qo,o9)end;function ri.updateHostNode(qo,o9,rj)return o9 end;return ri end,newEnv("Orca.include.node_modules.roact.src.NoopRenderer"))()end)newModule("Portal","ModuleScript","Orca.include.node_modules.roact.src.Portal","Orca.include.node_modules.roact.src",function()return setfenv(function()local pR=require(script.Parent.Symbol)local qK=pR.named("Portal")return qK end,newEnv("Orca.include.node_modules.roact.src.Portal"))()end)newInstance("PropMarkers","Folder","Orca.include.node_modules.roact.src.PropMarkers","Orca.include.node_modules.roact.src")newModule("Change","ModuleScript","Orca.include.node_modules.roact.src.PropMarkers.Change","Orca.include.node_modules.roact.src.PropMarkers",function()return setfenv(function()local pS=require(script.Parent.Parent.Type)local rk={}local rl={__tostring=function(self)return("RoactHostChangeEvent(%s)"):format(self.name)end}setmetatable(rk,{__index=function(self,rm)local rn={[pS]=pS.HostChangeEvent,name=rm}setmetatable(rn,rl)rk[rm]=rn;return rn end})return rk end,newEnv("Orca.include.node_modules.roact.src.PropMarkers.Change"))()end)newModule("Children","ModuleScript","Orca.include.node_modules.roact.src.PropMarkers.Children","Orca.include.node_modules.roact.src.PropMarkers",function()return setfenv(function()local pR=require(script.Parent.Parent.Symbol)local ro=pR.named("Children")return ro end,newEnv("Orca.include.node_modules.roact.src.PropMarkers.Children"))()end)newModule("Event","ModuleScript","Orca.include.node_modules.roact.src.PropMarkers.Event","Orca.include.node_modules.roact.src.PropMarkers",function()return setfenv(function()local pS=require(script.Parent.Parent.Type)local rp={}local rq={__tostring=function(self)return("RoactHostEvent(%s)"):format(self.name)end}setmetatable(rp,{__index=function(self,rr)local ow={[pS]=pS.HostEvent,name=rr}setmetatable(ow,rq)rp[rr]=ow;return ow end})return rp end,newEnv("Orca.include.node_modules.roact.src.PropMarkers.Event"))()end)newModule("Ref","ModuleScript","Orca.include.node_modules.roact.src.PropMarkers.Ref","Orca.include.node_modules.roact.src.PropMarkers",function()return setfenv(function()local pR=require(script.Parent.Parent.Symbol)local rs=pR.named("Ref")return rs end,newEnv("Orca.include.node_modules.roact.src.PropMarkers.Ref"))()end)newModule("PureComponent","ModuleScript","Orca.include.node_modules.roact.src.PureComponent","Orca.include.node_modules.roact.src",function()return setfenv(function()local qc=require(script.Parent.Component)local rt=qc:extend("PureComponent")rt.extend=qc.extend;function rt:shouldUpdate(qA,ex)if ex~=self.state then return true end;if qA==self.props then return false end;for ej,d3 in pairs(qA)do if self.props[ej]~=d3 then return true end end;for ej,d3 in pairs(self.props)do if qA[ej]~=d3 then return true end end;return false end;return rt end,newEnv("Orca.include.node_modules.roact.src.PureComponent"))()end)newModule("RobloxRenderer","ModuleScript","Orca.include.node_modules.roact.src.RobloxRenderer","Orca.include.node_modules.roact.src",function()return setfenv(function()local pN=require(script.Parent.Binding)local ro=require(script.Parent.PropMarkers.Children)local qL=require(script.Parent.ElementKind)local ru=require(script.Parent.SingleEventManager)local rv=require(script.Parent.getDefaultInstanceProperty)local rs=require(script.Parent.PropMarkers.Ref)local pS=require(script.Parent.Type)local q6=require(script.Parent.internalAssert)local pT=require(script.Parent.GlobalConfig).get()local rw=[[
Error applying props:
	%s
In element:
%s
]]local rx=[[
Error updating props:
	%s
In element:
%s
]]local function ry(...)return...end;local function rz(db,rA)if db==nil then return end;if typeof(db)=="function"then db(rA)elseif pS.of(db)==pS.Binding then pN.update(db,rA)else error(("Invalid ref: Expected type Binding but got %s"):format(typeof(db)))end end;local function rB(rC,ej,pY)if pY==nil then local rD=rC.ClassName;local ev,iM=rv(rD,ej)pY=iM end;rC[ej]=pY;return end;local function rE(qn,ej)local oy=qn.bindings[ej]oy()qn.bindings[ej]=nil end;local function rF(qn,ej,rG)local function rH(pY)local nr,rI=xpcall(function()rB(qn.hostObject,ej,pY)end,ry)if not nr then local q_=qn.currentElement.source;if q_==nil then q_="<enable element tracebacks>"end;local rg=rx:format(rI,q_)error(rg,0)end end;if qn.bindings==nil then qn.bindings={}end;qn.bindings[ej]=pN.subscribe(rG,rH)rH(rG:getValue())end;local function rJ(qn)if qn.bindings~=nil then for ev,oy in pairs(qn.bindings)do oy()end end end;local function rK(qn,ej,pY,rL)if pY==rL then return end;if ej==rs or ej==ro then return end;local rM=pS.of(ej)if rM==pS.HostEvent or rM==pS.HostChangeEvent then if qn.eventManager==nil then qn.eventManager=ru.new(qn.hostObject)end;local rr=ej.name;if rM==pS.HostChangeEvent then qn.eventManager:connectPropertyChange(rr,pY)else qn.eventManager:connectEvent(rr,pY)end;return end;local rN=pS.of(pY)==pS.Binding;local rO=pS.of(rL)==pS.Binding;if rO then rE(qn,ej)end;if rN then rF(qn,ej,pY)else rB(qn.hostObject,ej,pY)end end;local function rP(qn,l2)for rQ,d3 in pairs(l2)do rK(qn,rQ,d3,nil)end end;local function rR(qn,qD,qA)for rQ,pY in pairs(qA)do local rL=qD[rQ]rK(qn,rQ,pY,rL)end;for rQ,rL in pairs(qD)do local pY=qA[rQ]if pY==nil then rK(qn,rQ,nil,rL)end end end;local pL={}function pL.isHostObject(as)return typeof(as)=="Instance"end;function pL.mountHostNode(qo,qn)local rS=qn.currentElement;local qu=qn.hostParent;local qV=qn.hostKey;if pT.internalTypeChecks then q6(qL.of(rS)==qL.Host,"Element at given node is not a host Element")end;if pT.typeChecks then assert(rS.props.Name==nil,"Name can not be specified as a prop to a host component in Roact.")assert(rS.props.Parent==nil,"Parent can not be specified as a prop to a host component in Roact.")end;local pv=Instance.new(rS.component)qn.hostObject=pv;local nr,rI=xpcall(function()rP(qn,rS.props)end,ry)if not nr then local q_=rS.source;if q_==nil then q_="<enable element tracebacks>"end;local rg=rw:format(rI,q_)error(rg,0)end;pv.Name=tostring(qV)local be=rS.props[ro]if be~=nil then qo.updateVirtualNodeWithChildren(qn,qn.hostObject,be)end;pv.Parent=qu;qn.hostObject=pv;rz(rS.props[rs],pv)if qn.eventManager~=nil then qn.eventManager:resume()end end;function pL.unmountHostNode(qo,qn)local rS=qn.currentElement;rz(rS.props[rs],nil)for ev,qx in pairs(qn.children)do qo.unmountVirtualNode(qx)end;rJ(qn)qn.hostObject:Destroy()end;function pL.updateHostNode(qo,qn,rj)local qD=qn.currentElement.props;local qA=rj.props;if qn.eventManager~=nil then qn.eventManager:suspend()end;if qD[rs]~=qA[rs]then rz(qD[rs],nil)rz(qA[rs],qn.hostObject)end;local nr,rI=xpcall(function()rR(qn,qD,qA)end,ry)if not nr then local q_=rj.source;if q_==nil then q_="<enable element tracebacks>"end;local rg=rx:format(rI,q_)error(rg,0)end;local be=rj.props[ro]if be~=nil or qD[ro]~=nil then qo.updateVirtualNodeWithChildren(qn,qn.hostObject,be)end;if qn.eventManager~=nil then qn.eventManager:resume()end;return qn end;return pL end,newEnv("Orca.include.node_modules.roact.src.RobloxRenderer"))()end)newModule("SingleEventManager","ModuleScript","Orca.include.node_modules.roact.src.SingleEventManager","Orca.include.node_modules.roact.src",function()return setfenv(function()local rc=require(script.Parent.Logging)local rT="Change."local rU={Disabled="Disabled",Suspended="Suspended",Enabled="Enabled"}local ru={}ru.__index=ru;function ru.new(pv)local self=setmetatable({_suspendedEventQueue={},_connections={},_listeners={},_status=rU.Disabled,_isResuming=false,_instance=pv},ru)return self end;function ru:connectEvent(ej,rV)self:_connect(ej,self._instance[ej],rV)end;function ru:connectPropertyChange(ej,rV)local nr,ow=pcall(function()return self._instance:GetPropertyChangedSignal(ej)end)if not nr then error(("Cannot get changed signal on property %q: %s"):format(tostring(ej),ow),0)end;self:_connect(rT..ej,ow,rV)end;function ru:_connect(rW,ow,rV)if rV==nil then if self._connections[rW]~=nil then self._connections[rW]:Disconnect()self._connections[rW]=nil end;self._listeners[rW]=nil else if self._connections[rW]==nil then self._connections[rW]=ow:Connect(function(...)if self._status==rU.Enabled then self._listeners[rW](self._instance,...)elseif self._status==rU.Suspended then local rX=select("#",...)table.insert(self._suspendedEventQueue,{rW,rX,...})end end)end;self._listeners[rW]=rV end end;function ru:suspend()self._status=rU.Suspended end;function ru:resume()if self._isResuming then return end;self._isResuming=true;local c2=1;while c2<=#self._suspendedEventQueue do local rY=self._suspendedEventQueue[c2]local rV=self._listeners[rY[1]]local rX=rY[2]if rV~=nil then local rZ=coroutine.create(rV)local nr,dx=coroutine.resume(rZ,self._instance,unpack(rY,3,2+rX))if not nr then rc.warn("%s",dx)end end;c2=c2+1 end;self._isResuming=false;self._status=rU.Enabled;self._suspendedEventQueue={}end;return ru end,newEnv("Orca.include.node_modules.roact.src.SingleEventManager"))()end)newModule("Symbol","ModuleScript","Orca.include.node_modules.roact.src.Symbol","Orca.include.node_modules.roact.src",function()return setfenv(function()local pR={}function pR.named(hv)assert(type(hv)=="string","Symbols must be created using a string name!")local self=newproxy(true)local r_=("Symbol(%s)"):format(hv)getmetatable(self).__tostring=function()return r_ end;return self end;return pR end,newEnv("Orca.include.node_modules.roact.src.Symbol"))()end)newModule("Type","ModuleScript","Orca.include.node_modules.roact.src.Type","Orca.include.node_modules.roact.src",function()return setfenv(function()local pR=require(script.Parent.Symbol)local pM=require(script.Parent.strict)local pS=newproxy(true)local s0={}local function s1(hv)s0[hv]=pR.named("Roact"..hv)end;s1("Binding")s1("Element")s1("HostChangeEvent")s1("HostEvent")s1("StatefulComponentClass")s1("StatefulComponentInstance")s1("VirtualNode")s1("VirtualTree")function s0.of(d3)if typeof(d3)~="table"then return nil end;return d3[pS]end;getmetatable(pS).__index=s0;getmetatable(pS).__tostring=function()return"RoactType"end;pM(s0,"Type")return pS end,newEnv("Orca.include.node_modules.roact.src.Type"))()end)newModule("assertDeepEqual","ModuleScript","Orca.include.node_modules.roact.src.assertDeepEqual","Orca.include.node_modules.roact.src",function()return setfenv(function()local function s2(hD,dG)if typeof(hD)~=typeof(dG)then local oq=("{1} is of type %s, but {2} is of type %s"):format(typeof(hD),typeof(dG))return false,oq end;if typeof(hD)=="table"then local s3={}for ej,d3 in pairs(hD)do s3[ej]=true;local nr,s4=s2(d3,dG[ej])if not nr then local oq=s4:gsub("{1}",("{1}[%s]"):format(tostring(ej))):gsub("{2}",("{2}[%s]"):format(tostring(ej)))return false,oq end end;for ej,d3 in pairs(dG)do if not s3[ej]then local nr,s4=s2(d3,hD[ej])if not nr then local oq=s4:gsub("{1}",("{1}[%s]"):format(tostring(ej))):gsub("{2}",("{2}[%s]"):format(tostring(ej)))return false,oq end end end;return true end;if hD==dG then return true end;local oq="{1} ~= {2}"return false,oq end;local function s5(hD,dG)local nr,s6=s2(hD,dG)if not nr then local s4=s6:gsub("{1}","first"):gsub("{2}","second")local oq=("Values were not deep-equal.\n%s"):format(s4)error(oq,2)end end;return s5 end,newEnv("Orca.include.node_modules.roact.src.assertDeepEqual"))()end)newModule("assign","ModuleScript","Orca.include.node_modules.roact.src.assign","Orca.include.node_modules.roact.src",function()return setfenv(function()local rh=require(script.Parent.None)local function q3(as,...)for c2=1,select("#",...)do local q_=select(c2,...)if q_~=nil then for ej,d3 in pairs(q_)do if d3==rh then as[ej]=nil else as[ej]=d3 end end end end;return as end;return q3 end,newEnv("Orca.include.node_modules.roact.src.assign"))()end)newModule("createContext","ModuleScript","Orca.include.node_modules.roact.src.createContext","Orca.include.node_modules.roact.src",function()return setfenv(function()local pR=require(script.Parent.Symbol)local s7=require(script.Parent.createFragment)local pQ=require(script.Parent.createSignal)local ro=require(script.Parent.PropMarkers.Children)local qc=require(script.Parent.Component)local function s8(s9)return{value=s9,onUpdate=pQ()}end;local function sa(qp)local am=qc:extend("Provider")function am:init(l2)self.contextEntry=s8(l2.value)self:__addContext(qp.key,self.contextEntry)end;function am:willUpdate(sb)if sb.value~=self.props.value then self.contextEntry.value=sb.value end end;function am:didUpdate(sc)if sc.value~=self.props.value then self.contextEntry.onUpdate:fire(self.props.value)end end;function am:render()return s7(self.props[ro])end;return am end;local function sd(qp)local se=qc:extend("Consumer")function se.validateProps(l2)if type(l2.render)~="function"then return false,"Consumer expects a `render` function"else return true end end;function se:init(l2)self.contextEntry=self:__getContext(qp.key)end;function se:render()local d3;if self.contextEntry~=nil then d3=self.contextEntry.value else d3=qp.defaultValue end;return self.props.render(d3)end;function se:didUpdate()if self.contextEntry~=nil then self.lastValue=self.contextEntry.value end end;function se:didMount()if self.contextEntry~=nil then self.disconnect=self.contextEntry.onUpdate:subscribe(function(pY)if pY~=self.lastValue then self:setState({})end end)end end;function se:willUnmount()if self.disconnect~=nil then self.disconnect()end end;return se end;local sf={}sf.__index=sf;function sf.new(iM)return setmetatable({defaultValue=iM,key=pR.named("ContextKey")},sf)end;function sf:__tostring()return"RoactContext"end;local function sg(iM)local qp=sf.new(iM)return{Provider=sa(qp),Consumer=sd(qp)}end;return sg end,newEnv("Orca.include.node_modules.roact.src.createContext"))()end)newModule("createElement","ModuleScript","Orca.include.node_modules.roact.src.createElement","Orca.include.node_modules.roact.src",function()return setfenv(function()local ro=require(script.Parent.PropMarkers.Children)local qL=require(script.Parent.ElementKind)local rc=require(script.Parent.Logging)local pS=require(script.Parent.Type)local pT=require(script.Parent.GlobalConfig).get()local sh=[[
The prop `Roact.Children` was defined but was overriden by the third parameter to createElement!
This can happen when a component passes props through to a child element but also uses the `children` argument:

	Roact.createElement("Frame", passedProps, {
		child = ...
	})

Instead, consider using a utility function to merge tables of children together:

	local children = mergeTables(passedProps[Roact.Children], {
		child = ...
	})

	local fullProps = mergeTables(passedProps, {
		[Roact.Children] = children
	})

	Roact.createElement("Frame", fullProps)]]local function si(qO,l2,be)if pT.typeChecks then assert(qO~=nil,"`component` is required")assert(typeof(l2)=="table"or l2==nil,"`props` must be a table or nil")assert(typeof(be)=="table"or be==nil,"`children` must be a table or nil")end;if l2==nil then l2={}end;if be~=nil then if l2[ro]~=nil then rc.warnOnce(sh)end;l2[ro]=be end;local sj=qL.fromComponent(qO)local rS={[pS]=pS.Element,[qL]=sj,component=qO,props=l2}if pT.elementTracing then rS.source=debug.traceback("",2):sub(2)end;return rS end;return si end,newEnv("Orca.include.node_modules.roact.src.createElement"))()end)newModule("createFragment","ModuleScript","Orca.include.node_modules.roact.src.createFragment","Orca.include.node_modules.roact.src",function()return setfenv(function()local qL=require(script.Parent.ElementKind)local pS=require(script.Parent.Type)local function s7(qU)return{[pS]=pS.Element,[qL]=qL.Fragment,elements=qU}end;return s7 end,newEnv("Orca.include.node_modules.roact.src.createFragment"))()end)newModule("createReconciler","ModuleScript","Orca.include.node_modules.roact.src.createReconciler","Orca.include.node_modules.roact.src",function()return setfenv(function()local pS=require(script.Parent.Type)local qL=require(script.Parent.ElementKind)local qP=require(script.Parent.ElementUtils)local ro=require(script.Parent.PropMarkers.Children)local pR=require(script.Parent.Symbol)local q6=require(script.Parent.internalAssert)local pT=require(script.Parent.GlobalConfig).get()local q8=pR.named("InternalData")local function pJ(sk)local qo;local sl;local sm;local sn;local function so(qn,rj)local qu=qn.hostParent;local qV=qn.hostKey;local oM=qn.depth;local ni=qn.parent;local qp=qn.originalContext or qn.context;local sp=qn.parentLegacyContext;sn(qn)local sq=sl(rj,qu,qV,qp,sp)if sq~=nil then sq.depth=oM;sq.parent=ni end;return sq end;local function sr(qn,qu,ss)if pT.internalTypeChecks then q6(pS.of(qn)==pS.VirtualNode,"Expected arg #1 to be of type VirtualNode")end;local st={}for su,qx in pairs(qn.children)do local rj=qP.getElementByKey(ss,su)local sq=sm(qx,rj)if sq~=nil then qn.children[su]=sq else st[su]=true end end;for su in pairs(st)do qn.children[su]=nil end;for su,rj in qP.iterateElements(ss)do local sv=su;if su==qP.UseParentKey then sv=qn.hostKey end;if qn.children[su]==nil then local qx=sl(rj,qu,sv,qn.context,qn.legacyContext)if qx~=nil then qx.depth=qn.depth+1;qx.parent=qn;qn.children[su]=qx end end end end;local function sw(qn,qu,ss)sr(qn,qu,ss)end;local function sx(qn,qu,qw)if pS.of(qw)==pS.Element or qw==nil or typeof(qw)=="boolean"then sr(qn,qu,qw)else error(("%s\n%s"):format("Component returned invalid children:",qn.currentElement.source or"<enable element tracebacks>"),0)end end;function sn(qn)if pT.internalTypeChecks then q6(pS.of(qn)==pS.VirtualNode,"Expected arg #1 to be of type VirtualNode")end;local nl=qL.of(qn.currentElement)if nl==qL.Host then sk.unmountHostNode(qo,qn)elseif nl==qL.Function then for ev,qx in pairs(qn.children)do sn(qx)end elseif nl==qL.Stateful then qn.instance:__unmount()elseif nl==qL.Portal then for ev,qx in pairs(qn.children)do sn(qx)end elseif nl==qL.Fragment then for ev,qx in pairs(qn.children)do sn(qx)end else error(("Unknown ElementKind %q"):format(tostring(nl)),2)end end;local function sy(qn,rj)local be=rj.component(rj.props)sx(qn,qn.hostParent,be)return qn end;local function sz(qn,rj)local sA=qn.currentElement;local sB=sA.props.target;local sC=rj.props.target;assert(sk.isHostObject(sC),"Expected target to be host object")if sC~=sB then return so(qn,rj)end;local be=rj.props[ro]sw(qn,sC,be)return qn end;local function sD(qn,rj)sw(qn,qn.hostParent,rj.elements)return qn end;function sm(qn,rj,ex)if pT.internalTypeChecks then q6(pS.of(qn)==pS.VirtualNode,"Expected arg #1 to be of type VirtualNode")end;if pT.typeChecks then assert(pS.of(rj)==pS.Element or typeof(rj)=="boolean"or rj==nil,"Expected arg #2 to be of type Element, boolean, or nil")end;if qn.currentElement==rj and ex==nil then return qn end;if typeof(rj)=="boolean"or rj==nil then sn(qn)return nil end;if qn.currentElement.component~=rj.component then return so(qn,rj)end;local nl=qL.of(rj)local sE=true;if nl==qL.Host then qn=sk.updateHostNode(qo,qn,rj)elseif nl==qL.Function then qn=sy(qn,rj)elseif nl==qL.Stateful then sE=qn.instance:__update(rj,ex)elseif nl==qL.Portal then qn=sz(qn,rj)elseif nl==qL.Fragment then qn=sD(qn,rj)else error(("Unknown ElementKind %q"):format(tostring(nl)),2)end;if not sE then return qn end;qn.currentElement=rj;return qn end;local function sF(rS,qu,qV,qp,sG)if pT.internalTypeChecks then q6(sk.isHostObject(qu)or qu==nil,"Expected arg #2 to be a host object")q6(typeof(qp)=="table"or qp==nil,"Expected arg #4 to be of type table or nil")q6(typeof(sG)=="table"or sG==nil,"Expected arg #5 to be of type table or nil")end;if pT.typeChecks then assert(qV~=nil,"Expected arg #3 to be non-nil")assert(pS.of(rS)==pS.Element or typeof(rS)=="boolean","Expected arg #1 to be of type Element or boolean")end;return{[pS]=pS.VirtualNode,currentElement=rS,depth=1,parent=nil,children={},hostParent=qu,hostKey=qV,legacyContext=sG,parentLegacyContext=sG,context=qp or{},originalContext=nil}end;local function sH(qn)local rS=qn.currentElement;local be=rS.component(rS.props)sx(qn,qn.hostParent,be)end;local function sI(qn)local rS=qn.currentElement;local sC=rS.props.target;local be=rS.props[ro]assert(sk.isHostObject(sC),"Expected target to be host object")sw(qn,sC,be)end;local function sJ(qn)local rS=qn.currentElement;local be=rS.elements;sw(qn,qn.hostParent,be)end;function sl(rS,qu,qV,qp,sG)if pT.internalTypeChecks then q6(sk.isHostObject(qu)or qu==nil,"Expected arg #2 to be a host object")q6(typeof(sG)=="table"or sG==nil,"Expected arg #5 to be of type table or nil")end;if pT.typeChecks then assert(qV~=nil,"Expected arg #3 to be non-nil")assert(pS.of(rS)==pS.Element or typeof(rS)=="boolean","Expected arg #1 to be of type Element or boolean")end;if typeof(rS)=="boolean"then return nil end;local nl=qL.of(rS)local qn=sF(rS,qu,qV,qp,sG)if nl==qL.Host then sk.mountHostNode(qo,qn)elseif nl==qL.Function then sH(qn)elseif nl==qL.Stateful then rS.component:__mount(qo,qn)elseif nl==qL.Portal then sI(qn)elseif nl==qL.Fragment then sJ(qn)else error(("Unknown ElementKind %q"):format(tostring(nl)),2)end;return qn end;local function sK(rS,qu,qV)if pT.typeChecks then assert(pS.of(rS)==pS.Element,"Expected arg #1 to be of type Element")assert(sk.isHostObject(qu)or qu==nil,"Expected arg #2 to be a host object")end;if qV==nil then qV="RoactTree"end;local sL={[pS]=pS.VirtualTree,[q8]={rootNode=nil,mounted=true}}sL[q8].rootNode=sl(rS,qu,qV)return sL end;local function sM(sL)local qf=sL[q8]if pT.typeChecks then assert(pS.of(sL)==pS.VirtualTree,"Expected arg #1 to be a Roact handle")assert(qf.mounted,"Cannot unmounted a Roact tree that has already been unmounted")end;qf.mounted=false;if qf.rootNode~=nil then sn(qf.rootNode)end end;local function sN(sL,rj)local qf=sL[q8]if pT.typeChecks then assert(pS.of(sL)==pS.VirtualTree,"Expected arg #1 to be a Roact handle")assert(pS.of(rj)==pS.Element,"Expected arg #2 to be a Roact Element")end;qf.rootNode=sm(qf.rootNode,rj)return sL end;local function sO(qn)local sP=qn.parent;while sP do if sP.eventManager~=nil then sP.eventManager:suspend()end;sP=sP.parent end end;local function sQ(qn)local sP=qn.parent;while sP do if sP.eventManager~=nil then sP.eventManager:resume()end;sP=sP.parent end end;qo={mountVirtualTree=sK,unmountVirtualTree=sM,updateVirtualTree=sN,createVirtualNode=sF,mountVirtualNode=sl,unmountVirtualNode=sn,updateVirtualNode=sm,updateVirtualNodeWithChildren=sw,updateVirtualNodeWithRenderResult=sx,suspendParentEvents=sO,resumeParentEvents=sQ}return qo end;return pJ end,newEnv("Orca.include.node_modules.roact.src.createReconciler"))()end)newModule("createReconcilerCompat","ModuleScript","Orca.include.node_modules.roact.src.createReconcilerCompat","Orca.include.node_modules.roact.src",function()return setfenv(function()local rc=require(script.Parent.Logging)local sR=[[
Roact.reify has been renamed to Roact.mount and will be removed in a future release.
Check the call to Roact.reify at:
]]local sS=[[
Roact.teardown has been renamed to Roact.unmount and will be removed in a future release.
Check the call to Roact.teardown at:
]]local sT=[[
Roact.reconcile has been renamed to Roact.update and will be removed in a future release.
Check the call to Roact.reconcile at:
]]local function pK(qo)local sU={}function sU.reify(...)rc.warnOnce(sR)return qo.mountVirtualTree(...)end;function sU.teardown(...)rc.warnOnce(sS)return qo.unmountVirtualTree(...)end;function sU.reconcile(...)rc.warnOnce(sT)return qo.updateVirtualTree(...)end;return sU end;return pK end,newEnv("Orca.include.node_modules.roact.src.createReconcilerCompat"))()end)newModule("createRef","ModuleScript","Orca.include.node_modules.roact.src.createRef","Orca.include.node_modules.roact.src",function()return setfenv(function()local pN=require(script.Parent.Binding)local function sV()local cC,ev=pN.create(nil)local db={}setmetatable(db,{__index=function(self,ej)if ej=="current"then return cC:getValue()else return cC[ej]end end,__newindex=function(self,ej,d3)if ej=="current"then error("Cannot assign to the 'current' property of refs",2)end;cC[ej]=d3 end,__tostring=function(self)return("RoactRef(%s)"):format(tostring(cC:getValue()))end})return db end;return sV end,newEnv("Orca.include.node_modules.roact.src.createRef"))()end)newModule("createSignal","ModuleScript","Orca.include.node_modules.roact.src.createSignal","Orca.include.node_modules.roact.src",function()return setfenv(function()local function pQ()local sW={}local sX={}local sY=false;local function sZ(self,da)assert(typeof(da)=="function","Can only subscribe to signals with a function.")local nD={callback=da,disconnected=false}if sY and not sW[da]then sX[da]=nD end;sW[da]=nD;local function oy()assert(not nD.disconnected,"Listeners can only be disconnected once.")nD.disconnected=true;sW[da]=nil;sX[da]=nil end;return oy end;local function s_(self,...)sY=true;for da,nD in pairs(sW)do if not nD.disconnected and not sX[da]then da(...)end end;sY=false;for da,ev in pairs(sX)do sX[da]=nil end end;return{subscribe=sZ,fire=s_}end;return pQ end,newEnv("Orca.include.node_modules.roact.src.createSignal"))()end)newModule("createSpy","ModuleScript","Orca.include.node_modules.roact.src.createSpy","Orca.include.node_modules.roact.src",function()return setfenv(function()local s5=require(script.Parent.assertDeepEqual)local function t0(t1)local self={callCount=0,values={},valuesLength=0}self.value=function(...)self.callCount=self.callCount+1;self.values={...}self.valuesLength=select("#",...)if t1~=nil then return t1(...)end end;self.assertCalledWith=function(ev,...)local t2=select("#",...)if self.valuesLength~=t2 then error(("Expected %d arguments, but was called with %d arguments"):format(self.valuesLength,t2),2)end;for k2=1,t2 do local t3=select(k2,...)assert(self.values[k2]==t3,"value differs")end end;self.assertCalledWithDeepEqual=function(ev,...)local t2=select("#",...)if self.valuesLength~=t2 then error(("Expected %d arguments, but was called with %d arguments"):format(self.valuesLength,t2),2)end;for k2=1,t2 do local t3=select(k2,...)s5(self.values[k2],t3)end end;self.captureValues=function(ev,...)local t2=select("#",...)local dx={}assert(self.valuesLength==t2,"length of expected values differs from stored values")for k2=1,t2 do local ej=select(k2,...)dx[ej]=self.values[k2]end;return dx end;setmetatable(self,{__index=function(ev,ej)error(("%q is not a valid member of spy"):format(ej))end})return self end;return t0 end,newEnv("Orca.include.node_modules.roact.src.createSpy"))()end)newModule("forwardRef","ModuleScript","Orca.include.node_modules.roact.src.forwardRef","Orca.include.node_modules.roact.src",function()return setfenv(function()local q3=require(script.Parent.assign)local rh=require(script.Parent.None)local rs=require(script.Parent.PropMarkers.Ref)local pT=require(script.Parent.GlobalConfig).get()local t4={[rs]=rh}local function t5(iq)if pT.typeChecks then assert(typeof(iq)=="function","Expected arg #1 to be a function")end;return function(l2)local db=l2[rs]local t6=q3({},l2,t4)return iq(t6,db)end end;return t5 end,newEnv("Orca.include.node_modules.roact.src.forwardRef"))()end)newModule("getDefaultInstanceProperty","ModuleScript","Orca.include.node_modules.roact.src.getDefaultInstanceProperty","Orca.include.node_modules.roact.src",function()return setfenv(function()local pR=require(script.Parent.Symbol)local t7=pR.named("Nil")local t8={}local function rv(pt,rm)local t9=t8[pt]if t9 then local ta=t9[rm]if ta==t7 then return true,nil end;if ta~=nil then return true,ta end else t9={}t8[pt]=t9 end;local tb=Instance.new(pt)local nx,iM=pcall(function()return tb[rm]end)tb:Destroy()if nx then if iM==nil then t9[rm]=t7 else t9[rm]=iM end end;return nx,iM end;return rv end,newEnv("Orca.include.node_modules.roact.src.getDefaultInstanceProperty"))()end)newModule("internalAssert","ModuleScript","Orca.include.node_modules.roact.src.internalAssert","Orca.include.node_modules.roact.src",function()return setfenv(function()local function q6(tc,oq)if not tc then error(oq.." (This is probably a bug in Roact!)",3)end end;return q6 end,newEnv("Orca.include.node_modules.roact.src.internalAssert"))()end)newModule("invalidSetStateMessages","ModuleScript","Orca.include.node_modules.roact.src.invalidSetStateMessages","Orca.include.node_modules.roact.src",function()return setfenv(function()local q4=require(script.Parent.ComponentLifecyclePhase)local q5={}q5[q4.WillUpdate]=[[
setState cannot be used in the willUpdate lifecycle method.
Consider using the didUpdate method instead, or using getDerivedStateFromProps.

Check the definition of willUpdate in the component %q.]]q5[q4.WillUnmount]=[[
setState cannot be used in the willUnmount lifecycle method.
A component that is being unmounted cannot be updated!

Check the definition of willUnmount in the component %q.]]q5[q4.ShouldUpdate]=[[
setState cannot be used in the shouldUpdate lifecycle method.
shouldUpdate must be a pure function that only depends on props and state.

Check the definition of shouldUpdate in the component %q.]]q5[q4.Render]=[[
setState cannot be used in the render method.
render must be a pure function that only depends on props and state.

Check the definition of render in the component %q.]]q5["default"]=[[
setState can not be used in the current situation, because Roact doesn't know
which part of the lifecycle this component is in.

This is a bug in Roact.
It was triggered by the component %q.
]]return q5 end,newEnv("Orca.include.node_modules.roact.src.invalidSetStateMessages"))()end)newModule("oneChild","ModuleScript","Orca.include.node_modules.roact.src.oneChild","Orca.include.node_modules.roact.src",function()return setfenv(function()local function td(be)if not be then return nil end;local ej,fo=next(be)if not fo then return nil end;local te=next(be,ej)if te then error("Expected at most child, had more than one child.",2)end;return fo end;return td end,newEnv("Orca.include.node_modules.roact.src.oneChild"))()end)newModule("strict","ModuleScript","Orca.include.node_modules.roact.src.strict","Orca.include.node_modules.roact.src",function()return setfenv(function()local function pM(ek,hv)hv=hv or tostring(ek)return setmetatable(ek,{__index=function(self,ej)local oq=("%q (%s) is not a valid member of %s"):format(tostring(ej),typeof(ej),hv)error(oq,2)end,__newindex=function(self,ej,d3)local oq=("%q (%s) is not a valid member of %s"):format(tostring(ej),typeof(ej),hv)error(oq,2)end})end;return pM end,newEnv("Orca.include.node_modules.roact.src.strict"))()end)newInstance("roact-hooked","Folder","Orca.include.node_modules.roact-hooked","Orca.include.node_modules")newModule("out","ModuleScript","Orca.include.node_modules.roact-hooked.out","Orca.include.node_modules.roact-hooked",function()return setfenv(function()local a=_G[script]local g={}local tf=a.import(script,script,"with-hooks")local tg=tf.withHooks;local th=tf.withHooksPure;for J,K in pairs(a.import(script,script,"hooks"))do g[J]=K end;local function i(ti)return tg(ti)end;local function l5(ti)return th(ti)end;g.hooked=i;g.pure=l5;return g end,newEnv("Orca.include.node_modules.roact-hooked.out"))()end)newModule("hooks","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks","Orca.include.node_modules.roact-hooked.out",function()return setfenv(function()local a=_G[script]local g={}g.useBinding=a.import(script,script,"use-binding").useBinding;g.useCallback=a.import(script,script,"use-callback").useCallback;g.useContext=a.import(script,script,"use-context").useContext;g.useEffect=a.import(script,script,"use-effect").useEffect;g.useMemo=a.import(script,script,"use-memo").useMemo;g.useReducer=a.import(script,script,"use-reducer").useReducer;g.useState=a.import(script,script,"use-state").useState;g.useMutable=a.import(script,script,"use-mutable").useMutable;g.useRef=a.import(script,script,"use-ref").useRef;return g end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks"))()end)newModule("use-binding","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks.use-binding","Orca.include.node_modules.roact-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local cz=a.import(script,a.getModule(script,"@rbxts","roact").src).createBinding;local tj=a.import(script,script.Parent.Parent,"utils","memoized-hook").memoizedHook;local function cc(bG)return tj(function()local tk={cz(bG)}return tk end).state end;return{useBinding=cc}end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks.use-binding"))()end)newModule("use-callback","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks.use-callback","Orca.include.node_modules.roact-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local l=a.import(script,script.Parent,"use-memo").useMemo;local function j(da,di)return l(function()return da end,di)end;return{useCallback=j}end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks.use-callback"))()end)newModule("use-context","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks.use-context","Orca.include.node_modules.roact-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local tl=a.import(script,script.Parent.Parent,"utils","memoized-hook")local tj=tl.memoizedHook;local tm=tl.resolveCurrentComponent;local k=a.import(script,script.Parent,"use-effect").useEffect;local aK=a.import(script,script.Parent,"use-state").useState;local function tn(qO)return setmetatable({},{__index=qO})end;local function ee(qp)local to=qp;local Z=tj(function()local oj=tn(tm())to.Consumer.init(oj)return oj.contextEntry end)local tp=Z.state;if tp then local dv=aK(tp.value)local d3=dv[1]local m3=dv[2]k(function()return tp.onUpdate:subscribe(m3)end,{})return d3 else return to.defaultValue end end;return{useContext=ee}end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks.use-context"))()end)newModule("use-effect","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks.use-effect","Orca.include.node_modules.roact-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local tq=a.import(script,script.Parent.Parent,"utils","are-deps-equal").areDepsEqual;local tl=a.import(script,script.Parent.Parent,"utils","memoized-hook")local tj=tl.memoizedHook;local tm=tl.resolveCurrentComponent;local function tr(eq)local Z=tm()local ts=Z.effects;if ts.tail==nil then ts.tail=eq;ts.head=ts.tail else local aA=ts.tail;aA.next=eq;ts.tail=aA.next end;return eq end;local function k(da,di)local tt=tj(nil)local tu=tt.state;if tu~=nil then tu=tu.deps end;local tv=tu;if di and tq(di,tv)then return nil end;tt.state=tr({id=tt.id,callback=da,deps=di})end;return{useEffect=k}end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks.use-effect"))()end)newModule("use-memo","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks.use-memo","Orca.include.node_modules.roact-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local tq=a.import(script,script.Parent.Parent,"utils","are-deps-equal").areDepsEqual;local tj=a.import(script,script.Parent.Parent,"utils","memoized-hook").memoizedHook;local function l(tw,di)local tt=tj(function()return{}end)local Z=tt.state;local tx=Z[1]local tv=Z[2]if tx~=nil and(di and tq(di,tv))then return tx end;local ty=tw()tt.state={ty,di}return ty end;return{useMemo=l}end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks.use-memo"))()end)newModule("use-mutable","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks.use-mutable","Orca.include.node_modules.roact-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local tj=a.import(script,script.Parent.Parent,"utils","memoized-hook").memoizedHook;local function m(bG)return tj(function()return{current=bG}end).state end;return{useMutable=m}end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks.use-mutable"))()end)newModule("use-reducer","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks.use-reducer","Orca.include.node_modules.roact-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local tl=a.import(script,script.Parent.Parent,"utils","memoized-hook")local tj=tl.memoizedHook;local tm=tl.resolveCurrentComponent;local function dn(dt,tz,tA)local tB=tm()local tt=tj(function()local b3;if tA then b3=tA(tz)else b3=tz end;return b3 end)local function aZ(aU)local tC=dt(tt.state,aU)if tt.state~=tC then tB:setHookState(tt.id,function()tt.state=tC;return tt.state end)end end;return{tt.state,aZ}end;return{useReducer=dn}end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks.use-reducer"))()end)newModule("use-ref","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks.use-ref","Orca.include.node_modules.roact-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local sV=a.import(script,a.getModule(script,"@rbxts","roact").src).createRef;local tj=a.import(script,script.Parent.Parent,"utils","memoized-hook").memoizedHook;local function tD()return tj(function()return sV()end).state end;return{useRef=tD}end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks.use-ref"))()end)newModule("use-state","ModuleScript","Orca.include.node_modules.roact-hooked.out.hooks.use-state","Orca.include.node_modules.roact-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local dn=a.import(script,script.Parent,"use-reducer").useReducer;local function aK(dB)local Z=dn(function(F,aU)local b3;if type(aU)=="function"then b3=aU(F)else b3=aU end;return b3 end,nil,function()local b3;if type(dB)=="function"then b3=dB()else b3=dB end;return b3 end)local F=Z[1]local aZ=Z[2]return{F,aZ}end;return{useState=aK}end,newEnv("Orca.include.node_modules.roact-hooked.out.hooks.use-state"))()end)newModule("types","ModuleScript","Orca.include.node_modules.roact-hooked.out.types","Orca.include.node_modules.roact-hooked.out",function()return setfenv(function()return nil end,newEnv("Orca.include.node_modules.roact-hooked.out.types"))()end)newInstance("utils","Folder","Orca.include.node_modules.roact-hooked.out.utils","Orca.include.node_modules.roact-hooked.out")newModule("are-deps-equal","ModuleScript","Orca.include.node_modules.roact-hooked.out.utils.are-deps-equal","Orca.include.node_modules.roact-hooked.out.utils",function()return setfenv(function()local function tq(tE,tv)if tv==nil then return false end;if#tE~=#tv then return false end;do local k2=0;local hY=false;while true do if hY then k2=k2+1 else hY=true end;if not(k2<#tE)then break end;if tE[k2+1]==tv[k2+1]then continue;end;return false end end;return true end;return{areDepsEqual=tq}end,newEnv("Orca.include.node_modules.roact-hooked.out.utils.are-deps-equal"))()end)newModule("memoized-hook","ModuleScript","Orca.include.node_modules.roact-hooked.out.utils.memoized-hook","Orca.include.node_modules.roact-hooked.out.utils",function()return setfenv(function()local tF=table.concat({"Invalid hook call. Hooks can only be called inside of the body of a function component.","This is usually the result of conflicting versions of roact-hooked.","See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."},"\n")local tG="Failed to render hook! (Another hooked component is rendering)"local tH="Failed to render hook! (Another hooked component rendered during this one)"local tI;local tJ;local function tK(qO)local y=tJ==nil;assert(y,tG)tJ=qO end;local function tL(qO)local y=tJ==qO;assert(y,tH)tJ=nil;tI=nil end;local function tm()return tJ or error(tF,3)end;local function tj(bG)local tJ=tm()local b3;if tI then b3=tI.next else b3=tJ.firstHook end;local tM=b3;if tM then tI=tM else local b4;if type(bG)=="function"then b4=bG()else b4=bG end;local F=b4;local tN={id=tI and tI.id+1 or 0,state=F,baseState=F}if not tI then tI=tN;tJ.firstHook=tI else tI.next=tN;tI=tI.next end end;return tI end;return{renderReady=tK,renderDone=tL,resolveCurrentComponent=tm,memoizedHook=tj}end,newEnv("Orca.include.node_modules.roact-hooked.out.utils.memoized-hook"))()end)newModule("with-hooks","ModuleScript","Orca.include.node_modules.roact-hooked.out.with-hooks","Orca.include.node_modules.roact-hooked.out",function()return setfenv(function()local a=_G[script]local g={}local tf=a.import(script,script,"with-hooks")g.withHooks=tf.withHooks;g.withHooksPure=tf.withHooksPure;return g end,newEnv("Orca.include.node_modules.roact-hooked.out.with-hooks"))()end)newModule("component-with-hooks","ModuleScript","Orca.include.node_modules.roact-hooked.out.with-hooks.component-with-hooks","Orca.include.node_modules.roact-hooked.out.with-hooks",function()return setfenv(function()local a=_G[script]local tl=a.import(script,script.Parent.Parent,"utils","memoized-hook")local tL=tl.renderDone;local tK=tl.renderReady;local tO;do tO={}function tO:constructor()end;function tO:init()self.effects={}self.effectHandles={}end;function tO:setHookState(d1,dt)self:setState(function(F)return{[d1]=dt(F[d1])}end)end;function tO:render()tK(self)local tP=self.functionComponent;local tQ=self.props;local tR,tS=pcall(tP,tQ)local dx=tR and{success=true,value=tS}or{success=false,error=tS}tL(self)if not dx.success then error("(ComponentWithHooks) "..dx.error)end;return dx.value end;function tO:didMount()self:flushEffects()end;function tO:didUpdate()self:flushEffects()end;function tO:willUnmount()self:unmountEffects()self.effects.head=nil end;function tO:flushEffectsHelper(eq)if not eq then return nil end;local tT=self.effectHandles;local tU=eq.id;local b3=tT[tU]if b3~=nil then b3()end;local at=eq.callback()if at then local tV=self.effectHandles;local tW=eq.id;tV[tW]=at end;self:flushEffectsHelper(eq.next)end;function tO:flushEffects()self:flushEffectsHelper(self.effects.head)self.effects.head=nil;self.effects.tail=nil end;function tO:unmountEffects()local tT=self.effectHandles;local y=function(at)return at()end;for J,K in pairs(tT)do y(K,J,tT)end;table.clear(self.effectHandles)end end;return{ComponentWithHooks=tO}end,newEnv("Orca.include.node_modules.roact-hooked.out.with-hooks.component-with-hooks"))()end)newModule("with-hooks","ModuleScript","Orca.include.node_modules.roact-hooked.out.with-hooks.with-hooks","Orca.include.node_modules.roact-hooked.out.with-hooks",function()return setfenv(function()local a=_G[script]local tO=a.import(script,script.Parent,"component-with-hooks").ComponentWithHooks;local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local function tX(tY)for gX,bM in pairs(tO)do tY[gX]=bM end end;local function tg(ti)local tZ;do tZ=b.Component:extend("ComponentClass")function tZ:init()end;tZ.functionComponent=ti end;tX(tZ)return tZ end;local function th(ti)local tZ;do tZ=b.PureComponent:extend("ComponentClass")function tZ:init()end;tZ.functionComponent=ti end;tX(tZ)return tZ end;return{withHooks=tg,withHooksPure=th}end,newEnv("Orca.include.node_modules.roact-hooked.out.with-hooks.with-hooks"))()end)newInstance("roact-rodux-hooked","Folder","Orca.include.node_modules.roact-rodux-hooked","Orca.include.node_modules")newModule("out","ModuleScript","Orca.include.node_modules.roact-rodux-hooked.out","Orca.include.node_modules.roact-rodux-hooked",function()return setfenv(function()local a=_G[script]local g={}g.Provider=a.import(script,script,"components","provider").Provider;g.useDispatch=a.import(script,script,"hooks","use-dispatch").useDispatch;g.useSelector=a.import(script,script,"hooks","use-selector").useSelector;g.useStore=a.import(script,script,"hooks","use-store").useStore;g.shallowEqual=a.import(script,script,"helpers","shallow-equal").shallowEqual;g.RoactRoduxContext=a.import(script,script,"components","context").RoactRoduxContext;return g end,newEnv("Orca.include.node_modules.roact-rodux-hooked.out"))()end)newInstance("components","Folder","Orca.include.node_modules.roact-rodux-hooked.out.components","Orca.include.node_modules.roact-rodux-hooked.out")newModule("context","ModuleScript","Orca.include.node_modules.roact-rodux-hooked.out.components.context","Orca.include.node_modules.roact-rodux-hooked.out.components",function()return setfenv(function()local a=_G[script]local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local t_=b.createContext(nil)return{RoactRoduxContext=t_}end,newEnv("Orca.include.node_modules.roact-rodux-hooked.out.components.context"))()end)newModule("provider","ModuleScript","Orca.include.node_modules.roact-rodux-hooked.out.components.provider","Orca.include.node_modules.roact-rodux-hooked.out.components",function()return setfenv(function()local a=_G[script]local t_=a.import(script,script.Parent,"context").RoactRoduxContext;local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local i=h.hooked;local l=h.useMemo;local b=a.import(script,a.getModule(script,"@rbxts","roact").src)local am=i(function(C)local eu=C.store;local be=C[b.Children]local u0=l(function()return{store=eu}end,{eu})local u1={value=u0}local u2={}local H=#u2;if be then for J,K in pairs(be)do if type(J)=="number"then u2[H+J]=K else u2[J]=K end end end;return b.createElement(t_.Provider,u1,u2)end)return{Provider=am}end,newEnv("Orca.include.node_modules.roact-rodux-hooked.out.components.provider"))()end)newInstance("helpers","Folder","Orca.include.node_modules.roact-rodux-hooked.out.helpers","Orca.include.node_modules.roact-rodux-hooked.out")newModule("shallow-equal","ModuleScript","Orca.include.node_modules.roact-rodux-hooked.out.helpers.shallow-equal","Orca.include.node_modules.roact-rodux-hooked.out.helpers",function()return setfenv(function()local a=_G[script]local py=a.import(script,a.getModule(script,"@rbxts","object-utils"))local function hA(u3,u4)if u3==u4 then return true end;if not(type(u3)=="table")or not(type(u4)=="table")then return false end;local u5=py.keys(u3)local u6=py.keys(u4)if#u5~=#u6 then return false end;local y=function(d3,c2)return d3==u4[c2]end;local b3=true;for J,K in ipairs(u5)do if not y(K,J-1,u5)then b3=false;break end end;return b3 end;return{shallowEqual=hA}end,newEnv("Orca.include.node_modules.roact-rodux-hooked.out.helpers.shallow-equal"))()end)newInstance("hooks","Folder","Orca.include.node_modules.roact-rodux-hooked.out.hooks","Orca.include.node_modules.roact-rodux-hooked.out")newModule("use-dispatch","ModuleScript","Orca.include.node_modules.roact-rodux-hooked.out.hooks.use-dispatch","Orca.include.node_modules.roact-rodux-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local m=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).useMutable;local cT=a.import(script,script.Parent,"use-store").useStore;local function cR()local eu=cT()return m(function(aU)return eu:dispatch(aU)end).current end;return{useDispatch=cR}end,newEnv("Orca.include.node_modules.roact-rodux-hooked.out.hooks.use-dispatch"))()end)newModule("use-selector","ModuleScript","Orca.include.node_modules.roact-rodux-hooked.out.hooks.use-selector","Orca.include.node_modules.roact-rodux-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local h=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out)local k=h.useEffect;local m=h.useMutable;local dn=h.useReducer;local cT=a.import(script,script.Parent,"use-store").useStore;local function cS(iL,u7)if u7==nil then u7=function(hD,dG)return hD==dG end end;local Z=dn(function(bg)return bg+1 end,0)local u8=Z[2]local eu=cT()local u9=m()local ua=m()local ub=m()local uc=m()local ud=eu:getState()local ue;a.try(function()local uf=iL~=ua.current or ud~=ub.current or u9.current;if uf~=""and uf then local ug=iL(ud)if uc.current==nil or not u7(ug,uc.current)then ue=ug else ue=uc.current end else ue=uc.current end end,function(dw)if u9.current~=nil then dw=dw.."\nThe error may be correlated with this previous error:\n"..u9.current.."\n\n"end;error(dw)end)k(function()ua.current=iL;ub.current=ud;uc.current=ue;u9.current=nil end)k(function()local function uh(ui)local iN,iO=a.try(function()if ui==ub.current then return a.TRY_RETURN,{}end;local ug=ua.current(ui)if u7(ug,uc.current)then return a.TRY_RETURN,{}end;uc.current=ug;ub.current=ui end,function(dw)u9.current=dw end)if iN then return unpack(iO)end;task.spawn(u8)end;local uj=eu.changed:connect(uh)uh(eu:getState())return function()return uj:disconnect()end end,{eu})return ue end;return{useSelector=cS}end,newEnv("Orca.include.node_modules.roact-rodux-hooked.out.hooks.use-selector"))()end)newModule("use-store","ModuleScript","Orca.include.node_modules.roact-rodux-hooked.out.hooks.use-store","Orca.include.node_modules.roact-rodux-hooked.out.hooks",function()return setfenv(function()local a=_G[script]local t_=a.import(script,script.Parent.Parent,"components","context").RoactRoduxContext;local ee=a.import(script,a.getModule(script,"@rbxts","roact-hooked").out).useContext;local function cT()return ee(t_).store end;return{useStore=cT}end,newEnv("Orca.include.node_modules.roact-rodux-hooked.out.hooks.use-store"))()end)newModule("types","ModuleScript","Orca.include.node_modules.roact-rodux-hooked.out.types","Orca.include.node_modules.roact-rodux-hooked.out",function()return setfenv(function()return nil end,newEnv("Orca.include.node_modules.roact-rodux-hooked.out.types"))()end)newInstance("rodux","Folder","Orca.include.node_modules.rodux","Orca.include.node_modules")newModule("src","ModuleScript","Orca.include.node_modules.rodux.src","Orca.include.node_modules.rodux",function()return setfenv(function()local uk=require(script.Store)local ul=require(script.createReducer)local um=require(script.combineReducers)local un=require(script.makeActionCreator)local uo=require(script.loggerMiddleware)local up=require(script.thunkMiddleware)return{Store=uk,createReducer=ul,combineReducers=um,makeActionCreator=un,loggerMiddleware=uo.middleware,thunkMiddleware=up}end,newEnv("Orca.include.node_modules.rodux.src"))()end)newModule("NoYield","ModuleScript","Orca.include.node_modules.rodux.src.NoYield","Orca.include.node_modules.rodux.src",function()return setfenv(function()local function uq(oZ,nx,...)if not nx then local oq=...error(debug.traceback(oZ,oq),2)end;if coroutine.status(oZ)~="dead"then error(debug.traceback(oZ,"Attempted to yield inside changed event!"),2)end;return...end;local function ur(da,...)local oZ=coroutine.create(da)return uq(oZ,coroutine.resume(oZ,...))end;return ur end,newEnv("Orca.include.node_modules.rodux.src.NoYield"))()end)newModule("Signal","ModuleScript","Orca.include.node_modules.rodux.src.Signal","Orca.include.node_modules.rodux.src",function()return setfenv(function()local function us(nQ,...)local ut={}local t2=#nQ;for ej=1,t2 do ut[ej]=nQ[ej]end;for k2=1,select("#",...)do ut[t2+k2]=select(k2,...)end;return ut end;local function uu(nQ,uv)local ut={}for k2=1,#nQ do if nQ[k2]~=uv then table.insert(ut,nQ[k2])end end;return ut end;local p0={}p0.__index=p0;function p0.new(eu)local self={_listeners={},_store=eu}setmetatable(self,p0)return self end;function p0:connect(da)if typeof(da)~="function"then error("Expected the listener to be a function.")end;if self._store and self._store._isDispatching then error('You may not call store.changed:connect() while the reducer is executing. '..'If you would like to be notified after the store has been updated, subscribe from a '..'component and invoke store:getState() in the callback to access the latest state. ')end;local rV={callback=da,disconnected=false,connectTraceback=debug.traceback(),disconnectTraceback=nil}self._listeners=us(self._listeners,rV)local function oy()if rV.disconnected then error(("Listener connected at: \n%s\n".."was already disconnected at: \n%s\n"):format(tostring(rV.connectTraceback),tostring(rV.disconnectTraceback)))end;if self._store and self._store._isDispatching then error("You may not unsubscribe from a store listener while the reducer is executing.")end;rV.disconnected=true;rV.disconnectTraceback=debug.traceback()self._listeners=uu(self._listeners,rV)end;return{disconnect=oy}end;function p0:fire(...)for ev,rV in ipairs(self._listeners)do if not rV.disconnected then rV.callback(...)end end end;return p0 end,newEnv("Orca.include.node_modules.rodux.src.Signal"))()end)newModule("Store","ModuleScript","Orca.include.node_modules.rodux.src.Store","Orca.include.node_modules.rodux.src",function()return setfenv(function()local ez=game:GetService("RunService")local p0=require(script.Parent.Signal)local ur=require(script.Parent.NoYield)local uw=3;local ux={reportReducerError=function(uy,aU,uz)error(string.format("Received error: %s\n\n%s",uz.message,uz.thrownValue))end,reportUpdateError=function(uy,uA,uB,uz)error(string.format("Received error: %s\n\n%s",uz.message,uz.thrownValue))end}local function uC(oq)return debug.traceback(tostring(oq))end;local uk={}uk._flushEvent=ez.Heartbeat;uk.__index=uk;function uk.new(dt,dB,uD,uE)assert(typeof(dt)=="function","Bad argument #1 to Store.new, expected function.")assert(uD==nil or typeof(uD)=="table","Bad argument #3 to Store.new, expected nil or table.")if uD~=nil then for k2=1,#uD,1 do assert(typeof(uD[k2])=="function",("Expected the middleware ('%s') at index %d to be a function."):format(tostring(uD[k2]),k2))end end;local self={}self._errorReporter=uE or ux;self._isDispatching=false;self._reducer=dt;local uF={type="@@INIT"}self._actionLog={uF}local nx,dx=xpcall(function()self._state=dt(dB,uF)end,uC)if not nx then self._errorReporter.reportReducerError(dB,uF,{message="Caught error in reducer with init",thrownValue=dx})self._state=dB end;self._lastState=self._state;self._mutatedSinceFlush=false;self._connections={}self.changed=p0.new(self)setmetatable(self,uk)local nD=self._flushEvent:Connect(function()self:flush()end)table.insert(self._connections,nD)if uD then local uG=self.dispatch;local aZ=function(...)return uG(self,...)end;for k2=#uD,1,-1 do local uH=uD[k2]aZ=uH(aZ,self)end;self.dispatch=function(uI,...)return aZ(...)end end;return self end;function uk:getState()if self._isDispatching then error(("You may not call store:getState() while the reducer is executing. ".."The reducer (%s) has already received the state as an argument. ".."Pass it down from the top reducer instead of reading it from the store."):format(tostring(self._reducer)))end;return self._state end;function uk:dispatch(aU)if typeof(aU)~="table"then error(("Actions must be tables. ".."Use custom middleware for %q actions."):format(typeof(aU)),2)end;if aU.type==nil then error("Actions may not have an undefined 'type' property. ".."Have you misspelled a constant? \n"..tostring(aU),2)end;if self._isDispatching then error("Reducers may not dispatch actions.")end;local nx,dx=pcall(function()self._isDispatching=true;self._state=self._reducer(self._state,aU)self._mutatedSinceFlush=true end)self._isDispatching=false;if not nx then self._errorReporter.reportReducerError(self._state,aU,{message="Caught error in reducer",thrownValue=dx})end;if#self._actionLog==uw then table.remove(self._actionLog,1)end;table.insert(self._actionLog,aU)end;function uk:destruct()for ev,nD in ipairs(self._connections)do nD:Disconnect()end;self._connections=nil end;function uk:flush()if not self._mutatedSinceFlush then return end;self._mutatedSinceFlush=false;local F=self._state;local nx,uz=xpcall(function()ur(function()self.changed:fire(F,self._lastState)end)end,uC)if not nx then self._errorReporter.reportUpdateError(self._lastState,F,self._actionLog,{message="Caught error flushing store updates",thrownValue=uz})end;self._lastState=F end;return uk end,newEnv("Orca.include.node_modules.rodux.src.Store"))()end)newModule("combineReducers","ModuleScript","Orca.include.node_modules.rodux.src.combineReducers","Orca.include.node_modules.rodux.src",function()return setfenv(function()local function um(q)return function(F,aU)if F==nil then F={}end;local ex={}for ej,dt in pairs(q)do ex[ej]=dt(F[ej],aU)end;return ex end end;return um end,newEnv("Orca.include.node_modules.rodux.src.combineReducers"))()end)newModule("createReducer","ModuleScript","Orca.include.node_modules.rodux.src.createReducer","Orca.include.node_modules.rodux.src",function()return setfenv(function()return function(dB,uJ)return function(F,aU)if F==nil then F=dB end;local p3=uJ[aU.type]if p3 then return p3(F,aU)end;return F end end end,newEnv("Orca.include.node_modules.rodux.src.createReducer"))()end)newModule("loggerMiddleware","ModuleScript","Orca.include.node_modules.rodux.src.loggerMiddleware","Orca.include.node_modules.rodux.src",function()return setfenv(function()local uK=require(script.Parent.prettyPrint)local uo={outputFunction=print}function uo.middleware(uL,eu)return function(aU)local dx=uL(aU)uo.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(uK(aU),uK(eu:getState())))return dx end end;return uo end,newEnv("Orca.include.node_modules.rodux.src.loggerMiddleware"))()end)newModule("makeActionCreator","ModuleScript","Orca.include.node_modules.rodux.src.makeActionCreator","Orca.include.node_modules.rodux.src",function()return setfenv(function()local function un(hv,kj)assert(type(hv)=="string","Bad argument #1: Expected a string name for the action creator")assert(type(kj)=="function","Bad argument #2: Expected a function that creates action objects")return setmetatable({name=hv},{__call=function(self,...)local dx=kj(...)assert(type(dx)=="table","Invalid action: An action creator must return a table")dx.type=hv;return dx end})end;return un end,newEnv("Orca.include.node_modules.rodux.src.makeActionCreator"))()end)newModule("prettyPrint","ModuleScript","Orca.include.node_modules.rodux.src.prettyPrint","Orca.include.node_modules.rodux.src",function()return setfenv(function()local qZ="    "local function uK(d3,r0)r0=r0 or 0;local uM={}if typeof(d3)=="table"then table.insert(uM,"{\n")for uN,uO in pairs(d3)do table.insert(uM,qZ:rep(r0+1))table.insert(uM,tostring(uN))table.insert(uM," = ")table.insert(uM,uK(uO,r0+1))table.insert(uM,"\n")end;table.insert(uM,qZ:rep(r0))table.insert(uM,"}")elseif typeof(d3)=="string"then table.insert(uM,string.format("%q",d3))table.insert(uM," (string)")else table.insert(uM,tostring(d3))table.insert(uM," (")table.insert(uM,typeof(d3))table.insert(uM,")")end;return table.concat(uM,"")end;return uK end,newEnv("Orca.include.node_modules.rodux.src.prettyPrint"))()end)newModule("thunkMiddleware","ModuleScript","Orca.include.node_modules.rodux.src.thunkMiddleware","Orca.include.node_modules.rodux.src",function()return setfenv(function()local function uC(oq)return debug.traceback(oq)end;local function up(uL,eu)return function(aU)if typeof(aU)=="function"then local nx,dx=xpcall(function()return aU(eu)end,uC)if not nx then eu._errorReporter.reportReducerError(eu:getState(),aU,{message="Caught error in thunk",thrownValue=dx})return nil end;return dx end;return uL(aU)end end;return up end,newEnv("Orca.include.node_modules.rodux.src.thunkMiddleware"))()end)newModule("services","ModuleScript","Orca.include.node_modules.services","Orca.include.node_modules",function()return setfenv(function()return setmetatable({},{__index=function(self,uP)local uQ=game:GetService(uP)self[uP]=uQ;return uQ end})end,newEnv("Orca.include.node_modules.services"))()end)newInstance("types","Folder","Orca.include.node_modules.types","Orca.include.node_modules")newInstance("include","Folder","Orca.include.node_modules.types.include","Orca.include.node_modules.types")newInstance("generated","Folder","Orca.include.node_modules.types.include.generated","Orca.include.node_modules.types.include")

init()
   end,
})

local Button = Clans:CreateButton({
   Name = "c00lgui v2",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/14EU4i8n",true))()
   end,
})

local Backdoor = Window:CreateTab("Backdoor", nil) -- Title, Image

local Button = Backdoor:CreateButton({
   Name = "Luau X SS v3",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gojohdkaisenkt2/Gojohdkaisenkt-/refs/heads/main/L", true))()

   end,
})

local Button = Backdoor:CreateButton({
   Name = "LALOL Hub",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()                                                             
   end,
})