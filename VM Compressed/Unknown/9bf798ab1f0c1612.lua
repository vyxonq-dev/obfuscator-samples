print("skidding")
wait(2)

game.StarterGui:SetCore("DevConsoleVisible", true)
wait(2)
print("skidding")
wait(2)
print("Loading skid Library")
wait(5)
print("Orion Library Successfully Execute")
wait(2)
print("Loading skid gui v5.40")
wait(3)
print("Downloading...")
wait(3)
print("[10%_________]")
wait(1)
print("[#20%________]")
wait(1)
print("[##30%_______]")
wait(1)
print("[###40%______]")
wait(1)
print("[####50%_____]")
wait(1)
print("[#####60%____]")
wait(1)
print("[######70%___]")
wait(1)
print("[#######80%__]")
wait(1)
print("[########90%_]")
wait(3)
print("[##########100%]")
wait(2)
print("Downloading Complete")
wait(1)
print("Loading skid gui v5.40")
wait(5)
print("successful load skid Gui")
wait(1.10)
print("some scripts will not work")
print("By Skid")
wait (2)
game.StarterGui:SetCore("DevConsoleVisible", false)


local player =
game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "skid Gui v5.40", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <75027801535235> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]
local Tab = Window:MakeTab({
	Name = "Executors",
	Icon = "rbxassetid://7256706293",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
	Name = "executors"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddButton({
	Name = "skibidi polp",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-stigma-ultimate-29802"))()
  	end    
})

Tab:AddButton({
	Name = "Elysian",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-elysian-25258"))()
  	end    
})

Tab:AddButton({
	Name = "Elysian V2",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Elysian-V2-24978"))()
  	end    
})

Tab:AddButton({
	Name = "Project lua",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Project-Lua-Inspired-by-Project-Ligma-26224"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Dominator Executor",
	Callback = function()
      		local gui = Instance.new("ScreenGui")
gui.Name = "support mobile"
gui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.7, 0, 0.9, 69)
Frame.Position = UDim2.new(0.1, 0, 0.0, 0)
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.BackgroundTransparency = 0
Frame.Draggable = true
Frame.Parent = gui

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Size = UDim2.new(0.9, 53, 0.9, 36)
ImageLabel.Position = UDim2.new(0.0, 0, 0.0, 0)
ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
ImageLabel.Image = "rbxassetid://70496556629822"
ImageLabel.ImageTransparency = 0
ImageLabel.Parent = Frame

ImageLabel.BackgroundTransparency = 1

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.7, 29, 0.5, 19)
TextBox.Position = UDim2.new(0.0, 23, 0.1, 15)
TextBox.BackgroundColor3 = Color3.new(0, 0, 0)
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(0, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 15
TextBox.Parent = Frame
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = failed
TextBox.MultiLine = true
TextBox.TextWrapped = true

local Output = Instance.new("TextBox")
Output.Size = UDim2.new(0.5, 31, 0.2, 16)
Output.Position = UDim2.new(0.2, 19, 0.7, 5)
Output.BackgroundColor3 = Color3.new(0, 0, 0)
Output.BorderColor3 = Color3.new(0, 0, 0)
Output.BorderSizePixel = 0
Output.Text = "[IDE]: Hello Hackerman, Usename"
Output.TextColor3 = Color3.new(0, 0, 0)
Output.BackgroundTransparency = 1
Output.Font = Enum.Font.Code
Output.TextSize = 15
Output.Parent = Frame
Output.TextYAlignment = Enum.TextYAlignment.Top
Output.TextXAlignment = Enum.TextXAlignment.Left
Output.ClearTextOnFocus = failed
Output.MultiLine = true
Output.TextWrapped = true

local exe = Instance.new("TextButton")
exe.Size = UDim2.new(0.2, 4, 0.0, 22)
exe.Position = UDim2.new(0.0, 8, 0.7, 5)
exe.BackgroundColor3 = Color3.new(0, 0, 0)
exe.BorderColor3 = Color3.new(0, 0, 0)
exe.BorderSizePixel = 0
exe.Text = ""
exe.BackgroundTransparency = 1
exe.TextColor3 = Color3.new(255, 255, 255)
exe.Font = Enum.Font.Code
exe.Parent = Frame
exe.MouseButton1Click:Connect(function()
assert(loadstring(TextBox.Text))()
end)

local clea = Instance.new("TextButton")
clea.Size = UDim2.new(0.2, 4, 0.0, 22)
clea.Position = UDim2.new(0.0, 8, 0.8, 0)
clea.BackgroundColor3 = Color3.new(0, 0, 0)
clea.BorderColor3 = Color3.new(0, 0, 0)
clea.BorderSizePixel = 0
clea.Text = ""
clea.BackgroundTransparency = 1
clea.TextColor3 = Color3.new(255, 255, 255)
clea.Font = Enum.Font.Code
clea.Parent = Frame
clea.MouseButton1Click:Connect(function()
TextBox.Text = ""
end)

local Fileide = Instance.new("TextButton")
Fileide.Size = UDim2.new(0.2, 4, 0.0, 22)
Fileide.Position = UDim2.new(0.0, 8, 0.8, 28)
Fileide.BackgroundColor3 = Color3.new(0, 0, 0)
Fileide.BorderColor3 = Color3.new(0, 0, 0)
Fileide.BorderSizePixel = 0
Fileide.Text = ""
Fileide.BackgroundTransparency = 1
Fileide.TextColor3 = Color3.new(255, 255, 255)
Fileide.Font = Enum.Font.Code
Fileide.Parent = Frame
Fileide.MouseButton1Click:Connect(function()

local gui = Instance.new("ScreenGui")
gui.Name = "file"
gui.Parent = game.CoreGui

local file = Instance.new("Frame")
file.Size = UDim2.new(0.7, 0, 0.9, 59)
file.Position = UDim2.new(0.2, 0, 0.0, 0)
file.BackgroundColor3 = Color3.new(1, 1, 1)
file.BorderColor3 = Color3.new(0, 0, 0)
file.BorderSizePixel = 0
file.Active = true
file.BackgroundTransparency = 1
file.Draggable = true
file.Parent = gui

local file1 = Instance.new("ImageLabel")
file1.Size = UDim2.new(0.9, 53, 0.9, 35)
file1.Position = UDim2.new(0.0, 0, 0.0, 0)
file1.BackgroundColor3 = Color3.new(0, 0, 0)
file1.ImageColor3 = Color3.new(1, 1, 1)
file1.Image = "rbxassetid://86799294221744"
file1.ImageTransparency = 0
file1.Parent = file

file1.BackgroundTransparency = 1

local bir = Instance.new("TextButton")
bir.Size = UDim2.new(0.8, 0, 0.0, 14)
bir.Position = UDim2.new(0.1, 49, 0.8, 24)
bir.BackgroundColor3 = Color3.new(0, 0, 0)
bir.BorderColor3 = Color3.new(0, 0, 0)
bir.BorderSizePixel = 0
bir.Text = ""
bir.BackgroundTransparency = 1
bir.TextColor3 = Color3.new(255, 255, 255)
bir.Font = Enum.Font.Code
bir.Parent = file
bir.MouseButton1Click:Connect(function()
 TextBox.Text = "loadstring(game:HttpGet('https://raw.githubusercontent.com/ryand56/Scripts/refs/heads/Scripts/Wings.txt'))()"
file:Remove()
end)

local Xfile = Instance.new("TextButton")
Xfile.Size = UDim2.new(0.0, 25, 0.0, 25)
Xfile.Position = UDim2.new(0.9, 28, 0.0, 0)
Xfile.BackgroundColor3 = Color3.new(0, 0, 0)
Xfile.BorderColor3 = Color3.new(0, 0, 0)
Xfile.BorderSizePixel = 0
Xfile.Text = ""
Xfile.BackgroundTransparency = 1
Xfile.TextColor3 = Color3.new(255, 255, 255)
Xfile.Font = Enum.Font.Code
Xfile.Parent = file
Xfile.MouseButton1Click:Connect(function()
file:Remove()
end)
end)

local X = Instance.new("TextButton")
X.Size = UDim2.new(0.0, 29, 0.0, 25)
X.Position = UDim2.new(0.9, 19, 0.0, 0)
X.BackgroundColor3 = Color3.new(0, 1, 0)
X.BorderColor3 = Color3.new(0, 0, 0)
X.BorderSizePixel = 0
X.Text = ""
X.BackgroundTransparency = 1
X.TextColor3 = Color3.new(255, 255, 255)
X.Font = Enum.Font.Code
X.Parent = Frame
X.MouseButton1Click:Connect(function()
Frame:Remove()
end)

local Orbit = Instance.new("ImageLabel")

local ImageLel = Instance.new("ImageLabel")
ImageLel.Size = UDim2.new(0.1, 19, 0.3, 0)
ImageLel.Position = UDim2.new(-0.127000004, 0, 0.407999992, 0)
ImageLel.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLel.ImageColor3 = Color3.new(1, 1, 1)
ImageLel.Image = "rbxassetid://139336001646889"
ImageLel.ImageTransparency = 0
ImageLel.Parent = gui

ImageLel.BackgroundTransparency = 1

Orbit.Size = UDim2.new(0.1, 39, 0.3, 19)
Orbit.Position = UDim2.new(-0.127000004, 0, 0.407999992, 0)
Orbit.BackgroundColor3 = Color3.new(0, 0, 0)
Orbit.ImageColor3 = Color3.new(1, 1, 1)
Orbit.Image = "rbxassetid://139019879823094"
Orbit.ImageTransparency = 0
Orbit.Parent = gui

Orbit.BackgroundTransparency = 1

ImageLel:TweenPosition(UDim2.new(0.458, 0, 0.408, 0), "Out", "Linear", 0.4, false)
Orbit:TweenPosition(UDim2.new(0.446, 0, 0.379, 0), "Out", "Linear", 0.4, false)
wait(3)
Orbit:TweenPosition(UDim2.new(0.00, 0, 0.59,  0), "Out", "Sine", 0.7, false)
ImageLel:TweenPosition(UDim2.new(0.00, 10, 0.62, 0), "Out", "Sine", 0.7, false)

while wait() do
Orbit.Rotation = Orbit.Rotation + 1
end
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Project Shiba",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/HrE2dKSD"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]


local Tab = Window:MakeTab({
	Name = "Scripts",
	Icon = "rbxassetid://",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]


OrionLib:MakeNotification({
	Name = "Welcome to 1x1x1x1x1 gui",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]

Tab:AddButton({
	Name = "first T0PK3K 4.0",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-idk-script-t0pk3k-29594"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Second T0PK3K 4.0",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Kick-gui-fake-24452"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "c00lkidd Gui (NEW)",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/ucuPtN97"))()
  	end    
})


--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Project sonicelijahmania",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Hanif290/YoThereSkibidiSigma68/refs/heads/main/Yoshi681SkibidiBoy"))()
  	end    
})


--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "External Gui (Pass:Team 1x1x1x1x1) and could be working",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/Af3Z3JMt')))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "Exsernew",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/gitluau/luauexser/refs/heads/main/pHzp8uG1PO962o6qucrlP3AJy17eV3B.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Polaria Lua",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/cqCsjPQr')))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Obunga jumpscare",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/nLJkW0s1')))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Jeff the killer (It's not Removed from screen)",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Jeff-The-Killer-JumpScare-27384"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "Rc7 require",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/CVecVrT1')))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Rc7 (made by Alif)",
	Callback = function()
      		-- Gui to Lua
-- Version: 3.2

-- Instances:

local Rc7executor = Instance.new("ScreenGui")
local Rc7UI = Instance.new("ImageLabel")
local A = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local DexV2 = Instance.new("TextButton")
local Execute = Instance.new("TextButton")
local GoogleDrive = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local Open = Instance.new("TextButton")
local SaveFile = Instance.new("TextButton")
local RoExploit = Instance.new("TextButton")
local W = Instance.new("TextButton")
local input = Instance.new("TextBox")

--Properties:

Rc7executor.Name = "Rc7executor"
Rc7executor.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Rc7executor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Rc7executor.ResetOnSpawn = false

Rc7UI.Name = "Rc7UI"
Rc7UI.Parent = Rc7executor
Rc7UI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Rc7UI.BorderColor3 = Color3.fromRGB(0, 0, 0)
Rc7UI.BorderSizePixel = 0
Rc7UI.Position = UDim2.new(0.344550639, 0, 0.169354692, 0)
Rc7UI.Size = UDim2.new(0, 364, 0, 442)
Rc7UI.Image = "http://www.roblox.com/asset/?id=17034158391"
Rc7UI.Active = true
Rc7UI.Draggable = true

A.Name = "A"
A.Parent = Rc7UI
A.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
A.BackgroundTransparency = 1.000
A.BorderColor3 = Color3.fromRGB(0, 0, 0)
A.BorderSizePixel = 0
A.Position = UDim2.new(0.903581262, 0, 0.62585032, 0)
A.Size = UDim2.new(0, 29, 0, 35)
A.Font = Enum.Font.SourceSans
A.Text = ""
A.TextColor3 = Color3.fromRGB(0, 0, 0)
A.TextSize = 14.000
A.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-auto-walk-7500"))()
end)

Clear.Name = "Clear"
Clear.Parent = Rc7UI
Clear.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Clear.BackgroundTransparency = 1.000
Clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0.581267238, 0, 0.791383207, 0)
Clear.Size = UDim2.new(0, 101, 0, 28)
Clear.Font = Enum.Font.SourceSans
Clear.Text = ""
Clear.TextColor3 = Color3.fromRGB(0, 0, 0)
Clear.TextSize = 14.000
Clear.MouseButton1Down:connect(function()
	input.Text = " "
end)

Close.Name = "Close"
Close.Parent = Rc7UI
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.865013778, 0, 0, 0)
Close.Size = UDim2.new(0, 49, 0, 28)
Close.Font = Enum.Font.SourceSans
Close.Text = ""
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextSize = 14.000
Close.MouseButton1Down:connect(function()
	Rc7UI.Visible = false
end)

DexV2.Name = "DexV2"
DexV2.Parent = Rc7UI
DexV2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DexV2.BackgroundTransparency = 1.000
DexV2.BorderColor3 = Color3.fromRGB(0, 0, 0)
DexV2.BorderSizePixel = 0
DexV2.Position = UDim2.new(0.900826454, 0, 0.920634925, 0)
DexV2.Size = UDim2.new(0, 29, 0, 35)
DexV2.Font = Enum.Font.SourceSans
DexV2.Text = ""
DexV2.TextColor3 = Color3.fromRGB(0, 0, 0)
DexV2.TextSize = 14.000
DexV2.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Dex-V2-10310"))()

end)

Execute.Name = "Execute"
Execute.Parent = Rc7UI
Execute.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Execute.BackgroundTransparency = 1.000
Execute.BorderColor3 = Color3.fromRGB(0, 0, 0)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0.292011023, 0, 0.791383207, 0)
Execute.Size = UDim2.new(0, 103, 0, 28)
Execute.Font = Enum.Font.SourceSans
Execute.Text = ""
Execute.TextColor3 = Color3.fromRGB(0, 0, 0)
Execute.TextSize = 14.000
Execute.MouseButton1Down:connect(function()
	loadstring(input.Text)()
	output.Text = "Running script.."
	wait(2)
	output.Text = " "
	if input.Text == " " then
		output.Text = "No script detected? Or you forgot to put a script!"
		wait(2)
		output.Text = " "
	end
end)

GoogleDrive.Name = "Google Drive"
GoogleDrive.Parent = Rc7UI
GoogleDrive.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GoogleDrive.BackgroundTransparency = 1.000
GoogleDrive.BorderColor3 = Color3.fromRGB(0, 0, 0)
GoogleDrive.BorderSizePixel = 0
GoogleDrive.Position = UDim2.new(0.903581262, 0, 0.727891147, 0)
GoogleDrive.Size = UDim2.new(0, 29, 0, 35)
GoogleDrive.Font = Enum.Font.SourceSans
GoogleDrive.Text = ""
GoogleDrive.TextColor3 = Color3.fromRGB(0, 0, 0)
GoogleDrive.TextSize = 14.000
GoogleDrive.MouseButton1Click:Connect(function()
	print("SKIDDER ULTRA >:9")
end)

Minimize.Name = "Minimize"
Minimize.Parent = Rc7UI
Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minimize.BackgroundTransparency = 1.000
Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.597796142, 0, 0, 0)
Minimize.Size = UDim2.new(0, 49, 0, 28)
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = ""
Minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
Minimize.TextSize = 14.000
Minimize.MouseButton1Down:connect(function()
	Rc7UI.Visible = false
	Rc7UI.Visible = true
end)

Open.Name = "Open"
Open.Parent = Rc7UI
Open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Open.BackgroundTransparency = 1.000
Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
Open.BorderSizePixel = 0
Open.Position = UDim2.new(0, 0, 0.789115667, 0)
Open.Size = UDim2.new(0, 104, 0, 32)
Open.Font = Enum.Font.SourceSans
Open.Text = ""
Open.TextColor3 = Color3.fromRGB(0, 0, 0)
Open.TextSize = 14.000
Open.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/ScriptHub"))()

end)

SaveFile.Name = "Save File"
SaveFile.Parent = Rc7UI
SaveFile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SaveFile.BackgroundTransparency = 1.000
SaveFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveFile.BorderSizePixel = 0
SaveFile.Position = UDim2.new(0.903581262, 0, 0.421768695, 0)
SaveFile.Size = UDim2.new(0, 29, 0, 35)
SaveFile.Font = Enum.Font.SourceSans
SaveFile.Text = ""
SaveFile.TextColor3 = Color3.fromRGB(0, 0, 0)
SaveFile.TextSize = 14.000
SaveFile.MouseButton1Click:Connect(function()
	print("Cannot save file because were detected an error to your screen")
end)

RoExploit.Name = "RoExploit"
RoExploit.Parent = Rc7UI
RoExploit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RoExploit.BackgroundTransparency = 1.000
RoExploit.BorderColor3 = Color3.fromRGB(0, 0, 0)
RoExploit.BorderSizePixel = 0
RoExploit.Position = UDim2.new(0.903581262, 0, 0.820861697, 0)
RoExploit.Size = UDim2.new(0, 29, 0, 35)
RoExploit.Font = Enum.Font.SourceSans
RoExploit.Text = ""
RoExploit.TextColor3 = Color3.fromRGB(0, 0, 0)
RoExploit.TextSize = 14.000
RoExploit.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-RoXploit-by-KrystalTeam-9328"))()
end)

W.Name = "W"
W.Parent = Rc7UI
W.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
W.BackgroundTransparency = 1.000
W.BorderColor3 = Color3.fromRGB(0, 0, 0)
W.BorderSizePixel = 0
W.Position = UDim2.new(0.903581262, 0, 0.523809552, 0)
W.Size = UDim2.new(0, 29, 0, 35)
W.Font = Enum.Font.SourceSans
W.Text = ""
W.TextColor3 = Color3.fromRGB(0, 0, 0)
W.TextSize = 14.000
W.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-auto-walk-7500"))()

end)

input.Name = "input"
input.Parent = Rc7UI
input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
input.BackgroundTransparency = 1.000
input.BorderColor3 = Color3.fromRGB(0, 0, 0)
input.BorderSizePixel = 0
input.Position = UDim2.new(0.0826446265, 0, 0.158730164, 0)
input.Size = UDim2.new(0, 284, 0, 276)
input.ClearTextOnFocus = false
input.Font = Enum.Font.Roboto
input.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
input.Text = ""
input.TextColor3 = Color3.fromRGB(0, 0, 0)
input.TextSize = 16.000
input.TextXAlignment = Enum.TextXAlignment.Left
input.TextYAlignment = Enum.TextYAlignment.Top
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "Shedletsky",
	Callback = function()
      		s = Instance.new("Sky")
s.Name = "SKY"
s.SkyboxBk = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxDn = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxFt = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxLf = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxRt = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxUp = "http://www.roblox.com/asset/?id=172423468"
s.Parent = game.Lighting
Spooky = Instance.new("Sound", game.Workspace)
Spooky.Name = "Spooky"
Spooky.SoundId = "rbxassetid://93240326658391"
Spooky.Volume = 1
Spooky.Looped = true
Spooky.Pitch = 1
Spooky:Play()
local ID =18889618673 --id here
t1 = "http://www.roblox.com/asset/?id=18343405871"
t2 = "http://www.roblox.com/asset/?id=18343405871"
t3 = "http://www.roblox.com/asset/?id=18343405871"
 
local p = game.Players:GetChildren()
local w = game.Workspace:GetChildren()
 
for i,v in pairs(p) do
pe = Instance.new("ParticleEmitter", v.Character.Head)
pe.Texture = t3
pe.VelocitySpread = 5
end
  	end    
})


Tab:AddButton({
	Name = "Skeleton Skybox",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/QhUwb6RB')))()
  	end    
})

Tab:AddButton({
	Name = "Lazytown",
	Callback = function()
      		imageOne = "http://www.roblox.com/asset/?id=110240864101518"
imageTwo = "http://www.roblox.com/asset/?id=110240864101518"
imageThree = "http://www.roblox.com/asset/?id=110240864101518"
imageFour = "http://www.roblox.com/asset/?id=110240864101518"
imageFive = "http://www.roblox.com/asset/?id=110240864101518"
imageSix = "http://www.roblox.com/asset/?id=110240864101518"
imageSeven = "http://www.roblox.com/asset/?id=110240864101518"
imageEight = "http://www.roblox.com/asset/?id=110240864101518"
Spooky = Instance.new("Sound", game.Workspace)
Spooky.Name = "Spooky"
Spooky.SoundId = "rbxassetid://18988381150"
Spooky.Volume = 1500
Spooky.Looped = true
Spooky:Play()
Sky = Instance.new("Sky", game.Lighting)
Sky.SkyboxBk = imageOne
Sky.SkyboxDn = imageOne
Sky.SkyboxFt = imageOne
Sky.SkyboxLf = imageOne
Sky.SkyboxRt = imageOne
Sky.SkyboxUp = imageOne
while true do
    Sky.SkyboxBk = imageOne
    Sky.SkyboxDn = imageOne
    Sky.SkyboxFt = imageOne
    Sky.SkyboxLf = imageOne
    Sky.SkyboxRt = imageOne
    Sky.SkyboxUp = imageOne
    wait(0.25)
    Sky.SkyboxBk = imageTwo
    Sky.SkyboxDn = imageTwo
    Sky.SkyboxFt = imageTwo
    Sky.SkyboxLf = imageTwo
    Sky.SkyboxRt = imageTwo
    Sky.SkyboxUp = imageTwo
    wait(0.25)
    Sky.SkyboxBk = imageThree
    Sky.SkyboxDn = imageThree
    Sky.SkyboxFt = imageThree
    Sky.SkyboxLf = imageThree
    Sky.SkyboxRt = imageThree
    Sky.SkyboxUp = imageThree
    wait(0.25)
    Sky.SkyboxBk = imageFour
    Sky.SkyboxDn = imageFour
    Sky.SkyboxFt = imageFour
    Sky.SkyboxLf = imageFour
    Sky.SkyboxRt = imageFour
    Sky.SkyboxUp = imageFour
    wait(0.25)
    Sky.SkyboxBk = imageFive
    Sky.SkyboxDn = imageFive
    Sky.SkyboxFt = imageFive
    Sky.SkyboxLf = imageFive
    Sky.SkyboxRt = imageFive
    Sky.SkyboxUp = imageFive
    wait(0.25)
    Sky.SkyboxBk = imageSix
    Sky.SkyboxDn = imageSix
    Sky.SkyboxFt = imageSix
    Sky.SkyboxLf = imageSix
    Sky.SkyboxRt = imageSix
    Sky.SkyboxUp = imageSix
    wait(0.25)
    Sky.SkyboxBk = imageSeven
    Sky.SkyboxDn = imageSeven
    Sky.SkyboxFt = imageSeven
    Sky.SkyboxLf = imageSeven
    Sky.SkyboxRt = imageSeven
    Sky.SkyboxUp = imageSeven
    wait(0.25)
    Sky.SkyboxBk = imageEight
    Sky.SkyboxDn = imageEight
    Sky.SkyboxFt = imageEight
    Sky.SkyboxLf = imageEight
    Sky.SkyboxRt = imageEight
    Sky.SkyboxUp = imageEight
    wait(0.25)
end
  	end    
})


--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Steve",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Steve-script-24707"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Mario exe",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/gMtScLkU"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "MLG Gun",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Client-Replication-the-ss-loadstring-script-27393"))()
  end       
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Yong Shelon By 007n7",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/rSKeijCz"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Yong Shelon Gui",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/sGRa5mG6"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Grab knife v4",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V4.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Ultimate Trolling Gui",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ultimate-trolling-gui-15461"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]


local Tab = Window:MakeTab({
	Name = "Cmds",
	Icon = "rbxassetid://",
	PremiumOnly = false
})



Tab:AddButton({
	Name = "Harked",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/JxcExploit/Harkedv2-script/main/Leaked-v2hardked"))()
  	end    
})


Tab:AddButton({
	Name = "SSP (secret service panel)",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/MagnumIceCream/SecretServicePanel/6fefdf531e86404fb41b7812e7e84b69c7ea728f/ShakesSSP"))()
  	end    
})


--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Mr Bean Admin",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Test4267/mrbean/refs/heads/main/hh"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Tab = Window:MakeTab({
	Name = "Hubs",
	Icon = "rbxassetid://",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "Ghub v15",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/GHUBV15_X_ZENXOS-MAINLOADER/refs/heads/main/GHUB-X-ZENXOS-V15.txt"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Tiger X",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/Tiger-X-V3/main/Tiger%20X%20V3.5%20Fixed"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Fe bypass gui [FIXED]",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/g00lXploiter/g00lXploiter/main/Fe%20bypass", true))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Tab = Window:MakeTab({
	Name = "Inject logos",
	Icon = "rbxassetid://",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
	Name = "Logos"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddButton({
	Name = "Project stigma Low Quality",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/VbMpnRRy')))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Project stigma Good Quality",
	Callback = function()
      		loadstring(game:HttpGet("https://pastefy.app/lSGqK5Ds/raw",true))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "project ligma",
	Callback = function()
      		local gui = Instance.new("ScreenGui")
gui.Name = "executor"
gui.Parent = game.CoreGui

local lel = Instance.new("ImageLabel")
lel.Size = UDim2.new(0.0, 100, 0.0, 100)
lel.Position = UDim2.new(-0.127000004, 0, 0.407999992, 0)
lel.BackgroundColor3 = Color3.new(0, 0, 0)
lel.ImageColor3 = Color3.new(1, 1, 1)
lel.Image = "rbxassetid://75027801535235"
lel.ImageTransparency = 0
lel.Parent = gui

lel.BackgroundTransparency = 1 

local Ring = Instance.new("ImageLabel")
Ring.Size = UDim2.new(1.0, 0, 1.0, 0)
Ring.Position = UDim2.new(0.0, 0, 0.0, 0)
Ring.BackgroundColor3 = Color3.new(0, 0, 0)
Ring.ImageColor3 = Color3.new(1, 1, 1)
Ring.Image = "rbxassetid://"
Ring.ImageTransparency = 0
Ring.Parent = lel

Ring.BackgroundTransparency = 1

local Orbit = Instance.new("ImageLabel")
Orbit.Size = UDim2.new(0.0, 21, 0.0, 21)
Orbit.Position = UDim2.new(0.0, 0, 0.0, 10)
Orbit.BackgroundColor3 = Color3.new(0, 0, 0)
Orbit.ImageColor3 = Color3.new(1, 1, 1)
Orbit.Image = "rbxassetid://"
Orbit.ImageTransparency = 0
Orbit.Parent = Ring

Orbit.BackgroundTransparency = 1

lel:TweenPosition(UDim2.new(0.458, 0, 0.408, 0), "Out", "Linear", 0.4, false)
wait(3)
lel:TweenPosition(UDim2.new(0.0, 9, 0.0, 190), "Out", "Sine", 0.7, false)

while wait() do
Ring.Rotation = Ring.Rotation + 1
Orbit.Rotation = Orbit.Rotation - 1
end
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Project lua",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/HTBxzUaq')))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Project SadRc7",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/Gf5qPQbV')))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Epic face",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/K1Bf0881')))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]


local Tab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://96331255027268",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
	Name = "Dev/Creator"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddButton({
	Name = "me skidder",
	Callback = function()
      		
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
	Name = "Helper"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddButton({
	Name = "skid0n",
	Callback = function()
      		
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
	Name = "Tester"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddButton({
	Name = "nigaX1",
	Callback = function()
      		
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
	Name = "Special thanks to"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddButton({
	Name = "skid0n",
	Callback = function()
      		
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "skidRc7",
	Callback = function()
      		
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "null",
	Callback = function()
      		
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "niggakidd",
	Callback = function()
      		
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]