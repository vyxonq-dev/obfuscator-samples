--[[
    ____  __           __  _             _____ __                
   / __ )/ /___ ______/ /_(_)___  ____ _/ ___// /_____  ____  ___
  / __  / / __ `/ ___/ __/ / __ \/ __ `/\__ \/ __/ __ \/ __ \/ _ \
 / /_/ / / /_/ (__  ) /_/ / / / / /_/ /___/ / /_/ /_/ / / / /  __/
/_____/_/\__,_/____/\__/_/_/ /_/\__, //____/\__/\____/_/ /_/\___/
          animation grabber v3 /____/ Made by BlastingStone#8878
]]--

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "anim-grabber v3";
	Text = "Made by BlastingStone (V3rm UID: 464205)";
	Icon = "rbxassetid://7212792656";
	Duration = 20;
	Button1 = "ok";
	Button2 = "idc stfu";
})

-- Console for animation grabbing logs
if not syn then rconsoleclear = function() end; rconsoleprint = function(a) print(a) end; rconsolename = function() end end -- Compatibility line
rconsoleclear()
rconsolename('animation grabber v3 - logs')
rconsoleprint('    ____  __           __  _             _____ __                \n')
rconsoleprint('   / __ )/ /___ ______/ /_(_)___  ____ _/ ___// /_____  ____  ___\n')
rconsoleprint('  / __  / / __ `/ ___/ __/ / __ \\/ __ `/\\__ \\/ __/ __ \\/ __ \\/ _ \\\n')
rconsoleprint(' / /_/ / / /_/ (__  ) /_/ / / / / /_/ /___/ / /_/ /_/ / / / /  __/\n')
rconsoleprint('/_____/_/\\__,_/____/\\__/_/_/ /_/\\__, //____/\\__/\\____/_/ /_/\\___/\n')
rconsoleprint('          animation grabber v3 /____/ Made by BlastingStone#8878\n')
rconsoleprint('------------------------------------------------------------------\n')
rconsoleprint('Hello! This is an animation grabber v3 console.\nIt is the output for animations you will log.\nHow to use the grabber: use an animation on your character (if you are in an emote game, press a button on the emote you need) and click \"grab animation\".\nThe ID, along with the link, will appear in this console or in the GUI. You can either copy it from the grabber by pressing \"copy id / link\" or from console.\nIf a standard Roblox animation appeared instead, try the same steps again until you get the animation you need.\nIf you have any issues with the script, contact me on Discord: BlastingStone#8878\nglhf! :)\n')

-- Below is what lets you steal ported animations
if game.PlaceId == 5771467270 or game.PlaceId == 8221489139 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BlastingStone/MyLuaStuff/master/ttd3bypass.lua"))()
    task.wait()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BlastingStone/MyLuaStuff/master/universal_antisteal_bypass.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BlastingStone/MyLuaStuff/master/universal_antisteal_bypass.lua"))()
end

-- Instances:
local Counter = 0
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local name = Instance.new("TextLabel")
local RainbowLine = Instance.new("Frame")
local GrabAnimID = Instance.new("TextButton")
local Output = Instance.new("TextBox")
local CopyAnimID = Instance.new("TextButton")
local RainbowLine_2 = Instance.new("Frame")
local credits = Instance.new("TextLabel")
local BlastLogo = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")

--Properties:

if syn and syn.secure_gui then
	syn.secure_gui(ScreenGui)
end

local cloneref = cloneref or function(ref)
	return ref
end

local CoreGui

if gethui or gethiddenui then
	CoreGui = (gethui or gethiddenui)()
else
	CoreGui = cloneref(game:GetService("CoreGui"))
end
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Active = true
Main.Draggable = true
Main.Name = "Main"
Main.Parent = ScreenGui
Main.Active = true
Main.BackgroundColor3 = Color3.fromRGB(181, 181, 181)
Main.BorderSizePixel = 2
Main.Draggable = true
Main.Position = UDim2.new(0.75, 1, 0.449999988, 0)
Main.Size = UDim2.new(0, 200, 0, 260)

name.Name = "name"
name.Parent = Main
name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
name.BorderSizePixel = 0
name.Size = UDim2.new(0, 200, 0, 38)
name.Font = Enum.Font.SourceSansItalic
name.Text = "animation grabber v3 beta\nmade by BlastingStone#8878 <3"
name.TextColor3 = Color3.fromRGB()
name.TextSize = 14.000
name.TextWrapped = true

RainbowLine.Name = "RainbowLine"
RainbowLine.Parent = Main
RainbowLine.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
RainbowLine.BorderSizePixel = 0
RainbowLine.Position = UDim2.new(0, 0, 0.146153852, 0)
RainbowLine.Size = UDim2.new(0, 200, 0, 5)

GrabAnimID.Name = "GrabAnimID"
GrabAnimID.Parent = Main
GrabAnimID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GrabAnimID.Position = UDim2.new(0.100000001, 0, 0.375999987, 0)
GrabAnimID.Size = UDim2.new(0, 160, 0, 20)
GrabAnimID.Font = Enum.Font.SourceSans
GrabAnimID.Text = "grab animation"
GrabAnimID.TextColor3 = Color3.fromRGB()
GrabAnimID.TextSize = 14.000

Output.Name = "Output"
Output.Parent = Main
Output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Output.Position = UDim2.new(0.100000001, 0, 0.195999995, 0)
Output.Size = UDim2.new(0, 160, 0, 40)
Output.ClearTextOnFocus = false
Output.Font = Enum.Font.SourceSans
Output.PlaceholderColor3 = Color3.fromRGB(145, 145, 145)
Output.PlaceholderText = "animation id and link will appear here"
Output.Text = ""
Output.TextColor3 = Color3.fromRGB()
Output.TextSize = 14.000
Output.TextWrapped = true

CopyAnimID.Name = "CopyAnimID"
CopyAnimID.Parent = Main
CopyAnimID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CopyAnimID.Position = UDim2.new(0.100000001, 0, 0.476000011, 0)
CopyAnimID.Size = UDim2.new(0, 160, 0, 20)
CopyAnimID.Font = Enum.Font.SourceSans
CopyAnimID.Text = "copy animation id / link"
CopyAnimID.TextColor3 = Color3.fromRGB()
CopyAnimID.TextSize = 14.000

RainbowLine_2.Name = "RainbowLine"
RainbowLine_2.Parent = Main
RainbowLine_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
RainbowLine_2.BorderSizePixel = 0
RainbowLine_2.Position = UDim2.new(0, 0, 0.846000016, 0)
RainbowLine_2.Size = UDim2.new(0, 200, 0, 5)

credits.Name = "credits"
credits.Parent = Main
credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
credits.BorderSizePixel = 0
credits.Position = UDim2.new(0, 0, 0.86153847, 0)
credits.Size = UDim2.new(0, 200, 0, 36)
credits.Font = Enum.Font.SourceSansItalic
credits.Text = "special thanks to w a e for helping with universal bypass // press ' to hide ui"
credits.TextColor3 = Color3.fromRGB()
credits.TextSize = 14.000
credits.TextWrapped = true

BlastLogo.Name = "BlastLogo"
BlastLogo.Parent = Main
BlastLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BlastLogo.BackgroundTransparency = 1.000
BlastLogo.Position = UDim2.new(0.100000001, 0, 0.606000006, 0)
BlastLogo.Size = UDim2.new(0, 160, 0, 30)
BlastLogo.Image = "rbxassetid://7212793884"

TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.200000003, 0, 0.69599998, 0)
TextLabel.Size = UDim2.new(0, 140, 0, 20)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.Text = "developed on 09/25/2021"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.700

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 84, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 0))}
UIGradient.Parent = TextLabel

ScreenGui.Parent = CoreGui

-- Scripts:

local function FRLGUVN_fake_script() -- RainbowLine.Script 
	local script = Instance.new('LocalScript', RainbowLine)

	local RunService = game:GetService("RunService")
	local Target = script.Parent

	local Z = .25

	local Colors = {
		Color3.new(1, Z, Z), -- Red
		Color3.new(1, 1, Z), -- Yellow
		Color3.new(Z, 1, Z), -- Green
		Color3.new(Z, 1, 1), -- Cyan
		Color3.new(Z, Z, 1), -- Blue
		Color3.new(1, Z, 1), -- Magenta
	}

	RunService.RenderStepped:Connect(function()
		local tick = os.clock()
		local CurrentColor = Colors[math.floor((tick % #Colors) + 1)]
		local NextColor = Colors[math.floor(((tick + 1) % #Colors) + 1)]
		local ColorPercent = (tick % 1)
		Target.BackgroundColor3 = Color3.new(
			(CurrentColor.R + (NextColor.R - CurrentColor.R) * ColorPercent),
			(CurrentColor.G + (NextColor.G - CurrentColor.G) * ColorPercent),
			(CurrentColor.B + (NextColor.B - CurrentColor.B) * ColorPercent)
		)
	end)
end
coroutine.wrap(FRLGUVN_fake_script)()
local function HVCBZGX_fake_script() -- RainbowLine_2.Script 
	local script = Instance.new('LocalScript', RainbowLine_2)

	local RunService = game:GetService("RunService")
	local Target = script.Parent

	local Z = .25

	local Colors = {
		Color3.new(1, Z, Z), -- Red
		Color3.new(1, 1, Z), -- Yellow
		Color3.new(Z, 1, Z), -- Green
		Color3.new(Z, 1, 1), -- Cyan
		Color3.new(Z, Z, 1), -- Blue
		Color3.new(1, Z, 1), -- Magenta
	}

	RunService.RenderStepped:Connect(function()
		local tick = os.clock()
		local CurrentColor = Colors[math.floor((tick % #Colors) + 1)]
		local NextColor = Colors[math.floor(((tick + 1) % #Colors) + 1)]
		local ColorPercent = (tick % 1)
		Target.BackgroundColor3 = Color3.new(
			(CurrentColor.R + (NextColor.R - CurrentColor.R) * ColorPercent),
			(CurrentColor.G + (NextColor.G - CurrentColor.G) * ColorPercent),
			(CurrentColor.B + (NextColor.B - CurrentColor.B) * ColorPercent)
		)
	end)
end
coroutine.wrap(HVCBZGX_fake_script)()

local LocalPlayer = game:GetService("Players").LocalPlayer

local function msg(label, text, default, duration)
	label.Text = text
	task.wait(duration or 0)
	label.Text = default
end

GrabAnimID.MouseButton1Down:Connect(function()
	local Character = LocalPlayer.Character
	if Character then
		local Humanoid = Character:FindFirstChildOfClass('Humanoid')
		if Humanoid then
			for Index, AnimTrack in ipairs(Humanoid:WaitForChild("Animator"):GetPlayingAnimationTracks()) do
				Counter = Counter + 1
				rconsoleprint('Animation #'..Counter..': https://roblox.com/library/'..string.match(AnimTrack.Animation.AnimationId, "%d+")..'\n')
				Output.Text = "https://roblox.com/library/"..string.match(AnimTrack.Animation.AnimationId, "%d+")
			end
		else
			msg(GrabAnimID, "no humanoid found!", "grab animation", 1)
		end
	else
		msg(GrabAnimID, "no character found!", "grab animation", 1)
	end
	msg(GrabAnimID, "grabbed!", "grab animation", 1.5)
end)

CopyAnimID.MouseButton1Down:Connect(function()
	setclipboard(Output.Text)
	msg(CopyAnimID, "copied!", "copy animation id / link", 1.5)
end)
