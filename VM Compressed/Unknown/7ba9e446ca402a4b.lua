-- New draggable Orion Lib script for hub creations!
local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/WRUyYTdY')))()


local Window = OrionLib:MakeWindow({
    Name = "Ultimate SS FE Bypass GUI",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "Ultimate SS FE Bypass GUI" -- Put the name of your hub or script here!
})

print("Successfully executed.") -- Just a debug

local Tab = Window:MakeTab({
    Name = "MAIN:",
    Icon = "rbxassetid://131929413690284",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "GUI"
})

local playerName = game.Players.LocalPlayer.Name

Tab:AddButton({
    Name = "Welcome " .. playerName .. "! This is gui made by GunyahJohn/SnowKid",
    Callback = function()
    end
})

Tab:AddButton({
    Name = "Inject Stigma Logo",
    Callback = function()
      		local StigmanFroud = Instance.new("ScreenGui")
local trajectory = Instance.new("ImageLabel")
local R = Instance.new("ImageLabel")
local Earth = Instance.new("ImageLabel")
local Green = Instance.new("ImageLabel")

StigmanFroud.Name = "Stigman Froud"
StigmanFroud.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
StigmanFroud.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
StigmanFroud.DisplayOrder = 999
StigmanFroud.ResetOnSpawn = false

trajectory.Name = "trajectory"
trajectory.Parent = StigmanFroud
trajectory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trajectory.BackgroundTransparency = 1.000
trajectory.Position = UDim2.new(0.45430705, 0, 0.430432826, 0)
trajectory.Size = UDim2.new(0, 110, 0, 110)
trajectory.Image = "http://www.roblox.com/asset/?id=7102118272"
trajectory.SliceScale = 3.000

R.Name = "R"
R.Parent = StigmanFroud
R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
R.BackgroundTransparency = 1.000
R.Position = UDim2.new(0.45430705, 0, 0.430432826, 0)
R.Size = UDim2.new(0, 110, 0, 110)
R.ZIndex = 3
R.Image = "http://www.roblox.com/asset/?id=7102117818"
R.SliceScale = 3.000

Earth.Name = "Earth"
Earth.Parent = R
Earth.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Earth.BackgroundTransparency = 1.000
Earth.BorderColor3 = Color3.fromRGB(0, 0, 0)
Earth.BorderSizePixel = 0
Earth.Position = UDim2.new(0.404999346, 0, 0.406818181, 0)
Earth.Size = UDim2.new(0, 20, 0, 20)
Earth.ZIndex = 4
Earth.Image = "rbxassetid://78137783929126"

Green.Name = "Green"
Green.Parent = StigmanFroud
Green.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Green.BackgroundTransparency = 1.000
Green.BorderColor3 = Color3.fromRGB(0, 0, 0)
Green.BorderSizePixel = 0
Green.Position = UDim2.new(0.00499999989, 0, 0.824999988, 0)
Green.Size = UDim2.new(0, 110, 0, 110)
Green.ZIndex = 6
Green.Image = "rbxassetid://75554667916597"
Green.ImageTransparency = 1.000

local function AARC_fake_script() -- trajectory.Info 
	local script = Instance.new('LocalScript', trajectory)

	local img = script.Parent
	local sonic = script.Parent
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
	
	while true do
		wait(0.01)
		sonic.Rotation = sonic.Rotation +0.3
	end
	
	
end
coroutine.wrap(AARC_fake_script)()
local function LQERQ_fake_script() -- Earth.LocalScript 
	local script = Instance.new('LocalScript', Earth)

	local Angle = 0;
	local AngleIncrement = 0.02;
	local OriginPos = script.Parent.Position;
	local Distance = 55;
	
	while wait() do
		Angle = Angle + AngleIncrement;
		local dirX = math.cos(Angle) -- X
		local dirY = math.sin(Angle) -- Y
		script.Parent.Position = OriginPos + UDim2.new(0, dirX * Distance, 0, dirY * Distance);
	end
end
coroutine.wrap(LQERQ_fake_script)()
local function XBQODE_fake_script() -- R.Info 
	local script = Instance.new('LocalScript', R)

	local img = script.Parent
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
end
coroutine.wrap(XBQODE_fake_script)()
local function NSHDR_fake_script() -- Green.LocalScript 
	local script = Instance.new('LocalScript', Green)

	local Tween = game:GetService("TweenService")
	local Greenfn = script.Parent
	wait(2)
	while true do
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 0})
		TranspncyTween:Play()
		wait(0.3)
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 1})
		TranspncyTween:Play()
		wait(0.3)
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 0})
		TranspncyTween:Play()
		wait(0.3)
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 1})
		TranspncyTween:Play()
		wait(4)
	end
end
coroutine.wrap(NSHDR_fake_script)()
local function UDIRPT_fake_script() -- Green.Info 
	local script = Instance.new('LocalScript', Green)

	local img = script.Parent
	local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
	
	
end
coroutine.wrap(UDIRPT_fake_script)()
local function WGFAMY_fake_script() -- StigmanFroud.LocalScript 
	local script = Instance.new('LocalScript', StigmanFroud)

	local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	
	print("Loaded At",GetName.Name)
	wait(0.1)
	print("Welcome,",game.Players.LocalPlayer.Name)
	
end
coroutine.wrap(WGFAMY_fake_script)()
  	end    
}) 

Tab:AddButton({
    Name = "Inject SadRc7 Logo",
    Callback = function()
      		local gui = Instance.new("ScreenGui")
gui.Name = "executor"
gui.Parent = game.CoreGui

local lel = Instance.new("ImageLabel")
lel.Size = UDim2.new(0.0, 100, 0.0, 100)
lel.Position = UDim2.new(-0.127000004, 0, 0.407999992, 0)
lel.BackgroundColor3 = Color3.new(0, 0, 0)
lel.ImageColor3 = Color3.new(1, 1, 1)
lel.Image = "rbxassetid://96331255027268"
lel.ImageTransparency = 0
lel.Parent = gui

lel.BackgroundTransparency = 1 

local Ring = Instance.new("ImageLabel")
Ring.Size = UDim2.new(1.0, 0, 1.0, 0)
Ring.Position = UDim2.new(0.0, 0, 0.0, 0)
Ring.BackgroundColor3 = Color3.new(0, 0, 0)
Ring.ImageColor3 = Color3.new(0, 0, 0)
Ring.Image = "rbxassetid://7102118272"
Ring.ImageTransparency = 0
Ring.Parent = lel

Ring.BackgroundTransparency = 1

local Orbit = Instance.new("ImageLabel")
Orbit.Size = UDim2.new(0.0, 21, 0.0, 21)
Orbit.Position = UDim2.new(0.0, 0, 0.0, 10)
Orbit.BackgroundColor3 = Color3.new(0, 0, 0)
Orbit.ImageColor3 = Color3.new(1, 1, 1)
Orbit.Image = "rbxassetid://96331255027268"
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

Tab:AddButton({
    Name = "Exsernew SS",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/gitluau/luauexser/refs/heads/main/pHzp8uG1PO962o6qucrlP3AJy17eV3B.lua"))()
  end    
})

Tab:AddButton({
    Name = "Rc7",
    Callback = function()
          		local gui = Instance.new("ScreenGui")
gui.Name = "patrickGui"
gui.Parent = game.CoreGui

local lock = Instance.new("Frame")
lock.Size = UDim2.new(0.4, 19, 0.9, 19)
lock.Position = UDim2.new(0.0, 0, 0.0, 0)
lock.BackgroundColor3 = Color3.new(1, 1, 1)
lock.BorderColor3 = Color3.new(0, 0, 0)
lock.BorderSizePixel = 0
lock.Active = true
lock.BackgroundTransparency = 1
lock.Draggable = true
lock.Parent = gui

local rc7 = Instance.new("Frame")
rc7.Size = UDim2.new(0.9, 33, 0.9, 30)
rc7.Position = UDim2.new(0.0, 0, 0.0, 0)
rc7.BackgroundColor3 = Color3.new(1, 1, 1)
rc7.BorderColor3 = Color3.new(0, 0, 0)
rc7.BorderSizePixel = 0
rc7.Active = false
rc7.BackgroundTransparency = 1
rc7.Draggable = true
rc7.Parent = lock
rc7.Visible = false

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Size = UDim2.new(0.9, 31, 0.9, 29)
ImageLabel.Position = UDim2.new(0.0, 0, 0.0, 0)
ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
ImageLabel.Image = "rbxassetid://87234781699544"
ImageLabel.ImageTransparency = 0
ImageLabel.Parent = rc7

ImageLabel.BackgroundTransparency = 1

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 2, 0.6, 14)
TextBox.Position = UDim2.new(0.0, 9, 0.1, 8)
TextBox.BackgroundColor3 = Color3.new(0, 0, 0)
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(0, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 15
TextBox.Parent = rc7
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = failed
TextBox.MultiLine = true
TextBox.TextWrapped = true

local exe = Instance.new("TextButton")
exe.Size = UDim2.new(0.2, 21, 0.0, 23)
exe.Position = UDim2.new(0.2, 30, 0.7, 19)
exe.BackgroundColor3 = Color3.new(0, 0, 0)
exe.BorderColor3 = Color3.new(0, 0, 0)
exe.BorderSizePixel = 0
exe.Text = ""
exe.BackgroundTransparency = 1
exe.TextColor3 = Color3.new(0, 0, 0)
exe.Font = Enum.Font.Code
exe.Parent = rc7
exe.MouseButton1Click:Connect(function()
assert(loadstring(TextBox.Text))()
end)

local clea = Instance.new("TextButton")
clea.Size = UDim2.new(0.2, 22, 0.0, 23)
clea.Position = UDim2.new(0.5, 21, 0.7, 19)
clea.BackgroundColor3 = Color3.new(0, 0, 0)
clea.BorderColor3 = Color3.new(0, 0, 0)
clea.BorderSizePixel = 0
clea.Text = ""
clea.BackgroundTransparency = 1
clea.TextColor3 = Color3.new(255, 255, 255)
clea.Font = Enum.Font.Code
clea.Parent = rc7
clea.MouseButton1Click:Connect(function()
TextBox.Text = ""
end)

local roe = Instance.new("TextButton")
roe.Size = UDim2.new(0.1, 0, 0.0, 25)
roe.Position = UDim2.new(0.8, 20, 0.7, 26)
roe.BackgroundColor3 = Color3.new(0, 0, 0)
roe.BorderColor3 = Color3.new(0, 0, 0)
roe.BorderSizePixel = 0
roe.Text = ""
roe.BackgroundTransparency = 1
roe.TextColor3 = Color3.new(255, 255, 255)
roe.Font = Enum.Font.Code
roe.Parent = rc7
roe.MouseButton1Click:Connect(function()
loadstring(game:GetObjects("rbxassetid://364364477")[1].Source)()
end)

local X = Instance.new("TextButton")
X.Size = UDim2.new(0.1, 0, 0.1, 0)
X.Position = UDim2.new(0.9, 0, 0.0, 0)
X.BackgroundColor3 = Color3.new(0, 0, 0)
X.BorderColor3 = Color3.new(0, 0, 0)
X.BorderSizePixel = 0
X.Text = ""
X.BackgroundTransparency = 1
X.TextColor3 = Color3.new(0, 0, 0)
X.Font = Enum.Font.Code
X.Parent = rc7
X.MouseButton1Click:Connect(function()
lock:Remove()
end)

local lock1 = Instance.new("ImageLabel")
lock1.Size = UDim2.new(0.9, 33, 0.9, 30)
lock1.Position = UDim2.new(0.0, 0, 0.0, 0)
lock1.BackgroundColor3 = Color3.new(0, 0, 0)
lock1.ImageColor3 = Color3.new(1, 1, 1)
lock1.Image = "rbxassetid://90888446221641"
lock1.ImageTransparency = 0
lock1.Parent = lock

lock1.BackgroundTransparency = 1

local user = Instance.new("TextBox")
user.Size = UDim2.new(0.4, 14, 0.0, 19)
user.Position = UDim2.new(0.2, 0, 0.3, 28)
user.BackgroundColor3 = Color3.new(0, 0, 0)
user.BorderColor3 = Color3.new(0, 0, 0)
user.BorderSizePixel = 0
user.Text = ""
user.TextColor3 = Color3.new(1, 1, 1)
user.BackgroundTransparency = 1
user.Font = Enum.Font.Code
user.TextSize = 18
user.Parent = lock1
user.TextWrapped = true

local pass = Instance.new("TextLabel")
pass.Size = UDim2.new(0.4, 14, 0.0, 19)
pass.Position = UDim2.new(0.2, 0, 0.4, 22)
pass.BackgroundColor3 = Color3.new(0, 0, 0)
pass.BorderColor3 = Color3.new(0, 0, 0)
pass.BorderSizePixel = 0
pass.Text = "Free pass"
pass.BackgroundTransparency = 1
pass.TextColor3 = Color3.new(1, 1, 1)
pass.Font = Enum.Font.Code
pass.Parent = lock1
pass.TextSize = 18
pass.TextWrapped = true

local submit = Instance.new("TextButton")
submit.Size = UDim2.new(0.3, 0, 0.0, 21)
submit.Position = UDim2.new(0.2, 20, 0.5, 18)
submit.BackgroundColor3 = Color3.new(0, 0, 0)
submit.BorderColor3 = Color3.new(0, 0, 0)
submit.BorderSizePixel = 0
submit.Text = ""
submit.BackgroundTransparency = 1
submit.TextColor3 = Color3.new(255, 255, 255)
submit.Font = Enum.Font.Code
submit.Parent = lock1
submit.MouseButton1Click:Connect(function()
lock1.Visible = false
rc7.Visible = true
end)

local Xlock = Instance.new("TextButton")
Xlock.Size = UDim2.new(0.1, 0, 0.1, 0)
Xlock.Position = UDim2.new(0.9, 0, 0.0, 0)
Xlock.BackgroundColor3 = Color3.new(0, 0, 0)
Xlock.BorderColor3 = Color3.new(0, 0, 0)
Xlock.BorderSizePixel = 0
Xlock.Text = ""
Xlock.BackgroundTransparency = 1
Xlock.TextColor3 = Color3.new(255, 255, 255)
Xlock.Font = Enum.Font.Code
Xlock.Parent = lock1
Xlock.MouseButton1Click:Connect(function()
lock:Remove()
end)
  	end    
})

Tab:AddButton({
    Name = "Mario.exe",
    Callback = function()
         		loadstring(game:HttpGet("https://pastebin.com/raw/gMtScLkU"))()
  end    
})

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

Tab:AddButton({
    Name = "Elysian Hub V2",
    Callback = function() 
                 loadstring(game:HttpGet("https://raw.githubusercontent.com/ScrewedABunch/BlockDragonHead_Scripts/refs/heads/main/ElysianV2.txt"))()
  end    
})

Tab:AddButton({
    Name = "c00lgui reborn rc7",
    Callback = function()
                loadstring(game:GetObjects('rbxassetid://473373681')[1].Source)()
  end    
})

Tab:AddButton({
    Name = "Dominant Executor",
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

Tab:AddButton({
    Name = "R15 to R6",
    Callback = function()
          		loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-from-R15-to-R6-9639"))()
   end    
})

Tab:AddButton({
    Name = "yong shelon gui",
    Callback = function()
          		loadstring(game:HttpGet("https://pastebin.com/raw/sGRa5mG6"))()
  end    
})

Tab:AddButton({
	Name = "Lua Hammer",
	Callback = function() 
            loadstring(game:HttpGet("https://rawscripts.net/raw/Prison-Life-Lua-Hammer-18934"))()
  end    
})
	
Tab:AddButton({
    Name = "Ultimate Trolling Gui",
    Callback = function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ultimate-trolling-gui-15461"))()
  end    
})

Tab:AddButton({
    Name = "Steve",
    Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Steve-script-24707"))()
  end    
})

Tab:AddButton({
    Name = "Project Ligma",
    Callback = function()
          		 --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Project Ligma By ItsKittyyyGD Real fe Bypass
-- No skid this kids

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local TextButton_3 = Instance.new("TextButton")

ScreenGui.Name = "LigmaProjectGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.28551212, 0, 0.268115938, 0)
Frame.Size = UDim2.new(0, 820, 0, 384)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.Position = UDim2.new(0.0121951215, 0, 0.0755208358, 0)
TextBox.Size = UDim2.new(0, 574, 0, 346)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.MultiLine = true
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 16
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.Position = UDim2.new(0.713025033, 0, 0.0755208358, 0)
TextButton.Size = UDim2.new(0, 85, 0, 168)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "EXE"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 16

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.Position = UDim2.new(0.713025033, 0, 0.513020813, 0)
TextButton_2.Size = UDim2.new(0, 85, 0, 178)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "CLEAR"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextSize = 16

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.Position = UDim2.new(0.832501352, 0, 0.0755208358, 0)
Frame_2.Size = UDim2.new(0, 128, 0, 346)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0398184434, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 93, 0, 29)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Project Ligma"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 16

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.0195121951, 0, 0.015625, 0)
ImageLabel.Size = UDim2.new(0, 16, 0, 16)
ImageLabel.Image = "rbxassetid://87162794"

TextButton_3.Parent = Frame
TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_3.BackgroundTransparency = 1
TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderSizePixel = 0
TextButton_3.Position = UDim2.new(0.9703421, 0, 0, 0)
TextButton_3.Size = UDim2.new(0, 24, 0, 24)
TextButton_3.Font = Enum.Font.SourceSans
TextButton_3.Text = "X"
TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.TextSize = 16

local dragging
local dragInput
local dragStart
local startPos

local function onDragInput(input)
    if dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

Frame.InputChanged:Connect(onDragInput)

Frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local script = Instance.new('LocalScript', TextButton)
script.Parent.MouseButton1Click:Connect(function()
    loadstring(script.Parent.Parent.TextBox.Text)()
end)

local script2 = Instance.new('LocalScript', TextButton_2)
script2.Parent.MouseButton1Click:Connect(function()
    script2.Parent.Parent.TextBox.Text = ""
end)

TextButton_3.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
wait(0.1)
local LigmaProject = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local fr6 = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")

LigmaProject.Name = "LigmaProject"
LigmaProject.Parent = game.CoreGui

ImageLabel.Parent = LigmaProject
ImageLabel.Active = true
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(-0.127000004, 0, 0.407999992, 0)
ImageLabel.Size = UDim2.new(0, 90, 0, 90)
ImageLabel.Image = "rbxassetid://87162794"

fr6.Name = "fr6"
fr6.Parent = ImageLabel
fr6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fr6.BackgroundTransparency = 1.000
fr6.Position = UDim2.new(0, 0, -0.633333325, 0)
fr6.Size = UDim2.new(0, 90, 0, 50)
fr6.Font = Enum.Font.SourceSansBold
fr6.Text = "R15 -> R6"
fr6.TextColor3 = Color3.fromRGB(0, 0, 0)
fr6.TextScaled = true
fr6.TextSize = 18.000
fr6.TextTransparency = 1.000
fr6.TextWrapped = true

TextLabel_2.Parent = ImageLabel
TextLabel_2.Active = true
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.99999994, 0, 0, 0)
TextLabel_2.Size = UDim2.new(0, 269, 0, 90)
TextLabel_2.Font = Enum.Font.SourceSansBold
TextLabel_2.LineHeight = 1.100
TextLabel_2.Text = "Project Ligma by Harkinian and Unverified Run scripts live without filthy modules or converting!                                                              Use the external program to execute scripts.                                                                                                                                                                 Status: Injected"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 15.000
TextLabel_2.TextTransparency = 1.000
TextLabel_2.TextWrapped = true

local function UpdateVisibilityBasedOnRigType()
    local TweenService = game:GetService("TweenService")
    local txt = ImageLabel.TextLabel
    local btn = fr6
    wait(1)
    ImageLabel:TweenPosition(UDim2.new(0.458, 0, 0.408, 0), "Out", "Linear", 0.4, false)
    wait(3)
    ImageLabel:TweenPosition(UDim2.new(0.01, 0, 0.813, 0), "Out", "Sine", 0.7, false)
    wait(1)
    TweenService:Create(txt, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {["BackgroundTransparency"] = 0}):Play()
    TweenService:Create(txt, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {["TextTransparency"] = 0}):Play()

    for i, v in pairs(game.Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Humanoid") then
            if v.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
                btn.Visible = false
            elseif v.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
                TweenService:Create(btn, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {["BackgroundTransparency"] = 0}):Play()
                TweenService:Create(btn, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {["TextTransparency"] = 0}):Play()
                btn.Visible = true
            end
        end
    end

    wait(2)

    while wait() do
        for i, v in pairs(game.Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("Humanoid") then
                if v.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
                    btn.Visible = false
                elseif v.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
                    btn.Visible = true
                end
            end
        end
    end
end

fr6.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
            fr6.Visible = false
            loadstring(game:HttpGet("https://pastebin.com/raw/9wJepMwY", true))()
        end
    end
end)

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local btn = fr6
        btn.Visible = true
    end)
end)

UpdateVisibilityBasedOnRigType()
  end    
})

Tab:AddButton({
    Name = "Thomas Dank Engine",
    Callback = function()
          		 --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- ty krystalburger
--[[
	Thomas The Dank Engine:
							By: KrystalTeam
							Features: Being a dank engine that kill people
							Version: 1.0.0.2
--]]

local p = game.Players.LocalPlayer.Character
local weld = Instance.new("Weld",p.Torso)
weld.Part0 = p.Torso

local train = Instance.new("Part",p.Torso)
train.Anchored = true
train.CanCollide = false
train.Size = Vector3.new(3,2,6)
train.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
weld.Part1 = train
weld.C1 = CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(180),0)
train.Anchored = false
local TrainMesh = Instance.new("SpecialMesh",train)
TrainMesh.MeshType = Enum.MeshType.FileMesh
TrainMesh.Scale = Vector3.new(0.020,0.020,0.015)
TrainMesh.MeshId = "rbxassetid://431017802"
TrainMesh.TextureId = "rbxassetid://431017809"


local weld2 = Instance.new("Weld",p.Torso)
weld2.Part0 = p.Torso
local Smoke = Instance.new("Part",p.Torso)
Smoke.Anchored = true
Smoke.CanCollide = false
Smoke.Size = Vector3.new(1,1,1)
Smoke.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
weld2.Part1 = Smoke
weld2.C1 = CFrame.new(0,-4,3.5)-- * CFrame.Angles(0,math.rad(180),0)
Smoke.Anchored = false
Smoke.Transparency = 1;

local Particle = Instance.new("ParticleEmitter",Smoke)
Particle.Rate = 50;
Particle.Speed = NumberRange.new(30,60);
Particle.VelocitySpread = 4;
Particle.Texture = "rbxassetid://133619974"

local Light = Instance.new("SpotLight",train)
Light.Angle = 45;
Light.Brightness = 100;
Light.Face = Enum.NormalId.Back;
Light.Range = 30;

p.Humanoid.WalkSpeed = 60;


for i,v in pairs(p:GetChildren()) do
	if v:IsA("Part") then
		v.Transparency = 1;
	elseif v:IsA("Hat") then
		v:Destroy()
	elseif v:IsA("Model") then
		v:Destroy()
	end
end

local function SFX(id) local s=Instance.new("Sound",p.Torso); s.SoundId = "rbxassetid://"..id; s.Volume = 1; return s; end
train.Touched:connect(function(p)
	if p.Parent then
		if p.Parent:IsA("Model") then
			if game.Players:FindFirstChild(p.Parent.Name) then
				if p.Parent.Name ~= game.Players.LocalPlayer.Name then
					game.Players:FindFirstChild(p.Parent.Name).Character:BreakJoints()
					local Whistle = SFX(475073913)
					Whistle:Play()
				end
			end
		end
	end
end)

local Music = SFX(190819252)
Music.Looped = true;
wait(1)
Music:Play();
-- ~CL 2016  
  end    
})

Tab:AddButton({
    Name = "Rocky2u Admin",
    Callback = function()
      		str_srce = "14682300022" loadstring(game:GetObjects("rbxassetid://"..str_srce)[1].Source)()
  	end    
})

Tab:AddButton({
    Name = "Stigma Ultimate",
    Callback = function()
          		 --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://pastebin.com/raw/WW9zWhdA"))()
  end    
})

Tab:AddButton({
    Name = "Skeleton Skybox",
    Callback = function()
      		imageOne = "http://www.roblox.com/asset/?id=169585459"
imageTwo = "http://www.roblox.com/asset/?id=169585475"
imageThree = "http://www.roblox.com/asset/?id=169585485"
imageFour = "http://www.roblox.com/asset/?id=169585502"
imageFive = "http://www.roblox.com/asset/?id=169585515"
imageSix = "http://www.roblox.com/asset/?id=169585502"
imageSeven = "http://www.roblox.com/asset/?id=169585485"
imageEight = "http://www.roblox.com/asset/?id=169585475"
Spooky = Instance.new("Sound", game.Workspace)
Spooky.Name = "Spooky"
Spooky.SoundId = "rbxassetid://4808613510"
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

Tab:AddButton({
    Name = "T0PKEK 4.0",
    Callback = function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/i-topk3k-test-29602"))()
  end    
})

Tab:AddButton({
    Name = "Polaria ",
    Callback = function()
      		local gui = Instance.new("ScreenGui")
gui.Name = "Polaria 1.5"
gui.Parent = game.CoreGui

local Ui = Instance.new("Frame")
Ui.Size = UDim2.new(0.6, 12, 0.9, 69)
Ui.Position = UDim2.new(0.2, 0, 0.0, 0)
Ui.BackgroundColor3 = Color3.new(0, 0, 0)
Ui.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
Ui.BorderSizePixel = 3
Ui.Active = true
Ui.BackgroundTransparency = 0 
Ui.Draggable = true
Ui.Parent = gui

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(0.9, 45, 0.0, 26)
TextLabel.Position = UDim2.new(0.0, 0, 0.0, 0)
TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
TextLabel.BorderSizePixel = 3
TextLabel.Text = ""
TextLabel.BackgroundTransparency = 0 
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.Font = Enum.Font.Code
TextLabel.Parent = Ui
TextLabel.TextSize = 19

local text1 = Instance.new("TextLabel")
text1.Size = UDim2.new(0.1, 34, 0.2, 0)
text1.Position = UDim2.new(0.0, 0, 0.3, 3)
text1.BackgroundColor3 = Color3.new(0, 0, 0)
text1.BorderColor3 = Color3.new(0, 0, 0)
text1.BorderSizePixel = 0
text1.Text = "POLARIA"
text1.BackgroundTransparency = 0 
text1.TextColor3 = Color3.new(255, 255, 255)
text1.Font = Enum.Font.Code
text1.Parent = TextLabel
text1.TextSize = 19

local X = Instance.new("TextButton")
X.Size = UDim2.new(0.0, 28, 0.9, 2)
X.Position = UDim2.new(0.9, 18, 0.0, 0)
X.BackgroundColor3 = Color3.new(0, 0, 0)
X.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
X.BorderSizePixel = 3
X.Text = "X"
X.BackgroundTransparency = 0 
X.TextColor3 = Color3.new(255, 255, 255)
X.Font = Enum.Font.Code
X.Parent = TextLabel
X.TextSize = 25

local idk = Instance.new("Frame")
idk.Size = UDim2.new(0.0, 28, 0.9, 2)
idk.Position = UDim2.new(0.8, 32, 0.0, 0)
idk.BackgroundColor3 = Color3.new(0, 0, 0)
idk.BorderColor3 = Color3.new(0.5, 0, 1.0)
idk.BorderSizePixel = 3
idk.Active = false
idk.BackgroundTransparency = 0 
idk.Draggable = true
idk.Parent = TextLabel

local so = Instance.new("Frame")
so.Size = UDim2.new(0.2, 7, 0.5, 1)
so.Position = UDim2.new(0.3, 0, 0.2, 0)
so.BackgroundColor3 = Color3.new(0, 0, 0)
so.BorderColor3 = Color3.new(1, 1, 1)
so.BorderSizePixel = 1
so.Active = false
so.BackgroundTransparency = 0 
so.Draggable = true
so.Parent = idk

local Kl = Instance.new("TextButton")
Kl.Size = UDim2.new(0.0, 28, 0.9, 2)
Kl.Position = UDim2.new(0.8, 2, 0.0, 0)
Kl.BackgroundColor3 = Color3.new(0, 0, 0)
Kl.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
Kl.BorderSizePixel = 3
Kl.Text = "–"
Kl.BackgroundTransparency = 0 
Kl.TextColor3 = Color3.new(255, 255, 255)
Kl.Font = Enum.Font.Code
Kl.Parent = TextLabel
Kl.TextSize = 24

local Home = Instance.new("TextButton")
Home.Size = UDim2.new(0.2, 9, 0.0, 29)
Home.Position = UDim2.new(0.0, 0, 0.0, 29)
Home.BackgroundColor3 = Color3.new(0, 0, 0)
Home.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
Home.BorderSizePixel = 3
Home.Text = "Home"
Home.BackgroundTransparency = 0 
Home.TextColor3 = Color3.new(255, 255, 255)
Home.Font = Enum.Font.Code
Home.Parent = Ui
Home.TextSize = 20

local server = Instance.new("TextButton")
server.Size = UDim2.new(0.2, 25, 0.0, 29)
server.Position = UDim2.new(0.1, 58, 0.0, 29)
server.BackgroundColor3 = Color3.new(0, 0, 0)
server.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
server.BorderSizePixel = 3
server.Text = "Server/Local"
server.BackgroundTransparency = 0 
server.TextColor3 = Color3.new(255, 255, 255)
server.Font = Enum.Font.Code
server.Parent = Ui
server.TextSize = 18

local scr = Instance.new("TextButton")
scr.Size = UDim2.new(0.2, 0, 0.0, 29)
scr.Position = UDim2.new(0.3, 85, 0.0, 29)
scr.BackgroundColor3 = Color3.new(0, 0, 0)
scr.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
scr.BorderSizePixel = 3
scr.Text = "Scripts"
scr.BackgroundTransparency = 0 
scr.TextColor3 = Color3.new(255, 255, 255)
scr.Font = Enum.Font.Code
scr.Parent = Ui
scr.TextSize = 19

local exe = Instance.new("TextButton")
exe.Size = UDim2.new(0.1, 34, 0.0, 29)
exe.Position = UDim2.new(0.6, 39, 0.0, 29)
exe.BackgroundColor3 = Color3.new(0, 0, 0)
exe.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
exe.BorderSizePixel = 3
exe.Text = "Executor"
exe.BackgroundTransparency = 0 
exe.TextColor3 = Color3.new(255, 255, 255)
exe.Font = Enum.Font.Code
exe.Parent = Ui
exe.TextSize = 19

local out = Instance.new("TextButton")
out.Size = UDim2.new(0.1, 15, 0.0, 29)
out.Position = UDim2.new(0.8, 30, 0.0, 29)
out.BackgroundColor3 = Color3.new(0, 0, 0)
out.BorderColor3 = Color3.new(0.5, 0, 1.0)
out.BorderSizePixel = 3
out.Text = "Output"
out.BackgroundTransparency = 0 
out.TextColor3 = Color3.new(255, 255, 255)
out.Font = Enum.Font.Code
out.Parent = Ui
out.TextSize = 19

local Box = Instance.new("TextBox")
Box.Size = UDim2.new(0.9, 35, 0.6, 15)
Box.Position = UDim2.new(0.0, 5, 0.2, 0)
Box.BackgroundColor3 = Color3.new(0, 0, 0)
Box.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
Box.BorderSizePixel = 3
Box.Text = "Made by Executor scripts"
Box.TextColor3 = Color3.new(1, 1, 1)
Box.BackgroundTransparency = 0
Box.Font = Enum.Font.Code
Box.TextSize = 15
Box.Parent = Ui
Box.TextYAlignment = Enum.TextYAlignment.Top
Box.TextXAlignment = Enum.TextXAlignment.Left
Box.ClearTextOnFocus = failed
Box.TextWrapped = true

local execu = Instance.new("TextButton")
execu.Size = UDim2.new(0.2, 0, 0.1, 0)
execu.Position = UDim2.new(0.0, 5, 0.8, 27)
execu.BackgroundColor3 = Color3.new(0, 0, 0)
execu.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
execu.BorderSizePixel = 3
execu.Text = "Execute"
execu.BackgroundTransparency = 0 
execu.TextColor3 = Color3.new(255, 255, 255)
execu.Font = Enum.Font.Code
execu.Parent = Ui
execu.TextSize = 19

local clea = Instance.new("TextButton")
clea.Size = UDim2.new(0.2, 0, 0.1, 0)
clea.Position = UDim2.new(0.2, 19, 0.8, 27)
clea.BackgroundColor3 = Color3.new(0, 0, 0)
clea.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
clea.BorderSizePixel = 3
clea.Text = "Clear"
clea.BackgroundTransparency = 0 
clea.TextColor3 = Color3.new(255, 255, 255)
clea.Font = Enum.Font.Code
clea.Parent = Ui
clea.TextSize = 19

local Oppk = Instance.new("TextLabel")
Oppk.Size = UDim2.new(0.2, 0, 0.1, 0)
Oppk.Position = UDim2.new(0.5, 9, 0.8, 27)
Oppk.BackgroundColor3 = Color3.new(0, 0, 0)
Oppk.BorderColor3 = Color3.new(0, 0, 0)
Oppk.BorderSizePixel = 0
Oppk.Text = "Execute on :"
Oppk.BackgroundTransparency = 1
Oppk.TextColor3 = Color3.new(255, 255, 255)
Oppk.Font = Enum.Font.Code
Oppk.Parent = Ui
Oppk.TextSize = 20

local ll = Instance.new("TextLabel")
ll.Size = UDim2.new(0.3, 0, 0.1, 0)
ll.Position = UDim2.new(0.7, 0, 0.8, 27)
ll.BackgroundColor3 = Color3.new(0, 0, 0)
ll.BorderColor3 = Color3.new(0, 0, 0)
ll.BorderSizePixel = 0
ll.Text = "Server"
ll.BackgroundTransparency = 1
ll.TextColor3 = Color3.new(0, 1, 0)
ll.Font = Enum.Font.Code
ll.Parent = Ui
ll.TextSize = 19

---Scripts:

X.MouseButton1Click:Connect(function()
Ui:remove()
end)

clea.MouseButton1Click:Connect(function()
Box.Text = ""
end)

execu.MouseButton1Click:Connect(function()
assert(loadstring(Box.Text))()
end)
  	end    
})

Tab:AddButton({
    Name = "Grab Knife V4",
    Callback = function()
         		loadstring(game:HttpGet("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V4.lua"))()
  end    
})

Tab:AddButton({
    Name = "Ro-Xploit 6.0",
    Callback = function()
         		loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-RoXploit-by-KrystalTeam-9328"))()
  end    
})

Tab:AddButton({
    Name = "Virtual Keyboard",
    Callback = function()
         		loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua"))();
  end    
})

Tab:AddButton({
    Name = "c00lgui v3 edit by verified",
    Callback = function()
      		local msg = Instance.new("Message", workspace)
msg.Text = "c00lgui Reborn V0.5 has loaded"
wait(5.8)
msg:Destroy()
local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Executa o c00lgui 1 segundo antes
task.spawn(function()
    task.wait(1)
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-edit-v3-by-verified-5-32162"))()
end)

-- Aguarda o culgui ser adicionado ao PlayerGui
local gui
repeat
    task.wait(0.1)
    gui = playerGui:FindFirstChild("culgui")
until gui and gui:IsA("ScreenGui")

gui.ResetOnSpawn = false -- Impede que desapareรงa ao morrer

-- Tornar o Frame dentro do culgui movvel
local frame = gui:FindFirstChildWhichIsA("Frame")

if frame then
    local dragging
    local dragStart
    local startPos

    local function onInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end

    local function onInputChanged(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end

    frame.InputBegan:Connect(onInputBegan)
    frame.InputChanged:Connect(onInputChanged)
end
  end    
})

Tab:AddButton({
    Name = "anonymous particles",
    Callback = function()
         		local playerLeaderstats = {}
for i, v in pairs(game.Players:GetChildren()) do
table.insert(playerLeaderstats, v)
end
for i, v in pairs(playerLeaderstats) do
pe = Instance.new("ParticleEmitter",v.Character.Torso)
pe.Texture = "http://www.roblox.com/asset/?id=127476787"
pe.VelocitySpread = 50
end
  end    
})

Tab:AddButton({
    Name = "SG Secret Gui",
    Callback = function()
      		local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SG_GUI_RED_EDITION"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- 4829173
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 250)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 947563
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 5
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- 197263
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 385742
titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.Text = "SG GUI RED EDITION"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 24
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BorderSizePixel = 5
titleLabel.Parent = mainFrame

-- 746292
local fixedButtonsFrame = Instance.new("Frame")
fixedButtonsFrame.Size = UDim2.new(1, 0, 0, 50)
fixedButtonsFrame.Position = UDim2.new(0, 0, 0, 40)
fixedButtonsFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 167895
fixedButtonsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
fixedButtonsFrame.BorderSizePixel = 5
fixedButtonsFrame.Parent = mainFrame

-- 905172
local resetButton = Instance.new("TextButton")
resetButton.Size = UDim2.new(0.5, -2, 1, 0)
resetButton.Position = UDim2.new(0, 0, 0, 0)
resetButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 564738
resetButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
resetButton.BorderSizePixel = 5
resetButton.Text = "RE"
resetButton.Font = Enum.Font.SourceSansBold
resetButton.TextSize = 20
resetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
resetButton.Parent = fixedButtonsFrame
resetButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if character then
        local position = character.HumanoidRootPart.Position
        character:BreakJoints()
        wait(0.1)
        player:LoadCharacter()
        wait(0.1)
        character = player.Character
        if character then
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            humanoidRootPart.CFrame = CFrame.new(position)
        end
    end
end)

-- 371240
local r6Button = Instance.new("TextButton")
r6Button.Size = UDim2.new(0.5, -2, 1, 0)
r6Button.Position = UDim2.new(0.5, 2, 0, 0)
r6Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 102938
r6Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
r6Button.BorderSizePixel = 5
r6Button.Text = "R6"
r6Button.Font = Enum.Font.SourceSansBold
r6Button.TextSize = 20
r6Button.TextColor3 = Color3.fromRGB(255, 255, 255)
r6Button.Parent = fixedButtonsFrame
r6Button.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9wJepMwY", true))()
end)

-- 854726
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -10, 1, -100)
scrollingFrame.Position = UDim2.new(0, 5, 0, 95)
scrollingFrame.BackgroundTransparency = 0 -- 293847
scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 847362
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 5000)
scrollingFrame.ScrollBarThickness = 5
scrollingFrame.BorderSizePixel = 5
scrollingFrame.Parent = mainFrame

local layout = Instance.new("UIListLayout")
layout.Parent = scrollingFrame
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 5)

function _G.createButton(name, text, scriptUrl)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0.9, 0, 0, 50)
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 564930
    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    button.BorderSizePixel = 5
    button.Text = text
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = scrollingFrame
    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
end

_G.createButton("Railgun titan absalom", "Railgun titan absalom", "https://web.archive.org/web/20230520230408/https://pastebin.com/raw/Sq3AWXf5")
_G.createButton("What happened?", "What happened?", "https://pastefy.app/O95WzLrY/raw")
_G.createButton("Jeff The Killer", "Jeff The Killer", "https://pastefy.app/4I8ufh0o/raw")
_G.createButton("Herobrine", "Herobrine", "https://pastefy.app/Rfpe0mkO/raw")
_G.createButton("Samsung Note 7", "Samsung Note 7", "https://pastefy.app/dA68xt1p/raw")
_G.createButton("DEX EXPLORER", "DEX EXPLORER", "https://pastefy.app/g0TuOj5M/raw")
_G.createButton("Ro-Xploit 5.0", "Ro-Xploit 5.0", "https://pastefy.app/5KWLtUiQ/raw")
_G.createButton("F3X TOOL", "F3X TOOL", "https://pastefy.app/MHI03xg5/raw")
_G.createButton("Ouch!", "Ouch!", "https://pastefy.app/h6fhUC6z/raw")
_G.createButton("Air Power", "Air Power", "https://web.archive.org/web/20250129032544/https://pastebin.com/raw/BgPSg5Wg")
_G.createButton("Lua Hammer", "Lua Hammer", "https://pastebin.com/raw/5xkUq66A")
_G.createButton("Draw", "Draw", "https://web.archive.org/web/20230402091723/https://pastebin.com/raw/1322re6a")
_G.createButton("Master of Star", "Master of Star", "https://web.archive.org/web/20230403113552/https://pastebin.com/raw/8YWDfKjF")
_G.createButton("Shedletsky", "Shedletsky", "https://pastefy.app/ILydDmgJ/raw")
_G.createButton("John doe", "John doe", "https://pastebin.com/raw/d2Lin7Ea")
_G.createButton("Thomas", "Thomas", "https://web.archive.org/web/20230403101809/https://pastebin.com/raw/tMr759X7")
_G.createButton("Steve Minecraft", "Steve Minecraft", "https://pastebin.com/raw/2NNDTLjL")
_G.createButton("Mario.exe", "Mario.exe", "https://pastefy.app/aKhOO5r3/raw")
_G.createButton("Dark Wings", "Dark Wings", "https://web.archive.org/web/20190719191941/http://pastebin.com/raw/L0GbxNfL")
_G.createButton("Gnome spam", "Gnome spam", "https://pastefy.app/Zvnbe0Mi/raw")
_G.createButton("Change sky", "Change sky", "https://pastefy.app/HJKdEvB3/raw")
_G.createButton("Eletric Moves", "Eletric Moves", "https://web.archive.org/web/20200606103010/https://pastebin.com/raw/VLCC4Hqx")
_G.createButton("Restaurant Cafe", "Restaurant Cafe", "https://web.archive.org/web/20230331215846/https://pastebin.com/raw/HtUABLMJ")
_G.createButton("Topk3k 3.0", "Topk3k 3.0", "https://web.archive.org/web/20230519070821/https://pastebin.com/raw/cGvhHsmj")
_G.createButton("C00lgui", "C00lgui", "https://rawscripts.net/raw/a-literal-baseplate.-c00lgui-v2-by-rc7-29706")
_G.createButton("ExSer New", "ExSer New", "https://raw.githubusercontent.com/gitluau/luauexser/refs/heads/main/pHzp8uG1PO962o6qucrlP3AJy17eV3B.lua")

print("GUI caricata correttamente. Usa _G.createButton per aggiungere altri pulsanti.")

-- 634859
local rotatingImage = Instance.new("ImageLabel")
rotatingImage.Size = UDim2.new(0, 100, 0, 100)
rotatingImage.Position = UDim2.new(1, -110, 0, 10)
rotatingImage.AnchorPoint = Vector2.new(1, 0)
rotatingImage.Image = "rbxassetid://136906643509432"
rotatingImage.BackgroundTransparency = 1
rotatingImage.Parent = screenGui

local tweenService = game:GetService("TweenService")
local rotationTween = tweenService:Create(
    rotatingImage,
    TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true),
    {Rotation = 360}
)
rotationTween:Play()

local greetingText = Instance.new("TextLabel")
greetingText.Size = UDim2.new(0, 200, 0, 50)
greetingText.Position = UDim2.new(1, -210, 0, 10)
greetingText.AnchorPoint = Vector2.new(1, 0)
greetingText.BackgroundTransparency = 1
greetingText.Text = "Hi " .. player.Name .. "!"
greetingText.Font = Enum.Font.SourceSansBold
greetingText.TextSize = 24
greetingText.TextColor3 = Color3.fromRGB(255, 255, 255)
greetingText.Parent = screenGui

local footerText = Instance.new("TextLabel")
footerText.Size = UDim2.new(0, 300, 0, 50)
footerText.Position = UDim2.new(0.5, -150, 1, -60)
footerText.AnchorPoint = Vector2.new(0.5, 1)
footerText.BackgroundTransparency = 1
footerText.Text = "King"
footerText.Font = Enum.Font.SourceSans
footerText.TextSize = 18
footerText.TextColor3 = Color3.fromRGB(255, 255, 255)
footerText.Parent = screenGui
   end    
})

Tab:AddButton({
    Name = "FE TROLL GUI",
    Callback = function()

--[[

		Gui2Lua™
		10zOfficial
		Version 1.0.0

]]


-- Instances

local logs = Instance.new("ScreenGui")
local gui = Instance.new("Frame")
local _2 = Instance.new("Frame")
local b = Instance.new("TextButton")
local carl = Instance.new("TextButton")
local fir = Instance.new("TextButton")
local ide = Instance.new("TextButton")
local ilsky = Instance.new("TextButton")
local _1x1x1 = Instance.new("TextButton")
local ilu = Instance.new("TextButton")
local lain = Instance.new("TextButton")
local shed = Instance.new("TextButton")
local senifffc = Instance.new("TextButton")
local dp = Instance.new("TextButton")
local hack = Instance.new("TextButton")
local sonic = Instance.new("TextButton")
local b_2 = Instance.new("TextButton")
local oeo = Instance.new("TextLabel")
local back = Instance.new("TextButton")
local go = Instance.new("TextButton")
local _1 = Instance.new("Frame")
local b_3 = Instance.new("TextButton")
local carl_2 = Instance.new("TextButton")
local fir_2 = Instance.new("TextButton")
local cksk = Instance.new("TextButton")
local _1x1x1_2 = Instance.new("TextButton")
local ck = Instance.new("TextButton")
local senifffc_2 = Instance.new("TextButton")
local rc = Instance.new("TextButton")
local b_4 = Instance.new("TextButton")
local ouo = Instance.new("TextLabel")
local ck_2 = Instance.new("TextButton")
local ck_3 = Instance.new("TextButton")
local senifffc_3 = Instance.new("TextButton")
local ck_4 = Instance.new("TextButton")
local ck_5 = Instance.new("TextButton")
local abab = Instance.new("TextLabel")

-- Properties

logs.Name = "logs"
logs.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
logs.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

gui.Name = "gui"
gui.Parent = logs
gui.BackgroundColor3 = Color3.new(1, 1, 1)
gui.BackgroundTransparency = 1
gui.BorderColor3 = Color3.new(0, 0, 0)
gui.Position = UDim2.new(0.144722775, 0, 0.0796813369, 0)
gui.Size = UDim2.new(0, 503, 0, 327)

_2.Name = "2"
_2.Parent = gui
_2.BackgroundColor3 = Color3.new(1, 1, 1)
_2.BorderColor3 = Color3.new(0, 0, 0)
_2.Position = UDim2.new(-0.00141015626, 0, -0.00261533773, 0)
_2.Size = UDim2.new(0, 500, 0, 326)
_2.Visible = false

b.Name = "b"
b.Parent = _2
b.BackgroundColor3 = Color3.new(1, 1, 1)
b.BackgroundTransparency = 0.15000000596046448
b.BorderColor3 = Color3.new(0, 0, 0)
b.Position = UDim2.new(0.0320000015, 10, 0.940871179, 0)
b.Size = UDim2.new(0, 448, 0, 19)
b.Font = Enum.Font.Arial
b.Text = "1x1x1x1 has hacked hint"
b.TextColor3 = Color3.new(0, 0, 0)
b.TextScaled = true
b.TextSize = 41
b.TextWrapped = true

carl.Name = "carl"
carl.Parent = _2
carl.BackgroundColor3 = Color3.new(1, 1, 1)
carl.BackgroundTransparency = 0.15000000596046448
carl.BorderColor3 = Color3.new(0, 0, 0)
carl.Position = UDim2.new(0.338, 10, 0.342711657, 0)
carl.Size = UDim2.new(0, 142, 0, 49)
carl.Font = Enum.Font.Arial
carl.Text = "carl wheezer"
carl.TextColor3 = Color3.new(0, 0, 0)
carl.TextScaled = true
carl.TextSize = 41
carl.TextWrapped = true

fir.Name = "fir"
fir.Parent = _2
fir.BackgroundColor3 = Color3.new(1, 1, 1)
fir.BackgroundTransparency = 0.15000000596046448
fir.BorderColor3 = Color3.new(0, 0, 0)
fir.Position = UDim2.new(0.634000003, 10, 0.680134952, 0)
fir.Size = UDim2.new(0, 142, 0, 49)
fir.Font = Enum.Font.Arial
fir.Text = "blue fire all"
fir.TextColor3 = Color3.new(0, 0, 0)
fir.TextScaled = true
fir.TextSize = 41
fir.TextWrapped = true

ide.Name = "ide"
ide.Parent = _2
ide.BackgroundColor3 = Color3.new(1, 1, 1)
ide.BackgroundTransparency = 0.15000000596046448
ide.BorderColor3 = Color3.new(0, 0, 0)
ide.Position = UDim2.new(0.0419999994, 10, 0.51142329, 0)
ide.Size = UDim2.new(0, 142, 0, 49)
ide.Font = Enum.Font.Arial
ide.Text = "IDE was here"
ide.TextColor3 = Color3.new(0, 0, 0)
ide.TextScaled = true
ide.TextSize = 41
ide.TextWrapped = true

ilsky.Name = "ilsky"
ilsky.Parent = _2
ilsky.BackgroundColor3 = Color3.new(1, 1, 1)
ilsky.BackgroundTransparency = 0.15000000596046448
ilsky.BorderColor3 = Color3.new(0, 0, 0)
ilsky.Position = UDim2.new(0.338, 10, 0.51142329, 0)
ilsky.Size = UDim2.new(0, 142, 0, 49)
ilsky.Font = Enum.Font.Arial
ilsky.Text = "illuminati skybox"
ilsky.TextColor3 = Color3.new(0, 0, 0)
ilsky.TextScaled = true
ilsky.TextSize = 41
ilsky.TextWrapped = true

_1x1x1.Name = "1x1x1"
_1x1x1.Parent = _2
_1x1x1.BackgroundColor3 = Color3.new(1, 1, 1)
_1x1x1.BackgroundTransparency = 0.15000000596046448
_1x1x1.BorderColor3 = Color3.new(0, 0, 0)
_1x1x1.Position = UDim2.new(0.338, 10, 0.680134952, 0)
_1x1x1.Size = UDim2.new(0, 142, 0, 49)
_1x1x1.Font = Enum.Font.Arial
_1x1x1.Text = "1x1x1x1 theme"
_1x1x1.TextColor3 = Color3.new(0, 0, 0)
_1x1x1.TextScaled = true
_1x1x1.TextSize = 41
_1x1x1.TextWrapped = true

ilu.Name = "ilu"
ilu.Parent = _2
ilu.BackgroundColor3 = Color3.new(1, 1, 1)
ilu.BackgroundTransparency = 0.15000000596046448
ilu.BorderColor3 = Color3.new(0, 0, 0)
ilu.Position = UDim2.new(0.0419999994, 10, 0.173999995, 0)
ilu.Size = UDim2.new(0, 142, 0, 49)
ilu.Font = Enum.Font.Arial
ilu.Text = "Illuminati"
ilu.TextColor3 = Color3.new(0, 0, 0)
ilu.TextScaled = true
ilu.TextSize = 41
ilu.TextWrapped = true

lain.Name = "lain"
lain.Parent = _2
lain.BackgroundColor3 = Color3.new(1, 1, 1)
lain.BackgroundTransparency = 0.15000000596046448
lain.BorderColor3 = Color3.new(0, 0, 0)
lain.Position = UDim2.new(0.338, 10, 0.173999995, 0)
lain.Size = UDim2.new(0, 142, 0, 49)
lain.Font = Enum.Font.Arial
lain.Text = "lain particles"
lain.TextColor3 = Color3.new(0, 0, 0)
lain.TextScaled = true
lain.TextSize = 41
lain.TextWrapped = true

shed.Name = "shed"
shed.Parent = _2
shed.BackgroundColor3 = Color3.new(1, 1, 1)
shed.BackgroundTransparency = 0.15000000596046448
shed.BorderColor3 = Color3.new(0, 0, 0)
shed.Position = UDim2.new(0.634000003, 10, 0.342711657, 0)
shed.Size = UDim2.new(0, 142, 0, 49)
shed.Font = Enum.Font.Arial
shed.Text = "shedletsky particles"
shed.TextColor3 = Color3.new(0, 0, 0)
shed.TextScaled = true
shed.TextSize = 41
shed.TextWrapped = true

senifffc.Name = "senifffc"
senifffc.Parent = _2
senifffc.BackgroundColor3 = Color3.new(1, 1, 1)
senifffc.BackgroundTransparency = 0.15000000596046448
senifffc.BorderColor3 = Color3.new(0, 0, 0)
senifffc.Position = UDim2.new(0.0419999994, 10, 0.680134952, 0)
senifffc.Size = UDim2.new(0, 142, 0, 49)
senifffc.Font = Enum.Font.Arial
senifffc.Text = "senik meme all"
senifffc.TextColor3 = Color3.new(0, 0, 0)
senifffc.TextScaled = true
senifffc.TextSize = 41
senifffc.TextWrapped = true

dp.Name = "dp"
dp.Parent = _2
dp.BackgroundColor3 = Color3.new(1, 1, 1)
dp.BackgroundTransparency = 0.15000000596046448
dp.BorderColor3 = Color3.new(0, 0, 0)
dp.Position = UDim2.new(0.634000003, 10, 0.173999995, 0)
dp.Size = UDim2.new(0, 142, 0, 49)
dp.Font = Enum.Font.Arial
dp.Text = "clear particles"
dp.TextColor3 = Color3.new(0, 0, 0)
dp.TextScaled = true
dp.TextSize = 41
dp.TextWrapped = true

hack.Name = "hack"
hack.Parent = _2
hack.BackgroundColor3 = Color3.new(1, 1, 1)
hack.BackgroundTransparency = 0.15000000596046448
hack.BorderColor3 = Color3.new(0, 0, 0)
hack.Position = UDim2.new(0.634000003, 10, 0.51142329, 0)
hack.Size = UDim2.new(0, 142, 0, 49)
hack.Font = Enum.Font.Arial
hack.Text = "hacker particles"
hack.TextColor3 = Color3.new(0, 0, 0)
hack.TextScaled = true
hack.TextSize = 41
hack.TextWrapped = true

sonic.Name = "sonic"
sonic.Parent = _2
sonic.BackgroundColor3 = Color3.new(1, 1, 1)
sonic.BackgroundTransparency = 0.15000000596046448
sonic.BorderColor3 = Color3.new(0, 0, 0)
sonic.Position = UDim2.new(0.0419999994, 10, 0.342711657, 0)
sonic.Size = UDim2.new(0, 142, 0, 49)
sonic.Font = Enum.Font.Arial
sonic.Text = "senik dah  hejjogg"
sonic.TextColor3 = Color3.new(0, 0, 0)
sonic.TextScaled = true
sonic.TextSize = 41
sonic.TextWrapped = true

b_2.Name = "b"
b_2.Parent = _2
b_2.BackgroundColor3 = Color3.new(1, 1, 1)
b_2.BackgroundTransparency = 0.15000000596046448
b_2.BorderColor3 = Color3.new(0, 0, 0)
b_2.Position = UDim2.new(0.0320000015, 10, 0.866404891, 0)
b_2.Size = UDim2.new(0, 448, 0, 19)
b_2.Font = Enum.Font.Arial
b_2.Text = "1x1x1x1 billboard text"
b_2.TextColor3 = Color3.new(0, 0, 0)
b_2.TextScaled = true
b_2.TextSize = 41
b_2.TextWrapped = true

oeo.Name = "oeo"
oeo.Parent = _2
oeo.BackgroundColor3 = Color3.new(1, 1, 1)
oeo.BorderColor3 = Color3.new(0, 0, 0)
oeo.Size = UDim2.new(0, 500, 0, 48)
oeo.Font = Enum.Font.Arial
oeo.Text = "ULTIMATE TROLL FE GUI"
oeo.TextColor3 = Color3.new(0, 0, 0)
oeo.TextSize = 43
oeo.TextWrapped = true

back.Name = "back"
back.Parent = gui
back.BackgroundColor3 = Color3.new(1, 1, 1)
back.BorderColor3 = Color3.new(0, 0, 0)
back.Position = UDim2.new(1.0091579, 0, 0.761066496, 0)
back.Size = UDim2.new(0, 68, 0, 32)
back.Font = Enum.Font.SourceSans
back.Text = "<"
back.TextColor3 = Color3.new(0, 0, 0)
back.TextSize = 67

go.Name = "go"
go.Parent = gui
go.BackgroundColor3 = Color3.new(1, 1, 1)
go.BorderColor3 = Color3.new(0, 0, 0)
go.Position = UDim2.new(1.15627515, 0, 0.761066496, 0)
go.Size = UDim2.new(0, 68, 0, 32)
go.Font = Enum.Font.SourceSans
go.Text = ">"
go.TextColor3 = Color3.new(0, 0, 0)
go.TextSize = 67
go.TextWrapped = true

_1.Name = "1"
_1.Parent = gui
_1.BackgroundColor3 = Color3.new(1, 1, 1)
_1.BorderColor3 = Color3.new(0, 0, 0)
_1.Position = UDim2.new(-0.00141015626, 0, -0.00261533773, 0)
_1.Size = UDim2.new(0, 500, 0, 326)

b_3.Name = "b"
b_3.Parent = _1
b_3.BackgroundColor3 = Color3.new(1, 1, 1)
b_3.BackgroundTransparency = 0.15000000596046448
b_3.BorderColor3 = Color3.new(0, 0, 0)
b_3.Position = UDim2.new(0.0320000015, 10, 0.940871179, 0)
b_3.Size = UDim2.new(0, 448, 0, 19)
b_3.Font = Enum.Font.Arial
b_3.Text = "c00lkidd has hacked hint"
b_3.TextColor3 = Color3.new(0, 0, 0)
b_3.TextScaled = true
b_3.TextSize = 41
b_3.TextWrapped = true

carl_2.Name = "carl"
carl_2.Parent = _1
carl_2.BackgroundColor3 = Color3.new(1, 1, 1)
carl_2.BackgroundTransparency = 0.15000000596046448
carl_2.BorderColor3 = Color3.new(0, 0, 0)
carl_2.Position = UDim2.new(0.338, 10, 0.173999995, 0)
carl_2.Size = UDim2.new(0, 142, 0, 49)
carl_2.Font = Enum.Font.Arial
carl_2.Text = "body mesh spam (from v3nox)"
carl_2.TextColor3 = Color3.new(0, 0, 0)
carl_2.TextScaled = true
carl_2.TextSize = 41
carl_2.TextWrapped = true

fir_2.Name = "fir"
fir_2.Parent = _1
fir_2.BackgroundColor3 = Color3.new(1, 1, 1)
fir_2.BackgroundTransparency = 0.15000000596046448
fir_2.BorderColor3 = Color3.new(0, 0, 0)
fir_2.Position = UDim2.new(0.634000003, 10, 0.342711657, 0)
fir_2.Size = UDim2.new(0, 142, 0, 49)
fir_2.Font = Enum.Font.Arial
fir_2.Text = "red fire all"
fir_2.TextColor3 = Color3.new(0, 0, 0)
fir_2.TextScaled = true
fir_2.TextSize = 41
fir_2.TextWrapped = true

cksk.Name = "cksk"
cksk.Parent = _1
cksk.BackgroundColor3 = Color3.new(1, 1, 1)
cksk.BackgroundTransparency = 0.15000000596046448
cksk.BorderColor3 = Color3.new(0, 0, 0)
cksk.Position = UDim2.new(0.338, 10, 0.342711657, 0)
cksk.Size = UDim2.new(0, 142, 0, 49)
cksk.Font = Enum.Font.Arial
cksk.Text = "c00lkidd skybox"
cksk.TextColor3 = Color3.new(0, 0, 0)
cksk.TextScaled = true
cksk.TextSize = 41
cksk.TextWrapped = true

_1x1x1_2.Name = "1x1x1"
_1x1x1_2.Parent = _1
_1x1x1_2.BackgroundColor3 = Color3.new(1, 1, 1)
_1x1x1_2.BackgroundTransparency = 0.15000000596046448
_1x1x1_2.BorderColor3 = Color3.new(0, 0, 0)
_1x1x1_2.Position = UDim2.new(0.634000003, 10, 0.173999995, 0)
_1x1x1_2.Size = UDim2.new(0, 142, 0, 49)
_1x1x1_2.Font = Enum.Font.Arial
_1x1x1_2.Text = "c00lkidd theme"
_1x1x1_2.TextColor3 = Color3.new(0, 0, 0)
_1x1x1_2.TextScaled = true
_1x1x1_2.TextSize = 41
_1x1x1_2.TextWrapped = true

ck.Name = "ck"
ck.Parent = _1
ck.BackgroundColor3 = Color3.new(1, 1, 1)
ck.BackgroundTransparency = 0.15000000596046448
ck.BorderColor3 = Color3.new(0, 0, 0)
ck.Position = UDim2.new(0.0419999994, 10, 0.173999995, 0)
ck.Size = UDim2.new(0, 142, 0, 49)
ck.Font = Enum.Font.Arial
ck.Text = "c00lkidd decal"
ck.TextColor3 = Color3.new(0, 0, 0)
ck.TextScaled = true
ck.TextSize = 41
ck.TextWrapped = true

senifffc_2.Name = "senifffc"
senifffc_2.Parent = _1
senifffc_2.BackgroundColor3 = Color3.new(1, 1, 1)
senifffc_2.BackgroundTransparency = 0.15000000596046448
senifffc_2.BorderColor3 = Color3.new(0, 0, 0)
senifffc_2.Position = UDim2.new(0.0419999994, 10, 0.51142329, 0)
senifffc_2.Size = UDim2.new(0, 142, 0, 49)
senifffc_2.Font = Enum.Font.Arial
senifffc_2.Text = "skrublordz skybox"
senifffc_2.TextColor3 = Color3.new(0, 0, 0)
senifffc_2.TextScaled = true
senifffc_2.TextSize = 41
senifffc_2.TextWrapped = true

rc.Name = "rc"
rc.Parent = _1
rc.BackgroundColor3 = Color3.new(1, 1, 1)
rc.BackgroundTransparency = 0.15000000596046448
rc.BorderColor3 = Color3.new(0, 0, 0)
rc.Position = UDim2.new(0.0419999994, 10, 0.342711657, 0)
rc.Size = UDim2.new(0, 142, 0, 49)
rc.Font = Enum.Font.Arial
rc.Text = "random color ur body"
rc.TextColor3 = Color3.new(0, 0, 0)
rc.TextScaled = true
rc.TextSize = 41
rc.TextWrapped = true

b_4.Name = "b"
b_4.Parent = _1
b_4.BackgroundColor3 = Color3.new(1, 1, 1)
b_4.BackgroundTransparency = 0.15000000596046448
b_4.BorderColor3 = Color3.new(0, 0, 0)
b_4.Position = UDim2.new(0.0320000015, 10, 0.866404891, 0)
b_4.Size = UDim2.new(0, 448, 0, 19)
b_4.Font = Enum.Font.Arial
b_4.Text = "c00lkidd billboard text"
b_4.TextColor3 = Color3.new(0, 0, 0)
b_4.TextScaled = true
b_4.TextSize = 41
b_4.TextWrapped = true

ouo.Name = "ouo"
ouo.Parent = _1
ouo.BackgroundColor3 = Color3.new(1, 1, 1)
ouo.BorderColor3 = Color3.new(0, 0, 0)
ouo.Size = UDim2.new(0, 500, 0, 48)
ouo.Font = Enum.Font.Arial
ouo.Text = "ULTIMATE TROLL FE GUI"
ouo.TextColor3 = Color3.new(0, 0, 0)
ouo.TextSize = 43
ouo.TextWrapped = true

ck_2.Name = "ck"
ck_2.Parent = _1
ck_2.BackgroundColor3 = Color3.new(1, 1, 1)
ck_2.BackgroundTransparency = 0.15000000596046448
ck_2.BorderColor3 = Color3.new(0, 0, 0)
ck_2.Position = UDim2.new(0.338, 10, 0.51142329, 0)
ck_2.Size = UDim2.new(0, 142, 0, 49)
ck_2.Font = Enum.Font.Arial
ck_2.Text = "skrublordz decal"
ck_2.TextColor3 = Color3.new(0, 0, 0)
ck_2.TextScaled = true
ck_2.TextSize = 41
ck_2.TextWrapped = true

ck_3.Name = "ck"
ck_3.Parent = _1
ck_3.BackgroundColor3 = Color3.new(1, 1, 1)
ck_3.BackgroundTransparency = 0.15000000596046448
ck_3.BorderColor3 = Color3.new(0, 0, 0)
ck_3.Position = UDim2.new(0.634000003, 10, 0.51142329, 0)
ck_3.Size = UDim2.new(0, 142, 0, 49)
ck_3.Font = Enum.Font.Arial
ck_3.Text = "windows 98 particles"
ck_3.TextColor3 = Color3.new(0, 0, 0)
ck_3.TextScaled = true
ck_3.TextSize = 41
ck_3.TextWrapped = true

senifffc_3.Name = "senifffc"
senifffc_3.Parent = _1
senifffc_3.BackgroundColor3 = Color3.new(1, 1, 1)
senifffc_3.BackgroundTransparency = 0.15000000596046448
senifffc_3.BorderColor3 = Color3.new(0, 0, 0)
senifffc_3.Position = UDim2.new(0.0419999994, 10, 0.680134952, 0)
senifffc_3.Size = UDim2.new(0, 142, 0, 49)
senifffc_3.Font = Enum.Font.Arial
senifffc_3.Text = "bluescreen error skybox"
senifffc_3.TextColor3 = Color3.new(0, 0, 0)
senifffc_3.TextScaled = true
senifffc_3.TextSize = 41
senifffc_3.TextWrapped = true

ck_4.Name = "ck"
ck_4.Parent = _1
ck_4.BackgroundColor3 = Color3.new(1, 1, 1)
ck_4.BackgroundTransparency = 0.15000000596046448
ck_4.BorderColor3 = Color3.new(0, 0, 0)
ck_4.Position = UDim2.new(0.338, 10, 0.680134952, 0)
ck_4.Size = UDim2.new(0, 142, 0, 49)
ck_4.Font = Enum.Font.Arial
ck_4.Text = "trollface all"
ck_4.TextColor3 = Color3.new(0, 0, 0)
ck_4.TextScaled = true
ck_4.TextSize = 41
ck_4.TextWrapped = true

ck_5.Name = "ck"
ck_5.Parent = _1
ck_5.BackgroundColor3 = Color3.new(1, 1, 1)
ck_5.BackgroundTransparency = 0.15000000596046448
ck_5.BorderColor3 = Color3.new(0, 0, 0)
ck_5.Position = UDim2.new(0.634000003, 10, 0.680134952, 0)
ck_5.Size = UDim2.new(0, 142, 0, 49)
ck_5.Font = Enum.Font.Arial
ck_5.Text = "snoopdogg all"
ck_5.TextColor3 = Color3.new(0, 0, 0)
ck_5.TextScaled = true
ck_5.TextSize = 41
ck_5.TextWrapped = true

abab.Name = "abab"
abab.Parent = gui
abab.BackgroundColor3 = Color3.new(1, 1, 1)
abab.BorderColor3 = Color3.new(0, 0, 0)
abab.Position = UDim2.new(1.00915778, 0, 0.559231699, 0)
abab.Size = UDim2.new(0, 142, 0, 55)
abab.Font = Enum.Font.Arial
abab.Text = "Team Zigma  enjoy."
abab.TextColor3 = Color3.new(0, 0, 0)
abab.TextSize = 20
abab.TextWrapped = true

-- Scripts

local function RUNE_fake_script() -- gui.LocalScript 
	local script = Instance.new('LocalScript', gui)

	local UIS = game:GetService("UserInputService")
	local frame = script.Parent
	
	local dragToggle = nil
	local dragSpeed = 0.16
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale,startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService("TweenService"):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(RUNE_fake_script)()
local function PQLNXE_fake_script() -- b.Script 
	local script = Instance.new('Script', b)

	function click()
		local h = Instance.new("Hint", workspace)
		h.Text = "1X1X1X1 HAS HACKED THIS SERVER!"
		local mensagem = "1x1x1x1 HAS HACKED THIS SERVER!"
		
		for i = 1, #mensagem do
			h.Text = string.sub(mensagem, 1, i)
			wait(0.1)
		end
	end
	
	script.Parent.MouseButton1Down:Connect(click)
end
coroutine.wrap(PQLNXE_fake_script)()
local function BBVZI_fake_script() -- carl.Script 
	local script = Instance.new('Script', carl)

	function click()
		s = Instance.new("Sky")
		s.Name = "Sky"
		s.Parent = game.Lighting
		s.SkyboxBk = "http://www.roblox.com/asset/?id=18658805943"
		s.SkyboxDn = "http://www.roblox.com/asset/?id=18658805943"
		s.SkyboxFt = "http://www.roblox.com/asset/?id=18658805943"
		s.SkyboxLf = "http://www.roblox.com/asset/?id=18658805943"
		s.SkyboxRt = "http://www.roblox.com/asset/?id=18658805943"
		s.SkyboxUp = "http://www.roblox.com/asset/?id=18658805943"
		game.Lighting.TimeOfDay = 12
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(BBVZI_fake_script)()
local function NMTVBX_fake_script() -- fir.Script 
	local script = Instance.new('Script', fir)

	script.Parent.MouseButton1Click:Connect(function()
		for _, player in pairs(game.Players:GetPlayers()) do
			if player.Character then
				for _, part in pairs(player.Character:GetChildren()) do
					if part:IsA("BasePart") then
						local fire = Instance.new("Fire")
						fire.Size = 10
						fire.Heat = 8
	
						-- Cor azul!
						fire.Color = Color3.fromRGB(0, 150, 255)           -- chama azul
						fire.SecondaryColor = Color3.fromRGB(0, 60, 255)   -- base azul escura
	
						fire.Parent = part
					end
				end
			end
		end
	end)
	
end
coroutine.wrap(NMTVBX_fake_script)()
local function OCTYZ_fake_script() -- ide.Script 
	local script = Instance.new('Script', ide)

	function click()
		function exPro(root)
			for _, v in pairs(root:GetChildren()) do
				if v:IsA("Decal") and v.Texture ~= "http://www.roblox.com/asset/?id=135750100740030" then
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
					One.Texture = "http://www.roblox.com/asset/?id=135750100740030" -- CHANGE ID
					Two.Texture = "http://www.roblox.com/asset/?id=135750100740030" -- CHANGE ID
					Three.Texture = "http://www.roblox.com/asset/?id=135750100740030" -- CHANGE ID
					Four.Texture = "http://www.roblox.com/asset/?id=135750100740030" -- CHANGE ID
					Five.Texture = "http://www.roblox.com/asset/?id=135750100740030" -- CHANGE ID
					Six.Texture = "http://www.roblox.com/asset/?id=135750100740030" -- CHANGE ID
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
		function asdf(root)
			for _, v in pairs(root:GetChildren()) do
				asdf(v)
			end
		end
		exPro(game.Workspace)
		asdf(game.Workspace)
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(OCTYZ_fake_script)()
local function ESEM_fake_script() -- ilsky.Script 
	local script = Instance.new('Script', ilsky)

	function click()
		s = Instance.new("Sky")
		s.Name = "Sky"
		s.Parent = game.Lighting
		s.SkyboxBk = "http://www.roblox.com/asset/?id=719516751"
		s.SkyboxDn = "http://www.roblox.com/asset/?id=719516751"
		s.SkyboxFt = "http://www.roblox.com/asset/?id=719516751"
		s.SkyboxLf = "http://www.roblox.com/asset/?id=719516751"
		s.SkyboxRt = "http://www.roblox.com/asset/?id=719516751"
		s.SkyboxUp = "http://www.roblox.com/asset/?id=719516751"
		game.Lighting.TimeOfDay = 12
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(ESEM_fake_script)()
local function SINOTI_fake_script() -- _1x1x1.Script 
	local script = Instance.new('Script', _1x1x1)

	function click()
		for i,v in pairs(game.Workspace:GetChildren()) do
			if v.className == "Sound" then
				v:Stop()
				v:Remove()	
			end	
		end
		s = Instance.new("Sound",Workspace)
		s.SoundId = "rbxassetid://139488665764275"
		s.Volume = 10
		s.Looped = true
		s.Pitch = 1
		s:Play()
		wait(.1)
		s:Play()
	end
	
	script.Parent.MouseButton1Down:Connect(click)
end
coroutine.wrap(SINOTI_fake_script)()
local function FMSUVI_fake_script() -- ilu.Script 
	local script = Instance.new('Script', ilu)

	function click()
		function exPro(root)
			for _, v in pairs(root:GetChildren()) do
				if v:IsA("Decal") and v.Texture ~= "http://www.roblox.com/asset/?id=241361943" then
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
					One.Texture = "http://www.roblox.com/asset/?id=241361943" -- CHANGE ID
					Two.Texture = "http://www.roblox.com/asset/?id=241361943" -- CHANGE ID
					Three.Texture = "http://www.roblox.com/asset/?id=241361943" -- CHANGE ID
					Four.Texture = "http://www.roblox.com/asset/?id=241361943" -- CHANGE ID
					Five.Texture = "http://www.roblox.com/asset/?id=241361943" -- CHANGE ID
					Six.Texture = "http://www.roblox.com/asset/?id=241361943" -- CHANGE ID
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
		function asdf(root)
			for _, v in pairs(root:GetChildren()) do
				asdf(v)
			end
		end
		exPro(game.Workspace)
		asdf(game.Workspace)
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(FMSUVI_fake_script)()
local function NLOSFC_fake_script() -- lain.Script 
	local script = Instance.new('Script', lain)

	script.Parent.MouseButton1Click:Connect(function()
		for i, v in pairs(game.Players:GetChildren()) do
			local emit = Instance.new("ParticleEmitter")
			emit.Parent = v.Character.Head
			emit.Texture = "rbxassetid://17813642497" 
			emit.VelocitySpread = 1
	
			
			emit.Size = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 4),  
				NumberSequenceKeypoint.new(1, 4)    
			})
	
		
			emit.Lifetime = NumberRange.new(5, 6)
			emit.Rate = 20
			emit.Speed = NumberRange.new(10, 15)
		end
	end)
end
coroutine.wrap(NLOSFC_fake_script)()
local function ANNQGMI_fake_script() -- shed.Script 
	local script = Instance.new('Script', shed)

	-- SCRIPT MADE BY @thewavehggggggg / Java1x7x9x8 --
	script.Parent.MouseButton1Click:Connect(function()
		for i, v in pairs(game.Players:GetChildren()) do
			local emit = Instance.new("ParticleEmitter")
			emit.Parent = v.Character.Head
			emit.Texture = "rbxassetid://85312612489831" 
			emit.VelocitySpread = 1
		end
	end)
end
coroutine.wrap(ANNQGMI_fake_script)()
local function JUZY_fake_script() -- senifffc.Script 
	local script = Instance.new('Script', senifffc)

	function click()
		for i,v in pairs(game.Players:GetChildren()) do
			if v.Character:FindFirstChild("Head") then
				gui1=Instance.new("BillboardGui")
				gui1.Parent = v.Character.Head
				gui1.Adornee = v.Character.Head
				gui1.Size=UDim2.new(2.5,0,2.5,0)
				gui1.StudsOffset=Vector3.new(0,0.2,0)
				gui1.AlwaysOnTop = true
				text1=Instance.new("ImageLabel")
				text1.Image = "http://www.roblox.com/asset/?id=171217291"
				text1.Size=UDim2.new(1,0,1,0)
				text1.Position=UDim2.new(0,0,0,0)
				text1.BackgroundTransparency = 1
				text1.Parent=gui1
				v.Character.Head.Transparency = 1
			end
		end
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(JUZY_fake_script)()
local function IJNV_fake_script() -- dp.Script 
	local script = Instance.new('Script', dp)

	script.Parent.MouseButton1Click:Connect(function()
		for _, player in pairs(game.Players:GetPlayers()) do
			if player.Character then
				for _, descendant in pairs(player.Character:GetDescendants()) do
					if descendant:IsA("ParticleEmitter") then
						descendant:Destroy()
					end
				end
			end
		end
	end)
end
coroutine.wrap(IJNV_fake_script)()
local function NRRFZ_fake_script() -- hack.Script 
	local script = Instance.new('Script', hack)

	-- SCRIPT MADE BY @thewavehggggggg / Java1x7x9x8 --
	script.Parent.MouseButton1Click:Connect(function()
		for i, v in pairs(game.Players:GetChildren()) do
			local emit = Instance.new("ParticleEmitter")
			emit.Parent = v.Character.Head
			emit.Texture = "rbxassetid://13058161205" 
			emit.VelocitySpread = 1
		end
	end)
end
coroutine.wrap(NRRFZ_fake_script)()
local function YXGMRO_fake_script() -- sonic.Script 
	local script = Instance.new('Script', sonic)

	function click()
		function exPro(root)
			for _, v in pairs(root:GetChildren()) do
				if v:IsA("Decal") and v.Texture ~= "http://www.roblox.com/asset/?id=171217291" then
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
					One.Texture = "http://www.roblox.com/asset/?id=171217291" -- CHANGE ID
					Two.Texture = "http://www.roblox.com/asset/?id=171217291" -- CHANGE ID
					Three.Texture = "http://www.roblox.com/asset/?id=171217291" -- CHANGE ID
					Four.Texture = "http://www.roblox.com/asset/?id=171217291" -- CHANGE ID
					Five.Texture = "http://www.roblox.com/asset/?id=171217291" -- CHANGE ID
					Six.Texture = "http://www.roblox.com/asset/?id=171217291" -- CHANGE ID
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
		function asdf(root)
			for _, v in pairs(root:GetChildren()) do
				asdf(v)
			end
		end
		exPro(game.Workspace)
		asdf(game.Workspace)
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(YXGMRO_fake_script)()
local function BFFJPB_fake_script() -- b_2.Script 
	local script = Instance.new('Script', b_2)

	function click()
		local Players = game:GetService("Players")
	
		-- Função para criar e exibir o Hint animado na cabeça dos jogadores
		local function exibirHintAnimado()
			-- Percorrer todos os jogadores no jogo
			for _, player in pairs(Players:GetPlayers()) do
				-- Verifica se o jogador tem um personagem
				if player.Character and player.Character:FindFirstChild("Head") then
					-- Criar o BillboardGui que será usado para mostrar a mensagem na cabeça
					local billboard = Instance.new("BillboardGui")
					billboard.Size = UDim2.new(0, 400, 0, 50)  -- Tamanho da área onde o texto será exibido
					billboard.Adornee = player.Character.Head  -- Posiciona o BillboardGui na cabeça do personagem
					billboard.StudsOffset = Vector3.new(0, 3, 0)  -- Distância da câmera (ajuste para mais alto ou mais baixo)
					billboard.Parent = player.Character.Head  -- Coloca o BillboardGui na cabeça do personagem
	
					-- Criar o TextLabel dentro do BillboardGui
					local textLabel = Instance.new("TextLabel")
					textLabel.Size = UDim2.new(1, 0, 1, 0)  -- Preenche toda a área do BillboardGui
					textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Cor do texto (vermelho)
					textLabel.TextStrokeTransparency = 0.5  -- Transparência da borda do texto
					textLabel.TextSize = 30  -- Tamanho do texto
					textLabel.BackgroundTransparency = 1  -- Sem fundo para o TextLabel
					textLabel.Text = ""  -- Começa sem texto
					textLabel.Parent = billboard  -- Coloca o TextLabel dentro do BillboardGui
	
					-- A mensagem que queremos "digitar"
					local mensagem = "1X1X1X1"
	
					-- Função que vai "digitar" a mensagem
					for i = 1, #mensagem do
						textLabel.Text = string.sub(mensagem, 1, i)  -- Mostra uma parte da mensagem até o índice i
						wait(0.1)  -- Espera um pequeno intervalo para a animação (ajuste esse valor para mais rápido ou devagar)
					end
				end
			end
		end
	
		-- Chama a função para exibir o hint animado
		exibirHintAnimado()
	
	end
	
	script.Parent.MouseButton1Down:Connect(click)
end
coroutine.wrap(BFFJPB_fake_script)()
local function TKKXJNO_fake_script() -- back.LocalScript 
	local script = Instance.new('LocalScript', back)

	local frame1 = script.Parent.Parent["1"]
	local frame2 = script.Parent.Parent["2"]
	
	function OnClicked()
		if frame2.Visible == true then
			frame2.Visible = false
			frame1.Visible = true
		end
	end
	
	script.Parent.MouseButton1Click:Connect(OnClicked)
end
coroutine.wrap(TKKXJNO_fake_script)()
local function UVJV_fake_script() -- go.LocalScript 
	local script = Instance.new('LocalScript', go)

	local frame1 = script.Parent.Parent["1"]
	local frame2 = script.Parent.Parent["2"]
	
	function OnClicked()
		if frame1.Visible == true then
			frame1.Visible = false
			frame2.Visible = true
		end
	end
	
	script.Parent.MouseButton1Click:Connect(OnClicked)
end
coroutine.wrap(UVJV_fake_script)()
local function IYCUBFS_fake_script() -- b_3.Script 
	local script = Instance.new('Script', b_3)

	function click()
		local h = Instance.new("Hint", workspace)
		h.Text = "TEAM C00LKIDD HAS HACKED THIS SERVER!"
		local mensagem = "TEAM C00LKIDD HAS HACKED THIS SERVER!"
		
		for i = 1, #mensagem do
			h.Text = string.sub(mensagem, 1, i)
			wait(0.1)
		end
	end
	
	script.Parent.MouseButton1Down:Connect(click)
end
coroutine.wrap(IYCUBFS_fake_script)()
local function SWGHH_fake_script() -- carl_2.LocalScript 
	local script = Instance.new('LocalScript', carl_2)

	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local button = script.Parent
	
	local meshes = {
		Enum.MeshType.Brick,
		Enum.MeshType.Cylinder,
		Enum.MeshType.Head,
		Enum.MeshType.Sphere,
		Enum.MeshType.Torso,
		Enum.MeshType.Wedge
	}
	
	button.MouseButton1Down:Connect(function()
		while wait(0.4) do
			local character = player.Character
			if character then
				for _, part in pairs(character:GetDescendants()) do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						-- Remove mesh antiga se houver
						local oldMesh = part:FindFirstChildOfClass("SpecialMesh")
						if oldMesh then
							oldMesh:Destroy()
						end
	
						-- Adiciona nova mesh aleatória
						local mesh = Instance.new("SpecialMesh")
						mesh.MeshType = meshes[math.random(1, #meshes)]
						mesh.Parent = part
	
						
					end
				end
			end
		end
	end)
	
end
coroutine.wrap(SWGHH_fake_script)()
local function IMNXGAF_fake_script() -- fir_2.Script 
	local script = Instance.new('Script', fir_2)

	script.Parent.MouseButton1Click:Connect(function()
		for _, player in pairs(game.Players:GetPlayers()) do
			if player.Character then
				for _, part in pairs(player.Character:GetChildren()) do
					if part:IsA("BasePart") then
						local fire = Instance.new("Fire")
						fire.Size = 10
						fire.Heat = 8
	
						-- Cor azul!
						fire.Color = Color3.fromRGB(255, 0, 0)           -- chama azul
						fire.SecondaryColor = Color3.fromRGB(0, 60, 255)   -- base azul escura
	
						fire.Parent = part
					end
				end
			end
		end
	end)
	
end
coroutine.wrap(IMNXGAF_fake_script)()
local function EVLMU_fake_script() -- cksk.Script 
	local script = Instance.new('Script', cksk)

	function click()
		s = Instance.new("Sky")
		s.Name = "Sky"
		s.Parent = game.Lighting
		s.SkyboxBk = "http://www.roblox.com/asset/?id=113683131806910"
		s.SkyboxDn = "http://www.roblox.com/asset/?id=113683131806910"
		s.SkyboxFt = "http://www.roblox.com/asset/?id=113683131806910"
		s.SkyboxLf = "http://www.roblox.com/asset/?id=113683131806910"
		s.SkyboxRt = "http://www.roblox.com/asset/?id=113683131806910"
		s.SkyboxUp = "http://www.roblox.com/asset/?id=113683131806910"
		game.Lighting.TimeOfDay = 12
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(EVLMU_fake_script)()
local function FKTS_fake_script() -- _1x1x1_2.Script 
	local script = Instance.new('Script', _1x1x1_2)

	function click()
		for i,v in pairs(game.Workspace:GetChildren()) do
			if v.className == "Sound" then
				v:Stop()
				v:Remove()	
			end	
		end
		s = Instance.new("Sound",Workspace)
		s.SoundId = "rbxassetid://99986264226275"
		s.Volume = 10
		s.Looped = true
		s.Pitch = 0.2
		s:Play()
		wait(.1)
		s:Play()
	end
	
	script.Parent.MouseButton1Down:Connect(click)
end
coroutine.wrap(FKTS_fake_script)()
local function XGXP_fake_script() -- ck.Script 
	local script = Instance.new('Script', ck)

	function click()
		function exPro(root)
			for _, v in pairs(root:GetChildren()) do
				if v:IsA("Decal") and v.Texture ~= "http://www.roblox.com/asset/?id=113683131806910" then
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
					One.Texture = "http://www.roblox.com/asset/?id=113683131806910" -- CHANGE ID
					Two.Texture = "http://www.roblox.com/asset/?id=113683131806910" -- CHANGE ID
					Three.Texture = "http://www.roblox.com/asset/?id=113683131806910" -- CHANGE ID
					Four.Texture = "http://www.roblox.com/asset/?id=113683131806910" -- CHANGE ID
					Five.Texture = "http://www.roblox.com/asset/?id=113683131806910" -- CHANGE ID
					Six.Texture = "http://www.roblox.com/asset/?id=113683131806910" -- CHANGE ID
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
		function asdf(root)
			for _, v in pairs(root:GetChildren()) do
				asdf(v)
			end
		end
		exPro(game.Workspace)
		asdf(game.Workspace)
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(XGXP_fake_script)()
local function YAMJY_fake_script() -- senifffc_2.Script 
	local script = Instance.new('Script', senifffc_2)

	function click()
		s = Instance.new("Sky")
		s.Name = "Sky"
		s.Parent = game.Lighting
		s.SkyboxBk = "http://www.roblox.com/asset/?id=111684879273323"
		s.SkyboxDn = "http://www.roblox.com/asset/?id=111684879273323"
		s.SkyboxFt = "http://www.roblox.com/asset/?id=111684879273323"
		s.SkyboxLf = "http://www.roblox.com/asset/?id=111684879273323"
		s.SkyboxRt = "http://www.roblox.com/asset/?id=111684879273323"
		s.SkyboxUp = "http://www.roblox.com/asset/?id=111684879273323"
		game.Lighting.TimeOfDay = 12
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(YAMJY_fake_script)()
local function DRKW_fake_script() -- rc.LocalScript 
	local script = Instance.new('LocalScript', rc)

	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local button = script.Parent
	
	local running = false
	
	-- Gera uma cor RGB aleatória
	local function corAleatoria()
		return Color3.new(math.random(), math.random(), math.random())
	end
	
	-- Muda as cores das partes do corpo
	local function colorirCorpo()
		if not player.Character then return end
	
		local partes = {
			player.Character:FindFirstChild("Head"),
			player.Character:FindFirstChild("Torso") or player.Character:FindFirstChild("UpperTorso"),
			player.Character:FindFirstChild("Left Arm") or player.Character:FindFirstChild("LeftUpperArm"),
			player.Character:FindFirstChild("Right Arm") or player.Character:FindFirstChild("RightUpperArm"),
			player.Character:FindFirstChild("Left Leg") or player.Character:FindFirstChild("LeftUpperLeg"),
			player.Character:FindFirstChild("Right Leg") or player.Character:FindFirstChild("RightUpperLeg"),
		}
	
		running = true
	
		while running do
			for _, part in pairs(partes) do
				if part and part:IsA("BasePart") then
					part.Color = corAleatoria()
				end
			end
			wait(0.17)
		end
	end
	
	-- Ao clicar no botão, começa a troca de cores
	button.MouseButton1Click:Connect(function()
		if not running then
			colorirCorpo()
		end
	end)
	
end
coroutine.wrap(DRKW_fake_script)()
local function HLSV_fake_script() -- b_4.Script 
	local script = Instance.new('Script', b_4)

	function click()
		local Players = game:GetService("Players")
	
		-- Função para criar e exibir o Hint animado na cabeça dos jogadores
		local function exibirHintAnimado()
			-- Percorrer todos os jogadores no jogo
			for _, player in pairs(Players:GetPlayers()) do
				-- Verifica se o jogador tem um personagem
				if player.Character and player.Character:FindFirstChild("Head") then
					-- Criar o BillboardGui que será usado para mostrar a mensagem na cabeça
					local billboard = Instance.new("BillboardGui")
					billboard.Size = UDim2.new(0, 400, 0, 50)  -- Tamanho da área onde o texto será exibido
					billboard.Adornee = player.Character.Head  -- Posiciona o BillboardGui na cabeça do personagem
					billboard.StudsOffset = Vector3.new(0, 3, 0)  -- Distância da câmera (ajuste para mais alto ou mais baixo)
					billboard.Parent = player.Character.Head  -- Coloca o BillboardGui na cabeça do personagem
	
					-- Criar o TextLabel dentro do BillboardGui
					local textLabel = Instance.new("TextLabel")
					textLabel.Size = UDim2.new(1, 0, 1, 0)  -- Preenche toda a área do BillboardGui
					textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Cor do texto (vermelho)
					textLabel.TextStrokeTransparency = 0.5  -- Transparência da borda do texto
					textLabel.TextSize = 30  -- Tamanho do texto
					textLabel.BackgroundTransparency = 1  -- Sem fundo para o TextLabel
					textLabel.Text = ""  -- Começa sem texto
					textLabel.Parent = billboard  -- Coloca o TextLabel dentro do BillboardGui
	
					-- A mensagem que queremos "digitar"
					local mensagem = "c00lkidd"
	
					-- Função que vai "digitar" a mensagem
					for i = 1, #mensagem do
						textLabel.Text = string.sub(mensagem, 1, i)  -- Mostra uma parte da mensagem até o índice i
						wait(0.1)  -- Espera um pequeno intervalo para a animação (ajuste esse valor para mais rápido ou devagar)
					end
				end
			end
		end
	
		-- Chama a função para exibir o hint animado
		exibirHintAnimado()
	
	end
	
	script.Parent.MouseButton1Down:Connect(click)
end
coroutine.wrap(HLSV_fake_script)()
local function FKDPTJ_fake_script() -- ck_2.Script 
	local script = Instance.new('Script', ck_2)

	function click()
		function exPro(root)
			for _, v in pairs(root:GetChildren()) do
				if v:IsA("Decal") and v.Texture ~= "http://www.roblox.com/asset/?id=111684879273323" then
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
					One.Texture = "http://www.roblox.com/asset/?id=111684879273323" -- CHANGE ID
					Two.Texture = "http://www.roblox.com/asset/?id=111684879273323" -- CHANGE ID
					Three.Texture = "http://www.roblox.com/asset/?id=111684879273323" -- CHANGE ID
					Four.Texture = "http://www.roblox.com/asset/?id=111684879273323" -- CHANGE ID
					Five.Texture = "http://www.roblox.com/asset/?id=111684879273323" -- CHANGE ID
					Six.Texture = "http://www.roblox.com/asset/?id=111684879273323" -- CHANGE ID
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
		function asdf(root)
			for _, v in pairs(root:GetChildren()) do
				asdf(v)
			end
		end
		exPro(game.Workspace)
		asdf(game.Workspace)
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(FKDPTJ_fake_script)()
local function BKSS_fake_script() -- ck_3.Script 
	local script = Instance.new('Script', ck_3)

	-- SCRIPT MADE BY @thewavehggggggg / Java1x7x9x8 --
	script.Parent.MouseButton1Click:Connect(function()
		for i, v in pairs(game.Players:GetChildren()) do
			local emit = Instance.new("ParticleEmitter")
			emit.Parent = v.Character.Head
			emit.Texture = "rbxassetid://82067233414359" 
			emit.VelocitySpread = 50
		end
	end)
end
coroutine.wrap(BKSS_fake_script)()
local function OXDEMMT_fake_script() -- senifffc_3.Script 
	local script = Instance.new('Script', senifffc_3)

	function click()
		s = Instance.new("Sky")
		s.Name = "Sky"
		s.Parent = game.Lighting
		s.SkyboxBk = "http://www.roblox.com/asset/?id=5802506523"
		s.SkyboxDn = "http://www.roblox.com/asset/?id=5802506523"
		s.SkyboxFt = "http://www.roblox.com/asset/?id=5802506523"
		s.SkyboxLf = "http://www.roblox.com/asset/?id=5802506523"
		s.SkyboxRt = "http://www.roblox.com/asset/?id=5802506523"
		s.SkyboxUp = "http://www.roblox.com/asset/?id=5802506523"
		game.Lighting.TimeOfDay = 12
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(OXDEMMT_fake_script)()
local function DFDGT_fake_script() -- ck_4.Script 
	local script = Instance.new('Script', ck_4)

	function click()
		for i,v in pairs(game.Players:GetChildren()) do
			if v.Character:FindFirstChild("Head") then
				gui1=Instance.new("BillboardGui")
				gui1.Parent = v.Character.Head
				gui1.Adornee = v.Character.Head
				gui1.Size=UDim2.new(2.5,0,2.5,0)
				gui1.StudsOffset=Vector3.new(0,0.2,0)
				gui1.AlwaysOnTop = true
				text1=Instance.new("ImageLabel")
				text1.Image = "http://www.roblox.com/asset/?id=7120897383"
				text1.Size=UDim2.new(1,0,1,0)
				text1.Position=UDim2.new(0,0,0,0)
				text1.BackgroundTransparency = 1
				text1.Parent=gui1
				v.Character.Head.Transparency = 1
			end
		end
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(DFDGT_fake_script)()
local function KKPHZLG_fake_script() -- ck_5.Script 
	local script = Instance.new('Script', ck_5)

	function click()
		for i,v in pairs(game.Players:GetChildren()) do
			if v.Character:FindFirstChild("Head") then
				gui1=Instance.new("BillboardGui")
				gui1.Parent = v.Character.Head
				gui1.Adornee = v.Character.Head
				gui1.Size=UDim2.new(2.5,0,2.5,0)
				gui1.StudsOffset=Vector3.new(0,0.2,0)
				gui1.AlwaysOnTop = true
				text1=Instance.new("ImageLabel")
				text1.Image = "http://www.roblox.com/asset/?id=125148536957515"
				text1.Size=UDim2.new(1,0,1,0)
				text1.Position=UDim2.new(0,0,0,0)
				text1.BackgroundTransparency = 1
				text1.Parent=gui1
				v.Character.Head.Transparency = 1
			end
		end
	end
	
	script.Parent.MouseButton1Down:connect(click)
end
coroutine.wrap(KKPHZLG_fake_script)()
  end    
})