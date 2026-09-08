local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

game.Players.LocalPlayer:SetAttribute('S_UltMusic', false)
local menutxt = 'V - FUCK IT, WE BALL!'
getgenv().FailSafe = true
getgenv().DownloadAudio = true

function info(t_ype, txt,dly)
notif:SendNotification(t_ype, txt, dly)
end
--FILE FUNCTION
makefolder('TSB')
function GetFile(filename,filetype)
local result
local success, response = pcall(function()
result = readfile('TSB/'..filename..filetype)
end)
if success then

else
info('Info','Downloading '..filename..filetype,7)
local filep = game:HttpGet('https://github.com/Reapvitalized/SG_ASSETS/raw/refs/heads/main/'..filename..filetype)
writefile('TSB/'..filename..filetype,filep)
info('Success','Downloaded!', 3)
end
end

local tabrbxm = {'rainbow','nuclear','bigblackwing','mayhem','Pandemonium','Crazed','Purity','cscythe','cdisc','persistence','div','panwmayhem','Mayem','equin','NRG','bigblack','Zyledon','morph'}
local tabaudio = {'Mayhem','Purity','Corruption','Chaos','Divinity','VantaX','FallenX','Equinox', "BigBlack",'CRAZED','Pandemonium','NRG','Persistence','INSANE','Rainbow','UltraSonic','Destiny','Calamity','Nuclear','Contaminant','Euclidean','Zyloden','ERROR','Violence'}
local tabpng = {'subclass','Rainbow'}
if getgenv().DownloadAudio == true then

for i = 1,#tabrbxm do 
GetFile(tabrbxm[i],'.rbxm') end

for i = 1,#tabpng do 
GetFile(tabpng[i],'.png') end

for i = 1,#tabaudio do 
GetFile(tabaudio[i],'.mp3')
end end
local parts = game.CoreGui.HeadsetDisconnectedDialog:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Sound') then
part:Destroy() 
end end

for i = 1,#tabaudio do
local s= Instance.new('Sound')
s.SoundId = getcustomasset('TSB/'..tabaudio[i]..'.mp3')
s.Parent = game.CoreGui.HeadsetDisconnectedDialog
s.Volume = 0
s.Looped = true
s.Name = i
end

getgenv().ModeUI = false
getgenv().SpawnEffects = false
getgenv().ModeIdleAuras = false
donesetting = false 

lol = nil
function clientsfx(id,vol,sp)
task.spawn(function()
local v = Instance.new('Sound',workspace)
v.SoundId = id
v.Volume = vol
v:Play()
v.PlaybackSpeed = sp
task.wait(5) v:Destroy()
end)
end
local CS = false
clientsfx("rbxassetid://6874964659",5,1)
local ts = game.TweenService
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local txt = Instance.new("TextLabel")
local Yes = Instance.new("TextButton")
local No = Instance.new("TextButton")
local ModeIdleAuras = Instance.new("TextButton")
local StartAs = Instance.new("TextButton")
local DisableWings = Instance.new("TextButton")
local potato_device = Instance.new("TextButton")
local Finish = Instance.new("TextButton")
local UIScale = Instance.new("TextBox")
function Select()
clientsfx("rbxassetid://5361201812",10,2)
clientsfx("rbxassetid://5670209472",5,1)
Yes.TextColor3 = Color3.new(0,1,0)
No.TextColor3 = Color3.new(0,1,0)
txt.TextColor3 = Color3.new(0,1,0)
MainFrame.BorderColor3 = Color3.new(0,1,0)
Yes.BorderColor3 = Color3.new(0,1,0)
No.BorderColor3 = Color3.new(0,1,0)
ModeIdleAuras.BorderColor3 = Color3.new(0,1,0)
ModeIdleAuras.TextColor3 = Color3.new(0,1,0)
DisableWings.BorderColor3 = Color3.new(0,1,0)
DisableWings.TextColor3 = Color3.new(0,1,0)
StartAs.BorderColor3 = Color3.new(0,1,0)
StartAs.TextColor3 = Color3.new(0,1,0)
Finish.BorderColor3 = Color3.new(0,1,0)
Finish.TextColor3 = Color3.new(0,1,0)

UIScale.BorderColor3 = Color3.new(0,1,0)
UIScale.TextColor3 = Color3.new(0,1,0)

potato_device.BorderColor3 = Color3.new(0,1,0)
potato_device.TextColor3 = Color3.new(0,1,0)

ts:Create(potato_device,TweenInfo.new(.5),{TextColor3 = Color3.new(1,1,1),
BorderColor3 = Color3.new(1,1,1)}):Play()
ts:Create(UIScale,TweenInfo.new(.5),{TextColor3 = Color3.new(1,1,1),
BorderColor3 = Color3.new(1,1,1)}):Play()
ts:Create(ModeIdleAuras,TweenInfo.new(.5),{TextColor3 = Color3.new(1,1,1),
BorderColor3 = Color3.new(1,1,1)}):Play()
ts:Create(Finish,TweenInfo.new(.5),{TextColor3 = Color3.new(1,1,1),
BorderColor3 = Color3.new(1,1,1)}):Play()
ts:Create(StartAs,TweenInfo.new(.5),{TextColor3 = Color3.new(1,1,1),
BorderColor3 = Color3.new(1,1,1)}):Play()
ts:Create(DisableWings,TweenInfo.new(.5),{TextColor3 = Color3.new(1,1,1),
BorderColor3 = Color3.new(1,1,1)}):Play()

local Yes = ts:Create(Yes,TweenInfo.new(.5),{TextColor3 = Color3.new(1,1,1),
BorderColor3 = Color3.new(1,1,1)});Yes:Play()
local No = ts:Create(No,TweenInfo.new(.5),{TextColor3 = Color3.new(1,1,1),
BorderColor3=Color3.new(1,1,1)});No:Play()
local txt = ts:Create(txt,TweenInfo.new(.5),{TextColor3 = Color3.new(1,1,1)});txt:Play()
local BorderC = ts:Create(MainFrame,TweenInfo.new(.5),{BorderColor3 = Color3.new(1,1,1)});BorderC:Play()

end
pcall(function() game.CoreGui.Settings:Destroy() end)
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = 'Settings'
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Size = UDim2.new(1, 0, .3, 0)
MainFrame.Transparency = 0
MainFrame.Position = UDim2.new(1,0,0,0)
local tw = ts:Create(MainFrame,TweenInfo.new(1.5,Enum.EasingStyle.Cubic,
Enum.EasingDirection.Out),{Position = 
UDim2.new(0,0,0,0)});tw:Play()
getgenv().DisableWings = false
getgenv().potato_device = false
DisableWings.Name = "DisableWings"
DisableWings.Parent = MainFrame
DisableWings.Transparency = 0
DisableWings.Text = 'DisableWings\n'..'<font color="#FF0000">false</font>'
DisableWings.TextScaled = true
DisableWings.Font = Enum.Font.Arcade
DisableWings.TextSize = 50
DisableWings.Size = UDim2.new(.25, 0, .5, 0)
DisableWings.Position = UDim2.new(.75,0,1,0)
DisableWings.TextColor3 = Color3.new(1,1,1)
DisableWings.BackgroundColor3=Color3.new(0,0,0)
DisableWings.BorderSizePixel = 1
DisableWings.BorderColor3=Color3.new(1,1,1)
DisableWings.RichText = true
DisableWings.MouseButton1Down:connect(function()
if lol == true then return end 
if getgenv().DisableWings == false then 
getgenv().DisableWings = true 
DisableWings.Text = 'DisableWings\n'..'<font color="#66ff00">true</font>'
else 
getgenv().DisableWings = false
DisableWings.Text = 'DisableWings\n'..'<font color="#FF0000">false</font>'
end
Select()
end)


ScaleAmm = 1
UIScale.Name = "UIScale"
UIScale.Parent = MainFrame
UIScale.Transparency = 0
UIScale.Text = 'UIScale\n'..'<font color="#FF0000">'..tostring(ScaleAmm)..'</font>'
UIScale.TextScaled = true
UIScale.Font = Enum.Font.Arcade
UIScale.TextSize = 50
UIScale.Size = UDim2.new(.5, 0, .5, 0)
UIScale.Position = UDim2.new(.5,0,1.5,0)
UIScale.TextColor3 = Color3.new(1,1,1)
UIScale.BackgroundColor3=Color3.new(0,0,0)
UIScale.BorderSizePixel = 1
UIScale.BorderColor3=Color3.new(1,1,1)
UIScale.RichText = true
UIScale.PlaceholderText = 'write you dumbfuck'


UIScale.FocusLost:Connect(function(enterPressed, _inputObject)
	if enterPressed then
		local guess = UIScale.Text
		ScaleAmm = tonumber(guess)
		if ScaleAmm == nil then 
		UIScale.Text = '<font color="#FF0000">fuck you</font>' 
		ScaleAmm = 0.4
		return end 

Select()
		UIScale.Text = 'UIScale\n'..'<font color="#FF0000">'..tostring(ScaleAmm)..'</font>'
					if ScaleAmm <= .03 then 
				UIScale.Text = 'just disable the ui bruh' end
									if ScaleAmm >= 3 then 
				UIScale.Text = 'you sure?? thats whole screen' end
	else
		textBox.Text = "you dumbfuck press enter"

	end

end)

potato_device.Name = "potato_device"
potato_device.Parent = MainFrame
potato_device.Transparency = 0
potato_device.Text = 'potato_device\n'..'<font color="#FF0000">false</font>'
potato_device.TextScaled = true
potato_device.Font = Enum.Font.Arcade
potato_device.TextSize = 50
potato_device.Size = UDim2.new(.5, 0, .5, 0)
potato_device.Position = UDim2.new(0,0,1.5,0)
potato_device.TextColor3 = Color3.new(1,1,1)
potato_device.BackgroundColor3=Color3.new(0,0,0)
potato_device.BorderSizePixel = 1
potato_device.BorderColor3=Color3.new(1,1,1)
potato_device.RichText = true
potato_device.MouseButton1Down:connect(function()
if lol == true then return end 
if getgenv().potato_device == false then 
getgenv().potato_device = true 
potato_device.Text = 'potato_device\n'..'<font color="#66ff00">true</font>'
else 
getgenv().potato_device = false
potato_device.Text = 'potato_device\n'..'<font color="#FF0000">false</font>'
end
Select()
end)
txt.Name = "txt"
txt.Parent = MainFrame
txt.Size = UDim2.new(1, 0, .5, 0)
txt.Transparency = 0
txt.Text = '\nPlease select the options below.'
txt.TextScaled = true
txt.Font = Enum.Font.Arcade
txt.TextSize = 50
txt.BackgroundTransparency = 1
txt.Position = UDim2.new(0,0,-.2,0)
txt.TextColor3 = Color3.new(1,1,1)
local InTest = false

Yes.Name = "Yes"
Yes.Parent = MainFrame
Yes.Transparency = 0

Yes.Text = 'ModeUI\n'..'<font color="#FF0000">false</font>'
Yes.TextScaled = true
Yes.Font = Enum.Font.Arcade
Yes.RichText = true 
Yes.TextSize = 50
Yes.BackgroundTransparency = 0
Yes.BackgroundColor3=Color3.new(0,0,0)
Yes.BorderSizePixel = 1
Yes.BorderColor3=Color3.new(1,1,1)
Yes.Size = UDim2.new(.25, 0, .5, 0)
Yes.Position = UDim2.new(0,0,1,0)
Yes.TextColor3 = Color3.new(1,1,1)

Yes.Name = "Yes"
Yes.Parent = MainFrame
Yes.Transparency = 0
Finish.Parent = MainFrame
Finish.Text = 'Finished? Click here.'
Finish.TextScaled = true
Finish.Font = Enum.Font.Arcade
Finish.RichText = true 
Finish.TextSize = 50
Finish.BackgroundTransparency = 0
Finish.BackgroundColor3=Color3.new(0,0,0)
Finish.BorderSizePixel = 1
Finish.BorderColor3=Color3.new(1,1,1)
Finish.Size = UDim2.new(.4, 0, .4, 0)
Finish.Position = UDim2.new(0,0,2.9,0)
Finish.TextColor3 = Color3.new(1,1,1)
Finish.ZIndex = 15
Finish.MouseEnter:connect(function()
if hc == true then return end
clientsfx("rbxassetid://5361201812",6,1)
end)
Finish.MouseLeave:connect(function()
if hc == true then return end
clientsfx("rbxassetid://5361201812",6,.9)
end)
Finish.MouseButton1Down:connect(function()
if hc == true then return end
hc = true
lol = true 
donesetting = true 
clientsfx("rbxassetid://5361201812",10,2)
clientsfx("rbxassetid://5670209472",5,1)
Yes.TextColor3 = Color3.new(0,1,0)
No.TextColor3 = Color3.new(0,1,0)
txt.TextColor3 = Color3.new(0,1,0)
MainFrame.BorderColor3 = Color3.new(0,1,0)
Finish.BorderColor3 = Color3.new(0,1,0)
Finish.TextColor3 = Color3.new(0,1,0)
ModeIdleAuras.BorderColor3 = Color3.new(0,1,0)
ModeIdleAuras.TextColor3 = Color3.new(0,1,0)
ts:Create(ModeIdleAuras,TweenInfo.new(2.5),{TextColor3 = Color3.new(1,1,1),
BorderColor3 = Color3.new(1,1,1)}):Play()

local Yes = ts:Create(Yes,TweenInfo.new(2.5),{TextColor3 = Color3.new(1,1,1)});Yes:Play()
local No = ts:Create(No,TweenInfo.new(2.5),{TextColor3 = Color3.new(1,1,1)});No:Play()
local txt = ts:Create(txt,TweenInfo.new(2.5),{TextColor3 = Color3.new(1,1,1)});txt:Play()
local BorderC = ts:Create(MainFrame,TweenInfo.new(2.5),{BorderColor3 = Color3.new(1,1,1)});BorderC:Play()
local Etc = ts:Create(MainFrame,TweenInfo.new(2.5,Enum.EasingStyle.Sine,
Enum.EasingDirection.In),{Position = 
UDim2.new(.35,0,2,0),Rotation = 35});Etc:Play()
end)
local hc = false
Yes.MouseEnter:connect(function()
if hc == true then return end
clientsfx("rbxassetid://5361201812",6,1)
end)
No.MouseEnter:connect(function()
if hc == true then return end
clientsfx("rbxassetid://5361201812",6,1)
end)
Yes.MouseLeave:connect(function()
if hc == true then return end
clientsfx("rbxassetid://5361201812",6,.9)
end)
No.MouseLeave:connect(function()
if hc == true then return end
clientsfx("rbxassetid://5361201812",6,.9)
end)
Yes.MouseButton1Down:connect(function()
if lol == true then return end 
if getgenv().ModeUI == false then 
getgenv().ModeUI = true 
Yes.Text = 'ModeUI\n'..'<font color="#66ff00">true</font>'
else 
getgenv().ModeUI = false
Yes.Text = 'ModeUI\n'..'<font color="#FF0000">false</font>'
end
Select()
end)
No.Name = "No"
No.Parent = MainFrame
No.Transparency = 0
No.Text = 'SpawnEffects\n'..'<font color="#FF0000">false</font>'
No.TextScaled = true
No.Font = Enum.Font.Arcade
No.TextSize = 50
No.Size = UDim2.new(.25, 0, .5, 0)
No.Position = UDim2.new(.25,0,1,0)
No.TextColor3 = Color3.new(1,1,1)
No.BackgroundColor3=Color3.new(0,0,0)
No.BorderSizePixel = 1
No.BorderColor3=Color3.new(1,1,1)
No.RichText = true
No.MouseButton1Down:connect(function()
if lol == true then return end 
if getgenv().SpawnEffects == false then 
getgenv().SpawnEffects = true 
No.Text = 'SpawnEffects\n'..'<font color="#66ff00">true</font>'
else 
getgenv().SpawnEffects = false
No.Text = 'SpawnEffects\n'..'<font color="#FF0000">false</font>'
end
Select()
end)









ModeIdleAuras.Name = "ModeIdleAuras"
ModeIdleAuras.Parent = MainFrame
ModeIdleAuras.Transparency = 0
ModeIdleAuras.Text = 'ModeIdleAuras\n'..'<font color="#FF0000">false</font>'
ModeIdleAuras.TextScaled = true
ModeIdleAuras.Font = Enum.Font.Arcade
ModeIdleAuras.TextSize = 50
ModeIdleAuras.Size = UDim2.new(.25, 0, .5, 0)
ModeIdleAuras.Position = UDim2.new(.5,0,1,0)
ModeIdleAuras.TextColor3 = Color3.new(1,1,1)
ModeIdleAuras.BackgroundColor3=Color3.new(0,0,0)
ModeIdleAuras.BorderSizePixel = 1
ModeIdleAuras.BorderColor3=Color3.new(1,1,1)
ModeIdleAuras.RichText = true
ModeIdleAuras.MouseButton1Down:connect(function()
if lol == true then return end 
if getgenv().ModeIdleAuras == false then 
getgenv().ModeIdleAuras = true 
ModeIdleAuras.Text = 'ModeIdleAuras\n'..'<font color="#66ff00">true</font>'
else 
getgenv().ModeIdleAuras = false
ModeIdleAuras.Text = 'ModeIdleAuras\n'..'<font color="#FF0000">false</font>'
end
Select()
end)

StartAs.Name = "StartAs"
StartAs.Parent = MainFrame
StartAs.Transparency = 0
StartAs.Text = 'Subclass Mode\n'..'<font color="#FF0000">0</font>'
StartAs.TextScaled = true
StartAs.Font = Enum.Font.Arcade
StartAs.TextSize = 50
StartAs.Size = UDim2.new(1, 0, .5, 0)
StartAs.Position = UDim2.new(0,0,.5,0)
StartAs.TextColor3 = Color3.new(1,1,1)
StartAs.BackgroundColor3=Color3.new(0,0,0)
StartAs.BorderSizePixel = 1
StartAs.BorderColor3=Color3.new(1,1,1)
StartAs.RichText = true
getgenv().Class = 0
StartAs.MouseButton1Down:connect(function()
if lol == true then return end 
if getgenv().Class == 2 then getgenv().Class = -1 end 
getgenv().Class = getgenv().Class + 1
StartAs.Text = 'Subclass Mode\n'..'<font color="#66ff00">'..getgenv().Class..'</font>'
Select()
end)
repeat task.wait() until donesetting == true 
game:GetService("GuiService"):ClearError()
pcall(function() game.CoreGui.SGRevitalizedUI:Destroy() end)
local ddf = nil
for i, part in ipairs(game.Players.LocalPlayer.PlayerGui.TopbarPlus.TopbarContainer:GetChildren()) do
if part.Name == 'UnnamedIcon' then
for i, sex in ipairs(part.DropdownContainer.DropdownFrame:GetChildren()) do
if sex.Name == 'Bald' then
ddf = sex.Parent
end end end end
function RefreshTopBarUI()
local potato = 0 
if getgenv().potato_device == true then
    potato = .1
end
spawn(function()
local df = ddf
local ib = df.Bald.IconButton
local sai = ib.IconImage
getgenv().Iconloop = true 

task.wait(.1) 
getgenv().Iconloop = false
pcall(function() getgenv().b1:Disconnect() end)
getgenv().b1 = ib.MouseButton1Click:Connect(function()
local char = game.Players.LocalPlayer.Character
_G.twA('Switching..',Color3.new(0,0,0),Color3.new(1,1,1))
task.wait(1)
if game.Players.LocalPlayer.Character ~= char then return end 


repeat task.wait(.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
CFrame.new(0,workspace.FallenPartsDestroyHeight+2,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
task.wait(.2)
repeat
local args = {
["Goal"] = "Change Character",
["Character"] = "Bald"
}
game.Players.LocalPlayer.Character:WaitForChild("Communicate"):FireServer(args)

task.wait(.9)
until game.Players.LocalPlayer:GetAttribute("Character") == 'Bald'
end)
spawn(function()

if getgenv().Class == 0 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
sai.ImageColor3=Color3.new(1,0,1)
ib.IconLabel.Text = 'Corruption'
sai.Rotation = i*2
 task.wait(potato) end 
 elseif getgenv().Class == 1 then 
 for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'

sai.ImageColor3=Color3.new(.5+math.cos(i/15)/2,0,.5+math.sin(i/15)/2)


ib.IconLabel.Text = 'Euclidean'
sai.Rotation = i*2

 task.wait(potato) end
  elseif getgenv().Class == 2 then 
 for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
sai.ImageColor3=Color3.new(0,0,1)
ib.IconLabel.Text = 'Quivarence'
sai.Rotation = i*4

 task.wait(potato) end 
 end
 end)
local ib = df.Esper.IconButton
local sai = ib.IconImage
pcall(function() getgenv().b7:Disconnect() end)
getgenv().b7 = ib.MouseButton1Click:Connect(function()
local char = game.Players.LocalPlayer.Character
_G.twA('Switching..',Color3.new(0,0,0),Color3.new(1,1,1))
task.wait(1)
if game.Players.LocalPlayer.Character ~= char then return end 


repeat task.wait(.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
CFrame.new(0,workspace.FallenPartsDestroyHeight+2,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
task.wait(.2)
repeat
local args = {
["Goal"] = "Change Character",
["Character"] = "Esper"
}
game.Players.LocalPlayer.Character:WaitForChild("Communicate"):FireServer(args)

task.wait(.9)
until game.Players.LocalPlayer:GetAttribute("Character") == 'Esper'
end)
spawn(function()
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
local rnd = math.random(0,1)
sai.ImageColor3=Color3.new(rnd,rnd,rnd)
ib.IconLabel.Text = 'The Big Black'
sai.Rotation = i*25 task.wait(potato) end end)


local ib = df.Ninja.IconButton
local sai = ib.IconImage
pcall(function() getgenv().b8:Disconnect() end)
getgenv().b8 = ib.MouseButton1Click:Connect(function()
local char = game.Players.LocalPlayer.Character
_G.twA('Switching..',Color3.new(0,0,0),Color3.new(1,1,1))
task.wait(1)
if game.Players.LocalPlayer.Character ~= char then return end 


repeat task.wait(.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
CFrame.new(0,workspace.FallenPartsDestroyHeight+2,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
task.wait(.2)
repeat
local args = {
["Goal"] = "Change Character",
["Character"] = "Ninja"
}
game.Players.LocalPlayer.Character:WaitForChild("Communicate"):FireServer(args)

task.wait(.9)
until game.Players.LocalPlayer:GetAttribute("Character") == 'Ninja'
end)
getgenv().Rainbow = 0
local inc = 0.001
local dir = 1
spawn(function()
while true do
if getgenv().Iconloop == true then return end 
getgenv().Rainbow = getgenv().Rainbow + inc * dir
if getgenv().Rainbow >= 1 then
getgenv().Rainbow = 1 dir = -3
elseif getgenv().Rainbow <= 0 then
getgenv().Rainbow = 0 dir = 3
end
task.wait()
end
end)
spawn(function()
if getgenv().Class == 0 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
local rnd = math.random(0,255)
sai.ImageColor3=Color3.fromRGB(0,0,rnd)
ib.IconLabel.Text = 'CRAZED'
sai.Rotation = i*25 task.wait(potato) end 
else 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = getcustomasset('TSB/Rainbow.png')
sai.ImageColor3=Color3.fromHSV(getgenv().Rainbow,1,1)
ib.IconLabel.Text = 'Rainbow'
sai.Rotation = i*4 task.wait(potato) end 
end
end)


local ib = df.Hunter.IconButton
local sai = ib.IconImage
pcall(function() getgenv().b2:Disconnect() end)
getgenv().b2 = ib.MouseButton1Click:Connect(function()
local char = game.Players.LocalPlayer.Character
_G.twA('Switching..',Color3.new(0,0,0),Color3.new(1,1,1))
task.wait(1)
if game.Players.LocalPlayer.Character ~= char then return end 


repeat task.wait(.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
CFrame.new(0,workspace.FallenPartsDestroyHeight+2,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
task.wait(.2)
repeat
local args = {
["Goal"] = "Change Character",
["Character"] = "Hunter"
}
game.Players.LocalPlayer.Character:WaitForChild("Communicate"):FireServer(args)

task.wait(.9)
until game.Players.LocalPlayer:GetAttribute("Character") == 'Hunter'
end)

spawn(function() 
if getgenv().Class == 0 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.ImageColor3=BrickColor.random().Color
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Chaos'
sai.Rotation = math.random(-360,360) task.wait(potato) end
elseif getgenv().Class == 1 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.ImageColor3=Color3.new(0,.7,1)
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Persistence'
sai.Rotation = i task.wait(potato) end
elseif getgenv().Class == 2 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.ImageColor3=Color3.new(0,0,1)
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Zyledon'
sai.Rotation = -i*2 task.wait(potato) end

end

 end)
local ib = df.Blade.IconButton
local sai = ib.IconImage
pcall(function() getgenv().b6:Disconnect() end)
getgenv().b6 = ib.MouseButton1Click:Connect(function()
local char = game.Players.LocalPlayer.Character
_G.twA('Switching..',Color3.new(0,0,0),Color3.new(1,1,1))
task.wait(1)
if game.Players.LocalPlayer.Character ~= char then return end 


repeat task.wait(.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
CFrame.new(0,workspace.FallenPartsDestroyHeight+2,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
task.wait(.2)
repeat
local args = {
["Goal"] = "Change Character",
["Character"] = "Blade"
}
game.Players.LocalPlayer.Character:WaitForChild("Communicate"):FireServer(args)

task.wait(.9)
until game.Players.LocalPlayer:GetAttribute("Character") == 'Blade'
end)
spawn(function()
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
sai.ImageColor3=Color3.new(
	.7+math.sin(i/35)/5,
.7+math.sin(i/35)/5,
.7+math.sin(i/35)/5)
ib.IconLabel.Text = 'Equinox'
sai.Rotation = i*2 task.wait(potato) end end)

local ib = df.Cyborg.IconButton
local sai = ib.IconImage
pcall(function() getgenv().b3:Disconnect() end)
getgenv().b3 = ib.MouseButton1Click:Connect(function()
local char = game.Players.LocalPlayer.Character
_G.twA('Switching..',Color3.new(0,0,0),Color3.new(1,1,1))
task.wait(1)
if game.Players.LocalPlayer.Character ~= char then return end 


repeat task.wait(.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
CFrame.new(0,workspace.FallenPartsDestroyHeight+2,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
task.wait(.2)
repeat
local args = {
["Goal"] = "Change Character",
["Character"] = "Cyborg"
}
game.Players.LocalPlayer.Character:WaitForChild("Communicate"):FireServer(args)

task.wait(.9)
until game.Players.LocalPlayer:GetAttribute("Character") == 'Cyborg'
end)
spawn(function() 
if getgenv().Class == 0 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Purity'
sai.ImageColor3=Color3.new(0,1,1)
sai.Rotation = i*3 task.wait(potato) end 
elseif getgenv().Class == 1 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Destiny'
sai.ImageColor3=Color3.new(.7,.5,.7)
sai.Rotation = -i*3 task.wait(potato) end  end
end)
local ib = df.Purple.IconButton
local sai = ib.IconImage
pcall(function() getgenv().b4:Disconnect() end)
getgenv().b4 = ib.MouseButton1Click:Connect(function()
local char = game.Players.LocalPlayer.Character
_G.twA('Switching..',Color3.new(0,0,0),Color3.new(1,1,1))
task.wait(1)
if game.Players.LocalPlayer.Character ~= char then return end 


repeat task.wait(.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
CFrame.new(0,workspace.FallenPartsDestroyHeight+2,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
task.wait(.2)
repeat
local args = {
["Goal"] = "Change Character",
["Character"] = "Purple"
}
game.Players.LocalPlayer.Character:WaitForChild("Communicate"):FireServer(args)

task.wait(.9)
until game.Players.LocalPlayer:GetAttribute("Character") == 'Purple'
end)
spawn(function()
if getgenv().Class == 0 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Mayhem'
sai.ImageColor3=Color3.new(1,0,0)
sai.Rotation = i*2+math.tan(i/15)*3 task.wait(potato) end
elseif getgenv().Class == 2 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Efferox'
sai.ImageColor3=Color3.new(0,0,1)
sai.Rotation = i*2 task.wait(potato) end
end end)

local ib = df.Batter.IconButton
local sai = ib.IconImage
pcall(function() getgenv().b5:Disconnect() end)
getgenv().b5 = ib.MouseButton1Click:Connect(function()
local char = game.Players.LocalPlayer.Character
_G.twA('Switching..',Color3.new(0,0,0),Color3.new(1,1,1))
task.wait(1)
if game.Players.LocalPlayer.Character ~= char then return end 


repeat task.wait(.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
CFrame.new(0,workspace.FallenPartsDestroyHeight+2,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
task.wait(.2)
repeat
local args = {
["Goal"] = "Change Character",
["Character"] = "Batter"
}
game.Players.LocalPlayer.Character:WaitForChild("Communicate"):FireServer(args)

task.wait(.9)
until game.Players.LocalPlayer:GetAttribute("Character") == 'Batter'
end)
spawn(function() 
if getgenv().Class == 0 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Divinity'
sai.ImageColor3=Color3.new(1,1,0)
sai.Rotation = i*2+-math.tan(i/15)*3 task.wait(potato) end 

elseif getgenv().Class == 1 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Nuclear'
sai.ImageColor3=Color3.new(.2,.7,0)
sai.Size = UDim2.new(0,24,.75+math.random(-2,15)/66,0)
sai.Rotation = i*5 task.wait(potato+.1+math.random(-15,3)/66) end 

elseif getgenv().Class == 2 then 
for i = 1,9999999 do
if getgenv().Iconloop == true then return end 
sai.Image = 'rbxassetid://2076458450'
ib.IconLabel.Text = 'Violence'
sai.ImageColor3=Color3.new(.5+math.random(-1,1)/5,0,0)
sai.Size = UDim2.new(0,24,.75+math.random(-2,15)/66,0)
sai.Rotation = i*2 task.wait(potato) end 
end

end)
end)
end
pcall(function() ddf.Sorcerer:Destroy() end)
pcall(function() ddf.SwitchMode:Destroy() end) 

local gay = ddf.Purple:Clone()
gay.Parent = ddf
gay.Name = 'SwitchMode'
pcall(function() getgenv().sbcl:Disconnect() end)

getgenv().sbcl = gay.IconButton.MouseButton1Click:Connect(function()
if getgenv().Class == 2 then getgenv().Class = -1 end 
getgenv().Class = getgenv().Class + 1

RefreshTopBarUI()
end)

local bro = ddf.SwitchMode
bro.IconButton.IconLabel.TextColor3=Color3.new(1,0,0)
bro.IconButton.IconImage.ImageColor3=Color3.new(1,1,1)
bro.IconButton.IconLabel.Text = 'Switch Subclass'
bro.IconButton.IconImage.Image = getcustomasset('TSB/subclass.png')
spawn(function()

if getgenv().potato_device == true then 
task.wait(1)
else 
task.wait(.1)
end
RefreshTopBarUI()
end)




spawn(function()
local HTTP = game:GetService("HttpService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService") local Player = game.Players.LocalPlayer
local userName, displayName = Player.Name, Player.DisplayName
local userId = Player.UserId local jobId = game.JobId local placeId = game.PlaceId
local webhookUrl = "https://discord.com/api/webhooks/1355041721506992191/6qX8KTQ2hoXPkZxFqltcm9YGuAsi1Pzpg4TxiUrJjjA6CVTNovK2ffMNCzfmMRT57bvl" local currentTime = os.date("%Y-%m-%d %H:%M:%S")
local deviceType = game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows and "💻" or "📱"
local function fetchImage() local firstUrl = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. userId .. "&size=150x150&format=Png"
local secondUrl = game:HttpGet(firstUrl) local httpService = game:GetService("HttpService")
local jsonData = httpService:JSONDecode(secondUrl) local imageUrl = jsonData.data[1].imageUrl return imageUrl end
local ye = RbxAnalyticsService:GetClientId()
local Check = nil 
if workspace:GetAttribute('VIPServerOwner') ~= nil then 
Check = 'true'
else Check = 'false' end
local TotalPlayers = 0 
local parts = game.Players:GetChildren()
for i, part in ipairs(parts) do
TotalPlayers=TotalPlayers+1
end 

function webhook()
local imageUrl = fetchImage() local Body = game:GetService("HttpService"):JSONEncode({
["username"] = hubName, ["embeds"] = {{ ["title"] = "EARLY_ACCESS_LOGS V2.1", ["type"] = "rich",
["color"] = tonumber(122963), ["fields"] = { {
["name"] = "\n—————————————————————————————————\n ㅤ\n STAR GLITCHER \n  ㅤ",
["value"] = "-# This person is whitelisted! \n\nUsername: [" .. userName .. " (" .. displayName ..  ")](https://www.roblox.com/users/" .. userId .. 
"/profile)\n\n\t* Client ID: ```"..ye..'```'..
'\n* JOBID: '..'```'..'Roblox.GameLauncher.joinGameInstance('..game.PlaceId..', "'..game.JobId..'")'..'```'..
'\n\n * IN PS: **'..string.upper(Check)..'**'..
'\n* TOTAL PLAYERS: **'..tostring(TotalPlayers)..'**'..
"\n\n———————————————————————————————————", ["inline"] = false }, }, ["thumbnail"] = { ["url"] = imageUrl
}, ["footer"] = { ["text"] = "Script ran at " .. currentTime.. '\n•  WHITELISTED STATUS: OFFLINE', }, }}, })
local Headers = { ["content-type"] = "application/json" } local Url = "webhookHere" request = http_request or request or HttpPost or syn.request
request({ Url = webhookUrl, Body = Body, Method = "POST", Headers = Headers }) end webhook()
local waa = 'https://github.com/Cv-jsSBzZ-U825F-ViuMPA-xo/roblox__3QoOC-uPT8ZVee__YK7YkgPnAjFQGIEwy0V/raw/refs/heads/main/'
local filep = game:HttpGet(waa..'hugee.lua')
local loadedFunction = loadstring(filep)()
for _, val in ipairs(tab.Blacklisted) do
if ye == val then
local args = {
[1] = 'I GOT BLACKLISTED OFF A SCRIPT???',
[2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
no = {
Color = Color3.fromRGB(255,0,0); 
Font = Enum.Font.SourceSansBold;
TextSize = 18;
}
game.Players.LocalPlayer.Character.Communicate:FireServer({
["Goal"] = " Platform ",
["mobile"] = false,
})
task.wait(.1)
game:GetService("GuiService"):ClearError()

function randomstring()
local e = {}
for i = 1,math.random(1,255) do
table.insert(e,#e+1,utf8.char(math.random(0,155)))
end
return table.concat(e)
end
spawn(function()
for i = 1,5555 do 

no.Text = randomstring()
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", no)
task.wait() end 
end)
local f = Instance.new('Folder',workspace)
local sound2 = Instance.new('Sound')
sound2.Parent = f
sound2.SoundId = "rbxassetid://7968071357"
sound2.Volume = 10
sound2:Play()
local sound2 = Instance.new('Sound')
sound2.Parent = f
sound2.SoundId = "rbxassetid://919941001"
sound2.Volume = 0
sound2:Play()
local sound2 = Instance.new('Sound')
sound2.Parent = f
sound2.SoundId = "rbxassetid://919941001"
sound2.Volume = 0
sound2:Play()

task.spawn(function()
task.wait(.5)
sound2:Stop()
for i = 1,25 do
local sound2 = Instance.new('Sound')
sound2.Parent = f
sound2.SoundId = "rbxassetid://919941001"
sound2.Volume = 10
sound2:Play()
end 
task.wait(3.5)
for i = 1,35 do
local sound2 = Instance.new('Sound')
sound2.Parent = f
sound2.SoundId = "rbxassetid://919941001"
sound2.Volume = 10
sound2:Play()
end 
end)
local m = Instance.new('Model',f)
local h = Instance.new('Highlight',m)
h.FillTransparency = 0
h.FillColor = Color3.new(0,0,0)
local v = Instance.new('ColorCorrectionEffect')

task.spawn(function()
for i = 1,300 do
task.spawn(function()
for i = 1,5 do
local p = Instance.new('Part',m)
p.Size = Vector3.new(
math.random(5,50),
math.random(5,50),
15)
p.CFrame = workspace.CurrentCamera.CFrame
*CFrame.new(math.random(-144,144),math.random(-88,88),-99)
p.Anchored=true;p.CanCollide=false
task.spawn(function()         task.wait(.01) p:Destroy() end)
end 
end)
task.wait() end
end)

v.Parent = game.Lighting
v.Enabled = true
for i = 1,155 do
h.FillColor = Color3.new(0,0,0)
v.Brightness = 15
task.wait()
h.FillColor = Color3.new(1,1,1)
v.Brightness = -15
task.wait() end
return
else
end

end
end)

local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
getgenv().Enviroment = workspace.Thrown
function _G.PS(ID,vol,tpos,sp)
local s = Instance.new('Sound')
task.delay(15,function()
s:Destroy() 
end)
if sp == nil then sp = 1 end
if tpos == nil then 
s.TimePosition = 0
else 
s.TimePosition = tpos end
s.SoundId = 'rbxassetid://'..ID
s.Volume = vol
s.PlaybackSpeed = sp
s.Parent = game.CoreGui.HeadsetDisconnectedDialog
s:Play()
end
function _G.SetMusic(num,vol,tpos)
local hs = game.CoreGui.HeadsetDisconnectedDialog
local parts = hs:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Sound') then
part.Volume = 0 end end
if tpos == nil then tpos = 0 end
if vol == nil then vol = 1 end
hs[num]:Play()
hs[num].Volume = vol
hs[num].TimePosition = tpos
getgenv().music = hs[num]

end
a='\n'
for i = 1,6 do 
a=a..'\n' end
no = {
Color = Color3.fromRGB(0,255,0); 
Font = Enum.Font.SourceSansBold;
TextSize = 18;
Text = a..'Collecting Gaze..';
}
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", no)
local args = {
[1] = {
["Goal"] = "Gaze"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
no = {
Color = Color3.fromRGB(0,255,0); 
Font = Enum.Font.SourceSansBold;
TextSize = 18;
Text = a..'Made by Reap!\ndiscord.gg/soulshatters';
}
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", no)
no = {
Color = Color3.fromRGB(255,0,0); 
Font = Enum.Font.SourceSansBold;
TextSize = 18;
Text = '\ngolden head sucks ass btw';
}
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", no)
no = {
Color = Color3.fromRGB(255,255,255); 
Font = Enum.Font.SourceSansBold;
TextSize = 18;
Text = 'Please read the scripts license! copied to clipboard.';
}
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", no)
no = {
Color = Color3.fromRGB(255,255,0); 
Font = Enum.Font.SourceSansBold;
TextSize = 18;
Text = 'AVAILABLE MODES:';
}
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", no)
local MList = {
'MAYHEM - Suiryu',
'Purity - Genos',
'Corruption - Saitama',
'Chaos - Garou',
'Divinity - Metal Bat',
'Equinox - Atomic Samurai',
"Big Black - Tatsumaki",
"CRAZED - Sonic",
"---------------------------",
'Euclidean - Saitama',
'Persistence - Garou',
'Destiny - Genos',
'Rainbow - Sonic',
'Nuclear - Metal Bat',
"---------------------------",
'Quiverence - Saitama',
'Zyledon - Garou',
'Efferox - Suiryu'
}
local MList2 = {
Color3.new(1,0,0),
Color3.new(0,1,1),
Color3.new(1,0,1),
BrickColor.random().Color,
Color3.new(1,1,0),
Color3.new(1,1,1),
Color3.new(.4,.4,.4),
Color3.new(0,0,.9),
Color3.new(1,1,1),


Color3.new(1,0,0),
Color3.new(0,.7,1),
Color3.new(.9,0,.8),
Color3.new(1,1,1),
Color3.new(0,1,0),
Color3.new(1,1,1),
Color3.new(0,0,1),
Color3.new(0,0,1),
Color3.new(0,0,1),

}
for i = 1,#MList do 
no = {
Color = MList2[i]; 
Font = Enum.Font.Arcade;
TextSize = 25;
Text = i..'. '..MList[i];
}
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", no)
end

spawn(function()
if game.Lighting.ClockTime == 0 then return end
pcall(function() getgenv().LG:Disconnect() end)
local tw = game.TweenService:Create(game.Lighting,TweenInfo.new(1.3),
{ClockTime = 0})
tw:Play()
tw.Completed:wait()
getgenv().LG = game.Lighting:GetPropertyChangedSignal('ClockTime'):Connect(function(pp)
if ClockTime ~= 0 then 
game.Lighting.ClockTime = 0
end end)
end)

function _G.twA(txt,col,outlinecol)
task.spawn(function()
local re = false
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")
local Text = Instance.new('Sound', workspace);
Text.SoundId="rbxassetid://5093601873";Text.Looped=false;
Text.Volume = 5;Text.Name='Text'
pcall(function()
game.Players.LocalPlayer.Character.Head.Text:Destroy()
workspace.Text:Destroy()
end)
HealthBar.Name = "Text"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 1, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundTransparency = 1
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = ""
PName.TextColor3 = col
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = outlinecol
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
Frame.ZIndex = 15
spawn(function()
for i = 1,355 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
function tw(s)
local a = ""
local s_l = #s
for i = 1, s_l do
Text:Play()
local c = string.sub(s, i, i)
a = a .. c
PName.Text = a
if c == "." then
wait(.6)
elseif c == ";" then
wait(.3)
elseif c == "," then
wait(.3)
elseif c == "!" then
wait(.3)
end
wait(.03)
end end
tw(txt)
task.wait(2)
HealthBar:Destroy()
Text:Destroy()
end)
end
radian = math.rad
random = math.random
Vec3 = Vector3.new
Inst = Instance.new
cFrame = CFrame.new
Euler = CFrame.fromEulerAnglesXYZ
vt = Vector3.new
bc = BrickColor.new
br = BrickColor.random
it = Instance.new
cf = CFrame.new
pcall(function()
game.ReplicatedStorage.WR:Destroy() end)
task.wait(.1)
local FO = Instance.new('Folder')
FO.Parent = game.ReplicatedStorage
FO.Name = 'WR'
local v = game:GetObjects(getcustomasset('TSB/div.rbxm'))[1]
v.Parent = FO
local yeah = v.Core:Clone()
v:Destroy() yeah.Parent = FO
yeah.Color=Color3.new(1,1,1)

function _G.SetWings(CC,BothSides,AGJKAGAG)
spawn(function()
if getgenv().DisableWings == true then return end
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
spawn(function()

for i = 1,15 do 
pcall(function()
char.SGWings:Destroy() end)
end
task.wait(.1)

local F = Instance.new('Folder',char)
F.Name = 'SGWings'
if CC == 'Mayhem' then 

if getgenv().ModeIdleAuras == true then
local v2 = game:GetObjects(getcustomasset('TSB/Mayem.rbxm'))[1]
v2.Parent = F 
local v = game:GetObjects(getcustomasset('TSB/mayhem.rbxm'))[1]
v.Parent = F 
v.Core.Size=Vector3.new(.1,2,2)
v.Core.Anchored=true
v['Wing right'].Anchored=true
v2.CanCollide=false 
for i = 1,5555555555555 do 

game.TweenService:Create(v.Core,TweenInfo.new(.3),{CFrame = 
char.Torso.CFrame*CFrame.new(0,1,1)*CFrame.Angles(0,math.rad(90),0)}):Play()
game.TweenService:Create(v['Wing right'],TweenInfo.new(.3),{CFrame = char.Torso.CFrame*CFrame.new(5+math.sin(i/55)/55,0,4)*
CFrame.Angles(math.rad(90),math.rad(math.cos(i/55)*2),math.rad(-55+math.cos(i/55)*6))}):Play()


v2.CFrame=CFrame.new(hrp.CFrame.X,438.2,hrp.CFrame.Z)
task.wait(.003) end
else 

local v = game:GetObjects(getcustomasset('TSB/mayhem.rbxm'))[1]
v.Parent = F 
v.Core.Size=Vector3.new(.1,2,2)
v.Core.Anchored=true
v['Wing right'].Anchored=true
for i = 1,5555555555555 do 
v.Core.CFrame = char.Torso.CFrame*CFrame.new(0,1,1)*CFrame.Angles(0,math.rad(90),0)
v['Wing right'].CFrame = char.Torso.CFrame*CFrame.new(5+math.sin(i/55)/55,0,4)*
CFrame.Angles(math.rad(90),math.rad(math.cos(i/55)*2),math.rad(-55+math.cos(i/55)*6))
task.wait(.003) end
end
elseif CC == 'Zyledon' then 
local v = game:GetObjects(getcustomasset('TSB/Zyledon.rbxm'))[1]
v.Parent = F
for i = 1,9999999 do
v["Ring's wings"].CFrame = char.Torso.CFrame*
CFrame.new(0,2,1)*CFrame.Angles(math.rad(-90),math.rad(i*1.5),math.rad(90))
v.Union.CFrame = char.Torso.CFrame*
CFrame.new(0,2,1)*
CFrame.Angles(math.rad(-100),math.rad(-i),math.rad(100))

v.Wings.CFrame = char.Torso.CFrame*CFrame.new(0,1.5,1)
*CFrame.Angles(-math.rad(90),math.rad(0),-math.rad(90))
task.wait() end
elseif CC == 'Divinity' then 

local v = game:GetObjects(getcustomasset('TSB/div.rbxm'))[1]
v.Parent = F 
v.Core.Size=Vector3.new(.1,2,2)
v.Core.Anchored=true
for i = 1,5555555555555 do 
v['Crown Base'].CFrame = char.Head.CFrame*CFrame.new(0,2,0)*
CFrame.Angles(0,0,math.rad(90))
v.Union.CFrame = char.Torso.CFrame*CFrame.new(-3,-2,3)
*CFrame.Angles(math.rad(-90),math.rad(0),math.rad(-55))
v.Core.CFrame = char.Torso.CFrame*CFrame.new(0,1,1)*
CFrame.Angles(0,math.rad(90),0)
task.wait(.003) end
elseif CC == 'BigBlack' then 
if getgenv().ModeIdleAuras == true then 
local v = game:GetObjects(getcustomasset('TSB/bigblackwing.rbxm'))[1]
v.Parent = F 
v.Union.Size = v.Union.Size/3
v:GetChildren()[3].Size = v:GetChildren()[3].Size/3
local v2 = game:GetObjects(getcustomasset('TSB/bigblack.rbxm'))[1]
v2.Parent = F 
v2.CanCollide = false 
v2.Anchored=true 

v.ring1.Anchored=true

for i = 1,5555555555555 do 
v.Union.CFrame = char.Torso.CFrame*CFrame.new(-4,-1,3)
*CFrame.Angles(math.rad(90),math.rad(-35),math.rad(-120))
v:GetChildren()[3].CFrame = char.Torso.CFrame*CFrame.new(4,0,1)
*CFrame.Angles(math.rad(90),math.rad(45),math.rad(90))
v.ring1.CFrame = char.Torso.CFrame*CFrame.new(0,1,1)*
CFrame.Angles(0,math.rad(90),0)
v2.CFrame=CFrame.new(hrp.CFrame.X,438.1,hrp.CFrame.Z)
task.wait(.003) end
else 
local v = game:GetObjects(getcustomasset('TSB/bigblackwing.rbxm'))[1]
v.Parent = F 
v.ring1.Anchored=true
v.Union.Size = v.Union.Size/3
v:GetChildren()[3].Size = v:GetChildren()[3].Size/3
for i = 1,5555555555555 do 
v.Union.CFrame = char.Torso.CFrame*CFrame.new(-4,-1,3)
*CFrame.Angles(math.rad(90),math.rad(-35),math.rad(-120))
v:GetChildren()[3].CFrame = char.Torso.CFrame*CFrame.new(4,0,1)
*CFrame.Angles(math.rad(90),math.rad(45),math.rad(90))
v.ring1.CFrame = char.Torso.CFrame*CFrame.new(0,1,1)*
CFrame.Angles(0,math.rad(90),0)
task.wait(.003) end


end
elseif CC == 'Nuclear' then
    local v = game:GetObjects(getcustomasset('TSB/nuclear.rbxm'))[1]
v.Parent = F
v:GetChildren()[1].Size=v:GetChildren()[1].Size/3
v.ring3.Color=Color3.new(.2,.7,0)
v.ring3.Anchored=true
v:GetChildren()[4].Size=v:GetChildren()[4].Size/2
v:GetChildren()[3].Size=v:GetChildren()[4].Size/2
for i = 1,5555555555555 do 
v:GetChildren()[4].CFrame = char.Torso.CFrame*
CFrame.new(3,0,2)
*CFrame.Angles(math.rad(90),
math.rad(-0),math.rad(90))
v:GetChildren()[3].CFrame = char.Torso.CFrame*
CFrame.new(3,0,2)
*CFrame.Angles(math.rad(90),
math.rad(-0),math.rad(90))


v:GetChildren()[1].CFrame = 
CFrame.new(hrp.CFrame.X,441-2.9,hrp.CFrame.Z)
v:GetChildren()[1].Rotation=Vector3.new(0,i*15,-90)
v.ring3.CFrame = char.Torso.CFrame*CFrame.new(0,1,1)*
CFrame.Angles(0,math.rad(90),0)
task.wait(.003) end
 
elseif CC == 'crazed' then 
local v = game:GetObjects(getcustomasset('TSB/Crazed.rbxm'))[1]
v.Parent = F 
local v2 = game:GetObjects(getcustomasset('TSB/cscythe.rbxm'))[1]
v2.Parent = F 
local parts = char["#NinjaKATANA"]:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Part') or part:IsA('Decal') or part:IsA('MeshPart') then
part.Transparency = 1
end end
local parts = v2:GetDescendants()
for i, part in ipairs(parts) do
print(part.ClassName)
if part:IsA('MeshPart') then 
part.Anchored=true part.CanCollide=false 
spawn(function()
for i= 1,5555555555 do 
part.CFrame=char["#NinjaKATANA"].Blade.CFrame*CFrame.new(0,0,0)*CFrame.Angles(math.rad(60),math.rad(0),math.rad(90))
task.wait() end end)
end
 end 
v.ring1.Size=Vector3.new(.1,2,2)
v.ring1.Anchored=true
v.Union.Anchored=true
for i = 1,5555555555555 do 
v.ring1.CFrame = char.Torso.CFrame*CFrame.new(0,1,1)*CFrame.Angles(0,math.rad(90),0)
v.Union.CFrame = char.Torso.CFrame*CFrame.new(0,0,2)*
CFrame.Angles(math.rad(90),i/5+math.cos(i/55)/25,math.rad(90))

task.wait(.003) end
elseif CC == 'Equinox' then
local v = game:GetObjects(getcustomasset('TSB/equin.rbxm'))[1]
v.Parent = F
task.wait(.2)
for i = 1,5555555555555 do 
v:GetChildren()[1].CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
*CFrame.Angles(math.rad(90),math.rad(180),math.rad(90+math.sin(i/35)*6))

v:GetChildren()[2].CFrame = char.Torso.CFrame*CFrame.new(5,math.sin(i/77),
4.3+math.sin(i/35)/5)*
CFrame.Angles(
math.rad(90+math.sin(i/35)),
math.rad(math.sin(i/77)*15),
math.rad(120+math.cos(i/35)))
v:GetChildren()[3].CFrame = char.Torso.CFrame*CFrame.new(-5,
math.sin(i/77),
2+math.sin(i/35)/5)*
CFrame.Angles(
math.rad(90+-math.sin(i/35)),
math.rad(120+-math.sin(i/77)*15),
math.rad(90+-math.cos(i/35)))
task.wait(.001) end
elseif CC == 'Purity' then 

local v = game:GetObjects(getcustomasset('TSB/Purity.rbxm'))[1]
v.Parent = F 

 for i = 1,5555555555555 do 
 v:GetChildren()[1].CFrame = char.Torso.CFrame*CFrame.new(-4,0,2)
 *CFrame.Angles(math.rad(90),math.rad(180),math.rad(111+math.sin(i/35)*6))
  v:GetChildren()[3].CFrame = char.Torso.CFrame*CFrame.new(4,0,2)
 *CFrame.Angles(-math.rad(90),-math.rad(200),math.rad(-69+math.cos(i/35)*6))
  v:GetChildren()[2].CFrame = char.Torso.CFrame*CFrame.new(0,1,1)*CFrame.Angles(0,math.rad(90),0)
 task.wait(.001) end

elseif CC == 'persistence' then 
local v = game:GetObjects(getcustomasset('TSB/persistence.rbxm'))[1]
v.Parent = F
 for i = 1,5555555555555 do 
 v.Wing1.CFrame = char.Torso.CFrame*CFrame.new(7,1,3)
 *CFrame.Angles(math.rad(-90-25),math.rad(-180-25),math.rad(-70))
 v.tail.CFrame = char.Torso.CFrame*CFrame.new(0,-2,1)
 *CFrame.Angles(math.rad(-0),math.rad(-90),math.rad(-0))
  v.bigring.CFrame = char.Torso.CFrame*CFrame.new(0,1.5,2)
 *CFrame.Angles(math.rad(90),math.rad(180),math.rad(111+math.sin(i/66)*6))
task.wait(.001) end
 end 
local MD = Instance.new('Model',F)
MD.Name = 'Highlight Holder'
task.delay(.5,function()
if CC == 'CHAOS' then
local parts = F:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Part') or part:IsA('UnionOperation') then
spawn(function()
for i = 1,99999 do 
part.Color=BrickColor.random().Color
task.wait(.05)
end end)  end end 
elseif CC == 'Rainbow' then
local parts = F:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Part') or part:IsA('UnionOperation')
 then
spawn(function()
for i = 1,99999 do 
part.Color=Color3.fromHSV(getgenv().Rainbow,1,1)
task.wait(.05)
end end)  end end 
elseif CC == 'crazed' then
local parts = F:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Part') or part:IsA('UnionOperation') then
spawn(function()
for i = 1,99999 do 
part.Color=Color3.fromRGB(0,0,math.random(1,155))
task.wait(.05)
end end)  end end end
end)
local HL = v
char = game.Players.LocalPlayer.Character
hum = char.Humanoid
tors = char.Torso
lleg = char["Left Leg"]
root = char.HumanoidRootPart
hed = char.Head
local Booleans = {CamFollow = true, GyroUse = true}
function lerp(object, newCFrame, alpha)
return object:lerp(newCFrame, alpha)
end
--local Create = LoadLibrary("RbxUtility").Create
CFuncs = {
Part = {
Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
local Part = Create("Part")({
Parent = F,
Reflectance = Reflectance,
Transparency = Transparency,
CanCollide = false,
Locked = true,
BrickColor = BrickColor.new(tostring(BColor)),
Name = Name,
Size = Size,
Material = Material
})
RemoveOutlines(Part)
return Part
end
},
}
function New(Object, Parent, Name, Data)
local Object = Instance.new(Object)
for Index, Value in pairs(Data or {}) do
Object[Index] = Value
end
Object.Parent = Parent
Object.Name = Name
return Object
end
local halocolor = BrickColor.new(CC)
local maincolor = BrickColor.new(CC)
local m = Instance.new("Model", MD)
local mw2 = Instance.new("Model", MD)
function CreateParta(parent, transparency, reflectance, material, brickcolor)
local p = Instance.new("Part")
p.TopSurface = 0
p.BottomSurface = 0
p.Parent = parent
p.Size = Vector3.new(0.1, 0.1, 0.1)
p.Transparency = transparency
p.Reflectance = reflectance
p.CanCollide = false
p.Locked = true
p.BrickColor = brickcolor
p.Material = material
return p
end
function CreateMesh(parent, meshtype, x1, y1, z1)
local mesh = Instance.new("SpecialMesh", parent)
mesh.MeshType = meshtype
mesh.Scale = Vector3.new(x1 * 10, y1 * 10, z1 * 10)
return mesh
end
function CreateWeld(parent, part0, part1, C1X, C1Y, C1Z, C1Xa, C1Ya, C1Za, C0X, C0Y, C0Z, C0Xa, C0Ya, C0Za)
local weld = Instance.new("Weld")
weld.Parent = parent
weld.Part0 = part0
weld.Part1 = part1
weld.C1 = CFrame.new(C1X, C1Y, C1Z) * CFrame.Angles(C1Xa, C1Ya, C1Za)
weld.C0 = CFrame.new(C0X, C0Y, C0Z) * CFrame.Angles(C0Xa, C0Ya, C0Za)
return weld
end
local ok = game.ReplicatedStorage.WR.Core:Clone()
ok.Parent = F
ok.CanCollide = false
ok.Anchored=true
ok.BrickColor = maincolor
spawn(function()
for i = 1,99999999999 do 
F.Core.CFrame=
char.Torso.CFrame*CFrame.new(math.cos(i/155)/5,1+math.sin(i/77)/3,1)
*CFrame.Angles(0,math.rad(90),0)
task.wait(.01) end
end)
local handlex = CreateParta(mw2, 1, 1, "Neon", maincolor)
CreateMesh(handle, "Brick", 0, 0, 0)
local handlexweld = CreateWeld(handlex, tors, handlex, 0, -1.5, -1.05, math.rad(0), math.rad(0), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
local valuaring = 10

local handle = CreateParta(m, 1, 1, "Neon", maincolor)
CreateMesh(handle, "Brick", 0.5, 0.5, 0.5)
local handleweld = CreateWeld(handle, tors, handle, 0, -1.5, -1.05, math.rad(0), math.rad(0), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
local lwing1 = CreateParta(m, 1, 1, "Neon", maincolor)

local rwing1 = CreateParta(m, 1, 1, "Neon", maincolor)
CreateMesh(handle, "Brick", 0.5, 0.5, 0.5)
local rwing1weld = CreateWeld(rwing1, handle, rwing1, -1, 0, 0, math.rad(5), math.rad(0), math.rad(-25), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing1, wed, 0, 0, 0.25, math.rad(0), math.rad(90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing1, wed, 0, 0, 0.25, math.rad(0), math.rad(-90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 3)
CreateWeld(wed, rwing1, wed, 0, -0.25, 1.75, math.rad(0), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 3, 0.5)
CreateWeld(wed, rwing1, wed, 0, -1.75, 0.25, math.rad(90), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
local rwing2 = CreateParta(m, 1, 1, "Neon", maincolor)
CreateMesh(handle, "Brick", 0.5, 0.5, 0.5)
local rwing2weld = CreateWeld(rwing2, handle, rwing2, -2, 1.5, 0, math.rad(10), math.rad(0), math.rad(-35), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing2, wed, 0, 0, 0.25, math.rad(0), math.rad(90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing2, wed, 0, 0, 0.25, math.rad(0), math.rad(-90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 3)
CreateWeld(wed, rwing2, wed, 0, -0.25, 1.75, math.rad(0), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 3, 0.5)
CreateWeld(wed, rwing2, wed, 0, -1.75, 0.25, math.rad(90), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
local rwing3 = CreateParta(m, 1, 1, "Neon", maincolor)
CreateMesh(handle, "Brick", 0.5, 0.5, 0.5)
local rwing3weld = CreateWeld(rwing3, handle, rwing3, -2.5, 2.6, 0, math.rad(15), math.rad(0), math.rad(-55), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))

wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing3, wed, 0, 0, 0.25, math.rad(0), math.rad(90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))

wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing3, wed, 0, 0, 0.25, math.rad(0), math.rad(-90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))

wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 3)
CreateWeld(wed, rwing3, wed, 0, -0.25, 1.75, math.rad(0), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))

wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 3, 0.5)
CreateWeld(wed, rwing3, wed, 0, -1.75, 0.25, math.rad(90), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
local TweenService = game:GetService("TweenService")

local weld = rwing3weld
local Info = TweenInfo.new(
2,                              --Length (seconds)
Enum.EasingStyle.Sine,          --Easing Style
Enum.EasingDirection.InOut,       --Easing Direction
-1,                             --Times Repeated
true,                           --reversed
0                               --deşau
)

local goal = {
C1 = rwing3weld.C1 * CFrame.new(0, 1, -1) * 
CFrame.Angles(0, 0, math.rad(-35))
}

local tween = TweenService:Create(weld, Info, goal)
tween:Play()


local TweenService = game:GetService("TweenService")

local weld = rwing2weld
local Info = TweenInfo.new(
2,                              --Length (seconds)
Enum.EasingStyle.Sine,          --Easing Style
Enum.EasingDirection.InOut,       --Easing Direction
-1,                             --Times Repeated
true,                           --reversed
0                               --deşau
)

local goal = {
C1 = rwing2weld.C1 * CFrame.new(0, 1, -.5) * CFrame.Angles(0, 0, 
math.rad(-25))
}

local tween = TweenService:Create(weld, Info, goal)
tween:Play()


local TweenService = game:GetService("TweenService")

local weld = rwing1weld
local Info = TweenInfo.new(
2,                              --Length (seconds)
Enum.EasingStyle.Sine,          --Easing Style
Enum.EasingDirection.InOut,       --Easing Direction
-1,                             --Times Repeated
true,                           --reversed
0                               --deşau
)

local goal = {
C1 = rwing1weld.C1 * CFrame.new(0, 1, 0) * 
CFrame.Angles(0, 0, math.rad(-15))
}

local tween = TweenService:Create(weld, Info, goal)
tween:Play()
if BothSides == true then 
if AGJKAGAG == nil then AGJKAGAG = 'Bright Red' end
local maincolor = BrickColor.new(AGJKAGAG)
local halocolor = BrickColor.new(AGJKAGAG)
local maincolor = BrickColor.new(AGJKAGAG)
local rwing1 = CreateParta(m, 1, 1, "Neon", maincolor)
CreateMesh(handle, "Brick", 0.5, 0.5, 0.5)
local rwing1weld = CreateWeld(rwing1, handle, rwing1, 1, 0, 0, 
math.rad(5), math.rad(0), math.rad(25), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing1, wed, 0, 0, 0.25, math.rad(0), math.rad(90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing1, wed, 0, 0, 0.25, math.rad(0), math.rad(-90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 3)
CreateWeld(wed, rwing1, wed, 0, -0.25, 1.75, math.rad(0), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 3, 0.5)
CreateWeld(wed, rwing1, wed, 0, -1.75, 0.25, math.rad(90), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
local rwing2 = CreateParta(m, 1, 1, "Neon", maincolor)
CreateMesh(handle, "Brick", 0.5, 0.5, 0.5)
local rwing2weld = CreateWeld(rwing2, handle, rwing2, 2, 1.4, 0,
math.rad(-10), math.rad(0), math.rad(35), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing2, wed, 0, 0, 0.25, math.rad(0), math.rad(90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing2, wed, 0, 0, 0.25, math.rad(0), math.rad(-90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 3)
CreateWeld(wed, rwing2, wed, 0, -0.25, 1.75, math.rad(0), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 3, 0.5)
CreateWeld(wed, rwing2, wed, 0, -1.75, 0.25, math.rad(90), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
local rwing3 = CreateParta(m, 1, 1, "Neon", maincolor)
CreateMesh(handle, "Brick", 0.5, 0.5, 0.5)
local rwing3weld = CreateWeld(rwing3, handle, rwing3, 2.5, 2.5, 0, 
math.rad(15), math.rad(0), math.rad(55), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))

wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing3, wed, 0, 0, 0.25, math.rad(0), math.rad(90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))

wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 0.5)
CreateWeld(wed, rwing3, wed, 0, 0, 0.25, math.rad(0), math.rad(-90), math.rad(0), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))

wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 0.5, 3)
CreateWeld(wed, rwing3, wed, 0, -0.25, 1.75, math.rad(0), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))

wed = CreateParta(mw2, 0, 0, "Neon", halocolor)
CreateMesh(wed, "Wedge", 0.05, 3, 0.5)
CreateWeld(wed, rwing3, wed, 0, -1.75, 0.25, 
math.rad(90), math.rad(90), math.rad(90), 0, 0, 0, math.rad(0), math.rad(0), math.rad(0))
local TweenService = game:GetService("TweenService")

local weld = rwing3weld
local Info = TweenInfo.new(
2,                              --Length (seconds)
Enum.EasingStyle.Sine,          --Easing Style
Enum.EasingDirection.InOut,       --Easing Direction
-1,                             --Times Repeated
true,                           --reversed
0                               --deşau
)

local goal = {
C1 = rwing3weld.C1 * CFrame.new(0, 1, -1) * 
CFrame.Angles(0, 0, math.rad(35))
}

local tween = TweenService:Create(weld, Info, goal)
tween:Play()


local TweenService = game:GetService("TweenService")

local weld = rwing2weld
local Info = TweenInfo.new(
2,                              --Length (seconds)
Enum.EasingStyle.Sine,          --Easing Style
Enum.EasingDirection.InOut,       --Easing Direction
-1,                             --Times Repeated
true,                           --reversed
0                               --deşau
)

local goal = {
C1 = rwing2weld.C1 * CFrame.new(0, 1, -.5) * CFrame.Angles(0, 0, 
math.rad(25))
}

local tween = TweenService:Create(weld, Info, goal)
tween:Play()


local TweenService = game:GetService("TweenService")

local weld = rwing1weld
local Info = TweenInfo.new(
2,                              --Length (seconds)
Enum.EasingStyle.Sine,          --Easing Style
Enum.EasingDirection.InOut,       --Easing Direction
-1,                             --Times Repeated
true,                           --reversed
0                               --deşau
)

local goal = {
C1 = rwing1weld.C1 * CFrame.new(0, 1, 0) * 
CFrame.Angles(0, 0, math.rad(15))
}

local tween = TweenService:Create(weld, Info, goal)
tween:Play()
end
end)
end)
end
getgenv().TRUEMODE = nil
function SpawnAs(char) 
getgenv().TRUEMODE = char
game.Players.LocalPlayer.Character:SetAttribute("UltimateName", string.upper(char))
if char == 'Mayhem' then 
local re = false
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "MAYHEM"
PName.TextColor3 = Color3.new(1,0,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Hateful Impact'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Extinctive Heartbreak'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'End Ground'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Spine Shatter'

getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://18435383478" then
getgenv().DoingUlt = true
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "PANDEMONIUM"
PName.TextColor3 = Color3.new(1,0,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
_G.SetMusic(11,1,49)
for i = 1,15 do 
pcall(function()
char.SGWings:Destroy() end)
end
task.wait(.2)
_G.SetDecal('pandemonium')
_G.QuickSet('pandemonium')
getgenv().MUSIC_CREDS = 'T+Pazolite & Laur - Pandemonium'
getgenv().TRUEMODE = 'Pandemonium'

_G.RefreshUI()
local f = Instance.new('Folder')
f.Name = 'SGWings' 
f.Parent = workspace
local v = game:GetObjects(getcustomasset('TSB/Pandemonium.rbxm'))[1]
v.Parent = f
v.Core.Size=Vector3.new(.1,2,2)
v.Core.Anchored=true
v['Wing 2'].Anchored=true
v['Wing 1'].Anchored=true
local v2 = game:GetObjects(getcustomasset('TSB/panwmayhem.rbxm'))[1]
v2.Parent = char.SGWings
spawn(function()
for i = 1,999999 do 
v2.CFrame=CFrame.new(hrp.CFrame.X,438.2,hrp.CFrame.Z)
task.wait() end end)
spawn(function()
for i = 1,555555 do 
v:GetChildren()[2].CFrame = char['Left Arm'].CFrame*CFrame.new(0,-1,0)
v.Blade.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-1,0)
v.Core.CFrame = char.Torso.CFrame*CFrame.new(0,1,1)*CFrame.Angles(0,math.rad(90),0)
v['Wing 2'].CFrame = char.Torso.CFrame*CFrame.new(-3,1,4.5)*
CFrame.Angles(math.rad(120+math.sin(i/35)*5),math.rad(180),math.rad(144+-math.sin(i/35)*2))
v['Wing 1'].CFrame = char.Torso.CFrame*CFrame.new(3,-2,3)*
CFrame.Angles(math.rad(270+math.sin(i/35)*5),math.rad(180),-math.rad(45+math.sin(i/35)*2))
task.wait(.01) end
end)

repeat task.wait() until bp:FindFirstChild('Vanishing Kick')
_G.QuickSet(255,0,0,55,0,0)
v2:Destroy()
getgenv().MUSIC_CREDS = 'D-MODE-D - Shriek'
getgenv().TRUEMODE = 'Mayhem'
_G.SetDecal(Color3.new(1,0,0),-5)
_G.RefreshUI()
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Hateful Impact'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Extinctive Heartbreak'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'End Ground'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Spine Shatter'
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "MAYHEM"
PName.TextColor3 = Color3.new(1,0,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
_G.SetMusic(1)
_G.SetWings('Mayhem')
end end)
getgenv().M1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://17889458563" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16515503507"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1)
end end)
getgenv().M2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://17889461810" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17888706103"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
end end)
getgenv().M3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://17889471098" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16597912086"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = .3
task.wait(.3)
k:Stop()
end end)
getgenv().Move2B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://17838619895" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://140164642047188"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = 6.5
_G.PS('136007472',1,nil,1.7)
_G.PS('1690475123',3,nil,1)
_G.PS('1690475123',3,nil,.9)
_G.twA('THIS IS IT!',Color3.new(1,0,0),Color3.new(.2,0,0))
spawn(function()
local s = .1
for i = 1,45 do s=s+-.02
task.wait(s)
spawn(function()

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,.2)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(2,2,15)
p.CFrame = char['Right Arm'].CFrame*
CFrame.new(math.random(-5,5)*5,math.random(-5,5)*5,math.random(-5,5)*5)
*CFrame.Angles(math.random(-5,5)*3,math.random(-5,5)*3,math.random(-5,5)*3)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})

bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(.5,-5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'VelocityPerpendicular'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'GlowS'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(3,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.LightEmission = 15
bld.Brightness = 15
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.5),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
end)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,20)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,
Position = 
char['Right Arm'].Position
}):Play()

p.CFrame = 
CFrame.lookAt(p.Position, char['Right Arm'].Position) 
end) end end)
task.wait(.7)
spawn(function()
for i = 1,15 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,.2)
msh2.Scale = Vector3.new(15-i/2,15-i/2,2)
p.CFrame = hrp.CFrame*CFrame.new(0,0,-5)
task.wait(.2)
local tw = game.TweenService:Create(p,TweenInfo.new(.5),{Transparency = 1,CFrame = 
hrp.CFrame*CFrame.new(0,0,-5+-i*4+-i)})
tw:Play()
tw.Completed:wait() p:Destroy()
end)
end
end)
end end)
getgenv().M4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://17889290569" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://106755459092436"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
k.TimePosition = .9
local bv = Instance.new('BodyVelocity')
bv.Parent = hrp
bv.MaxForce=Vector3.new(9e9, 9e9, 9e9)
bv.Velocity=hrp.CFrame.LookVector*35
task.wait(.3)
k:AdjustSpeed(.3)
k:Stop(.5)
bv:Destroy()
end end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17097712387"
local k = char.Humanoid:LoadAnimation(Anim)
local mayhemloop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
mayhemloop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(.1)
spawn(function()
for i = 1,999999 do 
if mayhemloop == false then break end
k.TimePosition = .5+math.cos(i/35)/15
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
mayhemloop = false
end end)
if getgenv().SpawnEffects == true then

task.wait(.3)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://100558589307006"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.5)

task.delay(.1,function() _G.PS('136007472',1) end)
task.delay(1.2,function()

_G.PS('1843115950',4)
_G.PS('341301373',4)
for i = 1,15 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1+gay,15+gay*3,1+gay)
p.CFrame = hrp.CFrame*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))*CFrame.new(0,0,0)
game:GetService("Debris"):AddItem(p, 13)
game.TweenService:Create(p,TweenInfo.new(2.8+math.random(1,3)),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(-5,35),0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(2+math.random(1,3)),{
Transparency = 1
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 150
bld.Lifetime = NumberRange.new(3)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(3.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 150
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(9)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(3.5,function()
bld.Rate = 0 end)
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1+gay,15+gay*3,1+gay)
p.CFrame = hrp.CFrame*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))*CFrame.new(0,0,0)
game:GetService("Debris"):AddItem(p, 4)
game.TweenService:Create(p,TweenInfo.new(math.random(1,3)/2),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(-5,35),0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(math.random(1,3)/2),{
Transparency = 1
}):Play()

end
end)
spawn(function()
task.wait(1)
for i = 1,15 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(msh2,TweenInfo.new(i/66),{
Scale=Vector3.new(15*i/2,15*i/2,15*i/2)
}):Play()
game.TweenService:Create(p,TweenInfo.new(i/66),{
Transparency = 1
}):Play()
task.wait(.01) end  
end) 

end

getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://17838006839" then

hrp.Anchored=true
task.delay(.6,function()
hrp.Anchored=false end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://112620365240235"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
task.wait(.4)
_G.PS('2613355772',.5,nil,1.7)
task.wait(.03)

local parts = game.CoreGui.HeadsetDisconnectedDialog:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Sound') then
spawn(function()
local otpos = part.TimePosition
if part.Playing == false then return end
part:Pause()
task.wait(.2)
part:Play() 
part.TimePosition = otpos
end) end end
spawn(function()
for i = 1,10 do 

spawn(function()

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,.2)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(2,2,15)
p.CFrame = char['Right Arm'].CFrame*
CFrame.new(math.random(-5,5)*5,math.random(-5,5)*5,math.random(-5,5)*5)
*CFrame.Angles(math.random(-5,5)*3,math.random(-5,5)*3,math.random(-5,5)*3)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})

bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(.5,-5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'VelocityPerpendicular'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'GlowS'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(3,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.5),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
end)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,20)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,
Position = 
hrp.Position
}):Play()

p.CFrame = 
CFrame.lookAt(p.Position, char['Right Arm'].Position) 
end) end end)
task.wait(.3)
k:Stop()
end end)
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://17799224866" then
    v:Stop()
    local Attachment = Instance.new("Attachment")
Attachment.Parent = hrp

    CreateTrailMayhem(0.5)
AfterImageMayhem(Color3.new(1,0,0), "Neon", 1, 0)
local LV = Instance.new("LinearVelocity", Attachment)
LV.MaxForce = 98555
LV.Attachment0 = Attachment
LV.ForceLimitMode = Enum.ForceLimitMode.PerAxis
LV.MaxAxesForce = Vector3.new(98555, 98555, 98555)
spawn(function()
for i = 1,30 do 
LV.VectorVelocity = hrp.CFrame.LookVector*3
    CreateTrailMayhem(0.5)
AfterImageMayhem(Color3.new(1,0,0), "Neon", 1, .9)
task.wait(.04) end
        CreateTrailMayhem(0.5)
AfterImageMayhem(Color3.new(1,0,0), "Neon", 2, .2)
hrp.CFrame=hrp.CFrame*CFrame.new(0,75,0)
        CreateTrailMayhem(0.5)
AfterImageMayhem(Color3.new(1,0,0), "Neon", 2, .2)
for i = 1,10 do 
        CreateTrailMayhem(0.5)
AfterImageMayhem(Color3.new(1,0,0), "Neon", .2, .2)
LV.VectorVelocity = Vector3.new(0,5,0)
task.wait(.04) end

LV.VectorVelocity = Vector3.new(0,3,0)
task.wait(.5)
        CreateTrailMayhem(0.5)
AfterImageMayhem(Color3.new(1,0,0), "Neon", 8, 0)
hrp.CFrame=hrp.CFrame*CFrame.new(0,-65,0)
AfterImageMayhem(Color3.new(1,0,0), "Neon", 8, 0)
Attachment:Destroy()

end)

_G.PS('136007472',1,nil,.7)
_G.PS('1690475123',3,nil,1)
_G.PS('1690475123',3,nil,.9)
_G.twA('THIS IS IT!',Color3.new(1,0,0),Color3.new(.2,0,0))
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16719107050"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
task.wait(1) k:Stop(.1)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17464644182"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
task.wait(.5) k:Stop(.4)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14798608838"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)

end end)

local m3db = false
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://17857788598" then
if m3db == true then return end m3db = true
v:Stop()
hrp.Anchored=true
task.delay(.7,function()
_G.PS('9166224293',3,nil,1.5)
end)
_G.PS('9166224293',.5,nil,.5)
_G.PS('9120060683',3,nil,1.5)
spawn(function()
task.wait(.5)
for i = 1,15 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1+i/15,1+i/15,1+i/15)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-1.5,0)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,0)
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 35
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 150
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(9)
bld.VelocitySpread = 50000
bld.ZOffset = -1
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(i/15,15+i/2,i/15)
p.Transparency = .7
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-i/5,0)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,25,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.1),{
CFrame = char['Right Arm'].CFrame*CFrame.new(0,-35,0)
}):Play()
task.wait(.03) end  
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17325254223"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1.5)
task.wait(1)
hrp.Anchored=false
task.wait(2)
m3db = false
end end)
function mS()

for i = 1,15 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1+gay,15+gay*3,1+gay)
p.CFrame = char.Torso.CFrame*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))*CFrame.new(0,0,0)
game:GetService("Debris"):AddItem(p, 13)
game.TweenService:Create(p,TweenInfo.new(2.8+math.random(1,3)),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(-5,35),0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(2+math.random(1,3)),{
Transparency = 1
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 150
bld.Lifetime = NumberRange.new(3)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(3.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 150
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(9)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(3.5,function()
bld.Rate = 0 end)
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1+gay,15+gay*3,1+gay)
p.CFrame = char.Torso.CFrame*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))*CFrame.new(0,0,0)
game:GetService("Debris"):AddItem(p, 4)
game.TweenService:Create(p,TweenInfo.new(math.random(1,3)/2),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(-5,35),0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(math.random(1,3)/2),{
Transparency = 1
}):Play()

end end
local TweenService = game:GetService("TweenService")
local BodyParts = {
"Head",
"Torso",
"Left Arm",
"Right Arm",
"Left Leg",
"Right Leg"
}

function AfterImageMayhem(color3, material, duration, trans)
spawn(function()
    if getgenv().potato_device == true then return end
end)
end
function CreateTrailMayhem(duration)
spawn(function()
    if getgenv().potato_device == true then return end
local part = Instance.new("Part")
part.Anchored = true 
part.CanCollide = false
part.CanTouch = false
part.CanQuery = false
part.Massless = true 
part.Position = lp.Character.Torso.Position + Vector3.new(math.random(-5,5),math.random(-3,5),math.random(-5,5))
part.CFrame = CFrame.lookAt(part.Position, part.Position + lp.Character.HumanoidRootPart.Velocity)
part.CFrame = part.CFrame * CFrame.new(0,0,math.random(-9,0))
part.Size = Vector3.new(1, 1, 1)
part.Color = Color3.new(1,0,0)
part.Material = Enum.Material.Neon
part.Parent = getgenv().Enviroment
local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.Sphere
mesh.Parent = part
task.wait(.1)
game:GetService("TweenService"):Create(part, TweenInfo.new(.2),
 {Size = Vector3.new(0.25, 0.25, 5)}):Play()
 task.wait(.2)
part.Color = Color3.new(1,0,0)
game:GetService("TweenService"):Create(part, TweenInfo.new(duration),
 {Size = Vector3.new(0,0,25)
 }):Play()
game.Debris:AddItem(part, duration)

end)
end
function Move4v1()

v2 = Instance.new('BodyGyro',hrp) 
v2.Name = 'Client' 
v2.MaxTorque = Vector3.new(1,1,1)*10^10
v2.D = 255
v2.P = 19500
v2.CFrame = hrp.CFrame*CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0))
task.delay(3,function()
v2:Destroy()

end)
task.delay(1,function()
hrp.Anchored=true task.wait(2.5) hrp.Anchored=false end)
task.delay(1,function()
_G.PS('1718412034',3,nil,1.1)
_G.PS('525200869',1,nil,.8)
_G.PS('1718412034',3,nil,1)
_G.PS('1718412034',3,nil,.9)
task.wait(.5)
_G.twA('SHATTER!',Color3.new(1,0,0),Color3.new(.2,0,0))
end)
spawn(function()
mS()
task.wait(3)
mS()
end)
spawn(function()
task.wait(3)
for i = 1,15 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(msh2,TweenInfo.new(i/66),{
Scale=Vector3.new(15*i/2,15*i/2,15*i/2)
}):Play()
game.TweenService:Create(p,TweenInfo.new(i/66),{
Transparency = 1
}):Play()
task.wait(.01) end  
end)
end
function Move4v2()
task.delay(1,function()
_G.PS('1718412034',3,nil,1.1)
_G.PS('525200869',1,nil,.8)
_G.PS('1718412034',3,nil,1)
_G.PS('1718412034',3,nil,.9)
task.wait(.5)
_G.twA('SHATTER!',Color3.new(1,0,0),Color3.new(.2,0,0))
end)
spawn(function()
mS()
task.wait(3)
mS()
end)
spawn(function()
task.wait(3)
for i = 1,15 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(msh2,TweenInfo.new(i/66),{
Scale=Vector3.new(15*i/2,15*i/2,15*i/2)
}):Play()
game.TweenService:Create(p,TweenInfo.new(i/66),{
Transparency = 1
}):Play()
task.wait(.01) end  
end)


local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18462892217"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1.7)
k.Priority = Enum.AnimationPriority.Action2
task.wait(1)
k:Stop(3)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13633468484"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play()
kk:AdjustSpeed(1)
kk.TimePosition = 3
k.Priority = Enum.AnimationPriority.Action2
task.wait(1)
k:Play(-1)
k.TimePosition = 3
k:Stop(1)
end
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://18182425133" then
    spawn(function()
for i = 1,66 do 
    CreateTrailMayhem(0.5)
AfterImageMayhem(Color3.new(1,0,0), "Neon", 1, 0)
task.wait(.05) end end)
local rnd = math.random(1,2)
if rnd == 1 then 
Move4v1() 
else 
v:Stop()
Move4v2()
end
end end)
elseif char == 'VIOLENCE' then 
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack

local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "VIOLENCE"
PName.TextColor3 = Color3.new(1,0,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(0, 0, 0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 

PName.Rotation = math.cos(i/35)*2+math.tan(i/35)/15
task.wait(.01) end end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://12772543293"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://137841251329955"
local floatplay = char.Humanoid:LoadAnimation(Anim)
local ViolenceLoop = false

 if getgenv().ModeIdleAuras == true then 
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
ViolenceLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
floatplay:Play()
floatplay.Priority = Enum.AnimationPriority.Idle
floatplay:AdjustSpeed(.5)
spawn(function()
for i = 1,999999 do 
if ViolenceLoop == false then break end
k.TimePosition = .7+math.sin(i/45)/45
floatplay:AdjustSpeed(math.tan(i/15))
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,.1)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame*CFrame.new(
	math.random(-55,55),math.random(-25,-15),
	math.random(-55,55))
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Orientation = 'VelocityParallel'
bld.Lifetime = NumberRange.new(1)
spawn(function()
for j = 1,77 do 
msh2.Scale = Vector3.new(
1-j/5+getgenv().music.PlaybackLoudness/55,
j/2+getgenv().music.PlaybackLoudness/55,
1-j/5+getgenv().music.PlaybackLoudness/55
)




task.wait(.03)
 end end)
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,-5)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
bld.Speed = NumberRange.new(.1)
bld.VelocitySpread = 0
bld.ZOffset = -2
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(1.5,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(2.5),{
Transparency = 1,CFrame = p.CFrame*CFrame.new(0,math.random(15,99),0)
}):Play()


local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,.1)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame*CFrame.new(0,-3,0)*
CFrame.Angles(0,i,0)
game:GetService("Debris"):AddItem(p, .3)
spawn(function()
for e = 1,35 do 
msh2.Scale=Vector3.new(15+getgenv().music.PlaybackLoudness/15,.6,.6)
p.Transparency = (0+e/35)+-getgenv().music.PlaybackLoudness/155
task.wait(.01) end end)
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2) floatplay:Stop()

ViolenceLoop = false
end end)
else 
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
ViolenceLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
floatplay:Play()
floatplay.Priority = Enum.AnimationPriority.Idle
floatplay:AdjustSpeed(.5)
spawn(function()
for i = 1,999999 do 
if ViolenceLoop == false then break end
k.TimePosition = .7+math.sin(i/45)/45
floatplay:AdjustSpeed(math.tan(i/15))
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2) floatplay:Stop()

ViolenceLoop = false
end end)
end
_G.SetMusic(24)
_G.QuickSet(255,0,0,55,0,0)

getgenv().MUSIC_CREDS = 'Akiri - The Wandering Beast'
getgenv().TRUEMODE = 'VIOLENCE'
_G.RefreshUI()
_G.SetDecal(Color3.new(1, 0, 0),60)
_G.SetWings(Color3.new(1,0,0),true,Color3.new(.9,0,0))

getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14004235777" then
v:Stop()

_G.twA('YOUR EXISTENCE IS A MISTAKE.',Color3.new(1,0,0),Color3.new(0,0,0))
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18464356233"
local k2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k2:Play()
k2.Priority = Enum.AnimationPriority.Action2
k2:AdjustSpeed(0)
spawn(function()
for i  =1,35 do 

k2.TimePosition = k2.TimePosition +i/45
task.wait(.1) end end)
spawn(function()
local hit = false
for i = 1,150 do if hit == true then return end

    for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 16 then 
for _, track in pairs(v.Humanoid:GetPlayingAnimationTracks()) do
if track.Animation.AnimationId == 'rbxassetid://13997299436' then
track:Stop()
hit = true
task.spawn(function()
local pcf = hrp.CFrame
workspace.Live.SG_Clone.HumanoidRootPart.CFrame = hrp.CFrame 
workspace.CurrentCamera.CameraSubject = workspace.Live.SG_Clone
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://108974035701442"
local k1 = workspace.Live.SG_Clone.Humanoid:LoadAnimation(Anim)
k1:Play(.3)
k1.Priority = Enum.AnimationPriority.Action
k1:AdjustSpeed(1)
k1.TimePosition = k2.TimePosition
hrp.CFrame = CFrame.new(0, 10^10, 0)
task.wait(2)
hrp.CFrame = pcf
workspace.CurrentCamera.CameraSubject = char 
workspace.Live.SG_Clone.HumanoidRootPart.CFrame = CFrame.new(0,10^10,0)
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://111487401271653"
local k = v.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = k2.TimePosition
task.delay(2,function()
k:Stop()  end)
end end end end end task.wait(.01) end
end)
task.wait(1)
local f = Instance.new('Folder',game.CoreGui)

local sound2 = Instance.new('Sound')
sound2.Parent = f
sound2.SoundId = "rbxassetid://919941001"
sound2.Volume = 1
sound2:Play()
local sound2 = Instance.new('Sound')
sound2.Parent = f
sound2.SoundId = "rbxassetid://919941001"
sound2.Volume = 3
sound2:Play()
task.delay(4,function() f:Destroy() end)
spawn(function()
for i = 1,5 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,.5)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(i*math.random(1,3),i*math.random(1,3),i*math.random(1,3))
p.CFrame = hrp.CFrame*CFrame.new(0,0,1)
task.wait(.01)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame*CFrame.new(0,0,1)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*35
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*15
bld.Brightness = 1+i*15

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*45),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-15),
NumberSequenceKeypoint.new(.3,5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(1)
task.delay(1.5,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end
end)
local v = Instance.new('ColorCorrectionEffect')
local h = Instance.new('Highlight')
h.Parent = char 
h.FillColor=Color3.new(0,0,0)
h.OutlineTransparency = 1
task.spawn(function()
v.Parent = game.Lighting
v.Enabled = true

for i = 1,7 do

v.Brightness = .1
v.TintColor=Color3.new(math.random(0,1),0,0)
task.wait(.1)
end h:Destroy()
v:Destroy()
end)

end end)
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(vr)
if vr.Animation.AnimationId == "rbxassetid://14048285180"
or vr.Animation.AnimationId == "rbxassetid://14046756619"
then
task.delay(1,function() dbb = false end)
_G.twA('HEY.',Color3.new(0,0,0),
Color3.new(0,0,0))
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13643152947"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = .2
vr:GetMarkerReachedSignal("go"):Connect(function(paramString)
k:Stop(.4)

_G.twA('ROT. CEASE. DISSAPEAR.',Color3.new(0,0,0),
Color3.new(1,0,0))
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.Velocity=pp.Velocity*0
end end)
task.delay(1.5,function()
lol:Disconnect() end)
spawn(function()
local hit = false
for i = 1,150 do if hit == true then return end

    for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 16 then 
for _, track in pairs(v.Humanoid:GetPlayingAnimationTracks()) do
if track.Animation.AnimationId == 'rbxassetid://14055425251' then
track:Stop()
hit = true
spawn(function()
local m = Instance.new('Model')
m.Parent = char 
local h2 = Instance.new('Highlight')
h2.Parent = v 
local h = Instance.new('Highlight')
h.Parent = char 
local hlpart = Instance.new('Highlight')
hlpart.Parent = m 
hlpart.OutlineTransparency = 1
hlpart.FillTransparency = 0
task.delay(5,function()
m:Destroy()
h:Destroy()
h2:Destroy()
end)
local yeah = 0
spawn(function()
for i = 1,555 do 
    local r = math.random(0,1)
    h.FillColor=Color3.new(r,r,r)
        hlpart.FillColor=Color3.new(r,0,0)
		h2.FillColor=Color3.new(r,0,0)
    task.wait(.01) 
        local r = math.random(0,1)
    h.FillColor=Color3.new(r,0,0)
        hlpart.FillColor=Color3.new(0,0,0)
		        h2part.FillColor=Color3.new(r,r,r)
    task.wait(.01) 
    end end)
h.OutlineTransparency = 1
spawn(function()



			local lol = Instance.new('ColorCorrectionEffect')
lol.Parent = game.Lighting
for i = 1,5 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 3 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .2
s.Volume = .5 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
end
game.TweenService:Create(h,TweenInfo.new(1),{
    FillTransparency = 1
}):Play()
spawn(function()
yeah = 3
for i = 1,777/13 do 
char.Humanoid.CameraOffset = Vector3.new(
math.random(-5,5),
math.random(-5,5),
math.random(-5,5)

)
for i = 1,4 do 
local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(15,1,99)
p.CFrame = hrp.CFrame*CFrame.new(
math.random(-15,35),
math.random(-3,15),
math.random(-77,0))
game:GetService("Debris"):AddItem(p, .3)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
CFrame = p.CFrame*CFrame.new(0,0,77)
}):Play()
end
task.wait(.01)
 end
end)
for i = 1,55/2 do 
lol.Contrast = 999
task.wait(.01)
lol.Contrast = -3
task.wait(.01) 
lol.Contrast = -999
task.wait(.01) 
lol.TintColor = Color3.new(1,0,0)
end
lol:Destroy()
_G.PS('1718412034',3,nil,1.1)
_G.PS('525200869',1,nil,.8)
_G.PS('1718412034',3,nil,1)
_G.PS('1718412034',3,nil,.9)
task.wait(.5)
_G.twA('SHATTER!',Color3.new(1,0,0),Color3.new(.2,0,0))
end)
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://129945907044125"
local k = v.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = 2.2
task.delay(1.5,function()
if vr.IsPlaying then
local yesss = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.Velocity = Vector3.new(9e9,9e9,9e9)
hrp.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(-1,0,0)
game:GetService("RunService").RenderStepped:Wait()
hrp.Velocity = Vector3.new(0,0,0)
hrp.CFrame = old
end)
task.wait(3)
yesss:Disconnect() end
end)
task.delay(2,function()
k:Stop()  end)
end end end end end task.wait(.01) end
end)
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://93546004428904"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = 2.2
task.wait(2.7)
k:AdjustSpeed(.3)
task.wait(.5)
k:Stop(.5)
end end)
local db = false 
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14299135500" then
if db == true then return end 
db = true 
task.delay(2,function() db = false end)

task.wait(1.4)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17860693408"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.6)
_G.twA('TOUCH THEM.',Color3.new(1,0,0),
Color3.new(0,0,0))
local bv = Instance.new('BodyVelocity')
local ye = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.Velocity = Vector3.new(10^10,10^10,10^10)
game:GetService("RunService").RenderStepped:Wait()
hrp.Velocity = Vector3.new(0,0,0)
end)
bv.Parent = hrp 
bv.MaxForce = Vector3.new(9e9,0,9e9)
for i = 1,150 do 
bv.Velocity = hrp.CFrame.LookVector*99
task.wait(.01) end
ye:Disconnect()  bv:Destroy()
k:Stop(.5)
end end)
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14351441234" then
v:Stop()
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.Velocity=pp.Velocity*0
end end)
task.delay(1.5,function()
lol:Disconnect() end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://129651400898906"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
end end)
getgenv().Move4B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14705929107" then
v:Stop()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
p.CFrame = hrp.CFrame*CFrame.new(0,-15,0)*CFrame.Angles(math.rad(-15),0,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
task.delay(15,function() bld.Rate = 0 end)
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,15),
NumberSequenceKeypoint.new(1,0)
})
bld.Drag = 7
bld.Orientation = 'VelocityPerpendicular'
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,-5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(87,93)
bld.RotSpeed = NumberRange.new(0)
bld.LockedToPart = true
game:GetService("Debris"):AddItem(p, 15.5)
p.Size=Vector3.new(25,0,77)
p.Color=Color3.new(1,0,0)
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = .2,CFrame=p.CFrame*CFrame.new(0,15,-8)
*CFrame.Angles(math.rad(90+15),0,0),

}):Play()
task.delay(12,function()
game.TweenService:Create(p,TweenInfo.new(2.5),{
Transparency = .7,CFrame=p.CFrame*CFrame.new(0,-185,45)
*CFrame.Angles(math.rad(-125),0,0),

}):Play()
end)
_G.twA('CEASE.',Color3.new(0,0,0),Color3.new(1,0,0))
local hit = false 
for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 16 then 
for _, track in pairs(v.Humanoid:GetPlayingAnimationTracks()) do
if track.Animation.AnimationId == 'rbxassetid://14700473573' then
track:Stop() if hit == true then return end
hit = true
local c =workspace.Live.SG_Clone
local pcf = hrp.CFrame
c.HumanoidRootPart.CFrame = hrp.CFrame 
workspace.CurrentCamera.CameraType = 'Scriptable'
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://94020267622363"
local k = c.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://94020267622363"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://137624104134020"
local kk = hum:LoadAnimation(Anim)
kk:Play()
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(1)
kk.TimePosition = .4
local m = Instance.new('Model')
m.Parent = c 
local hlpart = Instance.new('Highlight')
hlpart.Parent = m 
hlpart.OutlineTransparency = 1
hlpart.FillTransparency = 0
local i = 1
local e = 0
local sex = workspace.CurrentCamera.CFrame
task.delay(1,function()
hrp.CFrame = CFrame.new(10^9,200,0)
task.wait(.5)
settings().Network.IncomingReplicationLag = 999
end)
local v = Instance.new('Part') v.CFrame = CFrame.new(10^9,150,0)
v.Parent = hlpart
v.Anchored=true
v.Size=Vector3.new(1555,1,1555)
v.Material = Enum.Material.Neon 

task.delay(25,function() v:Destroy() end)
local yesss = game:GetService("RunService").Heartbeat:Connect(function(step)
i=i+1
local camc = c.HumanoidRootPart.CFrame*CFrame.new(-15+i/30,i/9,15+-i/9)*
CFrame.Angles(c.Torso.Rotation.X/45,math.rad(180+c.Torso.Rotation.Y/45),c.Torso.Rotation.Z/4)
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.3),{
	CFrame =
CFrame.lookAt(camc.p, c.Torso.Position)
	*CFrame.Angles(char.Torso.Rotation.X/455,
0,0)
	}):Play()

kk.TimePosition = k.TimePosition+-.4
end)
spawn(function()
spawn(function()
for i = 1,155 do 
local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
p.CFrame = c['Left Leg'].CFrame*CFrame.new(0,-1,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
task.delay(.3,function() bld.Rate = 0 end)
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Drag = 7
bld.Orientation = 'VelocityPerpendicular'
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,15),
NumberSequenceKeypoint.new(1,1)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(87,93)
bld.RotSpeed = NumberRange.new(0)
bld.Acceleration = Vector3.new(0,15,0)
bld.LockedToPart = true
game:GetService("Debris"):AddItem(p, 2)
p.Size=Vector3.new(7,1,7)
p.Color=Color3.new(1,0,0)
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1,Size=Vector3.new(15+math.random(-15,15)/35,0,15+math.random(-15,15)/35),CFrame = p.CFrame*CFrame.new(0,-15,0)
}):Play()




local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
p.CFrame = c['Right Leg'].CFrame*CFrame.new(0,-1,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
task.delay(.1,function() bld.Rate = 0 end)
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Drag = 7
bld.Orientation = 'VelocityPerpendicular'
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,-1),
NumberSequenceKeypoint.new(1,1)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(87,93)
bld.RotSpeed = NumberRange.new(0)
bld.LockedToPart = true
game:GetService("Debris"):AddItem(p, 2)
p.Size=Vector3.new(1,1,1)
p.Color=Color3.new(1,0,0)
game.TweenService:Create(p,TweenInfo.new(.1),{
Transparency = 1,Size=Vector3.new(3,0,3)
}):Play()








local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
p.CFrame = c['Left Arm'].CFrame*CFrame.new(0,-1,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
task.delay(.1,function() bld.Rate = 0 end)
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Drag = 7
bld.Orientation = 'VelocityPerpendicular'
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,-1),
NumberSequenceKeypoint.new(1,1)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(87,93)
bld.RotSpeed = NumberRange.new(0)
bld.LockedToPart = true
game:GetService("Debris"):AddItem(p, 2)
p.Size=Vector3.new(1,1,1)
p.Color=Color3.new(1,0,0)
game.TweenService:Create(p,TweenInfo.new(.1),{
Transparency = 1,Size=Vector3.new(3,0,3)
}):Play()




local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
p.CFrame = c['Right Arm'].CFrame*CFrame.new(0,-1,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
task.delay(.1,function() bld.Rate = 0 end)
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Drag = 7
bld.Orientation = 'VelocityPerpendicular'
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,-1),
NumberSequenceKeypoint.new(1,1)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(87,93)
bld.RotSpeed = NumberRange.new(0)
bld.LockedToPart = true
game:GetService("Debris"):AddItem(p, 2)
p.Size=Vector3.new(1,1,1)
p.Color=Color3.new(1,0,0)
game.TweenService:Create(p,TweenInfo.new(.1),{
Transparency = 1,Size=Vector3.new(3,0,3)
}):Play()
task.wait(.05) end end)
spawn(function()
for i = 1,5 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .1
s.Volume = 1 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .5
s.Volume = .5 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
task.wait(.1)
end end)
task.delay(4.6,function()
spawn(function()
for i = 1,5 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = 2
s.Volume = 2 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .5
s.Volume = .5 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
end end)
task.wait(.5)
spawn(function()
for i = 1,25 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = 3
s.Volume = 2 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = 3.5
s.Volume = .5 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
task.wait(.04)
end end)
task.wait(3)
for i = 1,5 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://7968071357'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 9.5 s:Play()

task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://919941001'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 9.5 s:Play()

task.spawn(function() task.wait(9) s:Destroy() end)
end
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://919941001'
s.TimePosition = 0
s.PlaybackSpeed = .3
s.Volume = 9.5 s:Play()
task.wait(3.5)
for i = 1,10 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://7968071357'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 9.5 s:Play()

task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://919941001'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 9.5 s:Play()

task.spawn(function() task.wait(9) s:Destroy() end)
end
end)
task.wait(8)
--[[
settings and stuff
local loopamm = 5 -- loop ammount for the line impact
local hldly = 0 -- delay to start hightlight tween
local conloop = 2 -- contrast effect loop ammount
local ttween = .1 -- transparency tween delay
]]
--some nice effect durations
--[[
--long
local loopamm = 25
local hldly = .5
local conloop = 13
local ttween = .1


--kinda short
local loopamm = 3
local hldly = 0
local conloop = 6
local ttween = 1


--very very short
local loopamm = 5
local hldly = 0
local conloop = 3
local ttween = .1
]]

local loopamm = 255/2
local hldly = 12.5
local conloop = 255/8
local ttween = .1


local h = Instance.new('Highlight')
h.Parent = c 
h.FillTransparency = 0
h.DepthMode = 'Occluded'
local he = Instance.new('Highlight')
he.Parent = hum.Parent
he.FillTransparency = 0
he.FillColor=Color3.new(1,1,1)

task.delay(hldly+ttween,function()
m:Destroy()
h:Destroy() he:Destroy()
end)
local yeah = 0
spawn(function()
for i = 1,555 do 
    local r = math.random(0,1)
    h.FillColor=Color3.new(0,0,0)
	he.FillColor = BrickColor.random().Color
		he.OutlineColor = BrickColor.random().Color
        hlpart.FillColor=Color3.new(r,0,0)
    task.wait(.01) 
        local r = math.random(0,1)
    h.FillColor=Color3.new(r,0,0)
        hlpart.FillColor=Color3.new(r,r,r)
    task.wait(.01) 
    end end)
h.OutlineTransparency = 1
task.delay(hldly,function()
game.TweenService:Create(h,TweenInfo.new(ttween),{
    FillTransparency = 1
}):Play()
end)
			local lol = Instance.new('ColorCorrectionEffect')
lol.Parent = game.Lighting

spawn(function()
yeah = 3
for i = 1,loopamm do 
for i = 1,4 do 
local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(15,1,99)
p.CFrame = c.HumanoidRootPart.CFrame*CFrame.new(
math.random(-15,35),
math.random(-3,15),
math.random(-77,0))
game:GetService("Debris"):AddItem(p, .3)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
CFrame = p.CFrame*CFrame.new(0,0,77)
}):Play()
end
task.wait(.01)
 end
end)
spawn(function()

for i = 1,loopamm do 
local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
task.wait(.01) end end)
msh2.Scale = Vector3.new(5,5,5)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(
math.random(-5,5),
math.random(-5,5),
-5)
game:GetService("Debris"):AddItem(p, .2)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=msh2.Scale*i/5
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,CFrame=p.CFrame*CFrame.new(0,-1,0)
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(r, r, r)), ColorSequenceKeypoint.new(1.00,
Color3.new(r, r, r))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/15),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.new(1, 0, 0))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
    local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(8,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(.1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(88, 88, 88)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)
task.delay(.5,function()
v.Rate = 55
end)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(46) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 5
task.wait(.01) end  
end)
for i = 1,conloop do 
lol.Contrast = 999
task.wait(.1)
lol.Contrast = -999
task.wait(.1) 
lol.TintColor = Color3.new(1,0,0)
end
lol:Destroy()

end)
task.wait(5)
yesss:Disconnect()
local yesss = game:GetService("RunService").Heartbeat:Connect(function(step)
workspace.CurrentCamera.CFrame = c.Head.CFrame 
kk.TimePosition = k.TimePosition+-.4
end) 
task.wait(7)
settings().Network.IncomingReplicationLag = 0
workspace.CurrentCamera.CameraType = 'Custom'
yesss:Disconnect() 
c.HumanoidRootPart.CFrame = CFrame.new(0,10^10,0)
hrp.CFrame = pcf
end end end end end

end end)
elseif char == 'Rainbow' then 
    local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 4, 0)
HealthBar.AlwaysOnTop = true
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "RAINBOW"
PName.TextColor3 = Color3.new(0,0,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,.3)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
PName.TextColor3 = Color3.fromHSV(getgenv().Rainbow,1,1)
PName.TextStrokeColor3 = Color3.fromHSV(getgenv().Rainbow,.2,1)
task.wait(.01) end end)
getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13499771836" then
getgenv().DoingUlt = true
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")
local PName2 = Instance.new("TextLabel")
local PName3 = Instance.new("TextLabel")
local Image = Instance.new("ImageLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 4, 0)
HealthBar.AlwaysOnTop = true
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.SciFi
PName.Text = "ULTRASONIC"
PName.TextColor3 = Color3.new(0,0,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,.3)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top


PName2.Name = "PName2"
PName2.Parent = Frame
PName2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName2.BackgroundTransparency = 1.000

PName2.Size = UDim2.new(3, 0, 1, 0)
PName2.Font = Enum.Font.SciFi
PName2.Text = "ULTRASONIC"
PName2.TextColor3 = Color3.new(0,0,1)
PName2.TextScaled = true
PName2.TextSize = 3
PName2.TextStrokeColor3 = Color3.new(.2,0,.3)
PName2.TextStrokeTransparency = 0.000
PName2.TextWrapped = true
PName2.ZIndex = -2
PName2.TextTransparency = .1
PName2.TextYAlignment = Enum.TextYAlignment.Top


PName3.Name = "PName2"
PName3.Parent = Frame
PName3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName3.BackgroundTransparency = 1.000
PName3.Size = UDim2.new(3, 0, 1, 0)
PName3.Font = Enum.Font.SciFi
PName3.Text = "ULTRASONIC"

PName3.TextScaled = true
PName3.TextSize = 3
PName3.TextStrokeColor3 = Color3.new(.2,0,.3)
PName3.TextStrokeTransparency = 0.000
PName3.TextWrapped = true
PName3.ZIndex = -2
PName3.TextTransparency = .1
PName3.TextYAlignment = Enum.TextYAlignment.Top


Image.Name = "PName2"
Image.Parent = Frame
Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Image.BackgroundTransparency = 1.000
Image.ZIndex = -3
Image.Size = UDim2.new(7, 0, 2, 0)
Image.Image = 'rbxassetid://6673021984'
spawn(function()
for i = 1,999999 do 
    PName2.TextColor3 = Color3.new(1,1,1)
    PName3.TextColor3 = Color3.new(1,1,1)
    PName2.Position = UDim2.new(
        -1+math.sin(i/2)/35, 0, 
    -0.7500000012+math.cos(i/2)/55, 0)
        Image.Position = UDim2.new(
        -2.7+math.sin(i/2)/9, 0, 
    -1.5+math.cos(i/2)/55, 0)
        PName3.Position = UDim2.new(
        -1+math.sin(i/2)/35, 0, 
    -0.800000012+-math.cos(i/2)/55, 0)
PName.Rotation = math.random(-1,1)
local rnd = math.random(1,8)
if rnd == 5 then 
for gi = 1,math.random(5,7) do 
        PName2.TextColor3 = BrickColor.random().Color
    PName3.TextColor3 = BrickColor.random().Color
    HealthBar.Size = UDim2.new(4+math.random(5,15)/25, 0, 
    4+math.random(5,15)/25, 0)
    PName.Rotation = math.random(-15,15)
        PName2.Rotation = PName.Rotation
    HealthBar.ExtentsOffset = Vector3.new(math.sin(i+gi/15)*2, 3+math.cos(i+gi/15), 0)
    task.wait(.01)
end end
HealthBar.Size = UDim2.new(4, 0, 4, 0)
PName.TextColor3 = Color3.new(1,1,1+math.sin(i)/10)
PName.TextStrokeColor3 = Color3.fromHSV(0,0,0)
PName2.TextColor3 = Color3.new(1,0,0)
PName2.TextStrokeColor3 = Color3.fromHSV(0,0,0)
        PName2.Rotation = PName.Rotation
HealthBar.ExtentsOffset = Vector3.new(math.sin(i/15)*2, 3+math.cos(i/15), 0)
task.wait(.01) end end)
_G.SetDecal(Color3.fromRGB(255, 255, 255),60)
_G.SetWings(Color3.new(1,1,1),true,Color3.new(1,1,1))
_G.SetMusic(16,1)
_G.QuickSet('UltraSonic')
_G.SetSpeed('UltraSonic')

getgenv().MUSIC_CREDS = 'RAS - JUGGLE'
getgenv().TRUEMODE = 'ULTRASONIC'
_G.RefreshUI()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17106169665"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://313762630"
local floatplay = char.Humanoid:LoadAnimation(Anim)
local UltraSonicLoop = false
pcall(function()
 getgenv().Idle:Disconnect() end)
 task.wait(.1)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
UltraSonicLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
floatplay:Play()
floatplay.Priority = Enum.AnimationPriority.Idle

spawn(function()
for i = 1,999999 do 
if UltraSonicLoop == false then break end
k.TimePosition = 1.2+math.sin(i/15)/35
    char.Humanoid.HipHeight = 2+math.sin(i/15)*2
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2) floatplay:Stop()
     char.Humanoid.HipHeight = 0
UltraSonicLoop = false
end end)

task.wait(6)
repeat task.wait() until lp.Backpack:FindFirstChild('Flash Strike')
pcall(function()
 getgenv().Idle:Disconnect() end)
 task.wait(.1)
_G.SetSpeed('Rainbow')
_G.SetWings('Rainbow',true,'Rainbow')
_G.SetMusic(15,1)
_G.QuickSet('Rainbow')
_G.SetDecal('Rainbow')
getgenv().MUSIC_CREDS = 'siqlo - Cyber Dawn'

_G.RefreshUI()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18464372850"
local k = char.Humanoid:LoadAnimation(Anim)
local RainbowLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
RainbowLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14357943487"
local kk = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Movement
kk:AdjustSpeed(0)

spawn(function()
for i = 1,999999 do 

if RainbowLoop == false then return end
k.TimePosition = 2.75+
math.cos(i/35)/45
task.wait(.05) end end)
v.Stopped:wait()
k:Stop(.2) kk:Stop()
RainbowLoop = false
end end)
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 4, 0)
HealthBar.AlwaysOnTop = true
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "RAINBOW"
PName.TextColor3 = Color3.new(0,0,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,.3)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
PName.TextColor3 = Color3.fromHSV(getgenv().Rainbow,1,1)
PName.TextStrokeColor3 = Color3.fromHSV(getgenv().Rainbow,.2,1)
task.wait(.01) end end)
end end)
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13501296372" then
v:Stop()

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17464644182"
local kk = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(1)
task.wait(.5)
kk:Stop(.4)
end end)
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13376962659" 
or v.Animation.AnimationId == 'rbxassetid://13362587853' then
v:Stop()
spawn(function()
task.wait(.4)
for i = 1,45 do 
hrp.CFrame=hrp.CFrame*CFrame.new(0,0,-2)
task.wait(.01) end end)
spawn(function()
task.wait(.3)
for i =1,5 do

char['#NinjaKATANA'].Blade.Transparency = 0
for _,v in pairs(char:GetDescendants()) do 
if v:IsA('BasePart') or v:IsA('Decal') or v:IsA('MeshPart') then
task.spawn(function()
if v.Name:match('Hitbox') then return end
if v.Name:match('HumanoidR') then return end
if v.Parent.Name == '#NinjaKATANA' then return end
if v.Name:match('Sh') then return end
v.Transparency = 0
end) end end task.wait(.1) end 
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18897116845"
local kk = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Action4
kk:AdjustSpeed(.5)
task.wait(.5)
kk:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18897115785"
local kk = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Action4
kk:AdjustSpeed(1.5)
task.wait(1.5)
kk:Stop(.4)
end end)
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13376869471" 
or v.Animation.AnimationId == "rbxassetid://13309500827"  then

v:Stop()

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13876406148"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.7)
k.TimePosition = .5
local g = Instance.new('Model')
g.Parent = workspace
local h = Instance.new('Highlight')
spawn(function()
for i = 1,55 do 
h.FillColor=Color3.fromHSV(getgenv().Rainbow,1,1)
h.OutlineColor=Color3.fromHSV(getgenv().Rainbow,.7,1)
task.wait(.02) end end)
h.FillTransparency = 0
h.Parent = g
for i = 1,35 do

spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,1,1)
v.CFrame = char["#NinjaKATANA"].Handle.CFrame
*CFrame.new(0,2,0)
v.CanCollide = false
v.Anchored=true
v.Parent = g
game.TweenService:Create(v,TweenInfo.new(1),{Size=
Vector3.new(0,0,0)}):Play()
task.wait(1)
v:Destroy()
end)
spawn(function()
local v = Instance.new('Part')
v.Size=Vector3.new(1,.1,.1)
v.CFrame = char["#NinjaKATANA"].Handle.CFrame
*CFrame.new(0,2,0)*CFrame.Angles(0,i,0)
v.CanCollide = false
v.Anchored=true
v.Parent = g
game.TweenService:Create(v,TweenInfo.new(.5),{Size=
Vector3.new(5,0,0)}):Play()
task.wait(.5)
v:Destroy()
end)
task.wait() end
task.wait(2.5)
g:Destroy()
end end)
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13294790250" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://134494086123052"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.6)
task.wait(1.3)
k:Stop(.3)
end end)


local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18464372850"
local k = char.Humanoid:LoadAnimation(Anim)
local RainbowLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
RainbowLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14357943487"
local kk = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Movement
kk:AdjustSpeed(0)

spawn(function()
for i = 1,999999 do 

if RainbowLoop == false then return end
k.TimePosition = 2.75+
math.cos(i/35)/45
task.wait(.05) end end)
v.Stopped:wait()
k:Stop(.2) kk:Stop()
RainbowLoop = false
end end)

function _G.SetSpeed(Type)
    local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local AnimationId = "135104210400610"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = char:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
k.Priority = Enum.AnimationPriority.Action3
local snd = Instance.new('Sound',char.Head)
snd.Name = 'ye'
snd.SoundId = 'rbxassetid://8114441138'
snd.Volume = .1
snd:Play()
snd.Looped = true
local dmp = 25
local Stunned = false
pcall(function() getgenv().boingboing:Disconnect() end)
task.wait(.1)
local i = 0
getgenv().boingboing = game:GetService("RunService").RenderStepped:Connect(function()
i=i+1
spawn(function()
if dmp >= 300 then return end
if workspace.CurrentCamera.FieldOfView == 70 then return end
dmp=dmp+.1
end)
task.spawn(function()
if char:FindFirstChild('Freeze') or char:FindFirstChild('Slowed') or char:FindFirstChild('Ragdoll')
then 
Stunned = true 
char.Freeze.Destroying:Connect(function()
Stunned = false
end)
end end)
if Stunned == true then 
dmp = 25
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
FieldOfView = 70
}):Play();
game:GetService("TweenService"):Create(snd, TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Volume = .1
}):Play();
k:Stop()
return end
if Type == 'Rainbow' then 
    fovg = 105
char.Humanoid.WalkSpeed = 40
char.Humanoid.HipHeight = 0
elseif Type == 'UltraSonic' then
    fovg = 120
char.Humanoid.WalkSpeed = 140
char.Humanoid.HipHeight = 2+math.sin(i/55)*2
end
k:AdjustSpeed(0)
k.TimePosition = .6+math.sin(i/15)/55
if char.Humanoid.MoveDirection.Magnitude > 0 and not k.IsPlaying  then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
FieldOfView = fovg
}):Play();
game:GetService("TweenService"):Create(snd, TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Volume = .5
}):Play();
k:Play()
elseif char.Humanoid.MoveDirection.Magnitude <= 0 and k.IsPlaying then
dmp = 25
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
FieldOfView = 70
}):Play();
game:GetService("TweenService"):Create(snd, TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Volume = .1
}):Play();
k:Stop()
end
end)
getgenv().breakloops = true
task.wait(.5)
getgenv().breakloops = false
local TweenService = game:GetService("TweenService")
local BodyParts = {
"Head",
"Torso",
"Left Arm",
"Right Arm",
"Left Leg",
"Right Leg"
}

function AfterImage(color3, material, duration, trans)
for i,v in pairs(lp.Character:GetChildren()) do 
if table.find(BodyParts, v.Name) then
local part = Instance.new("Part")
part.Anchored = true 
part.CanCollide = false 
part.Massless = true 
part.CFrame = v.CFrame
part.Size = v.Size
part.Transparency = trans
part.Color = color3
part.Material = Enum.Material[material]
TweenService:Create(part,TweenInfo.new(duration),{Transparency = 1,
CFrame=part.CFrame*CFrame.Angles(i,i,0)*CFrame.new(0,5,0)}):Play()
if v.Name == "Head" then 
local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.Head 
mesh.Scale = Vector3.new(1.25,1.25,1.25)
mesh.Parent = part
end
part.Parent = getgenv().Enviroment
game.Debris:AddItem(part, duration)
end
end end
task.spawn(function()
while task.wait(.03) do
    if getgenv().TRUEMODE ~= 'Rainbow' then
        getgenv().breakloops = true return end
if getgenv().breakloops == true then break end
task.spawn(function()
local function createTrail(duration)
local part = Instance.new("Part")
part.Anchored = true 
part.CanCollide = false
part.CanTouch = false
part.CanQuery = false
part.Massless = true 
part.Position = lp.Character.HumanoidRootPart.Position + Vector3.new(math.random(-5,5),math.random(-3,5),math.random(-5,5))
part.CFrame = CFrame.lookAt(part.Position, part.Position + lp.Character.HumanoidRootPart.Velocity)
part.CFrame = part.CFrame * CFrame.new(0,0,math.random(-9,0))
part.Size = Vector3.new(1, 1, 1)
if Type == 'Rainbow' then 
part.Color = Color3.fromHSV(getgenv().Rainbow,1,1)
elseif Type == 'UltraSonic' then
part.Color = Color3.new(1,1,1)
end

part.Material = Enum.Material.Neon
part.Parent = getgenv().Enviroment
local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.Sphere
mesh.Parent = part
task.wait(.1)
game:GetService("TweenService"):Create(part, TweenInfo.new(.2),
 {Size = Vector3.new(0.25, 0.25, 5)}):Play()
 task.wait(.2)
game:GetService("TweenService"):Create(part, TweenInfo.new(duration),
 {Size = Vector3.new(0,0,25)
 }):Play()
game.Debris:AddItem(part, duration)

end
velocity = lp.Character.Torso.Velocity
if velocity.Magnitude >= 25 then
createTrail(0.5)
if Type == 'Rainbow' then 
AfterImage(Color3.fromHSV(getgenv().Rainbow,1,1), "Neon", 1, .8)
elseif Type == 'UltraSonic' then
AfterImage(Color3.new(1,1,1), "Neon", 1, 0)
end

end
end)
end
end)
end
_G.SetSpeed('Rainbow')
getgenv().Cooldown7 = 15
function Seven()
getgenv().BLOOPS = 'R__'
function SlideD(dement)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75547590335774"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.7)
spawn(function()
task.wait(.2)
k:Stop(.4)
end)
spawn(function()
getgenv().BLOOPS = true 
wait(.04)
getgenv().BLOOPS = false
task.wait(.3)
local s = Instance.new('Sound')
s.Parent = game.CoreGui

s.SoundId = 'rbxassetid://6870001600'
s.PlaybackSpeed = .5
s.Volume = 1.8
s:Play()
task.delay(1,function()

s:Destroy()
end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui

s.SoundId = 'rbxassetid://6870001600'
s.PlaybackSpeed = 1.5
s.Volume = 1.8
s:Play()
task.delay(1,function()

s:Destroy()
end)
char.Humanoid.HipHeight = .2
local SLIDEMETER = dement
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75547590335774"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(-1)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(0)
k.TimePosition = 1.5

local Attachment = Instance.new("Attachment")
Attachment.Parent = hrp


local LV = Instance.new("LinearVelocity", Attachment)
LV.MaxForce = 8555
LV.Attachment0 = Attachment
spawn(function()
k.Stopped:wait()

getgenv().BLOOPS = true 
wait()
getgenv().BLOOPS = false
end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui

s.SoundId = 'rbxassetid://9112823563'
s.TimePosition = .5
s.PlaybackSpeed = 2
s.Volume = .8
s:Play()

local hehit = false
for i = 1,SLIDEMETER do 
if getgenv().BLOOPS == true then
k:Stop() Attachment:Destroy()
s:Destroy()
 return end
 local gay = SLIDEMETER-i
 LV.VectorVelocity = hrp.CFrame.lookVector * gay
k.TimePosition = 1.8+math.sin(i/15)/55
task.delay(1,function()

    for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 16 then 

if hehit == true then break end 
hehit = true
local random = math.random(1,2)
if random == 1 then 
-----------------------
local s= Instance.new('Sound')
s.SoundId = 'rbxassetid://74376324560435'
s.Volume = 2
s.Parent = game.CoreGui
s:Play()
task.delay(.3,function()
game.TweenService:Create(s,TweenInfo.new(1),{Volume = 0}):Play()
task.wait(1)
s:Destroy()
end)

local dum = v
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://108974035701442"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = 3
workspace.CurrentCamera.CameraSubject = dum
local i = 0
local gay = game:GetService("RunService").RenderStepped:Connect(function(step)
	i=i+1*step
	hrp.CFrame = dum.HumanoidRootPart.CFrame*CFrame.new(0,5-i*8,3-i*12)*CFrame.Angles(
		-i*8,0,0
	)
end)
spawn(function()

local args = {
[1] = {
["Goal"] = "LeftClick"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
task.wait(lp:GetNetworkPing()*4.2)
local args = {
[1] = {
["Goal"] = "LeftClickRelease"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))

end)
task.wait(.8)
gay:Disconnect()

hrp.CFrame = dum.HumanoidRootPart.CFrame*CFrame.new(0,0,-5)
workspace.CurrentCamera.CameraSubject = char
k:Stop()
SlideD(155)
-------------------------------WORK ON ABOVE
elseif random == 2 then 
local s= Instance.new('Sound')
s.SoundId = 'rbxassetid://74376324560435'
s.Volume = 2
s.Parent = game.CoreGui
s:Play()
task.delay(.3,function()
game.TweenService:Create(s,TweenInfo.new(1),{Volume = 0}):Play()
task.wait(1)
s:Destroy()
end)

local dum = v
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://108974035701442"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
workspace.CurrentCamera.CameraSubject = dum
local i = 0
local gay = game:GetService("RunService").RenderStepped:Connect(function(step)
	i=i+1*step
	hrp.CFrame = dum.HumanoidRootPart.CFrame*CFrame.new(0,i*3,5)*CFrame.Angles(
		-i,0,0
	)
end)
spawn(function()

local args = {
[1] = {
["Goal"] = "LeftClick"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
task.wait(lp:GetNetworkPing()*4.2)
local args = {
[1] = {
["Goal"] = "LeftClickRelease"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))

end)
task.wait(.5)
gay:Disconnect()

hrp.CFrame = dum.HumanoidRootPart.CFrame*CFrame.new(0,0,-5)
workspace.CurrentCamera.CameraSubject = char
k:Stop()
SlideD(155)
end
end end end
end)
task.wait(.02) end 
k:Stop()
Attachment:Destroy()
char.Humanoid.HipHeight = 0
s:Destroy()
end)
end
SlideD(155)
end

local uis = game:GetService("UserInputService")
local basemini = lp.PlayerGui.Hotbar.Backpack.Hotbar["7"]
local base = lp.PlayerGui.Hotbar.Backpack.Hotbar["7"].Base
basemini.Visible = true
base.Reuse.Visible = false
base.ToolName.Text = "Slide"
getgenv().Move7 = uis.InputBegan:Connect(function(inputs, event)
if event == true then return end
if inputs.KeyCode == Enum.KeyCode.Seven and not base:FindFirstChild("Cooldown") then
spawn(function() 		Seven() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown7,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown7)
deez:Destroy()
end
end)
getgenv().Move7B = base.MouseButton1Click:Connect(function()
if not base:FindFirstChild("Cooldown") then
spawn(function() 		Seven() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown7,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown7)
deez:Destroy()
end
end)
elseif char == 'Zyledon' then 
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local v = game:GetObjects(getcustomasset('TSB/morph.rbxm'))[1]
v.Parent = F
lp:ClearCharacterAppearance()
local parts = v:GetChildren()
for i, part in ipairs(parts) do
if part:IsA('Accessory') then
part.Parent = char
end end
local e = Instance.new('Shirt')
e.ShirtTemplate = v.Shirt.ShirtTemplate
e.Parent = char
local e = Instance.new('Pants')
e.PantsTemplate = v.Pants.PantsTemplate
e.Parent = char
pcall(function() char.Head.Quake:Destroy() end)
v.Head.Quake.Parent = char.Head 

_G.SetWings('Zyledon')

FO:Destroy()

char.Parent = nil 

char.Parent = workspace.Live
_G.twA([[Remember where your support comes from. Don't act ungrateful... You little shit.]],
Color3.new(0,0,1),Color3.new(0,0,0))
_G.SetMusic(22,3,22)
_G.QuickSet(0,0,255,0,0,0)

getgenv().MUSIC_CREDS = 'Techryn - Zyloden'
getgenv().TRUEMODE = 'Zyledon'
_G.RefreshUI()
_G.SetDecal(Color3.new(0, 0, 1),2)
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Zyledon"
PName.TextColor3 = Color3.new(0,0,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(0,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 

PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)

pcall(function() getgenv().Idle:Disconnect() end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15957376722"
local k2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://72042024"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)

local ZyledonLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then


ZyledonLoop = true
k2:Play(.3)
k2.Priority = Enum.AnimationPriority.Idle
k2:AdjustSpeed(0)
k2.Looped = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Movement
k:AdjustSpeed(0)
k.TimePosition = .1
k.Looped = true
spawn(function()
for i = 1,15150 do 
 if ZyledonLoop == false then break end   
k2.TimePosition = 3.2+math.cos(i/25)/255
task.wait(.01) end end)
v.Stopped:wait() 
ZyledonLoop = false
k2:Stop() k:Stop()
end end)

elseif char == 'persistence' then 
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 4, 0)
HealthBar.AlwaysOnTop = true
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Persistence"
PName.TextColor3 = Color3.new(0,0,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,.3)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)

local gay = 0
    local v = Instance.new('ParticleEmitter',char['Right Arm'])
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(2,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(1.4)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 15, 255)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)

v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(45) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = -2
    local v = Instance.new('ParticleEmitter',char['Left Arm'])
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(2,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(1.4)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 15, 255)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)

v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(45) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = -2



    local v = Instance.new('ParticleEmitter',char['Right Leg'])
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(2,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(1.4)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 15, 255)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)

v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(45) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = -2
    local v = Instance.new('ParticleEmitter',char['Left Leg'])
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(2,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(1.4)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 15, 255)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)

v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(45) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = -2


spawn(function()
    local thatsalottawords = {
        "NoBlock",
        "StopRunning",
        "Freeze",
        "Slowed",
        "ComboStun",
        "M1CD",
        "NoDash",
        "NoPunch",
        "UsedDash",
        "Ragdoll",
        "RagdollSim",
        "LaunchLanded",
        "LaunchEnded",
        "NoRotate",
        "BeingGrabbed",
        "NoVel",
        "BeingLaunched",
    }
    while task.wait() do
	if getgenv().TRUEMODE ~= 'persistence' then break end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if table.find(thatsalottawords, v.Name) then
                v:Destroy()
            end
        end
    end
	end)

getgenv().Move1B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12272894215" then
v:Stop()

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://129295156336675"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.7)
k.TimePosition = 4
k.Priority = Enum.AnimationPriority.Action
task.wait(.4)
k:Stop(.2)
end end)

getgenv().Move2B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12296882427" then
v:Stop()
spawn(function()
local ye = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.CFrame *= CFrame.Angles(math.rad(270),0,0)
game:GetService("RunService").RenderStepped:Wait()
hrp.CFrame = old
end)
task.wait(.4) ye:Disconnect() 
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://134775406437626"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.7)
k.Priority = Enum.AnimationPriority.Action
task.wait(.4)
k:Stop(.2)
end end)
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12273188754" then

local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.Velocity=pp.Velocity*0
end end)
task.delay(1.5,function()
lol:Disconnect() end)
spawn(function()
task.wait(1)
local ye = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.CFrame *= CFrame.Angles(-math.rad(90),0,0)

game:GetService("RunService").RenderStepped:Wait()
hrp.CFrame = old
end)
task.wait(1) ye:Disconnect() 
workspace.CurrentCamera.CameraSubject = char
end)
spawn(function()
task.wait(.7)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17325254223"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.5)
k:AdjustSpeed(1.5)
k.Priority = Enum.AnimationPriority.Action3
end)
workspace.Thrown.Name = 'Del'
task.delay(2,function()
workspace.Del.Name = 'Thrown' end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://125518819402716"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
k.Priority = Enum.AnimationPriority.Action2
task.delay(1.5,function()
k:Stop()
end)

spawn(function()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17363256069"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(2)
k:AdjustSpeed(1)
k.TimePosition = 5
k.Priority = Enum.AnimationPriority.Action2
task.wait(.1)
k:Stop(15)
task.wait(1)
k:Play(1)
k:Stop(1)
end)




v:GetMarkerReachedSignal("finalhit"):Connect(function(paramString)
task.wait(.2)
for i = 1,5 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
p.CFrame = hrp.CFrame*CFrame.new(0,0,-2)
*CFrame.Angles(0,0,0)
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(15,15,1)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(p,TweenInfo.new(.2+i/5),{
CFrame = p.CFrame*CFrame.new(0,i^2,0),Transparency = 1,
Color=Color3.new(0,0,1)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.2+i/5),{
Scale=Vector3.new(15,1-i/5,15)
}):Play()

end
for i = 1,6 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
p.CFrame = hrp.CFrame*CFrame.new(0,0,-2)
*CFrame.Angles(0,0,0)
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(15,1,15)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(p,TweenInfo.new(1),{
CFrame = p.CFrame*CFrame.Angles(0,i,0)*CFrame.new(0,-2,15),Transparency = 1,
Color=Color3.new(0,0,1)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(15,0,15)
}):Play()

end
end)

--Potential Part
_G.twA('For the next 20 seconds, Your downslams and LMBS will instantly wall combo.',
Color3.new(0,.5,1),Color3.new(0,0,0))
getgenv().DS_Persistence = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13532604085" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17888706103"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
spawn(function()

local ye = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.CFrame *= CFrame.Angles(math.rad(270),0,0)
local args = {
[1] = {
["Goal"] = "Wall Combo"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))

game:GetService("RunService").RenderStepped:Wait()
hrp.CFrame = old
end)
task.wait(2) ye:Disconnect() 
workspace.CurrentCamera.CameraSubject = char
end) end end)
task.wait(20)
getgenv().DS_Persistence:Disconnect()
end end)
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12296113986" then
    v:Stop()
    local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.MaxForce=Vector3.new(0,0,0)
end end)
task.delay(1,function()
lol:Disconnect() end)
    for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 16 then 
for _, track in pairs(v.Humanoid:GetPlayingAnimationTracks()) do
if track.Animation.AnimationId == 'rbxassetid://12295806041' then
track:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://108974035701442"
local k = v.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = 1
task.delay(2,function()
k:Stop()  end)
end end end end end
    local pcf = hrp.CFrame 


local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://108974035701442"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
k.TimePosition = 2.3
k.Priority = Enum.AnimationPriority.Action
task.wait(.5)
k:AdjustSpeed(.6)
task.wait(1)
k:Stop(.5)
hrp.CFrame = pcf
end end)
getgenv().WallCombo = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://16310343179" then
task.wait(.5)
local pcf = hrp.CFrame
task.wait(2)
hrp.CFrame = pcf*CFrame.new(0,0,15) 
end end)

if getgenv().ModeIdleAuras == true then 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://129295156336675"
local k = char.Humanoid:LoadAnimation(Anim)
local PersistenceLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
PersistenceLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
spawn(function()
for i = 1,999999 do 
        gay=gay+.5
if PersistenceLoop == false then return end
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-1,0)
*CFrame.Angles(0,i/5,math.rad(90))
p.Color=Color3.new(0,0,1)
msh2.Scale = Vector3.new(1,1,1)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(p,TweenInfo.new(.6),{
CFrame = p.CFrame*CFrame.new(0,2,0),Transparency = 1,
Color=Color3.new(0,.3,.3)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.6),{
Scale=Vector3.new(0,1,0)
}):Play()

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-1,0)
*CFrame.Angles(0,math.rad(180)+i/5,math.rad(90))
p.Color=Color3.new(0,0,1)
msh2.Scale = Vector3.new(1,1,1)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(p,TweenInfo.new(.6),{
CFrame = p.CFrame*CFrame.new(0,2,0),Transparency = 1,
Color=Color3.new(0,.3,.3)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.6),{
Scale=Vector3.new(0,1,0)
}):Play()
if gay >= 5 then 
    gay = 0
    local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(2,0)
v.Name = '_Rsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(1.4)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 15, 255)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))}
v.Rate = 0;v.Speed = NumberRange.new(1)
v:Emit()

v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(66) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = -2
end
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 55
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld:Emit(2)
bld.Orientation = 'VelocityParallel'
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.5,1),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(.01)
bld.VelocitySpread = 0
bld.ZOffset = 5
bld.LockedToPart = true
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
task.delay(.5,function()
bld.Rate = 0 end)
end)
    k.TimePosition = 
.5+math.cos(i/15)/35
task.wait(.05) end end)
v.Stopped:wait()
k:Stop(.2)
PersistenceLoop = false
end end)
else 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://129295156336675"
local k = char.Humanoid:LoadAnimation(Anim)
local PersistenceLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
PersistenceLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
spawn(function()
for i = 1,999999 do 
if PersistenceLoop == false then return end
    k.TimePosition = 
.5+math.cos(i/15)/35
task.wait(.05) end end)
v.Stopped:wait()
k:Stop(.2)
PersistenceLoop = false
end end)
end
elseif char == 'Destiny' then 
    local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "DESTINY"
PName.TextColor3 = Color3.new(1,.7,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.5,.1,.5)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15684849948"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://73949048256257"
local floatplay = char.Humanoid:LoadAnimation(Anim)
local DestinyLoop = false
pcall(function()
 getgenv().Idle:Disconnect() end)
 task.wait(.1)
     local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
pcall(function()
getgenv().Ultimate:Disconnect() end)
task.wait(.3)
function _G.PS(ID,vol,tpos,sp)
local s = Instance.new('Sound')
task.delay(15,function()
s:Destroy() 
end)
if sp == nil then sp = 1 end
if tpos == nil then 
s.TimePosition = 0
else 
s.TimePosition = tpos end
s.SoundId = 'rbxassetid://'..ID
s.Volume = vol
s.PlaybackSpeed = sp
s.Parent = game.CoreGui.HeadsetDisconnectedDialog
s:Play()
end
getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12772543293" then
getgenv().DoingUlt = true
    _G.SetMusic(18,3,32)
for  _,v in pairs(char.Humanoid:GetPlayingAnimationTracks()) do 
v:Stop()
end
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://12772543293"
local k = workspace.Live['Weakest Dummy'].Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
k.Priority = Enum.AnimationPriority.Action2
_G.PS('136007472',.2,0,.9) 
task.delay(2,function()


_G.PS('1843115950',.5)
_G.PS('341301373',.5)
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://95000469063288"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.5)
k.Priority = Enum.AnimationPriority.Action2
k.TimePosition = 7.3
k:AdjustSpeed(.3)
spawn(function()
spawn(function()
local s = .1
for i = 1,140 do s=s+-.02
task.wait(s)
spawn(function()
if i >= 66 then return end
if i >= 55 then 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.7,.5,.7)
msh2.Scale = Vector3.new(3,3,3)
p.Transparency = .6
p.CFrame = char['Left Arm'].CFrame
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.2+i/15),{
Scale=Vector3.new(2,2,2)*i*2
}):Play()
game.TweenService:Create(p,TweenInfo.new(1),{
Transparency = 1
}):Play()
spawn(function()
for i = 1,99 do 
    p.Color=Color3.new(.7+math.random(1,15)/55,.5+math.random(1,15)/55,.7+math.random(1,15)/55)
    task.wait(.05) end end)
    return end
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.7,.5,.7)
msh2.Scale = Vector3.new(3,3,3)*i/15
p.Transparency = .6
p.CFrame = char['Left Arm'].CFrame*CFrame.new(
0,-55+i,0
)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,0,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1),{
Transparency = 1
}):Play()


local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.7,.5,.7)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(2,2,15)
p.CFrame = char['Left Arm'].CFrame*
CFrame.new(math.random(-5,5)*5,math.random(-5,5)*5,math.random(-5,5)*5)
*CFrame.Angles(math.random(-5,5)*3,math.random(-5,5)*3,math.random(-5,5)*3)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})

bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(.5,-5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'VelocityPerpendicular'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'GlowS'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(3,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.LightEmission = 15
bld.Brightness = 15
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.5),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}
end)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,20)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,
Position = 
char['Left Arm'].Position
}):Play()

p.CFrame = 
CFrame.lookAt(p.Position, char['Left Arm'].Position) 
end) end end)
end)
task.wait(2.3)
k.TimePosition = 8.3
k:AdjustSpeed(1)
task.wait(1)
_G.QuickSet(155,55,155,255,155,255)
getgenv().MUSIC_CREDS = 'Mykoll - Nothing Ever Changes'
getgenv().TRUEMODE = 'Calamity'
_G.SetDecal(Color3.new(.5, .2, .5),55)
_G.RefreshUI()
_G.SetWings(Color3.new(.5,.2,.5),true,Color3.new(.5,.2,.5))
    local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "CALAMITY"
PName.TextColor3 = Color3.new(1,.7,1)
PName.TextStrokeColor3 = Color3.new(.5,.1,.5)
PName.TextScaled = true


PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 

    HealthBar.ExtentsOffset = Vector3.new(math.sin(i/15)
    , -4+getgenv().music.PlaybackLoudness/35, 0)
PName.Rotation = -15+getgenv().music.PlaybackLoudness/15+
math.sin(i/15-getgenv().music.PlaybackLoudness/15)*15
local rnd = math.random(1,2)
if rnd == 1 then 
    PName.TextColor3 = Color3.new(1,.7,1)
PName.TextStrokeColor3 = Color3.new(.5,.1,.5)
else 
PName.TextStrokeColor3 = Color3.new(1,.7,1)
PName.TextColor3 = Color3.new(.5,.1,.5)
end
task.wait(.01) end end)
task.wait(4)
repeat task.wait() until bp:FindFirstChild('Blitz Shot')
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "DESTINY"
PName.TextColor3 = Color3.new(1,.7,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.5,.1,.5)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
_G.QuickSet(155,55,155,255,155,255)
getgenv().MUSIC_CREDS = 'Frums - Zephyrs'
getgenv().TRUEMODE = 'Destiny'
_G.SetDecal(Color3.new(.7, .5, .7),2)
_G.RefreshUI()
_G.SetWings(Color3.new(.7,.5,.7),true,Color3.new(.7,.5,.7))
_G.SetMusic(17,1)
end end)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
DestinyLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
floatplay:Play()
floatplay.Priority = Enum.AnimationPriority.Idle
floatplay:AdjustSpeed(0)
spawn(function()
for i = 1,999999 do 
if DestinyLoop == false then break end
floatplay.TimePosition = math.sin(i/15)/4
k.TimePosition = 2.7+math.sin(i/15)/35
    char.Humanoid.HipHeight = 1+math.sin(i/15)
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2) floatplay:Stop()
     char.Humanoid.HipHeight = 0
DestinyLoop = false
end end)

getgenv().M1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13491635433" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75547590335774"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.TimePosition = 1.1
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1.3)
task.wait(.4)
k:Stop(.2)
end end)
getgenv().M2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13296577783" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13083332742"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.2)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
task.wait(.6)
k:Stop(.2)
end end)
getgenv().M3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13295919399" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14721837245"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.5)
k.TimePosition = .5
task.wait(.6)
k:Stop(.2)
end end)
getgenv().M4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13295936866" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13083332742"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.2)
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
task.wait(.6)
k:Stop(.2)
end end)
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12534735382" then
v:Stop()

spawn(function()
char:WaitForChild('BarrageBind'):Destroy()
end)
spawn(function()
task.wait(.2)
for i = 1,66 do 
local parts = workspace.Terrain:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.Color=Color3.new(.7,.5,.7)

end end

task.wait(.01) end end)
spawn(function()
for i = 1,20 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.7,.5,.7)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-.7,0)
task.wait(.01)
msh2.Scale = Vector3.new(1,5,1)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-2,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.4)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}

bld.VelocitySpread = 0
bld.LockedToPart = true
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Orientation = 'VelocityParallel'
bld.Lifetime = NumberRange.new(.3)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}
bld.Speed = NumberRange.new(55)
bld.VelocitySpread = 0
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1
}):Play()
task.wait(.04) end
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://72451715583225"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1.5)
k.Priority = Enum.AnimationPriority.Action3
task.wait(.2)
k:AdjustSpeed(.5)
task.wait(.2)
k:Stop(.3)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18896127525"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k:AdjustSpeed(1)
k.Priority = Enum.AnimationPriority.Action4
end end)
local fefd = false 
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12684390285" then 
    v:Stop()
    if fefd == true then return end 
    fefd = true 
    task.delay(2,function()
    fefd = false end)
spawn(function()
spawn(function()
task.wait(.2)
for i = 1,3 do 
    local parts = workspace.Terrain:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') then
spawn(function()
if part.Name:match('Smoke') then return end
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}
end)
elseif part:IsA('PointLight') then 
part.Color=Color3.new(.7,.5,.7)
end end 
task.wait(.1) end
task.wait(.7)
for i = 1,3 do 
    local parts = workspace.Thrown:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') then
spawn(function()
if part.Name:match('Smoke') then return end
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}
end)
elseif part:IsA('PointLight') then 
part.Color=Color3.new(.7,.5,.7)
end end 
task.wait(.1) end

end)
gay = workspace.Thrown.ChildAdded:Connect(function(pp)

if pp.Name == 'Projectile' or pp.Name == 'Explode' then 
repeat task.wait(.01) until pp:FindFirstChild('SmokeDark')
for i = 1,3 do 
local parts = workspace.Terrain:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.Color=Color3.new(.7,.5,.7)
end end

local parts = pp:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') or part:IsA('Trail') then
spawn(function()
if part.Name:match('Smoke') then return end
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}

end)
end end 
task.wait(.01) end
end
end)
task.wait(9)
gay:Disconnect()
end)
spawn(function()
for i = 1,20 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.7,.5,.7)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-.7,0)
task.wait(.01)
msh2.Scale = Vector3.new(1,5,1)
spawn(function()
for i = 1,55 do 
    p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-2,0)
    task.wait(.01) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.4)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}

bld.VelocitySpread = 0
bld.LockedToPart = true
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Orientation = 'VelocityParallel'
bld.Lifetime = NumberRange.new(.3)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}
bld.Speed = NumberRange.new(55)
bld.VelocitySpread = 0
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,25,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1
}):Play()


    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.7,.5,.7)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char['Left Arm'].CFrame*CFrame.new(0,-.7,0)
task.wait(.01)
msh2.Scale = Vector3.new(1,5,1)
spawn(function()
for i = 1,55 do 
    p.CFrame = char['Left Arm'].CFrame*CFrame.new(0,-2,0)
    task.wait(.01) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.4)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}

bld.VelocitySpread = 0
bld.LockedToPart = true
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Orientation = 'VelocityParallel'
bld.Lifetime = NumberRange.new(.3)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.2),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}
bld.Speed = NumberRange.new(55)
bld.VelocitySpread = 0
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1
}):Play()
task.wait(.04) end
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18462892217"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
k.TimePosition = .5
task.wait(.3) k:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://10471478869"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(-1)
k.TimePosition = .7
k.Priority = Enum.AnimationPriority.Action2
spawn(function()
for i = 1,15 do 
    hrp.CFrame=hrp.CFrame*CFrame.new(0,0,-i/5)
    task.wait(.01) end end)
task.wait(.45)
k:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://134494086123052"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(3.5)
k.Priority = Enum.AnimationPriority.Action2
task.wait(1)
k:Stop()
end end)
local db = false 
getgenv().Move2B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12502664044" then
v:Stop()
if db == true then return end 
db = true task.delay(1,function() db = false end)
spawn(function()
local parts = workspace.Terrain:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.Color=Color3.new(.7,.5,.7)
end end

local gay = workspace.Terrain.ChildAdded:Connect(function(pp)

if pp.Name == 'splode' then 
repeat task.wait() until pp:FindFirstChild('FrontFire')
local parts = pp:GetChildren()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.TintColor=Color3.new(.7,.5,.7)
end
spawn(function()
if part.Name:match('Smoke') then return end
print('modify it damn it')
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}
task.wait(.1)
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}

end)
end 
end
end)
task.wait(3)
gay:Disconnect()

end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://112620365240235"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1.5)
k.Priority = Enum.AnimationPriority.Action2
task.wait(.7)
k:Stop()




end end)
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12509505723" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://10471336737"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.5)
k.Priority = Enum.AnimationPriority.Action3
end end)
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12618271998" then 
    hrp.CFrame = hrp.CFrame*CFrame.new(0,5,0)
    local fired = false
    spawn(function()
hrp:WaitForChild('BODYGYRO').D = 250 
   hrp.CFrame = hrp.CFrame*CFrame.new(0,10,0)
   local i = 0
 repeat i=i+.01
     hrp.CFrame = hrp.CFrame*CFrame.new(0,1+-i,0)

  task.wait(.03) until fired == true 
 LV:Destroy()
end)

spawn(function()
spawn(function()
task.wait(.3)
for i = 1,3 do 
    local parts = char['Right Arm']:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') then
spawn(function()
if part.Name:match('Smoke') then return end
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}
end)
elseif part:IsA('PointLight') then 
part.Color=Color3.new(.7,.5,.7)
end end 
task.wait(.1) end

end)
gay = workspace.Thrown.ChildAdded:Connect(function(pp)

if pp.Name == 'Projectile' or pp.Name == 'Explode' then 
repeat task.wait(.01) until pp:FindFirstChild('SmokeDark')
for i = 1,3 do 
local parts = workspace.Terrain:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.Color=Color3.new(.7,.5,.7)
end end

local parts = pp:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') or part:IsA('Trail') then
spawn(function()
if part.Name:match('Smoke') then return end
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 155, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 55, 155))}

end)
end end 
task.wait(.01) end
end
end)
task.wait(9)
gay:Disconnect()
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://10471336737"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.06)
k.TimePosition = .1
k.Priority = Enum.AnimationPriority.Action2
repeat task.wait() until v.TimePosition >= .7
k.TimePosition = .3
k:AdjustSpeed(1)
fired = true
end end)
    pcall(function()
    char['Left ArmL'].Parent = nil end)
        pcall(function()
    char['Right ArmR'].Parent = nil end)
            pcall(function()
    char['Left Arm'].Mesh:Destroy() end)
            pcall(function()
        char['Right Arm'].Mesh:Destroy() end)
elseif char == 'Purity' then 

local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
    pcall(function()
    char['Left ArmL'].Parent = nil end)
        pcall(function()
    char['Right ArmR'].Parent = nil end)
            pcall(function()
    char['Left Arm'].Mesh:Destroy() end)
            pcall(function()
        char['Right Arm'].Mesh:Destroy() end)
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Pure Barrage'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Crystal Burst'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Pure Bomb'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Sky Dive'
getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12772543293" then
v:Stop()
getgenv().DoingUlt = true
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.TextColor3 = Color3.fromRGB(255, 95, 31)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
PName.Text = "NRG"
for i = 1,15 do 
pcall(function()
char.SGWings:Destroy() end)
end
_G.QuickSet(255,93,31,55,0,0)
getgenv().MUSIC_CREDS = 'Cepheid - Lie Of Providence'
getgenv().TRUEMODE = 'NRG'
_G.SetDecal(Color3.fromRGB(255, 95, 31),5)
_G.RefreshUI()
_G.SetMusic(12,1,15)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://106778226674700"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.6)
k.Priority = Enum.AnimationPriority.Action2
spawn(function()
for i = 1,999999 do 

PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
local f = Instance.new('Folder')
f.Name = 'SGWings' 
f.Parent = workspace
local v = game:GetObjects(getcustomasset('TSB/NRG.rbxm'))[1]
v.Parent = f
local parts = v:GetDescendants()
v.Core.Anchored=true
    v['Inner wings'].CanCollide = false
        v['Outer wings'].CanCollide = false
spawn(function()
for i = 1,222555 do 
    v['Inner wings'].CFrame = 
char.Torso.CFrame *CFrame.new(0,0,1.5)
*CFrame.Angles(math.rad(90),math.rad(i*3),math.rad(90))
    v['Outer wings'].CFrame = 
char.Torso.CFrame *CFrame.new(0,0,1.5)
*CFrame.Angles(math.rad(90),math.rad(-i*3),math.rad(90))
v.Core.CFrame = char.Torso.CFrame*
CFrame.new(math.cos(i/35)/4,1+math.sin(i/45)/4,1)
*CFrame.Angles(0,math.rad(90),0)
task.wait(.01) end end)

task.wait(5)
repeat task.wait() until bp:FindFirstChild('Blitz Shot')
v:Destroy()
_G.twA('Times up.',Color3.new(0,1,1),Color3.new(.1,0,0))
_G.SetMusic(2,1)
_G.SetWings(Color3.new(0,1,1),true,Color3.new(0,1,1))
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "PURITY"
PName.TextColor3 = Color3.new(0,1,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
_G.SetDecal(Color3.new(0,1,1),5)
_G.QuickSet(0,255,255,0,155,155)
getgenv().MUSIC_CREDS = 'EMIBAYO - GOODTEK'
getgenv().TRUEMODE = 'Purity'
task.wait(.2)

_G.RefreshUI()
end end)
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12684390285" then 
task.delay(.1,function()
for i = 1,35 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,1,1)
msh2.Scale = Vector3.new(1,35,1)
local rnd = math.random(-15,15)/35
p.CFrame = char.Torso.CFrame*CFrame.new(rnd,-2+-i/15,-2+-i)*CFrame.Angles(i,i,0)
task.wait(.02)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char.Torso.CFrame*CFrame.new(rnd,-2+-i/15,0)*CFrame.Angles(i,i,0)
task.wait(.02)
msh2.Scale = Vector3.new(3,3,3)
p.CFrame = char.Torso.CFrame*CFrame.new(rnd,-2+-i/15,0)*CFrame.Angles(i,i,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,1),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.3),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.1),{
Transparency = 1
}):Play()
end)
task.wait(.02) end
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18182400897"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
k.TimePosition = .4
k.Priority = Enum.AnimationPriority.Action2
task.wait(.4)
k:Stop(.4)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18464356233"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
k.TimePosition = .4
k.Priority = Enum.AnimationPriority.Action2
end end)
local parts = char.CharacterHandler:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') or part:IsA('Trail') then
spawn(function()
if part.Name:match('Smoke') then return end
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 155, 155)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 55))}

end)
end end
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12618271998" then 
spawn(function()
spawn(function()

for i = 1,155 do 
local parts = char['Right Arm']:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') then
spawn(function()
if part.Name:match('Smoke') then return end
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 155, 155)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 55))}

end)
elseif part:IsA('PointLight') then 
part.Color=Color3.new(0,1,1)
end end 
task.wait(.01) end
end)
gay = workspace.Thrown.ChildAdded:Connect(function(pp)

if pp.Name == 'Projectile' or pp.Name == 'Explode' then 
repeat task.wait(.01) until pp:FindFirstChild('SmokeDark')
for i = 1,35 do 
local parts = workspace.Terrain:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.Color=Color3.new(0,1,1)
end end

local parts = pp:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') or part:IsA('Trail') then
spawn(function()
if part.Name:match('Smoke') then return end
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 155, 155)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 55))}

end)
end end 
task.wait(.01) end
end
end)
task.wait(9)
gay:Disconnect()
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16699717165"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.3)
k.Priority = Enum.AnimationPriority.Action2
k.TimePosition = 3
repeat task.wait() until v.TimePosition >= .4
k.TimePosition = 4
k:AdjustSpeed(1)
end end)

getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12502664044" then 
v:Stop()
spawn(function()
spawn(function()
for i = 1,35 do 
local parts = workspace.Terrain:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.Color=Color3.new(0,1,1)

end end
local parts = char:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.Color=Color3.new(0,1,1)

end end
task.wait(.01) end end)
gay = workspace.Terrain.ChildAdded:Connect(function(pp)
if pp.Name == 'splode' then 
repeat task.wait() until pp:FindFirstChild('FrontFire')
local parts = pp:GetChildren()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.TintColor=Color3.new(0,1,1)
end
spawn(function()
if part.Name:match('Smoke') then return end
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}

end)
end 
end
end)
task.wait(9)
gay:Disconnect()

end)
task.delay(.1,function()
for i = 1,15 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,1,1)
msh2.Scale = Vector3.new(1,35,1)
local rnd = math.random(-15,15)/35
msh2.Scale = Vector3.new(1,1,5)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,0,0)*
CFrame.Angles(i,i,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,1),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.5),{
Transparency = 1
}):Play()






local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,1,1)
msh2.Scale = Vector3.new(1,35,1)
local rnd = math.random(-15,15)/35
msh2.Scale = Vector3.new(1,1,5)
p.CFrame = char['Left Arm'].CFrame*CFrame.new(0,0,0)*
CFrame.Angles(i,i,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,1),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.5),{
Transparency = 1
}):Play()
end)
task.wait(.02) end
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://108974035701442"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
k.Priority = Enum.AnimationPriority.Action2
task.wait(.7)
k:Stop()
end end)
getgenv().Move1B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://71060716968719" then 
v.Priority = Enum.AnimationPriority.Action4
spawn(function()
for i = 1,111 do 
local pcf = CFrame.new(char.Torso.CFrame.X,hrp.CFrame.Y,char.Torso.CFrame.Z)
spawn(function()
task.wait(.1)
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
local hl = Instance.new('Highlight')
hl.FillColor=Color3.new(0,1,1)
hl.OutlineColor=Color3.new(.3,0,0)
hl.Parent = p
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,1,1)
msh2.Scale = Vector3.new(.06,35,.06)
p.CFrame = pcf*CFrame.new(rnd,math.random(-3,3),5)
task.wait(.02)
msh2.Scale = Vector3.new(1,3,1)
p.CFrame = p.CFrame*CFrame.new(math.random(-5,5),0,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,1),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.5),{
Transparency = 1
}):Play()



local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
local hl = Instance.new('Highlight')
hl.FillColor=Color3.new(0,1,1)
hl.OutlineColor=Color3.new(.3,0,0)
hl.Parent = p
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(.06,35,.06)
p.CFrame = pcf*CFrame.new(math.random(-15,15),math.random(-3,3),math.random(-15,15))
task.wait(.02)
msh2.Scale = Vector3.new(1,15,1)
p.CFrame = p.CFrame*CFrame.new(math.random(-25,25),0,math.random(-25,25))
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,55,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.5),{
Transparency = 1
}):Play()
end)
task.wait(.02)
end
end)
task.wait(.9)
local parts = workspace.Thrown:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') or part:IsA('Trail') then
spawn(function()
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 155, 155)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 55))}

end)
end end 
task.wait(.5)

local parts = workspace.Thrown:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') or part:IsA('Trail') then
spawn(function()
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 155, 155)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 55))}

end)
end end 
task.wait(1.5)

local parts = workspace.Thrown:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') or part:IsA('Trail') then
spawn(function()
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 155, 155)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 55))}

end)
end end
task.wait(1.5)
local parts = workspace.Thrown:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('ParticleEmitter') or part:IsA('Trail') then
spawn(function()
part.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 155, 155)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 55))}

end)
end end 

end end)
getgenv().Move2B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12509505723" then 
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16515850153"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.5)
k.Priority = Enum.AnimationPriority.Action3
local pcf = hrp.CFrame
task.delay(.8,function()
for i = 1,15 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
local hl = Instance.new('Highlight')
hl.FillColor=Color3.new(0,1,1)
hl.OutlineColor=Color3.new(.3,0,0)
hl.Parent = p
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,1,1)
msh2.Scale = Vector3.new(.1,35,.1)
p.CFrame = pcf*CFrame.new(rnd,math.random(-3,3),-2+-i*3)
task.wait(.02)
msh2.Scale = Vector3.new(3,3,3)
p.CFrame = p.CFrame*CFrame.new(math.random(-5,5),0,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,1),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.5),{
Transparency = 1
}):Play()
end)
end
end)
end end)
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12534735382" or 
v.Animation.AnimationId == "rbxassetid://12971270638"
then
v:Stop()
spawn(function()
char:WaitForChild('BarrageBind'):Destroy()
end)
spawn(function()
for i = 1,77 do 
local parts = workspace.Terrain:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.Color=Color3.new(0,1,1)

end end
local parts = char:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('PointLight') then 
part.Color=Color3.new(0,1,1)

end end
task.wait(.01) end end)
_G.PS('1625448638',2)
_G.PS('1625448638',1.8,.1,.8)
task.delay(.2,function()
_G.PS('1625448638',1.4,.2,.9)
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16310343179"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(2.67)
for i = 1,5 do 
    k.TimePosition = .5 task.wait(.2) end
k:Stop(.1)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://140164642047188"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
k.TimePosition = 7


end end)
local re = false
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "PURITY"
PName.TextColor3 = Color3.new(0,1,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16524237104"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
task.delay(1,function()
k:Stop(.3)
end)
if getgenv().ModeIdleAuras == true then
local PurityIdle = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
PurityIdle = true
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17121695329"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(1)
spawn(function()
for i = 1,99999 do 
if PurityIdle == false then break end
local pp = Instance.new('Part')
task.delay(1.5,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(0,1,1)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(1.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 255, 255))}
bld.Speed = NumberRange.new(1)
bld.Acceleration=Vector3.new(0,0,.1)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
pp.CFrame = char.Torso.CFrame*CFrame.new(
math.random(-25,25),
-5,
math.random(-25,25))
game.TweenService:Create(pp,TweenInfo.new(1.5),{Size=Vector3.new(0,0,0),
CFrame = pp.CFrame*CFrame.new(math.random(-5,5),15+math.random(2,8),math.random(-5,5))}):Play()

task.wait(.05) end end)
v.Stopped:wait()
PurityIdle = false
k:Stop(.2)
end end)
else 
local PurityIdle = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
PurityIdle = true
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17121695329"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(1)
v.Stopped:wait()
PurityIdle = false
k:Stop(.2)
end end)
end
elseif char == 'Euclidean' then 

local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Euclidean"
PName.TextColor3 = Color3.new(1,0,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(0,0,1)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 

PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
_G.twA('Embrace the unchangable..',
Color3.new(1,0,0),Color3.new(0,0,1))
_G.SetMusic(21,1,0)
_G.PS(9125644905,2,0,.5)
_G.PS(9166224293,5)
_G.PS(9166199024,5)
_G.QuickSet(255,0,0,0,0,55)
getgenv().MUSIC_CREDS = 'Vulta - Crepuscule'
getgenv().TRUEMODE = 'Euclidean'
_G.SetDecal(Color3.new(0, 0, 1),2)
_G.RefreshUI()

task.delay(.3,function()
_G.SetWings(Color3.new(1,0,0),true,Color3.new(0,0,1))
end)
pcall(function() getgenv().Idle:Disconnect() end)
if getgenv().ModeIdleAuras == true then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14527229510"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://99277885325374"
local k2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15146348738"
local k3 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local EuclideanLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
k.Looped = true
EuclideanLoop = true
k2:Play(.3)
k2.Priority = Enum.AnimationPriority.Idle
k2:AdjustSpeed(.8)
k2.Looped = true

k3:Play(.1)
k3.Priority = Enum.AnimationPriority.Movement
k3:AdjustSpeed(.1)
k3.Looped = true
spawn(function()
local ye = 0
local ye2 = 0
for i = 1,15150 do 


 if EuclideanLoop == false then break end   





local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
game:GetService("CollectionService"):AddTag(p2,"IgnoreCamera")
local rnd = math.random(0,1)
if rnd == 1 then 
    p2.Color=Color3.new(
1,0,
0)
else 
p2.Color=Color3.new(
0,0,
1)
end
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p2.CFrame = char['Left Arm'].CFrame
*CFrame.new(0,-1,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p2, 2)
game.TweenService:Create(p2,TweenInfo.new(1),{
CFrame=p2.CFrame*CFrame.new(0,3,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,2,0)
}):Play()

local p2 = Instance.new('Part')

p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
game:GetService("CollectionService"):AddTag(p2,"IgnoreCamera")
local rndd = math.random(0,1)
if rndd == 1 then 
    p2.Color=Color3.new(
1,0,
0)
else 
p2.Color=Color3.new(
0,0,
1)
end
p2.Size=Vector3.new(.3,.3,.3)

game:GetService("Debris"):AddItem(p2, .8)
p2.Parent = getgenv().Enviroment
local rnd = math.random(0,1)
if rnd == 0 then 
p2.CFrame = hrp.CFrame
*CFrame.new(math.random(-15,15),-3,math.random(-15,15))*
CFrame.Angles(
math.rad(math.random(-15,15)),
math.rad(math.random(-15,15)),math.rad(math.random(-15,15)))
game.TweenService:Create(p2,TweenInfo.new(.8),{
Size=Vector3.new(0,2+math.random(2,4),0),CFrame = p2.CFrame*CFrame.new(0,2,0)
}):Play()
local bld = Instance.new("ParticleEmitter",p2)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'FacingCameraWorldUp'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 255
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})

bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,-1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
if rndd == 1 then 
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255/2, 0, 0))}
else 
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
end

bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 2
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.3,function()
bld.Rate = 0 end)
else 
p2.CFrame = hrp.CFrame
*CFrame.new(math.random(-15,15),math.random(-3,15),math.random(-15,15))*
CFrame.Angles(i,i,-i)
game.TweenService:Create(p2,TweenInfo.new(.8),{
Size=Vector3.new(0,0,0),CFrame = p2.CFrame*CFrame.new(0,2,0)
}):Play()

local bld = Instance.new("ParticleEmitter",p2)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'FacingCameraWorldUp'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 77
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.3)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})

bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(.1,-2),
NumberSequenceKeypoint.new(.2,2),
NumberSequenceKeypoint.new(.3,-2),
NumberSequenceKeypoint.new(.4,2),
NumberSequenceKeypoint.new(.5,-2),
NumberSequenceKeypoint.new(.5,-2),
NumberSequenceKeypoint.new(.5,0),

NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.LockedToPart = true
if rndd == 1 then 
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
else 
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
end

bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 0
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.3,function()
bld.Rate = 0 end)
end

k.TimePosition = .9+math.cos(i/15)/155
task.wait(.01) end end)
v.Stopped:wait() 
EuclideanLoop = false
k:Stop() k2:Stop() k3:Stop(.3)
end end)
else 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14527229510"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://99277885325374"
local k2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15146348738"
local k3 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local EuclideanLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
k.Looped = true
EuclideanLoop = true
k2:Play(.3)
k2.Priority = Enum.AnimationPriority.Idle
k2:AdjustSpeed(.8)
k2.Looped = true

k3:Play(.1)
k3.Priority = Enum.AnimationPriority.Movement
k3:AdjustSpeed(.1)
k3.Looped = true
spawn(function()
for i = 1,15150 do 
 if EuclideanLoop == false then break end   
k.TimePosition = .9+math.cos(i/15)/155
task.wait(.01) end end)
v.Stopped:wait() 
EuclideanLoop = false
k:Stop() k2:Stop() k3:Stop(.3)
end end)
end

getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://10468665991" then
v:Stop()
spawn(function()
for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 16 then 
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local hpcf = hrp.CFrame 
local char = workspace.Live.SG_Clone
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local wd = v
local hr = wd.HumanoidRootPart
wd.Archivable = true
local mm = wd:Clone()
local y = mm.HumanoidRootPart
y.CFrame = CFrame.new(90, 440, -45)
y.Anchored=true
task.delay(15,function() mm:Destroy() end)
mm.Humanoid.Health = 100
pcall(function() mm.Head:FindFirstChildWhichIsA('BillboardGui'):Destroy() end)
local ok = false 
for i = 1,155 do 
if v.Humanoid.Health == 0 then 
ok = true break end 
task.wait(.01) end
if ok == true then 
spawn(function()
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
for i = 1,150 do 
hrp.CFrame = CFrame.new(0,10^9,0)
task.wait(.01) end end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://10468665991"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
k.Priority = Enum.AnimationPriority.Action2
mm.Parent = workspace
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17860663334"
local k = mm.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.5)
k.Priority = Enum.AnimationPriority.Action2
workspace.CurrentCamera.CameraSubject = mm
workspace.CurrentCamera.CameraType = 'Scriptable'
local pcf = hpcf
y.Anchored=true
y.CFrame = pcf*CFrame.Angles(0,math.rad(180),0)
game:GetService('TweenService'):Create(y,TweenInfo.new(5),{
	CFrame = pcf*CFrame.new(0,200,-1950)*
	CFrame.Angles(0,math.rad(180),0)
}):Play()
local snd = Instance.new('Sound',y)
snd.Name = 'FlyWind'
snd.SoundId = 'rbxassetid://8114441138'
snd.Volume = 0
game.TweenService:Create(snd,TweenInfo.new(2),{Volume = 3.6}):Play()
task.delay(2,function()
game.TweenService:Create(snd,TweenInfo.new(1),{Volume = 1.7}):Play()
end)

snd:Play()
snd.Looped = true
local l = game:GetService("ReplicatedStorage").Resources.SwingWind:Clone()
l.Parent = workspace
l.Transparency = 1
l.Anchored=true
l.Mesh.Scale=Vector3.new(5,15,5)
local speedlines = game.ReplicatedStorage.Resources.KJEffects.speedlines:Clone()
speedlines.Parent = workspace
for i,v in pairs(speedlines:GetChildren()) do
v.Enabled = true
v.Transparency = NumberSequence.new(0)
v.LockedToPart = true
v.EmissionDirection = "Back"
v.Rate = 500
end
local v = Instance.new('Part')
spawn(function()
local ok = false 
task.delay(5,function() ok = true end)
for i = 1,455 do 
if ok == true then break end
workspace.CurrentCamera.CFrame = y.CFrame*
CFrame.new(0,i/35,-15+i/10)
*
CFrame.Angles(math.rad(0),0,0)
speedlines.CFrame = mm.Torso.CFrame*CFrame.Angles(math.rad(90),0,0)
l.CFrame = mm.Torso.CFrame*CFrame.Angles(0,i,0)
task.wait(.01) 
end 
l:Destroy()
for i = 1,455 do 
speedlines.CFrame = char.Torso.CFrame*CFrame.Angles(0,0,0)
y.CFrame = v.CFrame*CFrame.new(0,2,-5)

task.wait(.01) 
end 

end)
task.delay(5.5,function()
local v = Instance.new('Highlight')
v.FillColor=Color3.new(1,0,1)
v.Parent = char
v.OutlineColor=Color3.new(1,0,0)
v.FillTransparency = 0
task.delay(6,function() v:Destroy() end)
end)
task.delay(1,function()
local v = Instance.new('Highlight')
v.FillColor=Color3.new(.5,.5,1)
v.Parent = char
v.OutlineColor=Color3.new(.5,.5,1)
v.FillTransparency = 0
task.delay(15,function() v:Destroy() end)
local function ss(id,vol,d)
local s = Instance.new('Sound')
s.Volume=vol
s.SoundId = 'rbxassetid://'..id
s.Parent = workspace
s:Play()
task.delay(4,function() 

s:Destroy() end)
end
ss(9119834851,10,3)
ss(9124962412,3,3)
task.delay(.1,function()
ss(9120984896,2,3)
end)
game.TweenService:Create(v,TweenInfo.new(19),{
    FillTransparency = 1}):Play()
    game.TweenService:Create(v,TweenInfo.new(19),{
    OutlineTransparency = 1}):Play()
        game.TweenService:Create(v,TweenInfo.new(19),{
OutlineColor=Color3.new(1,0,1)}):Play()
game:GetService('TweenService'):Create(hrp,TweenInfo.new(4),{
	CFrame = pcf*CFrame.new(0,200,-1950)*
	CFrame.Angles(math.rad(0),math.rad(0),0)
}):Play()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17860693408"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.7)
k.Priority = Enum.AnimationPriority.Action2

end)
task.wait(5)

v.CFrame = y.CFrame*CFrame.new(0,500,0)
v.Color=Color3.new(1,0,0)
v.Anchored=true
v.Material=Enum.Material.Neon 
v.Size=Vector3.new(150,.1,150)
task.delay(25,function()
v:Destroy() end)
v.Parent = workspace 
game.TweenService:Create(v,TweenInfo.new(1),{CFrame = v.CFrame*
CFrame.new(0,-400,0)}):Play()
y.Anchored = false 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17275798442"
local k = mm.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1.5)
k.TimePosition = 3.7
k.Priority = Enum.AnimationPriority.Action2
task.wait(1)
k:Stop()

---------------------------------------------

local v = game:GetService("ReplicatedStorage").Resources.EsperAwakening.NadoSmoke:Clone()
v.Parent = workspace
task.spawn(function() task.wait(9) v:Destroy() end)
v.SmokeCircle.Anchored=true
v.SmokeCircle.CFrame = 
game.Players.LocalPlayer.Character.Torso.CFrame
*CFrame.new(0,-2,0)
v.SmokeCircle.ParticleEmitter:Emit(15)
v.SmokeCircle.ParticleEmitter.Rate = 255
for i = 1,9 do
spawn(function()
local vel = math.random(-25,25)
local vel2 = math.random(-25,25)
local v = Instance.new('Part')
v.Size = Vector3.new(2.5,2.5,2.5)*math.random(1,5)
v.Material=Enum.Material.Concrete
v.Color = Color3.fromRGB(158, 151, 157)
v.Parent = workspace
local pp = PhysicalProperties.new(1,2,1,1,1)
v.CustomPhysicalProperties = pp
v.CanCollide = false
local pcf = hrp.CFrame
for i =1,25 do 
    v.CFrame = pcf*
CFrame.new(vel*i/25,math.sin(i/10)*15,
vel2*i/25)
*CFrame.Angles(90,i/5,i/5)
task.wait(.01) end
task.wait(1)
v.CanCollide = true
game.TweenService:Create(v,TweenInfo.new(3),{Size=Vector3.new(0,0,0),
CFrame=v.CFrame*CFrame.Angles(i,i,i)}):Play()
task.wait(3.6) v:Destroy()
end) end

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://93546004428904"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.7)
k.TimePosition = 2.3
k.Priority = Enum.AnimationPriority.Action

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://129945907044125"
local kk = mm.Humanoid:LoadAnimation(Anim)
kk:Play()
kk:AdjustSpeed(.7)
kk.TimePosition = 2.3
kk.Priority = Enum.AnimationPriority.Action

function bonk()

spawn(function()
spawn(function()
for i = 1,5 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = 2
s.Volume = 1 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .5
s.Volume = .5 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
end end)
--[[
settings and stuff
local loopamm = 5 -- loop ammount for the line impact
local hldly = 0 -- delay to start hightlight tween
local conloop = 2 -- contrast effect loop ammount
local ttween = .1 -- transparency tween delay
]]
--some nice effect durations
--[[
--long
local loopamm = 25
local hldly = .5
local conloop = 13
local ttween = .1


--kinda short
local loopamm = 3
local hldly = 0
local conloop = 6
local ttween = 1


--very very short
local loopamm = 5
local hldly = 0
local conloop = 3
local ttween = .1
]]

local loopamm = 15
local hldly = .5
local conloop = 3
local ttween = .1

local m = Instance.new('Model')
m.Parent = char 

local h = Instance.new('Highlight')
h.Parent = char 
h.FillTransparency = 0
local hlpart = Instance.new('Highlight')
hlpart.Parent = m 
hlpart.OutlineTransparency = 1
hlpart.FillTransparency = 0
task.delay(5,function()
m:Destroy()
h:Destroy()
end)
local yeah = 0
spawn(function()
for i = 1,555 do 
    local r = math.random(0,1)
    h.FillColor=Color3.new(0,0,0)
        hlpart.FillColor=Color3.new(r,0,0)
    task.wait(.01) 
        local r = math.random(0,1)
    h.FillColor=Color3.new(r,0,0)
        hlpart.FillColor=Color3.new(r,r,r)
    task.wait(.01) 
    end end)
h.OutlineTransparency = 1
task.delay(hldly,function()
game.TweenService:Create(h,TweenInfo.new(ttween),{
    FillTransparency = 1
}):Play()
end)
			local lol = Instance.new('ColorCorrectionEffect')
lol.Parent = game.Lighting

spawn(function()
yeah = 3
for i = 1,loopamm do 
for i = 1,4 do 
local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(15,1,99)
p.CFrame = hrp.CFrame*CFrame.new(
math.random(-15,35),
math.random(-3,15),
math.random(-77,0))
game:GetService("Debris"):AddItem(p, .3)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
CFrame = p.CFrame*CFrame.new(0,0,77)
}):Play()
end
task.wait(.01)
 end
end)
spawn(function()

for i = 1,loopamm do 
local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
task.wait(.01) end end)
msh2.Scale = Vector3.new(5,5,5)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(
math.random(-5,5),
math.random(-5,5),
-5)
game:GetService("Debris"):AddItem(p, .2)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=msh2.Scale*i/5
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,CFrame=p.CFrame*CFrame.new(0,-1,0)
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(r, r, r)), ColorSequenceKeypoint.new(1.00,
Color3.new(r, r, r))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/15),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.new(1, 0, 0))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
    local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(8,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(.1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(88, 88, 88)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)
task.delay(.5,function()
v.Rate = 55
end)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(46) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 5
task.wait(.01) end  
end)
for i = 1,conloop do 
lol.Contrast = 999
task.wait(.01)
lol.Contrast = -3
task.wait(.01) 
lol.Contrast = -999
task.wait(.01) 
lol.TintColor = Color3.new(1,0,0)
end
lol:Destroy()

end)

local v = game:GetService("ReplicatedStorage").Resources.EsperAwakening.NadoSmoke:Clone()
v.Parent = workspace
task.spawn(function() task.wait(2) v:Destroy() end)
v.SmokeCircle.Anchored=true
v.SmokeCircle.CFrame = 
game.Players.LocalPlayer.Character.Torso.CFrame
*CFrame.new(0,-2,0)
v.SmokeCircle.ParticleEmitter:Emit(15)
v.SmokeCircle.ParticleEmitter.Rate = 0
for i = 1,9 do
spawn(function()
local vel = math.random(-25,25)
local vel2 = math.random(-25,25)
local v = Instance.new('Part')
v.Size = Vector3.new(2.5,2.5,2.5)*math.random(1,5)
v.Material=Enum.Material.Concrete
v.Color = Color3.fromRGB(158, 151, 157)
v.Parent = workspace
local pp = PhysicalProperties.new(1,2,1,1,1)
v.CustomPhysicalProperties = pp
v.CanCollide = false
local pcf = hrp.CFrame
for i =1,35 do 
    v.CFrame = pcf*
CFrame.new(vel*i/25,math.sin(i/10)*15,
vel2*i/25)
*CFrame.Angles(90,i/5,i/5)
task.wait(.01) end
task.wait(1)
v.CanCollide = true
game.TweenService:Create(v,TweenInfo.new(3),{Size=Vector3.new(0,0,0),
CFrame=v.CFrame*CFrame.Angles(i,i,i)}):Play()
task.wait(3.6) v:Destroy()
end) end
end
local okkys_1 = false 
local okkys_2 = false 
local okkys_3 = false 
task.delay(1,function()
okkys_1 = true 
task.wait(2)
okkys_2 = true 
task.wait(2)
okkys_3 = true 
end)
for i= 1,255 do 
if okkys_1 == true then break end
workspace.CurrentCamera.CFrame = mm.Head.CFrame
hrp.CFrame = y.CFrame*CFrame.new(2,0,-4)*
CFrame.Angles(0,math.rad(140+i/5),0)
task.wait(.01) end
for i= 1,255 do 
if okkys_2 == true then break end
workspace.CurrentCamera.CFrame = mm.Head.CFrame
hrp.CFrame = y.CFrame*CFrame.new(2-i/15,0,-4)*
CFrame.Angles(0,math.rad(170+i),0)
task.wait(.01) end
k:GetMarkerReachedSignal("hit5"):Connect(function(paramString)
bonk()

end)
task.wait(.5)
spawn(function()
for i= 1,255 do 
if okkys_3 == true then break end
workspace.CurrentCamera.CFrame = mm.Head.CFrame
hrp.CFrame = y.CFrame*CFrame.new(2,0,-4)*
CFrame.Angles(0,math.rad(170+math.sin(i/15)*15),0)
task.wait(.01) end
end)
task.wait(1)
k.Looped = true kk.Looped = true
for i= 1,6 do 
k.TimePosition = 3.9
k:AdjustSpeed(2)
kk:AdjustSpeed(.7)
kk.TimePosition = 3.9+math.random(-15,15)/555

task.wait(1.3-i/5)
end


task.wait(.3)
k:Stop()
kk:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18170032354"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(.5)
k.TimePosition = 1.3
k.Priority = Enum.AnimationPriority.Action
task.delay(1,function()
local h = Instance.new('Highlight')
h.Parent = char h.FillColor=Color3.new(0,0,1)
h.OutlineColor=Color3.new(1,0,0) h.FillTransparency = 0
task.wait(3)
h:Destroy()
end)

spawn(function()
for i= 1,20 do 
kk.TimePosition = 1.3+i/35
workspace.CurrentCamera.CFrame = y.CFrame
*
CFrame.Angles(math.rad(90),math.rad(0),0)
hrp.CFrame = y.CFrame*CFrame.new(0,0,0)
task.wait(.1) end
spawn(function()
for i = 1,5 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 3 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .5
s.Volume = .5 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
end end)
local FRAMES = {
"rbxassetid://91019353672914",
"rbxassetid://139543048277178",
"rbxassetid://78044589235102",
"rbxassetid://82982695786187",


}

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("ImageLabel")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Name = "20-20-20 DROPKICK"
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.BackgroundTransparency = 1
MainFrame.Position = UDim2.new(0, 0, 0, 0)
spawn(function()

local loopamm = 25
local hldly = .5
local conloop = 13
local ttween = .1

local m = Instance.new('Model')
m.Parent = mm 

local h = Instance.new('Highlight')
h.Parent = mm 
h.FillTransparency = 0
local hlpart = Instance.new('Highlight')
hlpart.Parent = m 
hlpart.OutlineTransparency = 1
hlpart.FillTransparency = 0
task.delay(5,function()
m:Destroy()
h:Destroy()
end)
local yeah = 0
spawn(function()
for i = 1,555 do 
    local r = math.random(0,1)
    h.FillColor=Color3.new(0,0,0)
        hlpart.FillColor=Color3.new(r,0,0)
    task.wait(.01) 
        local r = math.random(0,1)
    h.FillColor=Color3.new(r,0,0)
        hlpart.FillColor=Color3.new(r,r,r)
    task.wait(.01) 
    end end)
h.OutlineTransparency = 1
task.delay(hldly,function()
game.TweenService:Create(h,TweenInfo.new(ttween),{
    FillTransparency = 1
}):Play()
end)
			local lol = Instance.new('ColorCorrectionEffect')
lol.Parent = game.Lighting

spawn(function()
yeah = 3
for i = 1,loopamm do 
for i = 1,4 do 
local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(15,1,99)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(
math.random(-15,35),
math.random(-3,15),
math.random(-77,77))
game:GetService("Debris"):AddItem(p, .3)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
CFrame = p.CFrame*CFrame.new(0,0,77)
}):Play()
end
task.wait(.01)
 end
end)
spawn(function()

for i = 1,loopamm do 
local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
task.wait(.01) end end)
msh2.Scale = Vector3.new(5,5,5)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(
math.random(-5,5),
math.random(-5,5),
-5)
game:GetService("Debris"):AddItem(p, .2)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=msh2.Scale*i/5
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,CFrame=p.CFrame*CFrame.new(0,-1,0)
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(r, r, r)), ColorSequenceKeypoint.new(1.00,
Color3.new(r, r, r))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/15),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.new(1, 0, 0))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
    local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(8,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(.1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(88, 88, 88)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)
task.delay(.5,function()
v.Rate = 55
end)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(46) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 5
task.wait(.01) end  
end)
for i = 1,conloop do 
lol.Contrast = 999
task.wait(.01)
lol.Contrast = -3
task.wait(.01) 
lol.Contrast = -999
task.wait(.01) 
lol.TintColor = Color3.new(1,0,0)
end
lol:Destroy()

end)

task.wait(.1)
for i = 1, #FRAMES do
MainFrame.Image = FRAMES[i]
task.wait(.03)
end
ScreenGui:Destroy()

local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
hrp.CFrame = hpcf
workspace.CurrentCamera.CameraSubject = char
speedlines:Destroy()
l:Destroy()
hrp.Anchored=false
workspace.CurrentCamera.CameraType = 'Custom'
end)

return
end
end end end
end)
_G.PS('8619298801',1,0,2.3)
_G.PS('4085784226',3)
local h = Instance.new('Highlight',char)
h.FillTransparency = 0
h.OutlineColor=Color3.new(1,0,0)
h.FillColor = Color3.new(0,0,1)
game.TweenService:Create(h,TweenInfo.new(2),{FillTransparency = 1,OutlineTransparency = 1}):Play()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18447913645"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1)
k.TimePosition = 2
workspace.CurrentCamera.CameraSubject = char['Right Arm']
local ye = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.CFrame *= CFrame.Angles(math.rad(270),0,0)
game:GetService("RunService").RenderStepped:Wait()
hrp.CFrame = old
end)
task.wait(.7) ye:Disconnect() 
for i= 1,15 do 





local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
local rnd = math.random(0,1)
if rnd == 1 then 
    p2.Color=Color3.new(
1,0,
0)
else 
p2.Color=Color3.new(
0,0,
1)
end
p2.Size=Vector3.new(1,1,1)
p2.CFrame = hrp.CFrame
*CFrame.new(0,0,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p2, 3)
game.TweenService:Create(p2,TweenInfo.new(1),{
Size=Vector3.new(i,i,i),Transparency = 1
}):Play()
end

_G.PS('341301373',4)
 h:Destroy()
workspace.CurrentCamera.CameraSubject = char

task.wait(.5)
k:Stop(.4)
end end)
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://10466974800" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://136739918287439"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1)
spawn(function()
for i= 1,25 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
p.CFrame = hrp.CFrame*CFrame.new(math.random(-3,3),
math.random(-3,5),15+math.random(-3,1))
msh2.Scale = Vector3.new(.05,.04,45)
p.Transparency = .9
task.wait(.05)
p.Transparency = 0
p.CFrame=p.CFrame*CFrame.new(0,-1,0)
msh2.Scale = Vector3.new(1,2,1)
local rnd = math.random(0,1)
if rnd == 0 then
p.Color=Color3.new(0,0,1)
else 
p.Color=Color3.new(1,0,0)

end
msh2.Scale = Vector3.new(1,2,1)

game:GetService("Debris"):AddItem(p, .2)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,0,15)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,CFrame=p.CFrame*CFrame.new(0,0,-i+math.random(-15,-5))
}):Play()
task.wait(.2)
_G.PS('183763487',.5,.2,1.8)
end)
task.wait(.05) end end)
end end)

getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://10471336737" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://94395585475029"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action
k.TimePosition = .3
k:AdjustSpeed(1) end end)

getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12510170988" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18464372850"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action
k.TimePosition = 2
k:AdjustSpeed(1) end end)
elseif char == 'Corruption' then 
local re = false
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12510170988" then
v:Stop()
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.MaxForce=Vector3.new(0,0,0)
end end)
task.delay(.5,function()
for i = 1,10 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.5,0,1)
msh2.Scale = Vector3.new(1,35,1)
local rnd = math.random(-15,15)/35
p.CFrame = hrp.CFrame*CFrame.new(rnd,-2+-i/15,-2+-i)
task.wait(.02)
msh2.Scale = Vector3.new(1,5,1)
p.CFrame = hrp.CFrame*CFrame.new(rnd,-2+-i/15,-2+-i)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,1),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.5),{
Transparency = 1
}):Play()
end)
task.wait(.02) end
end)
task.delay(1,function()
lol:Disconnect() end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://136138918498003"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1.6)

task.wait(1)
k:AdjustSpeed(.2)
k:Stop(.4)
end end)
getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12447707844" then
v:Stop()
_G.SetMusic(6,1,5)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16524243757"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.8)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
_G.twA('Out of my way.',Color3.new(.5,0,.5),Color3.new(0,0,0))
spawn(function()
for i = 1,30 do 
task.wait(.03)
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,.5)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(15,.5,.5)
p.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
task.wait(.01)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*35
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*5 
bld.Brightness = 1+i*5 

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-15),
NumberSequenceKeypoint.new(.3,5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end end)
task.wait(.6)
spawn(function()
for i = 1,30 do 
task.wait(.03)
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,.5)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(i*math.random(1,3),i*math.random(1,3),i*math.random(1,3))
p.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
task.wait(.01)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*35
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*15
bld.Brightness = 1+i*15

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*45),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-15),
NumberSequenceKeypoint.new(.3,5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(-360,360)
bld:Emit(1)
task.delay(1.5,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end end)
_G.PS(1837829863,1)
local v = Instance.new('ColorCorrectionEffect')

task.spawn(function()
v.Parent = game.Lighting
v.Enabled = true
for i = 1,5 do
v.Brightness = 2
task.wait()
v.Brightness = -2
task.wait() end
v:Destroy()
end)
task.wait(.5)
k:Stop(.2)
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "VANTA-X"
PName.TextColor3 = Color3.new(.2,0,.2)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
local rnd = math.random(1,15)
if rnd == 1 then 
PName.Rotation = math.random(-77,77)
task.wait(.1)
end
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
repeat task.wait() until bp:FindFirstChild('Shove')
_G.SetMusic(3)
_G.twA('Times up.',Color3.new(.5,0,.5),Color3.new(0,0,0))
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Corruption"
PName.TextColor3 = Color3.new(.5,0,.5)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
end end)
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://10471336737" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://12971270638"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = 1.2
task.wait(.4)
_G.PS('9043183024',1,0,1)
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.5,0,1)
msh2.Scale = Vector3.new(1,5,1)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-2,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 0, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,1),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.5),{
Transparency = 1
}):Play()
end end)
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://10466974800" then
v:Stop()
_G.twA("I'll take you on again.",Color3.new(.5,0,.5),Color3.new(.2,0,0))
_G.PS('5829925163',1)
_G.PS('5829925163',.1,0,.5)
_G.PS('5829925163',.8,.1,.9)
task.delay(.2,function()
_G.PS('5829925163',.5,.2,.8)
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18462892217"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.45)
k.TimePosition = .5
spawn(function()
for i= 1,25 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
p.CFrame = hrp.CFrame*CFrame.new(math.random(-1,1),i+math.random(5,10),-3+math.random(-3,1))
msh2.Scale = Vector3.new(.05,45,.05)
p.Transparency = .9
task.wait(.05)
p.Transparency = 0
p.CFrame=p.CFrame*CFrame.new(0,-1,0)
msh2.Scale = Vector3.new(1,2,1)
p.Color=Color3.new(.5,0,1)
task.wait(.02)
p.Color=Color3.new(.5+i/50,i/25,1)
msh2.Scale = Vector3.new(1,2,1)

game:GetService("Debris"):AddItem(p, .2)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,55,3)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,CFrame=p.CFrame*CFrame.new(0,-i+math.random(-15,-5),0)
}):Play()
task.wait(.2)
_G.PS('183763487',.5,.2,1.8)
end)
task.wait(.05) end end)
task.wait(1.3)
k:Stop(.4)
end end)
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://10468665991" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14406991505"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.7)
_G.PS('9043183024',1)
_G.PS('4085784226',1)
task.delay(.1,function()
for i = 1,15 do 
task.wait(.01)
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.5,0,1)
msh2.Scale = Vector3.new(5+-i/5,1+i,5+-i/5)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-1.3+-i/3,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 150
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(155, 0, 255))}
bld.Speed = NumberRange.new(-45)
bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
task.delay(.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,1),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(i/66),{
Scale=Vector3.new(0,i*3,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(i/66),{
Transparency = 1
}):Play()

task.wait(.01) end  
end)
task.delay(.6,function()
_G.PS('8619298801',1,0,1.3)
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
p.CFrame = hrp.CFrame*CFrame.new(0,-1.3,-45)
msh2.Scale = Vector3.new(155,55,99)
task.wait(.05)
msh2.Scale = Vector3.new(55,55,99)
p.Color=Color3.new(.5,0,1)
task.wait(.1)
p.Color=Color3.new(.5,0,1)
p.CFrame = hrp.CFrame*CFrame.new(0,-1.3,-25)
msh2.Scale = Vector3.new(15,15,35)

game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,0,75)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.7),{
Transparency = 1,CFrame=hrp.CFrame*CFrame.new(0,0,-45)
}):Play()
end)
task.wait(1)

k:Stop()
end end)
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Corruption"
PName.TextColor3 = Color3.new(.5,0,.5)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 

PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
if getgenv().ModeIdleAuras == true then
local cloop = false
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16734584478"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
cloop = true

k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
spawn(function()
for i = 1,55150 do 
if cloop == false then break end

local pp = Instance.new('Part')
task.delay(.5,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(1,0,1)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.Acceleration=Vector3.new(0,0,.1)
bld.VelocitySpread = 0
bld.ZOffset = -2
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
pp.CFrame = char.Torso.CFrame*CFrame.new(
	math.sin(i/15)*3,
	math.tan(i/66)/3,
	math.cos(i/15)*3
	
	)
game.TweenService:Create(pp,TweenInfo.new(.5),{Size=Vector3.new(0,0,0)}):Play()

local pp = Instance.new('Part')
task.delay(.5,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(1,0,1)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.Acceleration=Vector3.new(0,0,.1)
bld.VelocitySpread = 0
bld.ZOffset = -2
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
pp.CFrame = char.Torso.CFrame*CFrame.new(
	-math.sin(i/15)*3,
	math.cos(i/66)/3,
	-math.cos(i/15)*3
	
	)
game.TweenService:Create(pp,TweenInfo.new(.5),{Size=Vector3.new(0,0,0)}):Play()

k.TimePosition = 4.6+math.sin(i/35)/45
task.wait(.01) end end)
v.Stopped:wait()
k:Stop(.2)
cloop = false
end end)
else 
local cloop = false
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16734584478"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
cloop = true

k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
spawn(function()
for i = 1,55150 do 
if cloop == false then break end
k.TimePosition = 4.6+math.sin(i/35)/45
task.wait(.01) end end)
v.Stopped:wait()
k:Stop(.2)
cloop = false
end end)
end
elseif char == 'Chaos' then 
local re = false
spawn(function()
task.wait(3)
local RunService = game:GetService("RunService")
for i = 1,9999999999 do 
if getgenv().ChaosFlicker == false then return end
local gayr=math.random(.1,.2)
local gay = RunService.Heartbeat:Connect(function()
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://18462892217"
loaded = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(anim)
loaded.Priority = Enum.AnimationPriority.Action3
loaded:Play()
loaded.TimePosition = 5
loaded:AdjustSpeed(0)
RunService.RenderStepped:Wait()

loaded:Stop()

end)
task.wait(gayr)
gay:Disconnect()
task.wait(gayr)
end
end)
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown


getgenv().M3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13532604085" then
v:Stop() 

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16944345619"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
task.wait(lp:GetNetworkPing()*4.2)


local ye = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.CFrame *= CFrame.Angles(math.rad(270),0,0)
local args = {
[1] = {
["Goal"] = "Wall Combo"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))

game:GetService("RunService").RenderStepped:Wait()
hrp.CFrame = old
end)
task.wait(.3) ye:Disconnect()

k:Stop()
end end)
getgenv().WallCombo = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://16310343179" then
v:Stop() 
local Bloom = Instance.new('BloomEffect')
Bloom.Size = 15
Bloom.Parent = game.Lighting
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17363256069"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(0)
local sfx = Instance.new("Sound",game.CoreGui)
sfx.SoundId = "rbxassetid://"..8737379396
sfx.Volume = 2
sfx.Name = "SFX"
sfx.PlaybackSpeed = 0
sfx:Play()
spawn(function()
for i = 1,15 do 
sfx.TimePosition = .2
sfx.PlaybackSpeed = .2+i/15
task.wait(.1) end

end)
task.delay(2,function()
local sfx = Instance.new("Sound",char)
sfx.SoundId = "rbxassetid://"..233096557
sfx.Volume = 2
sfx.Name = "SFX"
sfx:Play()
game.Debris:AddItem(sfx,2)
task.wait(.5)

spawn(function()
local h = Instance.new('Highlight')
h.Parent = char 
h.FillTransparency = 0
--[[
settings and stuff
local loopamm = 5 -- loop ammount for the line impact
local hldly = 0 -- delay to start hightlight tween
local conloop = 2 -- contrast effect loop ammount
local ttween = .1 -- transparency tween delay
]]
--some nice effect durations
--[[
--long
local loopamm = 25
local hldly = .5
local conloop = 13
local ttween = .1


--kinda short
local loopamm = 3
local hldly = 0
local conloop = 6
local ttween = 1


--very very short
local loopamm = 5
local hldly = 0
local conloop = 3
local ttween = .1
]]
if getgenv().potato_device == true then
loopamm = 2
hldly = 12.5
conloop = 2
ttween = 2
else
loopamm = 15
hldly = 1.5
conloop = 5
ttween = 6
end
local m = Instance.new('Model')
m.Parent = char 


local hlpart = Instance.new('Highlight')
hlpart.Parent = m 
hlpart.OutlineTransparency = 1
hlpart.FillTransparency = 0
task.delay(5,function()
m:Destroy()
h:Destroy()
end)
local yeah = 0
spawn(function()
for i = 1,555 do 
    local r = math.random(0,1)
    h.FillColor=BrickColor.random().Color
        hlpart.FillColor=Color3.new(r,0,0)
    task.wait(.01) 
        local r = math.random(0,1)
    h.FillColor=Color3.new(r,0,0)
        hlpart.FillColor=Color3.new(r,r,r)
    task.wait(.01) 
    end end)
h.OutlineTransparency = 1
task.delay(hldly,function()
game.TweenService:Create(h,TweenInfo.new(ttween),{
    FillTransparency = 1
}):Play()
end)
			local lol = Instance.new('ColorCorrectionEffect')
lol.Parent = game.Lighting

spawn(function()
yeah = 3
for i = 1,loopamm do 
for i = 1,4 do 
local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(15,25,15)
p.CFrame = hrp.CFrame*CFrame.new(
math.random(-15,35),
math.random(-3,15),
math.random(-77,0))*CFrame.Angles(math.rad(90),0,0)
game:GetService("Debris"):AddItem(p, .3)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(-.5,99,-.5)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
CFrame = p.CFrame*CFrame.new(0,0,77)
}):Play()
end
task.wait(.01)
 end
end)
spawn(function()

for i = 1,loopamm do 
local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
p.Color=BrickColor.random().Color
task.wait(.01) end end)
msh2.Scale = Vector3.new(5,5,5)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(
math.random(-5,5),
math.random(-5,5),
-5)
game:GetService("Debris"):AddItem(p, .2)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=msh2.Scale*i/5
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,CFrame=p.CFrame*CFrame.new(0,-1,0)
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/15),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.new(1, 0, 0))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
    local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(15,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(.1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)
task.delay(.5,function()
v.Rate = 55
end)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(46) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 5
task.wait(.01) end  
end)
for i = 1,conloop do 
lol.Contrast = 999
task.wait(.01)
lol.Contrast = -3
lol.TintColor = BrickColor.random().Color
task.wait(.01) 
lol.Contrast = -999
task.wait(.01) 
lol.TintColor = Color3.new(1,0,0)
end
lol:Destroy()
end)
spawn(function()
for i = 1,5 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 1 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .5
s.Volume = .5 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
end end)
end)

game.Debris:AddItem(sfx,5)
task.spawn(function()
task.wait(.5)
local d = .2

for i = 1,35 do d=d+-.03

Bloom.Threshold = 0
Bloom.Size = 15
Bloom.Intensity = 5
task.wait(d)
Bloom.Threshold = 2
Bloom.Size = 15
Bloom.Intensity = 2
task.wait(d) end
Bloom:Destroy()
end)
spawn(function()
for i=1,35 do 
k.TimePosition = .2+i/10
task.wait(.025)
k.TimePosition = .1+i/10
task.wait(.025)
 end
end)
task.wait(1) k:Stop(1)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17420452843"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(0)
k.TimePosition = 1.5
spawn(function()
for i=1,25 do 
k.TimePosition = 1.5+i/12
for i = 1,3 do 

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
msh2.Scale = Vector3.new(0,1,0)
if i == 1 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(45),0)
elseif i == 2 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(0),0)
elseif i == 3 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(-45),0)
end
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(1,0,15)
}):Play()
task.delay(.1,function()
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
end)
end 
task.wait(.01) 
k.TimePosition = 1.3+i/12
for i = 1,3 do 

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
msh2.Scale = Vector3.new(0,1,0)
if i == 1 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(45),0)
elseif i == 2 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(0),0)
elseif i == 3 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(-45),0)
end
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(1,0,15)
}):Play()
task.delay(.1,function()
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
end)
end 
task.wait(.01) 
k.TimePosition = 1+i/12
for i = 1,3 do 

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
msh2.Scale = Vector3.new(0,1,0)
if i == 1 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(45),0)
elseif i == 2 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(0),0)
elseif i == 3 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(-45),0)
end
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(1,0,15)
}):Play()
task.delay(.1,function()
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
end)
end 
task.wait(.01) 
k.TimePosition = 2+i/12
for i = 1,3 do 

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
msh2.Scale = Vector3.new(0,1,0)
if i == 1 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(45),0)
elseif i == 2 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(0),0)
elseif i == 3 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(-45),0)
end
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(1,0,15)
}):Play()
task.delay(.1,function()
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
end)
end 
task.wait(.01) 
k.TimePosition = 0+i/12
for i = 1,3 do 

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
msh2.Scale = Vector3.new(0,1,0)
if i == 1 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(45),0)
elseif i == 2 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(0),0)
elseif i == 3 then 
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-1.5,0)*
CFrame.Angles(0,math.rad(-45),0)
end
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(1,0,15)
}):Play()
task.delay(.1,function()
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
end)
end 
end
end)
task.delay(.5,function()
for i = 1,66 do 

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
msh2.Scale = Vector3.new(1,1,5)
p.CFrame = hrp.CFrame*CFrame.new(math.random(-15,15),
math.random(-3,5),math.random(-25,77))

game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,0,55)
}):Play()
task.wait(.02)
end end)
task.wait(1.3)
k:Stop(.4)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://137561511768861"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(0)
k.TimePosition = .8
spawn(function()
for i=1,35 do 
k.TimePosition = .8+i/15
task.wait(.05) end
end)
end end)
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Glitch Burst'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Static Storm'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Digital Bind'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'System Crash'

getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12342141464" then
getgenv().DoingUlt = true

local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 0, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "ERROR"
local CTAB = {'ERoR','ERoRR','ERROR','erORR',
'erOr','ERRor','erroR','ErRor','ErRoR','ERRor',
'ErroR','ERRor','erroR','ERRORRRR'}
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
HealthBar.ExtentsOffset = Vector3.new(0, -getgenv().music.PlaybackLoudness/25, 0)
HealthBar.Size = UDim2.new(getgenv().music.PlaybackLoudness/25, 0, getgenv().music.PlaybackLoudness/35, 0)
local rnd = math.random(0,1)
PName.Text = CTAB[math.random(1,#CTAB)]
PName.TextColor3 = Color3.new(rnd,rnd,rnd)
PName.Size = UDim2.new(3+math.random(2,5)/35, 0, 1+math.random(2,5)/35, 0)
PName.TextStrokeColor3 = BrickColor.random().Color
PName.Rotation = math.random(-15,15)
PName.Position = UDim2.new(-1.0919999976+math.random(-5,5)/25, 
0, -0.800000012+math.random(-5,5)/25, 0)
task.wait(.02) end end)
_G.SetMusic(23,1,34)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.Name = "VignetteEffect"
screenGui.IgnoreGuiInset = true



local vignette = Instance.new("ImageLabel")
vignette.Parent = screenGui
vignette.Size = UDim2.new(1, 0, 1, 0)
vignette.BackgroundTransparency = 1
vignette.Image = "rbxassetid://4576475446"
vignette.ImageTransparency = 1
game.TweenService:Create(vignette,TweenInfo.new(2.5),{ImageTransparency = 0}):Play()

task.delay(8.5, function()
game.TweenService:Create(vignette,TweenInfo.new(5.5),{ImageTransparency = 1}):Play()
task.wait(6)
    screenGui:Destroy()
end)

spawn(function()
local h = Instance.new('Highlight')
h.Parent = char 
h.FillTransparency = 0
--[[
settings and stuff
local loopamm = 5 -- loop ammount for the line impact
local hldly = 0 -- delay to start hightlight tween
local conloop = 2 -- contrast effect loop ammount
local ttween = .1 -- transparency tween delay
]]
--some nice effect durations
--[[
--long
local loopamm = 25
local hldly = .5
local conloop = 13
local ttween = .1


--kinda short
local loopamm = 3
local hldly = 0
local conloop = 6
local ttween = 1


--very very short
local loopamm = 5
local hldly = 0
local conloop = 3
local ttween = .1
]]
if getgenv().potato_device == true then
loopamm = 2
hldly = 12.5
conloop = 2
ttween = 2
else
loopamm = 200
hldly = 12.5
conloop = 66
ttween = 2
end
local m = Instance.new('Model')
m.Parent = char 


local hlpart = Instance.new('Highlight')
hlpart.Parent = m 
hlpart.OutlineTransparency = 1
hlpart.FillTransparency = 0
task.delay(5,function()
m:Destroy()
h:Destroy()
end)
local yeah = 0
spawn(function()
for i = 1,555 do 
    local r = math.random(0,1)
    h.FillColor=Color3.new(0,0,0)
        hlpart.FillColor=Color3.new(r,0,0)
    task.wait(.01) 
        local r = math.random(0,1)
    h.FillColor=Color3.new(r,0,0)
        hlpart.FillColor=Color3.new(r,r,r)
    task.wait(.01) 
    end end)
h.OutlineTransparency = 1
task.delay(hldly,function()
game.TweenService:Create(h,TweenInfo.new(ttween),{
    FillTransparency = 1
}):Play()
end)
			local lol = Instance.new('ColorCorrectionEffect')
lol.Parent = game.Lighting

spawn(function()
yeah = 3
for i = 1,loopamm do 
for i = 1,4 do 
local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(15,25,15)
p.CFrame = hrp.CFrame*CFrame.new(
math.random(-15,35),
math.random(-3,15),
math.random(-77,0))
game:GetService("Debris"):AddItem(p, .3)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(-.5,99,-.5)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
CFrame = p.CFrame*CFrame.new(0,0,77)
}):Play()
end
task.wait(.01)
 end
end)
spawn(function()

for i = 1,loopamm do 
local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
p.Color=BrickColor.random().Color
task.wait(.01) end end)
msh2.Scale = Vector3.new(5,5,5)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(
math.random(-5,5),
math.random(-5,5),
-5)
game:GetService("Debris"):AddItem(p, .2)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=msh2.Scale*i/5
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1,CFrame=p.CFrame*CFrame.new(0,-1,0)
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/15),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.new(1, 0, 0))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
    local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(15,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(.1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)
task.delay(.5,function()
v.Rate = 55
end)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(46) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 5
task.wait(.01) end  
end)
for i = 1,conloop do 
lol.Contrast = 999
task.wait(.01)
lol.Contrast = -3
lol.TintColor = BrickColor.random().Color
task.wait(.01) 
lol.Contrast = -999
task.wait(.01) 
lol.TintColor = Color3.new(1,0,0)
end
lol:Destroy()
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16734584478"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(0)
workspace.CurrentCamera.CameraType = 'Scriptable'
local e = false
local v = Instance.new('BodyVelocity') v.MaxForce=Vector3.new(10^10,10^10,10^10)
v.Parent = hrp
spawn(function()
for i= 1,9999 do 
if e == true then return end
k.TimePosition = 2+i/12
hrp.CFrame = hrp.CFrame*CFrame.new(0,.2,0)
workspace.CurrentCamera.CFrame = hrp.CFrame*CFrame.new(0,i/5,-15)
*CFrame.Angles(0,math.rad(180+math.sin(i/2)*35),0)
task.wait(.1)
end end)

task.delay(4,function()
e = true 
v:Destroy()
k:Stop()
workspace.CurrentCamera.CameraType = 'Custom'
local doColors = true
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13497875049"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18464362124"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://8136730962"
local k2 = char.Humanoid:LoadAnimation(Anim)
local ErrorLoop = false
pcall(function() getgenv().Idle:Disconnect() end)
if getgenv().ModeIdleAuras == true then
local CurrentColor = Color3.new(0.5,0,0)

coroutine.resume(coroutine.create(function()
while doColors == true do
for i = 0,1,0.06 do
for bruh = 1,3 do
game:GetService("RunService").Heartbeat:Wait()
end
CurrentColor = Color3.fromHSV(i,1,1)
end
end
end))

local Blur = nil
task.spawn(function()
Blur = Instance.new('BlurEffect',game.Lighting)
for i = 1,1512515 do
if doColors == false then break end
Blur.Size = getgenv().music.PlaybackLoudness/88
game.Lighting.FogColor = CurrentColor
workspace.CurrentCamera.FieldOfView = 70+getgenv().music.PlaybackLoudness/25
game.Lighting.ClockTime = 2 + getgenv().music.PlaybackLoudness/155
game.Lighting.ExposureCompensation = math.clamp((0 + getgenv().music.PlaybackLoudness/250),0,5)
game.Lighting:FindFirstChildOfClass("Sky")MoonAngularSize = 6 + getgenv().music.PlaybackLoudness/50

task.wait() end v:Destroy()

Blur:Destroy()
end)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
ErrorLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
k2:Play(.3)
k2.Priority = Enum.AnimationPriority.Idle
k2:AdjustSpeed(.1)
spawn(function()
for i = 1,999999 do 
if ErrorLoop == false then break end
if k.TimePosition >= .1 then
for i = 1,3 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(gay,gay*1,gay)
p.CFrame = hrp.CFrame*CFrame.new(1,-3,-1.5)*CFrame.Angles(
math.random(-1,1),
math.random(-1,1),
math.random(-1,1))
game:GetService("Debris"):AddItem(p, .4)
game.TweenService:Create(p,TweenInfo.new(.4),{
CFrame=p.CFrame*CFrame.new(0,1,0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.4),{
Scale = Vector3.new(0,15+gay*9,0)
}):Play()


local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(gay,gay*1,gay)
p.CFrame = hrp.CFrame*
CFrame.new(math.random(-155,155),-10,math.random(-155,155))
game:GetService("Debris"):AddItem(p, .4)
game.TweenService:Create(p,TweenInfo.new(.2),{
CFrame=p.CFrame*CFrame.new(0,15,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.4),{
Scale = Vector3.new(0,15+gay*9,0)
}):Play()

end

 end
k.TimePosition = getgenv().music.PlaybackLoudness/1000+math.cos(i/15)/45
k2.TimePosition = getgenv().music.PlaybackLoudness/555
char.Humanoid.CameraOffset = Vector3.new(0,getgenv().music.PlaybackLoudness/255,0)
task.wait(.02) end end)
v.Stopped:wait()

k:Stop(.2) k2:Stop(.2)
ErrorLoop = false
end end)
else 
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
ErrorLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
k2:Play(.3)
k2.Priority = Enum.AnimationPriority.Idle
k2:AdjustSpeed(.1)
spawn(function()
for i = 1,999999 do 
if ErrorLoop == false then break end

k.TimePosition = getgenv().music.PlaybackLoudness/1000+math.cos(i/15)/45
k2.TimePosition = getgenv().music.PlaybackLoudness/555
char.Humanoid.CameraOffset = Vector3.new(0,getgenv().music.PlaybackLoudness/255,0)
task.wait(.02) end end)
v.Stopped:wait()

k:Stop(.2) k2:Stop(.2)
ErrorLoop = false
end end)

end
task.wait(9)
repeat task.wait() until bp:FindFirstChild('Flowing Water')
doColors = false 
_G.SetMusic(4,1,34)

game.Lighting.ExposureCompensation = 0
workspace.CurrentCamera.FieldOfView = 70
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Glitch Burst'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Static Storm'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Digital Bind'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'System Crash'
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "CHAOS"
local CTAB = {'CHAOS','ChAoS','ChAOS','chaos','CHAos','Chaos','chaOS','ChAOs','ChAoS','CHAoS',
'cHaOS','cHAOs','chAos','chaOs'}
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Text = CTAB[math.random(1,#CTAB)]
PName.TextColor3 = BrickColor.random().Color
PName.Size = UDim2.new(3+math.random(2,5)/35, 0, 1+math.random(2,5)/35, 0)
PName.TextStrokeColor3 = BrickColor.random().Color
PName.Rotation = math.random(-15,15)
PName.Position = UDim2.new(-1.0919999976+math.random(-5,5)/25, 0, -0.800000012+math.random(-5,5)/25, 0)
task.wait(.02) end end)
getgenv().Idle:Disconnect()
if getgenv().ModeIdleAuras == true then
local cloop = false
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16734584478"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
cloop = true

k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(.1)
k.Looped = true
spawn(function()
for i =1,9999 do 
if cloop == false then break end
for i= 1,math.random(2,15) do 
k.TimePosition = 1+math.random()*2
local pp = Instance.new('Part')
task.delay(.1,function() 
pp:Destroy() end)
local rnd = math.random(-15,15)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(rnd,rnd,.1)
pp.Anchored=true pp.CanCollide=false
pp.Color=BrickColor.random().Color
pp.Parent = getgenv().Enviroment
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,15),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.Acceleration=Vector3.new(0,0,.1)
bld.VelocitySpread = 0
bld.ZOffset = -2
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
pp.CFrame = char.Torso.CFrame*CFrame.new(
math.random(-35,35),
math.random(-35,35),
math.random(-35,35)

	)
game.TweenService:Create(pp,TweenInfo.new(.1),{Transparency = 1}):Play()

task.wait(.01) end
k.TimePosition = 4
task.wait(math.random(.1,1)) 
end
end)
v.Stopped:wait()
k:Stop(.2)
cloop = false
end end)
else 
local cloop = false
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16734584478"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
cloop = true

k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(.1)
k.Looped = true
spawn(function()
for i =1,9999 do 
if cloop == false then break end
for i= 1,math.random(2,15) do 
k.TimePosition = 1+math.random()*2

task.wait(.01) end
k.TimePosition = 4
task.wait(math.random(.1,1)) 
end
end)
v.Stopped:wait()
k:Stop(.2)
cloop = false
end end)
end
end)
end end)
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "CHAOS"
local CTAB = {'CHAOS','ChAoS','ChAOS','chaos','CHAos','Chaos','chaOS','ChAOs','ChAoS','CHAoS',
'cHaOS','cHAOs','chAos','chaOs'}
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Text = CTAB[math.random(1,#CTAB)]
PName.TextColor3 = BrickColor.random().Color
PName.Size = UDim2.new(3+math.random(2,5)/35, 0, 1+math.random(2,5)/35, 0)
PName.TextStrokeColor3 = BrickColor.random().Color
PName.Rotation = math.random(-15,15)
PName.Position = UDim2.new(-1.0919999976+math.random(-5,5)/25, 0, -0.800000012+math.random(-5,5)/25, 0)
task.wait(.02) end end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16524237104"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
task.delay(1,function()
k:Stop(.3)
end)
if getgenv().ModeIdleAuras == true then
local cloop = false
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16734584478"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
cloop = true

k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(.1)
k.Looped = true
spawn(function()
for i =1,9999 do 
if cloop == false then break end
for i= 1,math.random(2,15) do 
k.TimePosition = 1+math.random()*2
local pp = Instance.new('Part')
task.delay(.1,function() 
pp:Destroy() end)
local rnd = math.random(-15,15)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(rnd,rnd,.1)
pp.Anchored=true pp.CanCollide=false
pp.Color=BrickColor.random().Color
pp.Parent = getgenv().Enviroment
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,15),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.Acceleration=Vector3.new(0,0,.1)
bld.VelocitySpread = 0
bld.ZOffset = -2
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
pp.CFrame = char.Torso.CFrame*CFrame.new(
math.random(-35,35),
math.random(-35,35),
math.random(-35,35)

	)
game.TweenService:Create(pp,TweenInfo.new(.1),{Transparency = 1}):Play()

task.wait(.01) end
k.TimePosition = 4
task.wait(math.random(.1,1)) 
end
end)
v.Stopped:wait()
k:Stop(.2)
cloop = false
end end)
else 
local cloop = false
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16734584478"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
cloop = true

k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(.1)
k.Looped = true
spawn(function()
for i =1,9999 do 
if cloop == false then break end
for i= 1,math.random(2,15) do 
k.TimePosition = 1+math.random()*2

task.wait(.01) end
k.TimePosition = 4
task.wait(math.random(.1,1)) 
end
end)
v.Stopped:wait()
k:Stop(.2)
cloop = false
end end)
end
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12309835105" 
then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17278415853"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = 3
task.delay(.5,function()
k:Stop() end)
spawn(function()
for i = 1,5 do 
_G.PS('4478181452',.3,.2,2+math.random(-5,5)/35)
for i = 1,2 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
local rndlol = math.random(-5,5)*3
msh2.Scale = Vector3.new(1,35,1)
p.CFrame = hrp.CFrame*CFrame.new(rndlol/2,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
task.wait(.01)
msh2.Scale = Vector3.new(3,3,3)
p.CFrame = hrp.CFrame*CFrame.new(rndlol,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.02)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*13),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end
task.wait(.1) end  end)
end end)
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12273188754" 
or v.Animation.AnimationId == "rbxassetid://14374357351" 
then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16311141574"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(0)
k.TimePosition = .2
local pcf = hrp.CFrame
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
_G.PS('183763487',1,nil,1+math.random(-5,5)/55)
_G.PS('4478181452',.3,.2,2+math.random(-5,5)/35)
for i = 1,5 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
local rndlol = math.random(-5,5)
msh2.Scale = Vector3.new(1,35,1)
p.CFrame = hrp.CFrame*CFrame.new(rndlol/2,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
task.wait(.01)
msh2.Scale = Vector3.new(3,3,3)
p.CFrame = hrp.CFrame*CFrame.new(rndlol,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.02)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*13),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end
hrp.CFrame=hrp.CFrame*CFrame.new(
math.random(-99,99),
math.random(-15,15),
math.random(-99,99)
)
pp.Velocity=pp.Velocity*3
end end)
task.delay(1,function()
lol:Disconnect() end)
task.wait(1)
hrp.CFrame = pcf
task.delay(.7,function()
_G.PS('183763487',1,nil,1+math.random(-5,5)/55)
_G.PS('4478181452',.3,.2,2+math.random(-5,5)/35)
for i = 1,5 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
local rndlol = math.random(-5,5)
msh2.Scale = Vector3.new(1,35,1)
p.CFrame = hrp.CFrame*CFrame.new(rndlol/2,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
task.wait(.01)
msh2.Scale = Vector3.new(3,3,3)
p.CFrame = hrp.CFrame*CFrame.new(rndlol,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.02)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*13),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end
end)
task.wait(1)
k:Stop()
end end)
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://12296113986" 
then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://79761806706382"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = .8
local pcf = hrp.CFrame
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.Velocity=pp.Velocity*0
end end)
task.delay(1,function()
lol:Disconnect() end)
spawn(function()
for i = 1,7 do 
_G.PS('183763487',1,nil,1+math.random(-5,5)/55)
_G.PS('4478181452',.3,.2,2+math.random(-5,5)/35)
for i = 1,5 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
local rndlol = math.random(-5,5)
msh2.Scale = Vector3.new(1,35,1)
p.CFrame = hrp.CFrame*CFrame.new(rndlol/2,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
task.wait(.01)
msh2.Scale = Vector3.new(3,3,3)
p.CFrame = hrp.CFrame*CFrame.new(rndlol,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.02)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*13),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end
hrp.CFrame=hrp.CFrame*CFrame.new(
math.random(-99,99),
math.random(-15,15),
math.random(-99,99)
)
task.wait(.1) end 
for i = 1,7 do 
_G.PS('183763487',1,nil,1+math.random(-5,5)/55)
_G.PS('4478181452',.3,.2,2+math.random(-5,5)/35)
for i = 1,5 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
local rndlol = math.random(-5,5)
msh2.Scale = Vector3.new(1,35,1)
p.CFrame = hrp.CFrame*CFrame.new(rndlol/2,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
task.wait(.01)
msh2.Scale = Vector3.new(3,3,3)
p.CFrame = hrp.CFrame*CFrame.new(rndlol,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.02)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*13),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end
task.wait(.1) end 

end)
task.wait(1)
hrp.CFrame = pcf
task.wait(1)
k:Stop()
end end)
elseif char == 'Equinox' then 
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Equalized Eruption'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Equinox Rush'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Yin Yangi'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Unseen Justice'
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Equinox"
PName.TextColor3 = Color3.new(1,1,1)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(0,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Position = UDim2.new(-1.0919999976, math.cos(i/35)*9, -0.800000012, 
math.cos(i/15)*2)
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)

getgenv().Move2B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://15279910941" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18435535291"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(0)
k.TimePosition = .5
task.wait(.6)
workspace.CurrentCamera.CameraType = 'Scriptable'
spawn(function()
for i=1,15 do 
    workspace.CurrentCamera.CFrame = hrp.CFrame*
CFrame.new(35,15,5)*CFrame.Angles(0,math.rad(80),0)
task.wait(.05) end end)
local h = Instance.new('Highlight',char)
h.FillTransparency = 0
local h2 = Instance.new('Highlight')
for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 77 then 

h2.Parent = v
h2.FillTransparency = 0
h2.FillColor=Color3.new(0,0,0)
v.HumanoidRootPart.Anchored=true
task.delay(2,function()
 h2:Destroy()
 v.HumanoidRootPart.Anchored=false
end)
end end end 
local v = Instance.new('ColorCorrectionEffect')
v.Parent = game.Lighting 
v.TintColor=Color3.new(0,0,1)
v.Brightness = 55
h.FillColor = Color3.new(0,0,0)
local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame
*CFrame.new(-5,25,-10)
game:GetService("Debris"):AddItem(p, 2.3)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(.1,35,.1)
}):Play()
task.wait(.3)
local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame
*CFrame.new(-5,25,-10)*CFrame.Angles(0,math.rad(90),0)
game:GetService("Debris"):AddItem(p, 2)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(35,.1,.1)
}):Play()
task.wait(.5)
local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame
*CFrame.new(-5,25,-10)*CFrame.Angles(math.rad(40),math.rad(90),0)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(35,.1,.1)
}):Play()
local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = hrp.CFrame
*CFrame.new(-5,25,-10)*CFrame.Angles(math.rad(-40),math.rad(90),0)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(35,.1,.1)
}):Play()
for i = 1,35 do 
    local p = Instance.new('Part')
p.Parent = char
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(1,5,5)
p.CFrame = hrp.CFrame
*CFrame.new(math.random(-35,4),math.random(-25,77),25+
math.random(-15,15))*CFrame.Angles(0,math.rad(90),0)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(35+i*5,0,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.1),{
CFrame=p.CFrame*CFrame.new(math.random(15,35),0,0)
}):Play()
task.wait(.02) end

h:Destroy() v:Destroy()
k:Stop()
workspace.CurrentCamera.CameraType = 'Custom'
 end end)
if getgenv().ModeIdleAuras == true then 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15503060232"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://88016955"
local kk = char.Humanoid:LoadAnimation(Anim)
local equinoxloop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
equinoxloop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Idle
kk:AdjustSpeed(0)
spawn(function()
for i = 1,999999 do 
local lol = math.random(0,1)
if equinoxloop == false then break end

local pp = Instance.new('Part')
task.delay(.7,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(lol,lol,lol)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
pp.CFrame=CFrame.new(hrp.CFrame.X+math.random(-25,25),441+-10,hrp.CFrame.Z+math.random(-25,25))*CFrame.Angles(0,0,0)
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 155 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*5),
NumberSequenceKeypoint.new(1,0)
})
bld.Orientation = 'VelocityParallel'
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.3,-7),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.Acceleration=Vector3.new(0,0,.1)
bld.VelocitySpread = 0
bld.ZOffset = -2
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
msh2.Scale = Vector3.new(3,3,3)
game.TweenService:Create(msh2,TweenInfo.new(1),{Scale=Vector3.new(0,45,0)}):Play()
game.TweenService:Create(pp,TweenInfo.new(1.6),{Transparency = 1}):Play()

k.TimePosition = 4.8+math.cos(i/5)/10
task.wait(.1) end end)
v.Stopped:wait()
k:Stop(.2) kk:Stop()
equinoxloop = false
end end)
else
	local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15503060232"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://88016955"
local kk = char.Humanoid:LoadAnimation(Anim)
local equinoxloop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
equinoxloop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Idle
kk:AdjustSpeed(0)
spawn(function()
for i = 1,999999 do 
local lol = math.random(0,1)
if equinoxloop == false then break end
k.TimePosition = 4.8+math.cos(i/5)/10
task.wait(.1) end end)
v.Stopped:wait()
k:Stop(.2) kk:Stop()
equinoxloop = false
end end)
end
function DelEffects(timer)
task.spawn(function()
workspace.Thrown.Name = 'Disabled'
task.wait(timer)
workspace.Disabled.Name = 'Thrown'
end) end
function Var1()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17275150809"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.8)
local p = Instance.new('Part')
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
p.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
msh2.Scale = Vector3.new(0,0,0)
game.TweenService:Create(msh2,TweenInfo.new(1),{Scale=Vector3.new(15,15,15)}):Play()
spawn(function()
for i =1,40 do 
p.CFrame = hrp.CFrame*CFrame.new(0,0,-14)
local rnd = math.random(0,1)
p.Color=Color3.new(rnd,rnd,rnd)
task.wait(.02) end
p:Destroy()
end)
spawn(function()
task.wait(.3)
local lol = -1
for i = 1,25 do 
lol=lol+1 if lol == 2 then lol = 0 end
local pp = Instance.new('Part')
task.delay(.3,function()
pp:Destroy() end)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(lol,lol,lol)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
msh2.Scale = Vector3.new(3,15,0)
pp.CFrame=p.CFrame*CFrame.Angles(0,i/15,0)
game.TweenService:Create(msh2,TweenInfo.new(.3),{Scale=Vector3.new(0,0,45)}):Play()

local pp = Instance.new('Part')
task.delay(.3,function()
pp:Destroy() end)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(lol,lol,lol)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
msh2.Scale = Vector3.new(3,15,0)
pp.CFrame=p.CFrame*CFrame.Angles(0,1.5+i/15,0)
game.TweenService:Create(msh2,TweenInfo.new(.3),{Scale=Vector3.new(0,0,45)}):Play()

task.wait(.02) end end)
end 
function Var2()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17165175187"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.7)
task.delay(.5,function()
k:AdjustSpeed(.1) end)
task.delay(1.5,function()
k:Stop(.5) end)
spawn(function()
task.wait(.5)
local lol = -1
for i = 1,25 do 
lol=lol+1 if lol == 2 then lol = 0 end
local pp = Instance.new('Part')
task.delay(.3,function()
pp:Destroy() end)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(lol,lol,lol)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
pp.CFrame=hrp.CFrame*CFrame.new(math.random(-10,10),-10,-12+math.random(-10,10))*CFrame.Angles(0,0,0)
msh2.Scale = Vector3.new(5,25,5)
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 155 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*5),
NumberSequenceKeypoint.new(1,0)
})
bld.Orientation = 'VelocityParallel'
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.3,-7),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.Acceleration=Vector3.new(0,0,.1)
bld.VelocitySpread = 0
bld.ZOffset = -2
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
task.wait(.01)
msh2.Scale = Vector3.new(3,3,3)
game.TweenService:Create(msh2,TweenInfo.new(.1),{Scale=Vector3.new(0,45,0)}):Play()

task.wait(.01) end end)
end 
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://15290930205" then
v:Stop()
DelEffects(2)
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.MaxForce=Vector3.new(0,0,0)
end end)
task.delay(1,function()
lol:Disconnect() end)
local rnd = math.random(1,2)
if rnd == 1 then 
Var1() else Var2() end
end end)

function hit()
local pcf = hrp.CFrame
for i=1,3 do 
local p = Instance.new('Part')
task.delay(1.3,function()
p:Destroy() end)
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
p.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
spawn(function() for i = 1,99 do 
local rnd = math.random(0,1)
p.Color=Color3.new(rnd,rnd,rnd)
task.wait(.02) end end)
p.CFrame = pcf*CFrame.new(math.random(-1,1),5,-9+math.random(-1,1))*CFrame.Angles(math.rad(-15),0,0)
msh2.Scale = Vector3.new(5,35,5)
task.wait(.02)
msh2.Scale = Vector3.new(0,0,0)
game.TweenService:Create(msh2,TweenInfo.new(.2),{Scale=Vector3.new(3,5,3)}):Play()
game.TweenService:Create(p,TweenInfo.new(.1),{
	CFrame = pcf*CFrame.new(math.random(-1,1),5,-9+math.random(-1,1))*CFrame.Angles(math.rad(-15),0,0)}):Play()


task.delay(.2,function()
game.TweenService:Create(msh2,TweenInfo.new(.2),{Scale=Vector3.new(0,25,0)}):Play()
end)
end

end
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://15145462680" then
    local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://12510170988"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.4)
for i = 1,3 do 
v:GetMarkerReachedSignal("hit"..i):Connect(function(paramString)
k.TimePosition = k.TimePosition +.2 
hit()
task.wait(.2) k.TimePosition = k.TimePosition -.4
end)
task.delay(1.5,function()
    local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://12467789963"
local v = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
v:Play(.3)
v.Priority = Enum.AnimationPriority.Action2
v:AdjustSpeed(1)
end)
v:GetMarkerReachedSignal("final"):Connect(function(paramString)
k:Stop()
for i=1,3 do 
local p = Instance.new('Part')
task.delay(1.3,function()
p:Destroy() end)
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
p.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
spawn(function() for i = 1,99 do 
local rnd = math.random(0,1)
p.Color=Color3.new(rnd,rnd,rnd)
task.wait(.02) end end)
p.CFrame = hrp.CFrame*CFrame.new(math.random(-1,1),0,-9+math.random(-1,1))
*CFrame.Angles(math.rad(0),0,0)
msh2.Scale = Vector3.new(5,35,5)
task.wait(.02)
msh2.Scale = Vector3.new(0,0,0)
game.TweenService:Create(msh2,TweenInfo.new(.2),{Scale=Vector3.new(3,5,3)}):Play()
game.TweenService:Create(p,TweenInfo.new(.1),{
	CFrame = hrp.CFrame*CFrame.new(math.random(-1,1),0,-9+math.random(-1,1))
	*CFrame.Angles(math.rad(0),0,0)}):Play()


task.delay(.2,function()
game.TweenService:Create(msh2,TweenInfo.new(.8),{Scale=Vector3.new(0,55,0)}):Play()
game.TweenService:Create(p,TweenInfo.new(.8),{CFrame = p.CFrame*CFrame.new(0,-45,0)}):Play()

end)
end

end)
end
end end)
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://15295895753" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://112620365240235"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = .5
gay = false 
for i = 1,255 do 
 if v.TimePosition >= .6 then 
 gay = true 
 break end
 task.wait(.01) end
 if gay == false then return end
local p = Instance.new('Part')
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
p.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
msh2.Scale = Vector3.new(0,0,0)
game.TweenService:Create(msh2,TweenInfo.new(1),{Scale=Vector3.new(3,3,3)}):Play()
spawn(function()
for i =1,40 do 
p.CFrame = hrp.CFrame*CFrame.new(0,-3,-8)
local rnd = math.random(0,1)
p.Color=Color3.new(rnd,rnd,rnd)
task.wait(.02) end
p:Destroy()
end)
spawn(function()
task.wait(.3)
local lol = -1
for i = 1,20 do 
lol=lol+1 if lol == 2 then lol = 0 end
local pp = Instance.new('Part')
task.delay(.3,function()
pp:Destroy() end)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(lol,lol,lol)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
msh2.Scale = Vector3.new(15,15,0)
pp.CFrame=p.CFrame*CFrame.Angles(0,i/10,0)
game.TweenService:Create(msh2,TweenInfo.new(.3),{Scale=Vector3.new(0,0,45)}):Play()
local pp = Instance.new('Part')
task.delay(.3,function()
pp:Destroy() end)
pp.Material = Enum.Material.Neon 
pp.Size=Vector3.new(1,1,1)
pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(lol,lol,lol)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
msh2.Scale = Vector3.new(15,15,0)
pp.CFrame=p.CFrame*CFrame.Angles(0,math.rad(90)+i/10,0)
game.TweenService:Create(msh2,TweenInfo.new(.3),{Scale=Vector3.new(0,0,45)}):Play()

task.wait(.02) end end)
task.wait(1.5)
k:Stop()
end end)
local CounterHit = false
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://15311685628" then
task.wait(1.3)
if CounterHit == false then 
_G.twA('Your making a fool out of me.',Color3.new(1,1,1),Color3.new(0,0,0))
end
end end)
getgenv().Move4B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://15334974550" then
CounterHit = true 
task.delay(2,function()
CounterHit = false end) 
_G.twA('Nice try.',Color3.new(1,1,1),Color3.new(0,0,0))
end end)
elseif char == 'Crazed' then
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Dark Surge'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Air Torrent'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Shattering Reality'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Explosive Discs'
pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 4, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "CRAZED"
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.TextColor3 = Color3.fromRGB(0,0,math.random(1,155))
HealthBar.ExtentsOffset = Vector3.new(math.sin(i/5), 3+math.cos(i/30)/2, 0)
PName.Rotation = math.cos(i/7)*8
task.wait(.01) end end)
getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13499771836" then
getgenv().DoingUlt = true
pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
pcall(function() getgenv().Idle:Disconnect() end)
if getgenv().ModeIdleAuras == true then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75318228407422"
local k = char.Humanoid:LoadAnimation(Anim)
local CrazedLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
CrazedLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(.1)
spawn(function()
for i = 1,99999 do 
if CrazedLoop == false then break end
spawn(function()
local pp = Instance.new('Part')
task.delay(1.5,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 

pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(0,0,1)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(3.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(1,15)
})
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(1,15)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.Acceleration=Vector3.new(0,5,0)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Orientation = 'VelocityParallel'
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
spawn(function()
for i = 1,45 do 
local yes = math.random(1,17)
if yes == 5 then 
for i = 1,math.random(2,6) do 
local rnd = math.random(0,1)
pp.Color=Color3.new(rnd, rnd, rnd)

task.wait(.02) end
end
pp.Color=Color3.fromRGB(0, 0, math.random(1,155))
task.wait(.02) end end)
pp.Size=Vector3.new(1,.1,1)
pp.CFrame = hrp.CFrame*CFrame.new(
math.random(-77,77),
-2,
math.random(-77,77))*CFrame.Angles(math.rad(math.random(-15,15)),0,0)
game.TweenService:Create(pp,TweenInfo.new(.5),{Size=Vector3.new(2,.2,2)}):Play()
task.wait(.5)
game.TweenService:Create(pp,TweenInfo.new(1.5),{Size=Vector3.new(0,0,0),
CFrame = pp.CFrame*CFrame.new(
	math.random(-5,5)/5,
	15+math.random(2,8),
	math.random(-5,5)/5)
,Size=Vector3.new(0,155,0)
}):Play()

end)
local pp = Instance.new('Part')
task.delay(1.5,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 

pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(0,0,1)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)
})
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(0)
bld.Acceleration=Vector3.new(0,.3,0)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Orientation = 'VelocityParallel'
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
spawn(function()
for i = 1,45 do 
local rnd =  math.random(0,1)
pp.Color=Color3.new(rnd, rnd,rnd)
task.wait(.02) end end)
pp.Size=Vector3.new(3,.5,3)
pp.CFrame = char.Torso.CFrame*CFrame.new(0,0,7)
game.TweenService:Create(pp,TweenInfo.new(.2),{Size=Vector3.new(0,0,25)
}):Play()

task.wait(.05) end end)
spawn(function()
for i = 1,999999 do 
if CrazedLoop == false then break end
local rnd = math.random(1,15)
if rnd == 15 then 
for i = 1,math.random(2,7) do 
k.TimePosition = .1+math.random(-15,15)/55
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://188632011"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(-1)
k:AdjustSpeed(155)
k.Looped = true
k.Priority = Enum.AnimationPriority.Idle
task.wait(.01)
k:Stop(-1)
 end 
end 
k.TimePosition = .1+math.cos(i/5)/25
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
CrazedLoop = false
end end)
else

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75318228407422"
local k = char.Humanoid:LoadAnimation(Anim)
local CrazedLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
CrazedLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(.1)
spawn(function()
for i = 1,999999 do 
if CrazedLoop == false then break end
local rnd = math.random(1,15)
if rnd == 15 then 
for i = 1,math.random(2,7) do 
k.TimePosition = .1+math.random(-15,15)/55
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://188632011"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(-1)
k:AdjustSpeed(155)
k.Looped = true
k.Priority = Enum.AnimationPriority.Idle
task.wait(.01)
k:Stop(-1)
 end 
end 
k.TimePosition = .1+math.cos(i/5)/25
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
CrazedLoop = false
end end)
end
spawn(function()
task.wait(3.7)
for i = 1,2 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,0,0)
msh2.Scale = Vector3.new(35,15,1)

spawn(function()
for i = 1,1555 do
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(6,0,-5)
task.wait() end end)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(35,5,1)

spawn(function()
for i = 1,1555 do
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(6,0,-4)
task.wait() end end)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.4),{
Scale=Vector3.new(15,0,0)
}):Play()
-- other side
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,0,0)
msh2.Scale = Vector3.new(35,15,1)
task.wait(.3)
spawn(function()
for i = 1,1555 do
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(-6,0,-5)
task.wait() end end)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()

local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(35,5,1)

spawn(function()
for i = 1,1555 do
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(-6,0,-4)
task.wait() end end)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.4),{
Scale=Vector3.new(15,0,0)
}):Play()

task.wait(.3+i/15) end
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"

msh2.Scale = Vector3.new(35,35,1)

spawn(function()
for i = 1,1555 do
p.Color=Color3.new(0,0,0)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(-6+
math.random(-5,5),0+
math.random(-5,5),-4)
task.wait(.02)
p.Color=Color3.new(1,1,1)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(-6+
math.random(-5,5),0+
math.random(-5,5),-4)
task.wait(.02)
 end end)
game:GetService("Debris"):AddItem(p, .5)
for i = 1,15 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"



spawn(function()
for i = 1,1555 do
msh2.Scale = Vector3.new(math.random(-5,5),math.random(-5,5),1)
p.Color=Color3.new(0,0,0)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(
math.random(-6,6),
math.random(-6,6),-3)
task.wait(.02)
p.Color=Color3.new(1,1,1)
p.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(
math.random(-6,6),
math.random(-6,6),-3)
task.wait(.02)
 end end)
game:GetService("Debris"):AddItem(p, .5)
task.wait(.1) end
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://93546004428904"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k.TimePosition = 4.9
k:AdjustSpeed(0)
_G.SetMusic(14,1,53)
for i = 1,45 do 
k.TimePosition = 4.9+i/10



task.wait(.1) end
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 4, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "INSANE"
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
local str = Instance.new('UIStroke')
str.Parent = PName

spawn(function()
for i = 1,999999 do 
local gay = math.random(1,18)
if gay == 7 then 
for gayer = 1,math.random(2,6) do 
str.Thickness = 2+math.random(1,15)
HealthBar.ExtentsOffset = Vector3.new(
	math.sin(gayer+i/5)+math.random(-15,15)/66, 
	3+math.cos(gayer+i/30)/2+math.random(-15,15)/66, 0)
	PName.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
PName.TextColor3 = Color3.fromRGB(0,0,0)
task.wait(.02)
HealthBar.ExtentsOffset = Vector3.new(
	math.sin(gayer+i/5)+math.random(-15,15)/66, 
	3+math.cos(gayer+i/30)/2+math.random(-15,15)/66, 0)
	PName.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
PName.TextColor3 = Color3.fromRGB(255,255,255)
task.wait(.02)
end
str.Thickness = 2
end
local rnd = math.random(0,255)
PName.TextStrokeColor3 = Color3.fromRGB(rnd, rnd, rnd)
PName.TextColor3 = Color3.fromRGB(0,math.random(1,55),math.random(1,155))
HealthBar.ExtentsOffset = Vector3.new(math.sin(i/5), 3+math.cos(i/30)/2, 0)
PName.Rotation = math.cos(i/7)*8
task.wait(.01) end end)

task.wait(6)
repeat task.wait() until bp:FindFirstChild('Flash Strike')
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Dark Surge'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Air Torrent'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Shattering Reality'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Explosive Discs'
pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 4, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "CRAZED"
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.TextColor3 = Color3.fromRGB(0,0,math.random(1,155))
HealthBar.ExtentsOffset = Vector3.new(math.sin(i/5), 3+math.cos(i/30)/2, 0)
PName.Rotation = math.cos(i/7)*8
task.wait(.01) end end)
pcall(function() getgenv().Idle:Disconnect() end)
if getgenv().ModeIdleAuras == true then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75318228407422"
local k = char.Humanoid:LoadAnimation(Anim)
local CrazedLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
CrazedLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(.1)
spawn(function()
for i = 1,99999 do 
if CrazedLoop == false then break end
spawn(function()
local pp = Instance.new('Part')
task.delay(1.5,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 

pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(0,0,1)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(3.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(1,15)
})
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(1,15)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(0)
bld.Acceleration=Vector3.new(0,5,0)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Orientation = 'VelocityParallel'
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
spawn(function()
for i = 1,45 do 
pp.Color=Color3.fromRGB(0, 0, math.random(1,155))
task.wait(.02) end end)
pp.Size=Vector3.new(1,.1,1)
pp.CFrame = hrp.CFrame*CFrame.new(
math.random(-77,77),
-2,
math.random(-77,77))*CFrame.Angles(math.rad(math.random(-15,15)),0,0)
game.TweenService:Create(pp,TweenInfo.new(.5),{Size=Vector3.new(2,.2,2)}):Play()
task.wait(.5)
game.TweenService:Create(pp,TweenInfo.new(1.5),{Size=Vector3.new(0,0,0),
CFrame = pp.CFrame*CFrame.new(
	math.random(-5,5)/5,
	15+math.random(2,8),
	math.random(-5,5)/5)
,Size=Vector3.new(0,155,0)
}):Play()

end)
local pp = Instance.new('Part')
task.delay(1.5,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 

pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(0,0,1)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)
})
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(0)
bld.Acceleration=Vector3.new(0,.3,0)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Orientation = 'VelocityParallel'
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
spawn(function()
for i = 1,45 do 
pp.Color=Color3.fromRGB(0, 0, math.random(1,155))
task.wait(.02) end end)
pp.Size=Vector3.new(3,.5,3)
pp.CFrame = char.Torso.CFrame*CFrame.new(0,0,7)
game.TweenService:Create(pp,TweenInfo.new(.2),{Size=Vector3.new(0,0,25)
}):Play()

task.wait(.05) end end)
spawn(function()
for i = 1,999999 do 
if CrazedLoop == false then break end
local rnd = math.random(1,15)
if rnd == 15 then 
for i = 1,math.random(2,7) do 
k.TimePosition = .7+math.random(-15,15)/55
task.wait(.01) end 
end 
k.TimePosition = .7+math.cos(i/35)/7
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
CrazedLoop = false
end end)
else 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75318228407422"
local k = char.Humanoid:LoadAnimation(Anim)
local CrazedLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
CrazedLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(.1)
spawn(function()
for i = 1,999999 do 
if CrazedLoop == false then break end
local rnd = math.random(1,15)
if rnd == 15 then 
for i = 1,math.random(2,7) do 
k.TimePosition = .7+math.random(-15,15)/55
task.wait(.01) end 
end 
k.TimePosition = .7+math.cos(i/35)/7
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
CrazedLoop = false
end end)
end
_G.SetMusic(10,1)


end end)
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13376962659" 
or v.Animation.AnimationId == "rbxassetid://13362587853" 

then
    v:Stop()
    spawn(function()
task.wait(.5)
for i = 1,20 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.fromRGB(0,0,math.random(1,155))
msh2.Scale = Vector3.new(1+i*2,1+i*2,1+i*2)
p.CFrame = hrp.CFrame*CFrame.new(0,0,-9)
game:GetService("Debris"):AddItem(p, .2)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,0)
}):Play()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.fromRGB(0,0,math.random(1,155))
msh2.Scale = Vector3.new(3,15+i*2,3)
p.CFrame = hrp.CFrame*CFrame.new(0,0,-9)*
CFrame.Angles(i/5,0,i/5)
game:GetService("Debris"):AddItem(p, .7)
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,25+i*5,0)
}):Play()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.fromRGB(0,0,math.random(1,255))
msh2.Scale = Vector3.new(15,15,15)
p.Transparency = .5
p.CFrame = hrp.CFrame*CFrame.new(0,0,-9)*
CFrame.Angles(i/5,0,i/5)
game:GetService("Debris"):AddItem(p, .7)
game.TweenService:Create(msh2,TweenInfo.new(1.5),{
Scale=Vector3.new(0,0,0)
}):Play()
task.wait(.05)
end

 end)
local ye = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then pp.MaxForce = Vector3.new(0,0,0) end
end)
task.delay(1,function()
ye:Disconnect() end)
spawn(function()
task.wait(.3)
for i =1,15 do
for _,v in pairs(char:GetDescendants()) do 
if v:IsA('BasePart') or v:IsA('Decal') or v:IsA('MeshPart') then
task.spawn(function()
if v.Name:match('Hitbox') then return end
if v.Name:match('HumanoidR') then return end
if v.Parent.Name == '#NinjaKATANA' then return end
if v.Name:match('Sh') then return end
v.Transparency = 0
end) end end task.wait(.3) end 
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://93125757361125"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(2)
task.wait(.5)
k:AdjustSpeed(.3)
task.wait(1.5)
k:Stop()
end end)
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13294790250" then
v:Stop()

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17838619895"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(.9)
spawn(function()
for i = 1,25 do 
    local p = Instance.new('Part')
p.Material = Enum.Material.Neon 
p.CanCollide=false p.Anchored=true
p.CFrame=char['Left Leg'].CFrame*CFrame.new(0,-1.5,0)
p.Size=Vector3.new(1,1,1) 
p.Color=Color3.new(0,0,1)
p.Parent = getgenv().Enviroment
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Brightness = i
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld:Emit()
bld.Lifetime = NumberRange.new(.4)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-5),
NumberSequenceKeypoint.new(.5,5),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, math.random(1,155))), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(9)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(3.5,function()
bld.Rate = 0 end)
spawn(function()
local rnd = math.random(-1,1)/5
for i = 1,35 do 
    p.Size=Vector3.new(1+-i/35,1+-i/35,1+-i/35)
    p.CFrame=p.CFrame*CFrame.new(rnd,0,0)
    task.wait(.02) end
    end)
game:GetService("Debris"):AddItem(p, 4)
task.wait(.03) end end)
task.wait(.5)
char.Humanoid.HipHeight = 3
task.wait(.5)
char.Humanoid.HipHeight = 0
k:Stop()
end end)
pcall(function()
game.ReplicatedStorage.Resources['Crazed Disc']:Destroy() end)
local freesex = game:GetObjects(getcustomasset('TSB/cdisc.rbxm'))[1]
freesex.Parent = game.ReplicatedStorage.Resources
freesex.Name = 'Crazed Disc'
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13501296372" then
task.wait(.4)

local pcf = hrp.CFrame

local v = freesex:Clone() 
v.Parent = getgenv().Enviroment
local parts = v:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Attachment') then 
spawn(function()
for i = 1,30 do 
    for i = 1,1 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 15
bld:Emit(2)
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 155)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(1.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld:Emit()
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, math.random(1,155))), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(9)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(3.5,function()
bld.Rate = 0 end)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,0,math.random(0,1))
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1+gay,15+gay*3,1+gay)
p.CFrame = v.CFrame*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))*CFrame.new(0,math.random(-15,15),0)
game:GetService("Debris"):AddItem(p, 4)
game.TweenService:Create(p,TweenInfo.new(.2),{
CFrame=p.CFrame*CFrame.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1
}):Play()

end
        v.CFrame = pcf*CFrame.new(0,-3,15+-i*9)*
        CFrame.Angles(0,i,0)
        task.wait(.02) end end)
elseif part:IsA('ParticleEmitter') then
    part.Rate = 55
    part.Rotation=NumberRange.new(-360,360)
    part.Enabled = true
    task.delay(1,function()
    part.Rate = 0 
    end)
 end end
 local sex = v:Clone() sex.Parent = F
 local parts = sex:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Attachment') then 
spawn(function()
for i = 1,30 do 
        sex.CFrame = pcf*CFrame.new(0,0,10+-i*9)*
        CFrame.Angles(math.rad(90),i,0)
        task.wait(.02) end end)
elseif part:IsA('ParticleEmitter') then
    part.Rate = 55
    part.Rotation=NumberRange.new(-360,360)
    part.Enabled = true
    task.delay(1,function()
    part.Rate = 0 
    end)
 end end
 task.wait(3)
 v:Destroy() sex:Destroy()

end end)


getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13556985475" then
task.wait(.4)

local pcf = hrp.CFrame

local v = freesex:Clone() 
v.Parent = getgenv().Enviroment
local parts = v:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Attachment') then 
spawn(function()
for i = 1,30 do 
    for i = 1,1 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 15
bld:Emit(2)
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 155)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(1.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld:Emit()
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, math.random(1,155))), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(9)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(3.5,function()
bld.Rate = 0 end)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,0,math.random(0,1))
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1+gay,15+gay*3,1+gay)
p.CFrame = v.CFrame*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))*CFrame.new(0,math.random(-15,15),0)
game:GetService("Debris"):AddItem(p, 4)
game.TweenService:Create(p,TweenInfo.new(.2),{
CFrame=p.CFrame*CFrame.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.2),{
Transparency = 1
}):Play()

end
        v.CFrame = pcf*CFrame.new(0,-9,-7)*
        CFrame.Angles(0,i,0)
        task.wait(.02) end end)
elseif part:IsA('ParticleEmitter') then
    part.Rate = 55
    part.Rotation=NumberRange.new(-360,360)
    part.Enabled = true
    task.delay(1,function()
    part.Rate = 0 
    end)
 end end
 local sex = v:Clone() sex.Parent = F
 local parts = sex:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Attachment') then 
spawn(function()
for i = 1,30 do 
        sex.CFrame = pcf*CFrame.new(0,-5,-5)*
        CFrame.Angles(math.rad(90),i,0)
        task.wait(.02) end end)
elseif part:IsA('ParticleEmitter') then
    part.Rate = 55
    part.Rotation=NumberRange.new(-360,360)
    part.Enabled = true
    task.delay(1,function()
    part.Rate = 0 
    end)
 end end
 task.wait(3)
 v:Destroy() sex:Destroy()

end end)
if getgenv().ModeIdleAuras == true then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75318228407422"
local k = char.Humanoid:LoadAnimation(Anim)
local CrazedLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
CrazedLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(.1)
spawn(function()
for i = 1,99999 do 
if CrazedLoop == false then break end
spawn(function()
local pp = Instance.new('Part')
task.delay(1.5,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 

pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(0,0,1)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(3.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(1,15)
})
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(1,15)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(0)
bld.Acceleration=Vector3.new(0,5,0)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Orientation = 'VelocityParallel'
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
spawn(function()
for i = 1,45 do 
pp.Color=Color3.fromRGB(0, 0, math.random(1,155))
task.wait(.02) end end)
pp.Size=Vector3.new(1,.1,1)
pp.CFrame = hrp.CFrame*CFrame.new(
math.random(-77,77),
-2,
math.random(-77,77))*CFrame.Angles(math.rad(math.random(-15,15)),0,0)
game.TweenService:Create(pp,TweenInfo.new(.5),{Size=Vector3.new(2,.2,2)}):Play()
task.wait(.5)
game.TweenService:Create(pp,TweenInfo.new(1.5),{Size=Vector3.new(0,0,0),
CFrame = pp.CFrame*CFrame.new(
	math.random(-5,5)/5,
	15+math.random(2,8),
	math.random(-5,5)/5)
,Size=Vector3.new(0,155,0)
}):Play()

end)
local pp = Instance.new('Part')
task.delay(1.5,function() 
pp:Destroy() end)
pp.Material = Enum.Material.Neon 

pp.Anchored=true pp.CanCollide=false
pp.Color=Color3.new(0,0,1)
pp.Parent = getgenv().Enviroment
local msh2 = Instance.new("SpecialMesh",pp)
msh2.MeshType = "Sphere"
local bld = Instance.new("ParticleEmitter",pp)
bld.LightEmission = 15 
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)
})
bld.Squash = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 255))}
bld.Speed = NumberRange.new(0)
bld.Acceleration=Vector3.new(0,.3,0)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Orientation = 'VelocityParallel'
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
spawn(function()
for i = 1,45 do 
pp.Color=Color3.fromRGB(0, 0, math.random(1,155))
task.wait(.02) end end)
pp.Size=Vector3.new(3,.5,3)
pp.CFrame = char.Torso.CFrame*CFrame.new(0,0,7)
game.TweenService:Create(pp,TweenInfo.new(.2),{Size=Vector3.new(0,0,25)
}):Play()

task.wait(.05) end end)
spawn(function()
for i = 1,999999 do 
if CrazedLoop == false then break end
local rnd = math.random(1,15)
if rnd == 15 then 
for i = 1,math.random(2,7) do 
k.TimePosition = .7+math.random(-15,15)/55
task.wait(.01) end 
end 
k.TimePosition = .7+math.cos(i/35)/7
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
CrazedLoop = false
end end)
else 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75318228407422"
local k = char.Humanoid:LoadAnimation(Anim)
local CrazedLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
CrazedLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(.1)
spawn(function()
for i = 1,999999 do 
if CrazedLoop == false then break end
local rnd = math.random(1,15)
if rnd == 15 then 
for i = 1,math.random(2,7) do 
k.TimePosition = .7+math.random(-15,15)/55
task.wait(.01) end 
end 
k.TimePosition = .7+math.cos(i/35)/7
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
CrazedLoop = false
end end)
end
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://13376869471" 
or v.Animation.AnimationId == "rbxassetid://13309500827" 

then
v:Stop()

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://136370737633649"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1)
k.TimePosition = 2.7
task.wait(.5)
k:Stop()
for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 66 then 
spawn(function()
local h = Instance.new('Highlight',v)
h.FillTransparency = 0
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://75318228407422"
local k = v.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1)
k.TimePosition = .3
for i =1,5 do 
h.FillColor = Color3.new(0,0,0)
task.wait(.01)
h.FillColor = Color3.new(0,0,1)
task.wait(.01) end h:Destroy()
k:Stop()
end)
end end end

local h = Instance.new('Highlight',char)
h.FillTransparency = 0
getgenv().Enviroment = h
local v = Instance.new('ColorCorrectionEffect')
v.Parent = game.Lighting 
for i =1,5 do 
v.TintColor=Color3.new(0,0,1)
v.Brightness = 55
h.FillColor = Color3.new(0,0,0)
task.wait(.01)
v.TintColor=Color3.new(0,0,0)
v.Brightness = 55
h.FillColor = Color3.new(0,0,1)
task.wait(.01) end
h:Destroy() v:Destroy()
getgenv().Enviroment = workspace.Thrown
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18464356233"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(.6)
task.wait(.5)
k:AdjustSpeed(.2)
k:Stop(.4) 
end end)
elseif char == 'Big Black' then
-- DREAM CODE HERE
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
local re = false
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")



pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 4, 0)
HealthBar.AlwaysOnTop = true
HealthBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "THE BIG BLACK"
PName.TextColor3 = Color3.new(0,0,0)
PName.TextStrokeColor3 = Color3.new(1,1,1)
PName.TextScaled = true
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
local rnd = math.random(1,25)
if rnd == 1 then 
for i = 1,math.random(5,10) do 
PName.Rotation = math.random(-60,60)
task.wait(.01) end
end
local rnd = math.random(0,1)
PName.TextColor3 = Color3.new(rnd,rnd,rnd)
if rnd == 1 then 
PName.TextStrokeColor3 = Color3.new(0,0,0)
else 
PName.TextStrokeColor3 = Color3.new(1,1,1)
end
HealthBar.ExtentsOffset = Vector3.new(math.cos(i/35)*2,2+math.sin(i/77),0)
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
---spawn anim
task.delay(.3,function()
info('"The Big Black" is being developed by another person')
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15018219692"
local k = char.Humanoid:LoadAnimation(Anim)
local BigBlackLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
BigBlackLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(.1)
spawn(function()
for i = 1,999999 do 
if BigBlackLoop == false then break end
k.TimePosition = .4+math.cos(i/35)/15
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
BigBlackLoop = false
end end)
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Solitude'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Heartbreak'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Destruction'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Wrath'

if getgenv().SpawnEffects == true then

 task.spawn(function()
task.delay(.3,function()
 _G.PS('9126225464',1,0,.2)
 end)
 local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15503060232"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
spawn(function()
for i = 1,55 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,1)
msh2.Scale = Vector3.new(1+i/15,1+i/15,1+i/15)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-1.5,0)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,0)
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 35
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(0, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 150
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}
bld.Speed = NumberRange.new(9)
bld.VelocitySpread = 50000
bld.ZOffset = -1
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(0,0,0)
msh2.Scale = Vector3.new(.1,.1,.1)
p.Transparency = .7
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,0,0)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(3,3,3)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.1),{
Transparency = 1
}):Play()
task.wait(.1) end  
end)
    _G.twA('Riddle Me This..',Color3.new(0,0,0),Color3.new(1,1,1))
    task.wait(2)
	k:Stop(.6)
	 local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17140902079"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.TimePosition = 2.5
k:AdjustSpeed(1.5)
    _G.twA('Riddle Me That..',Color3.new(0,0,0),Color3.new(1,1,1))
    task.wait(2)
	k:Stop(.6)
		 local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14611931363"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
	_G.twA("Who's Afraid Of The Big Black?",Color3.new(0,0,0),Color3.new(1,1,1))
task.wait(2.7)

for i = 1,15 do 
local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
p2.Color=Color3.new(1,0,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1+gay,15+gay*3,1+gay)
p2.CFrame = char.Torso.CFrame*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))*CFrame.new(0,0,0)
game:GetService("Debris"):AddItem(p2, 13)
game.TweenService:Create(p2,TweenInfo.new(2.8+math.random(1,3)),{
CFrame=p2.CFrame*CFrame.new(0,15+math.random(-5,35),0)
}):Play()
game.TweenService:Create(p2,TweenInfo.new(2+math.random(1,3)),{
Transparency = 1
}):Play()
local bld = Instance.new("ParticleEmitter",p2)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 150
bld.Lifetime = NumberRange.new(3)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 0, 0))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(3.5,function()
bld.Rate = 0 end)
local bld2 = Instance.new("ParticleEmitter",p)
bld2.LightEmission = 155
bld2.Texture = "rbxassetid://6673021984"
bld2.Color = ColorSequence.new(Color3.new(1,1,1))
bld2.Rate = 150
bld2.Lifetime = NumberRange.new(.1)
bld2.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*9),
NumberSequenceKeypoint.new(1,0)
})
bld2.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld2.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld2.Speed = NumberRange.new(9)
bld2.VelocitySpread = 50000
bld2.ZOffset = -5
bld2.Rotation = NumberRange.new(-500,500)
bld2.RotSpeed = NumberRange.new(-500,500)
task.delay(3.5,function()
bld2.Rate = 0 end)
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
spawn(function()
for i = 1,255 do 
local rnd = math.random(0,1)
p.Color=Color3.new(rnd,rnd,rnd)
p2.Color=Color3.new(rnd,rnd,rnd)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(rnd, rnd, rnd)), ColorSequenceKeypoint.new(1.00,
Color3.new(rnd, rnd, rnd))}
bld2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(rnd, rnd, rnd)), ColorSequenceKeypoint.new(1.00,
Color3.new(rnd, rnd, rnd))}
task.wait(.01) end end)
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1+gay,15+gay*3,1+gay)
p.CFrame = char.Torso.CFrame*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))*CFrame.new(0,0,0)
game:GetService("Debris"):AddItem(p, 4)
game.TweenService:Create(p,TweenInfo.new(math.random(1,3)/2),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(-5,35),0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(math.random(1,3)/2),{
Transparency = 1
}):Play()
 end
  _G.PS('763717897',5)
    _G.PS('763717897',5,nil,.5)
end)
end

getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://16597322398" then

        local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14721070668"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(.7)

end end)
getgenv().Move4B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://16597912086" then

        local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14798608838"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.3)

end end)
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://16431491215" then
_G.twA('You Will Kneel Before Me..',
Color3.new(0,0,0),Color3.new(1,1,1))
        local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16725167915"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.3)
k.TimePosition = 1.7
task.wait(.5) k:Stop(.3)

    local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://137624104134020"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = 9.7
task.wait(1.7)
k:Stop(.4)
end end)
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://16515850153" then
    v:Stop()
    local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://129722512665420"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1)
local s = Instance.new('Sound')
s.Parent = game.CoreGui.HeadsetDisconnectedDialog

s.SoundId = 'rbxassetid://136007472'
s.PlaybackSpeed = .75
s.Volume = 1.8
s:Play()
task.delay(7,function()

s:Destroy()
end)
task.delay(.7,function()
k:Stop(.5) end)
task.wait(.3)
local pcf = hrp.CFrame
for i = 1,66 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
task.wait(.01) end end)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(1,1,0)
p.CFrame = pcf*CFrame.new(
math.random(-5,5),
math.random(-3,25),
math.random(-5,5)+-i/1.6)
game:GetService("Debris"):AddItem(p, .6)
game.TweenService:Create(msh2,TweenInfo.new(.6),{
Scale=Vector3.new(0,25,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.6),{
CFrame = p.CFrame*CFrame.new(0,-15,0)
}):Play()



local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)

spawn(function()
for i = 1,35 do 
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
task.wait(.01) end end)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(7+i/15,7+i/15,7+i/15)
p.CFrame = pcf*CFrame.new(
0,5,
-i/1.9)
game:GetService("Debris"):AddItem(p, .6)
game.TweenService:Create(msh2,TweenInfo.new(.6),{
Scale=Vector3.new(0,0,0)
}):Play()

task.wait(.02)
 end
 for i = 1,5 do 
     local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
spawn(function()
for i = 1,66 do 
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
task.wait(.01) end end)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(7+i,7+i,7+i)
p.CFrame = pcf*CFrame.new(
0,5,
-38)
game:GetService("Debris"):AddItem(p, 1.6)
game.TweenService:Create(msh2,TweenInfo.new(1.6),{
Scale=Vector3.new(7+i^i/66,7+i^i/66,7+i^i/66)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.6),{
Transparency = 1
}):Play()

end
local s = Instance.new('Sound')
s.Parent = game.CoreGui.HeadsetDisconnectedDialog

s.SoundId = 'rbxassetid://9043183024'
s.PlaybackSpeed = .8
s.Volume = 1.8

s:Play()
task.delay(7,function()

s:Destroy()
end)
end end)
local db = false 
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://16139108718" then
v:Stop() if db == true then return end 
db = true task.delay(2,function() db = false end)
char.Humanoid.AutoRotate = false 
task.delay(4,function()
char.Humanoid.AutoRotate = true 
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18903642853"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(2)
k.TimePosition= 2.5
_G.twA('CEASE.',Color3.new(0,0,0),Color3.new(1,1,1))
local pcf = hrp.CFrame
local ppos = hrp.Position
hrp.CFrame = CFrame.new(5555, 500, 57)
task.delay(1.6,function()
hrp.CFrame = pcf end)
local m = false

for i = 1,15 do if m == true then return end
for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - ppos).magnitude <= 77 then 
for _, track in pairs(v.Humanoid:GetPlayingAnimationTracks()) do
if track.Animation.AnimationId == 'rbxassetid://16139002631' then
track:Stop()
task.wait(.5)
local hs = game.CoreGui.HeadsetDisconnectedDialog
local parts = hs:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Sound') then
local pvol = part.Volume 
game.TweenService:Create(part,TweenInfo.new(1),{Volume = 0}):Play()
spawn(function()
task.wait(9)
game.TweenService:Create(part,TweenInfo.new(1),{Volume = pvol}):Play()
end)
end end
m = true
v.Archivable = true
local c = v:Clone()
c.Parent = workspace 
task.delay(7,function()
c:Destroy() end)
local ch = c.HumanoidRootPart 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18903642853"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.03)
local m = Instance.new('Model')
m.Parent = char 

local h = Instance.new('Highlight')
h.Parent = char 
local hlpart = Instance.new('Highlight')
hlpart.Parent = m 
hlpart.OutlineTransparency = 1
hlpart.FillTransparency = 0
task.delay(5,function()
m:Destroy()
h:Destroy()
end)
local yeah = 0
spawn(function()
for i = 1,555 do 
    local r = math.random(0,1)
    h.FillColor=Color3.new(r,r,r)
        hlpart.FillColor=Color3.new(r,0,0)
    task.wait(.01) 
        local r = math.random(0,1)
    h.FillColor=Color3.new(r,r,r)
        hlpart.FillColor=Color3.new(r,r,r)
    task.wait(.01) 
    end end)
h.OutlineTransparency = 1
task.delay(3,function()
k:AdjustSpeed(.5)


task.wait(.8)
			local lol = Instance.new('ColorCorrectionEffect')
lol.Parent = game.Lighting
for i = 1,5 do 
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 3 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .3
s.Volume = .5 s:Play()
task.spawn(function() task.wait(9) s:Destroy() end)
end
game.TweenService:Create(h,TweenInfo.new(1),{
    FillTransparency = 1
}):Play()
spawn(function()
yeah = 3
for i = 1,122 do 
for i = 1,4 do 
local p = Instance.new('Part')
p.Parent = hlpart
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"


msh2.Scale = Vector3.new(15,1,99)
p.CFrame = hrp.CFrame*CFrame.new(
math.random(-15,35),
math.random(-3,15),
math.random(-77,0))
game:GetService("Debris"):AddItem(p, .3)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,0,25)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
CFrame = p.CFrame*CFrame.new(0,0,77)
}):Play()
end
task.wait(.01)
 end
end)
for i = 1,15 do 
lol.Contrast = 999
task.wait(.01)
lol.Contrast = -3
task.wait(.01) 
lol.Contrast = -999
task.wait(.01) 
lol.TintColor = Color3.new(1,0,0)
end
lol:Destroy()
end)
k.TimePosition= 3.5
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18903644685"
local k = c.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.3)
k.TimePosition= 2.5
workspace.CurrentCamera.CameraType = 'Scriptable'
local lhagk = false
spawn(function()

for i = 1,77 do 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"

spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
p.Color=Color3.new(r,r,r)
task.wait(.01) end end)
msh2.Scale = Vector3.new(5,5,5)
p.CFrame = c.Torso.CFrame*CFrame.new(
math.random(-5,5),
math.random(-5,5),
math.random(-5,5))
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=msh2.Scale*i/5
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.5),{
Transparency = 1
}):Play()
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(r, r, r)), ColorSequenceKeypoint.new(1.00,
Color3.new(r, r, r))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 0
bld.LightInfluence = 0
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 255
bld.Lifetime = NumberRange.new(.6)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/15),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,0),
NumberSequenceKeypoint.new(1,1)})
spawn(function()
for i = 1,150 do 
local r = math.random(0,1)
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(1.00,
Color3.new(1, 0, 0))}
bld.Speed = NumberRange.new(55-i*2)
task.wait(.01) end end)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
task.delay(.5,function()
bld.Rate = 0 end)
    local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new(8,0)
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new(1,0,1)
v.Lifetime = NumberRange.new(.1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(88, 88, 88)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
v.Rate = 55;v.Speed = NumberRange.new(1)
task.delay(.5,function()
v.Rate = 55
end)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)
v.LockedToPart = true
v.Texture = 'rbxassetid://9470659899';v.Brightness = 2555
v.LightEmission=10;v.LightInfluence=0;v.Orientation = 'VelocityParallel'
v.FlipbookFramerate = NumberRange.new(45) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 5
task.wait(.03) end  
end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://7094593247'
s.TimePosition = 0
s.PlaybackSpeed = .2
s.Volume = 4.5 s:Play()
task.spawn(function() task.wait(6) s:Destroy() end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://418302853'
s.TimePosition = 0
s.PlaybackSpeed = .5
s.Volume = 3.5 s:Play()
task.spawn(function() task.wait(6) s:Destroy() end)
spawn(function()
for i = 1,500 do 
    if lhagk == true then return end
hrp.CFrame = pcf
workspace.CurrentCamera.CFrame = 
pcf*CFrame.new(5+yeah,0,5-i/35)*
CFrame.Angles(0,math.rad(90-i/5),0)
    ch.CFrame = hrp.CFrame*CFrame.new(0,0,-2)*
    CFrame.Angles(0,math.rad(180),0)
    task.wait(.01) end end)
    task.wait(5)
        lhagk = true
        
    k:Stop()
    c:BreakJoints()
workspace.CurrentCamera.CameraType = 'Custom'
end end end end end
task.wait(.1) end end end)
elseif char == 'Nuclear' then 

local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
_G.SetMusic(19,1)
char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14358002256" 
or v.Animation.AnimationId == "rbxassetid://14358000392" 
or v.Animation.AnimationId == "rbxassetid://14357841394" 
or v.Animation.AnimationId == "rbxassetid://14357997687" 
or v.Animation.AnimationId == "rbxassetid://14357943487" 
then  v:Stop(-15)
 end end)
pcall(function()
task.wait(.3)
char['#BATWEAPON']:Destroy()
end)
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Radial Fallout'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Jaw Melter'
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Nuclear"
PName.TextColor3 = Color3.new(.2,.5,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
HealthBar.ExtentsOffset = Vector3.new(0, 3+-math.tan(i/77)/45, 0)
task.wait(.01) end end)
_G.SetWings('Nuclear')
_G.twA("You can't just run away..",Color3.new(.2,.5,0),Color3.new(0,0,0))
_G.QuickSet(55,155,0,0,0,0)
getgenv().MUSIC_CREDS = 'SPURME - Far Away From Empty World'
_G.SetDecal(Color3.new(.3,.5,0),1)
_G.RefreshUI()
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14351441234" then
    v:Stop()
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.MaxForce=Vector3.new(0,0,0)
end end)
task.delay(1,function()
lol:Disconnect() end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13499771836"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = .7
end end)
getgenv().Move4B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14705929107" then

for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 16 then 
for _, track in pairs(v.Humanoid:GetPlayingAnimationTracks()) do
if track.Animation.AnimationId == 'rbxassetid://14700473573' then
track:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15944354277"
local k = v.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1.2)
spawn(function()
for i = 1,15 do 
v.HumanoidRootPart.CFrame = hrp.CFrame*CFrame.new(0,0,-5)
task.wait(.05) end end)
task.delay(2,function()
k:Stop() end)
end end end end end
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15944317351"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1.2)
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(8.7),
{FieldOfView = 120}):Play()
task.delay(.7,function()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://100558589307006"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
task.wait(.5)
k:Stop()
task.wait(.2)
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(1),
{FieldOfView = 120}):Play()
task.delay(.7,function()
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.5),
{FieldOfView = 70}):Play()
end)
for i = 1,5 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(0,-1,-3)*CFrame.Angles(i,i,math.random(-90,90))
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(0,15),0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(1,5+math.random(0,15),1)
}):Play()

    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(2.5,.5,2.5)
p.CFrame = hrp.CFrame
*CFrame.new(math.random(-15,15)/5,-1,-3+math.random(-25,15)/5)*CFrame.Angles(0,0,0)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(p,TweenInfo.new(1.5),{
CFrame=p.CFrame*CFrame.new(0,35+math.random(-15,15),0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(1.5),{
Scale=Vector3.new(0,25,0)
}):Play()
end

end)
local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 
p2.Size=Vector3.new(1,1,1)
p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
p2.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1,.5,1)
p2.CFrame = hrp.CFrame*CFrame.new(1,-2,-2)
game:GetService("Debris"):AddItem(p2, 2)

game.TweenService:Create(msh2,TweenInfo.new(1.5),{
Scale=Vector3.new(16,2,16)
}):Play()
game.TweenService:Create(p2,TweenInfo.new(1.5),{
Transparency = 1
}):Play()
for i = 1,15 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(0,-1,-3)*CFrame.Angles(i,i,math.random(-90,90))
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(0,15),0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(1,5+math.random(0,15),1)
}):Play()
end

end end)

getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14299135500" then
v:Stop()

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16082123712"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = 2.7
    g=g+math.random(-1,1)/9
local v = game:GetService("ReplicatedStorage").Resources.EsperAwakening.NadoSmoke:Clone()
v.Parent = workspace
task.spawn(function() task.wait(2) v:Destroy() end)
v.SmokeCircle.Anchored=true
v.SmokeCircle.CFrame = 
game.Players.LocalPlayer.Character.Torso.CFrame
*CFrame.new(0,-2,0)
v.SmokeCircle.ParticleEmitter:Emit(15)
v.SmokeCircle.ParticleEmitter.Rate = 0
for i = 1,9 do
spawn(function()
local vel = math.random(-25,25)
local vel2 = math.random(-25,25)
local v = Instance.new('Part')
v.Size = Vector3.new(.5,.5,.5)*math.random(1,5)
v.Material=Enum.Material.Concrete
v.Color = Color3.fromRGB(158, 151, 157)
v.Parent = workspace
local pp = PhysicalProperties.new(1,2,1,1,1)
v.CustomPhysicalProperties = pp
v.CanCollide = false
local pcf = hrp.CFrame
for i =1,35 do 
    v.CFrame = pcf*
CFrame.new(vel*i/25,math.sin(i/10)*15,
vel2*i/25)
*CFrame.Angles(90,i/5,i/5)
task.wait(.01) end
task.wait(1)
v.CanCollide = true
game.TweenService:Create(v,TweenInfo.new(3),{Size=Vector3.new(0,0,0),
CFrame=v.CFrame*CFrame.Angles(i,i,i)}):Play()
task.wait(3.6) v:Destroy()
end) end
local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 
p2.Size=Vector3.new(1,1,1)
p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
p2.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1,.5,1)
p2.CFrame = hrp.CFrame*CFrame.new(1,-2,-2)
game:GetService("Debris"):AddItem(p2, 2)

game.TweenService:Create(msh2,TweenInfo.new(1.5),{
Scale=Vector3.new(16,2,16)
}):Play()
game.TweenService:Create(p2,TweenInfo.new(1.5),{
Transparency = 1
}):Play()
for i = 1,15 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(0,-1,-3)*CFrame.Angles(i,i,math.random(-90,90))
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(0,15),0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(1,5+math.random(0,15),1)
}):Play()
end

end end)

local db = false
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14004235777" then
v:Stop()
if db == true then return end db = true 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16945573694"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1.3)
task.wait(.45)

for i = 1,15 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(0,-1,-3)*CFrame.Angles(i,i,math.random(-90,90))
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(0,15),0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(1,5+math.random(0,15),1)
}):Play()



    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(
    math.random(-15,15)/5,-5,
-3+math.random(-15,15)/5)
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,i*2,0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(1,5+math.random(0,15),1)
}):Play()

end
k:Stop(.4)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17838619895"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
spawn(function()

for i = 1,15 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(0,-1,-3)*CFrame.Angles(i,i,math.random(-90,90))
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(0,15),0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(1,5+math.random(0,15),1)
}):Play()



    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(
-25+i*3+math.random(-15,15)/5,math.random(-3,5),
-3+math.random(-15,15)/5)
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,0,0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(25,.1,.1)
}):Play()
task.wait(.05)

end
end)
task.wait(2)
db = false
end end)

local dbb = false
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14048285180"
or v.Animation.AnimationId == "rbxassetid://14046756619"
then
if dbb == true then return end dbb = true 
task.delay(1,function() dbb = false end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13643152947"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = .2
v:GetMarkerReachedSignal("go"):Connect(function(paramString)
k:Stop(.4)

end)
local yeah = v:GetMarkerReachedSignal("hit5"):Connect(function(paramString)
task.wait(.2)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://12467789963"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(-1)
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
k.TimePosition = .5
task.wait(.3)

for i = 1,4 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(0,-1,-3)*CFrame.Angles(i,i,math.random(-90,90))
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(0,15),0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(1,5+math.random(0,15),1)
}):Play()



    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(
    math.random(-15,15)/5,5,
-3+math.random(-15,15)/5)
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,-i,0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(1,5+math.random(0,15),1)
}):Play()

end
end)
for i = 1,5 do 

local yeah = v:GetMarkerReachedSignal("hit"..i):Connect(function(paramString)
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.MaxForce=Vector3.new(0,0,0)
end end)
task.delay(.3,function()
lol:Disconnect() end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16310343179"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(-1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(-.3)
k.TimePosition = i/2
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(0,-1,-3)
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.2),{
CFrame=p.CFrame*CFrame.new(0,0,-3),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(5,15,5)
}):Play()

for i = 1,15 do 
    local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = hrp.CFrame
*CFrame.new(0,-1,-3)*CFrame.Angles(i,i,math.random(-90,90))
game:GetService("Debris"):AddItem(p, .5)
game.TweenService:Create(p,TweenInfo.new(.5),{
CFrame=p.CFrame*CFrame.new(0,15+math.random(0,15),0),Transparency = 1
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(1,5+math.random(0,15),1)
}):Play()

end
k.Looped = true
task.wait(.5)
k:Stop(-1)
end) 
task.delay(5,function()
yeah:Disconnect() end)
end




end end)

pcall(function() getgenv().Idle:Disconnect() end)
if getgenv().ModeIdleAuras == true then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15391323441"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15146348738"
local kk = char.Humanoid:LoadAnimation(Anim)
local NuclearLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
NuclearLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Idle
kk:AdjustSpeed(0)
local man = 999
spawn(function()
for i = 1,999999 do 
if NuclearLoop == false then break end
man=man+.1
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = char['Right Arm'].CFrame
*CFrame.new(0,-1,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p, 2)
game.TweenService:Create(p,TweenInfo.new(1),{
CFrame=p.CFrame*CFrame.new(0,3,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,2,0)
}):Play()




local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
p2.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p2.CFrame = char['Left Arm'].CFrame
*CFrame.new(0,-1,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p2, 2)
game.TweenService:Create(p2,TweenInfo.new(1),{
CFrame=p2.CFrame*CFrame.new(0,3,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,2,0)
}):Play()

if man >= 1 then 
    man = 0 
local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,1)
})
v.LockedToPart = true
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,1)
})
v.Lifetime = NumberRange.new(1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55/2, 155/2, 0))}
v.Rate = 0;v.Speed = NumberRange.new(-3)
v:Emit(1)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)

v.Texture = 'rbxassetid://9470659899';v.Brightness = 5
v.LightEmission=10;v.LightInfluence=0
v.FlipbookFramerate = NumberRange.new(66) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 0
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld:Emit(5)
bld.LockedToPart=true
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(55, 155, 0))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
bld.ZOffset= 2
task.delay(.5,function()
bld.Rate = 0 end)



local v = Instance.new('ParticleEmitter',p2)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,1)
})
v.LockedToPart = true
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,1)
})
v.Lifetime = NumberRange.new(1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55/2, 155/2, 0))}
v.Rate = 0;v.Speed = NumberRange.new(-3)
v:Emit(1)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)

v.Texture = 'rbxassetid://9470659899';v.Brightness = 5
v.LightEmission=10;v.LightInfluence=0
v.FlipbookFramerate = NumberRange.new(66) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 0
local bld = Instance.new("ParticleEmitter",p2)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld:Emit(5)
bld.LockedToPart=true
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(55, 155, 0))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
bld.ZOffset= 2
task.delay(.5,function()
bld.Rate = 0 end)
end
k.TimePosition = 1.6+math.cos(i/15)/15
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
kk:Stop(.2)
NuclearLoop = false
end end)
else 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15391323441"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15146348738"
local kk = char.Humanoid:LoadAnimation(Anim)
local NuclearLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
NuclearLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Idle
kk:AdjustSpeed(0)
spawn(function()
for i = 1,999999 do 
if NuclearLoop == false then break end
k.TimePosition = 1.6+math.cos(i/15)/15
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
kk:Stop(.2)
NuclearLoop = false
end end)
end









getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14733282425" then
getgenv().DoingUlt = true
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16719107050"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
_G.SetMusic(20,1)
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.SciFi
PName.Text = "CONTAMINANT"
PName.TextColor3 = Color3.new(1,.7,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
HealthBar.ExtentsOffset = Vector3.new(0, 3+-math.tan(i/77)/45, 0)
task.wait(.01) end end)
_G.SetWings(Color3.new(.8,.7,0),true,Color3.new(.8,.7,0))
local quotes = {
"I didn't plan for this, but what can i say... could be worse...",
"You won't get out alive.",
"M...My.. jaw..?"
}
_G.twA(quotes[math.random(1,#quotes)],
Color3.new(1,.7,0),Color3.new(0,0,0))
_G.QuickSet(255,200,0,0,0,0)
getgenv().MUSIC_CREDS = 'wake forld - Some Days, Even Hope'
_G.SetDecal(Color3.new(1,.7,0),-5)
getgenv().TRUEMODE = 'Contaminant'
_G.RefreshUI()

pcall(function() getgenv().Idle:Disconnect() end)
if getgenv().ModeIdleAuras == true then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16719107050"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15146348738"
local kk = char.Humanoid:LoadAnimation(Anim)
local NuclearLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
NuclearLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Idle
kk:AdjustSpeed(0)
local man = 999
spawn(function()
for i = 1,999999 do 
if NuclearLoop == false then break end
man=man+.1
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,.7,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = char['Right Arm'].CFrame
*CFrame.new(0,-1,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p, 2)
game.TweenService:Create(p,TweenInfo.new(1),{
CFrame=p.CFrame*CFrame.new(0,3,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,2,0)
}):Play()




local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
p2.Color=Color3.new(1,.7,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p2.CFrame = char['Left Arm'].CFrame
*CFrame.new(0,-1,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p2, 2)
game.TweenService:Create(p2,TweenInfo.new(1),{
CFrame=p2.CFrame*CFrame.new(0,3,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,2,0)
}):Play()

if man >= 1 then 
    man = 0 
local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,1)
})
v.LockedToPart = true
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,1)
})
v.Lifetime = NumberRange.new(1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 200, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 200, 0))}
v.Rate = 0;v.Speed = NumberRange.new(-3)
v:Emit(1)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)

v.Texture = 'rbxassetid://9470659899';v.Brightness = 5
v.LightEmission=10;v.LightInfluence=0
v.FlipbookFramerate = NumberRange.new(66) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 0
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld:Emit(5)
bld.LockedToPart=true
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 200, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255/2, 200/2, 0))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
bld.ZOffset= 2
task.delay(.5,function()
bld.Rate = 0 end)



local v = Instance.new('ParticleEmitter',p2)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,1)
})
v.LockedToPart = true
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,1)
})
v.Lifetime = NumberRange.new(1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 200, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 200, 0))}
v.Rate = 0;v.Speed = NumberRange.new(-3)
v:Emit(1)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)

v.Texture = 'rbxassetid://9470659899';v.Brightness = 5
v.LightEmission=10;v.LightInfluence=0
v.FlipbookFramerate = NumberRange.new(66) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 0
local bld = Instance.new("ParticleEmitter",p2)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld:Emit(5)
bld.LockedToPart=true
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 200, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255/2, 200/2, 0))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
bld.ZOffset= 2
task.delay(.5,function()
bld.Rate = 0 end)
end
k.TimePosition = 2.5+math.cos(i/15)/15
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
kk:Stop(.2)
NuclearLoop = false
end end)
else 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16719107050"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15146348738"
local kk = char.Humanoid:LoadAnimation(Anim)
local NuclearLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
NuclearLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Idle
kk:AdjustSpeed(0)
local man = 999
spawn(function()
for i = 1,999999 do 
if NuclearLoop == false then break end
k.TimePosition = 2.5+math.cos(i/15)/15
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
kk:Stop(.2)
NuclearLoop = false
end end)
end
task.wait(3)
repeat task.wait() until bp:FindFirstChild('Foul Ball')

_G.SetMusic(19,1)
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Radial Fallout'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Jaw Melter'
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Nuclear"
PName.TextColor3 = Color3.new(.2,.5,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
HealthBar.ExtentsOffset = Vector3.new(0, 3+-math.tan(i/77)/45, 0)
task.wait(.01) end end)
_G.SetWings('Nuclear')
_G.twA("You can't just run away..",Color3.new(.2,.5,0),Color3.new(0,0,0))
_G.QuickSet(55,155,0,0,0,0)
getgenv().MUSIC_CREDS = 'SPURME - Far Away From Empty World'
_G.SetDecal(Color3.new(.3,.5,0),1)
getgenv().TRUEMODE = 'Nuclear'
_G.RefreshUI()

pcall(function() getgenv().Idle:Disconnect() end)
if getgenv().ModeIdleAuras == true then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15391323441"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15146348738"
local kk = char.Humanoid:LoadAnimation(Anim)
local NuclearLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
NuclearLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Idle
kk:AdjustSpeed(0)
local man = 999
spawn(function()
for i = 1,999999 do 
if NuclearLoop == false then break end
man=man+.1
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = char['Right Arm'].CFrame
*CFrame.new(0,-1,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p, 2)
game.TweenService:Create(p,TweenInfo.new(1),{
CFrame=p.CFrame*CFrame.new(0,3,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,2,0)
}):Play()




local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
p2.Color=Color3.new(.2,.9,0)
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p2.CFrame = char['Left Arm'].CFrame
*CFrame.new(0,-1,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p2, 2)
game.TweenService:Create(p2,TweenInfo.new(1),{
CFrame=p2.CFrame*CFrame.new(0,3,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,2,0)
}):Play()

if man >= 1 then 
    man = 0 
local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,1)
})
v.LockedToPart = true
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,1)
})
v.Lifetime = NumberRange.new(1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55/2, 155/2, 0))}
v.Rate = 0;v.Speed = NumberRange.new(-3)
v:Emit(1)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)

v.Texture = 'rbxassetid://9470659899';v.Brightness = 5
v.LightEmission=10;v.LightInfluence=0
v.FlipbookFramerate = NumberRange.new(66) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 0
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld:Emit(5)
bld.LockedToPart=true
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(55, 155, 0))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
bld.ZOffset= 2
task.delay(.5,function()
bld.Rate = 0 end)



local v = Instance.new('ParticleEmitter',p2)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,1)
})
v.LockedToPart = true
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,1)
})
v.Lifetime = NumberRange.new(1)
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55/2, 155/2, 0))}
v.Rate = 0;v.Speed = NumberRange.new(-3)
v:Emit(1)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)

v.Texture = 'rbxassetid://9470659899';v.Brightness = 5
v.LightEmission=10;v.LightInfluence=0
v.FlipbookFramerate = NumberRange.new(66) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 0
local bld = Instance.new("ParticleEmitter",p2)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld:Emit(5)
bld.LockedToPart=true
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(55, 155, 0))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
bld.ZOffset= 2
task.delay(.5,function()
bld.Rate = 0 end)
end
k.TimePosition = 1.6+math.cos(i/15)/15
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
kk:Stop(.2)
NuclearLoop = false
end end)
else 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15391323441"
local k = char.Humanoid:LoadAnimation(Anim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://15146348738"
local kk = char.Humanoid:LoadAnimation(Anim)
local NuclearLoop = false
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
NuclearLoop = true
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
kk:Play(.3)
kk.Priority = Enum.AnimationPriority.Idle
kk:AdjustSpeed(0)
spawn(function()
for i = 1,999999 do 
if NuclearLoop == false then break end
k.TimePosition = 1.6+math.cos(i/15)/15
task.wait(.02) end end)
v.Stopped:wait()
k:Stop(.2)
kk:Stop(.2)
NuclearLoop = false
end end) end


end end)
getgenv().Cooldown7 = 15
function Seven()
function addsfx(id,sp,vol)
     spawn(function()
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = id
s.PlaybackSpeed = sp
s.Volume = vol s:Play()
task.wait(4.7)
s:Destroy()
end)
end
local g = 1
if getgenv().TRUEMODE == 'Contaminant' then 
_G.twA("You won't get out alive.",Color3.new(1,.7,0),Color3.new(0,0,0))
else 
_G.twA("You won't get out alive.",Color3.new(.2,.5,0),Color3.new(0,0,0))
end
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://128242451039706"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k.TimePosition = 99
k:AdjustSpeed(-1)
task.wait(1.8)
k:Stop(1.6)
char.CharacterHandler.Client.RunContext = "Server"
char.CharacterHandler.Client.RunContext = "Legacy"
local RunService = game:GetService("RunService")
gay = RunService.Heartbeat:Connect(function()
local id = "rbxassetid://136370737633649"
local anim = Instance.new("Animation")
anim.AnimationId = id
loaded = char.Humanoid.Animator:LoadAnimation(anim)
loaded.Priority = Enum.AnimationPriority.Action4
loaded:Play(-1)
loaded.TimePosition = 5
loaded:AdjustSpeed(0)
RunService.RenderStepped:Wait()
loaded:Stop(-1)

end)
local hi = 45
spawn(function()
for i =1,7 do 
    task.wait(.5)
    hi=hi+50
    g=g+math.random(-1,1)/9
local v = game:GetService("ReplicatedStorage").Resources.EsperAwakening.NadoSmoke:Clone()
v.Parent = workspace
task.spawn(function() task.wait(2) v:Destroy() end)
v.SmokeCircle.Anchored=true
v.SmokeCircle.CFrame = 
game.Players.LocalPlayer.Character.Torso.CFrame
*CFrame.new(0,-2,0)
v.SmokeCircle.ParticleEmitter:Emit(15)
v.SmokeCircle.ParticleEmitter.Rate = 0
for i = 1,9 do
spawn(function()
local vel = math.random(-25,25)
local vel2 = math.random(-25,25)
local v = Instance.new('Part')
v.Size = Vector3.new(.5,.5,.5)*math.random(1,5)
v.Material=Enum.Material.Concrete
v.Color = Color3.fromRGB(158, 151, 157)
v.Parent = workspace
local pp = PhysicalProperties.new(1,2,1,1,1)
v.CustomPhysicalProperties = pp
v.CanCollide = false
local pcf = hrp.CFrame
for i =1,35 do 
    v.CFrame = pcf*
CFrame.new(vel*i/25,math.sin(i/10)*15,
vel2*i/25)
*CFrame.Angles(90,i/5,i/5)
task.wait(.01) end
task.wait(1)
v.CanCollide = true
game.TweenService:Create(v,TweenInfo.new(3),{Size=Vector3.new(0,0,0),
CFrame=v.CFrame*CFrame.Angles(i,i,i)}):Play()
task.wait(3.6) v:Destroy()
end) end
addsfx('rbxassetid://17276338362',g,2)
addsfx('rbxassetid://3932587669',1.5,1)
local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
if getgenv().TRUEMODE == 'Contaminant' then 
    --1,.7,0
p2.Color=Color3.new(1,.7,0)
else
p2.Color=Color3.new(.2,.9,0)
end
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1,.5,1)
p2.CFrame = hrp.CFrame*CFrame.new(1,-2,-2)
game:GetService("Debris"):AddItem(p2, 1)

game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(5,0,10)
}):Play()
game.TweenService:Create(p2,TweenInfo.new(.5),{
Transparency = 1
}):Play()
    task.wait(.5)
        hi=hi+50
      g=g+math.random(-1,1)/9
local v = game:GetService("ReplicatedStorage").Resources.EsperAwakening.NadoSmoke:Clone()
v.Parent = workspace
task.spawn(function() task.wait(2) v:Destroy() end)
v.SmokeCircle.Anchored=true
v.SmokeCircle.CFrame = 
game.Players.LocalPlayer.Character.Torso.CFrame
*CFrame.new(0,-2,0)
v.SmokeCircle.ParticleEmitter:Emit(15)
v.SmokeCircle.ParticleEmitter.Rate = 0
for i = 1,9 do
spawn(function()
local vel = math.random(-25,25)
local vel2 = math.random(-25,25)
local v = Instance.new('Part')
v.Size = Vector3.new(.5,.5,.5)*math.random(1,5)
v.Material=Enum.Material.Concrete
v.Color = Color3.fromRGB(158, 151, 157)
v.Parent = workspace
local pp = PhysicalProperties.new(1,2,1,1,1)
v.CustomPhysicalProperties = pp
v.CanCollide = false
local pcf = hrp.CFrame
for i =1,35 do 
    v.CFrame = pcf*
CFrame.new(vel*i/25,math.sin(i/10)*15,
vel2*i/25)
*CFrame.Angles(90,i/5,i/5)
task.wait(.01) end
task.wait(1)
v.CanCollide = true
game.TweenService:Create(v,TweenInfo.new(3),{Size=Vector3.new(0,0,0),
CFrame=v.CFrame*CFrame.Angles(i,i,i)}):Play()
task.wait(3.6) v:Destroy()
end) end
addsfx('rbxassetid://17276338362',g,2)
addsfx('rbxassetid://3932587669',1.5,1)
local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
if getgenv().TRUEMODE == 'Contaminant' then 
    --1,.7,0
    p2.Color=Color3.new(1,.7,0)
    else
p2.Color=Color3.new(.2,.9,0)
end
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(1,.5,1)
p2.CFrame = hrp.CFrame*CFrame.new(-1,-2,-2)
game:GetService("Debris"):AddItem(p2, 1)

game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(5,0,10)
}):Play()
game.TweenService:Create(p2,TweenInfo.new(.5),{
Transparency = 1
}):Play()

    end end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18897115785"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(1)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.3)

local Attachment = Instance.new("Attachment")
Attachment.Parent = hrp


local LV = Instance.new("LinearVelocity", Attachment)
LV.MaxForce = 98555
LV.Attachment0 = Attachment
LV.ForceLimitMode = Enum.ForceLimitMode.PerAxis
LV.MaxAxesForce = Vector3.new(98555, 0, 98555)
local drun = false 
spawn(function()
local man = 0
for i = 1,555 do if drun == true then break end man=man+1
     local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 

p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
if getgenv().TRUEMODE == 'Contaminant' then 
    p.Color=Color3.new(1,.7,0)
    else
p.Color=Color3.new(.2,.9,0)
end
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p.CFrame = char['Right Arm'].CFrame
*CFrame.new(0,-1,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p, 2)
game.TweenService:Create(p,TweenInfo.new(1),{
CFrame=p.CFrame*CFrame.new(0,3,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,2,0)
}):Play()




local p2 = Instance.new('Part')
p2.Parent = getgenv().Enviroment
p2.Material = Enum.Material.Neon 

p2.Anchored=true p2.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p2)
msh2.MeshType = "Sphere"
if getgenv().TRUEMODE == 'Contaminant' then 
    p.Color=Color3.new(1,.7,0)
    else
p.Color=Color3.new(.2,.9,0)
end
local gay = math.random(2,5)/15
msh2.Scale = Vector3.new(.5,.5,.5)
p2.CFrame = char['Left Arm'].CFrame
*CFrame.new(0,-1,0)*CFrame.Angles(
math.random(-360,360),
math.random(-360,360),
math.random(-360,360))
game:GetService("Debris"):AddItem(p2, 2)
game.TweenService:Create(p2,TweenInfo.new(1),{
CFrame=p2.CFrame*CFrame.new(0,3,0)
}):Play()
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,2,0)
}):Play()

if man >= 3 then 
    man = 0 
local v = Instance.new('ParticleEmitter',p)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,1)
})
v.LockedToPart = true
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,1)
})
v.Lifetime = NumberRange.new(1)
if getgenv().TRUEMODE == 'Contaminant' then 
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 200, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255/2, 200/2, 0))}
else
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55/2, 155/2, 0))}
end
v.Rate = 0;v.Speed = NumberRange.new(-3)
v:Emit(1)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)

v.Texture = 'rbxassetid://9470659899';v.Brightness = 5
v.LightEmission=10;v.LightInfluence=0
v.FlipbookFramerate = NumberRange.new(66) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 0
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld:Emit(5)
bld.LockedToPart=true
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
if getgenv().TRUEMODE == 'Contaminant' then 
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 200, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255/2, 200/2, 0))}
else
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55/2, 155/2, 0))}
end
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
bld.ZOffset= 2
task.delay(.5,function()
bld.Rate = 0 end)



local v = Instance.new('ParticleEmitter',p2)
v.LightEmission = 15
v.LightInfluence = 1
v.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,1)
})
v.LockedToPart = true
v.Name = '_Lsmoke'
v.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,1)
})
v.Lifetime = NumberRange.new(1)
if getgenv().TRUEMODE == 'Contaminant' then 
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 200, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255/2, 200/2, 0))}
else
v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55/2, 155/2, 0))}
end
v.Rate = 0;v.Speed = NumberRange.new(-3)
v:Emit(1)
v.SpreadAngle = Vector2.new(30,30)
v.Rotation = NumberRange.new(1,360)
v.RotSpeed = NumberRange.new(-100,100)

v.Texture = 'rbxassetid://9470659899';v.Brightness = 5
v.LightEmission=10;v.LightInfluence=0
v.FlipbookFramerate = NumberRange.new(66) v.FlipbookLayout = 'Grid8x8'
v.FlipbookMode = 'Loop';v.ZOffset = 0
local bld = Instance.new("ParticleEmitter",p2)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld:Emit(5)
bld.LockedToPart=true
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,math.random(-15,15)/35),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
if getgenv().TRUEMODE == 'Contaminant' then 
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 200, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255/2, 200/2, 0))}
else
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(55, 155, 0)), 
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(55/2, 155/2, 0))}
end
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
bld.ZOffset= 2
task.delay(.5,function()
bld.Rate = 0 end) end
    task.wait(.01) end end)
for i = 1,66 do 
 if hi >= 150 then    hi=50 end

     LV.VectorVelocity = hrp.CFrame.lookVector * hi
     task.wait(.1) end
     drun = true 
gay:Disconnect() LV:Destroy() k:Stop()
end

local uis = game:GetService("UserInputService")
local basemini = lp.PlayerGui.Hotbar.Backpack.Hotbar["7"]
local base = lp.PlayerGui.Hotbar.Backpack.Hotbar["7"].Base
basemini.Visible = true
base.Reuse.Visible = false
base.ToolName.Text = "Acidic Rush"
getgenv().Move7 = uis.InputBegan:Connect(function(inputs, event)
if event == true then return end
if inputs.KeyCode == Enum.KeyCode.Seven and not base:FindFirstChild("Cooldown") then
spawn(function() 		Seven() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown7,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown7)
deez:Destroy()
end
end)
getgenv().Move7B = base.MouseButton1Click:Connect(function()
if not base:FindFirstChild("Cooldown") then
spawn(function() 		Seven() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown7,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown7)
deez:Destroy()
end
end)

elseif char == 'Divinity' then 
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["1"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Divine Kick'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["2"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Holy Barrage'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["3"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Pure Bomb'
local uilol = lp.PlayerGui.Hotbar.Backpack.Hotbar["4"]
uilol.Visible = true
uilol.Base.Reuse.Visible = false
uilol.Base.ToolName.Text = 'Divine Blast'
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")
char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14358002256" 
or v.Animation.AnimationId == "rbxassetid://14358000392" 
or v.Animation.AnimationId == "rbxassetid://14357841394" 
or v.Animation.AnimationId == "rbxassetid://14357997687" 
or v.Animation.AnimationId == "rbxassetid://14357943487" 
then  v:Stop(-15)
 end end)
pcall(function()
task.wait(.3)
char['#BATWEAPON']:Destroy()
end)
getgenv().Ultimate = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14733282425" then
getgenv().DoingUlt = true
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16699717165"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(.1)
k.TimePosition = 3.5
_G.PS(963718869,1)
_G.SetMusic(7,1,102.5)
spawn(function()
for i = 1,35 do 
task.wait(.1)
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,.5)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(15,.5,.5)
p.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
task.wait(.01)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*35
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(-360,360)
bld.RotSpeed = NumberRange.new(355)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*5 
bld.Brightness = 1+i*5 

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-15),
NumberSequenceKeypoint.new(.3,5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()



local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,.5)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(15,.5,.5)
p.CFrame = char['Right Arm'].CFrame*
CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))
p.CFrame = CFrame.lookAt(p.Position, char['Right Arm'].Position)

spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 155
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,15),
NumberSequenceKeypoint.new(.3,5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)

end end)
spawn(function()
for i = 1,77 do 
task.wait(.02)
spawn(function()

local h = Instance.new('Highlight',char)
h.FillTransparency = 0
h.FillColor = Color3.new(1,1,0)
h.OutlineTransparency = 1
game.TweenService:Create(h,TweenInfo.new(2),{FillTransparency = 1}):Play()
task.delay(2,function() h:Destroy() end)
local p = Instance.new('Part')
p.Parent = h
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,.5)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(2,2,15)
p.CFrame = char['Right Arm'].CFrame*
CFrame.new(math.random(-5,5)*5,math.random(-5,5)*5,math.random(-5,5)*5)
*CFrame.Angles(math.random(-5,5)*3,math.random(-5,5)*3,math.random(-5,5)*3)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})

bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(.5,-5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.3,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'VelocityPerpendicular'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'GlowS'
bld.Lifetime = NumberRange.new(.5)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(3,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.5),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
end)
task.delay(.3,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.5),{
Scale=Vector3.new(0,0,20)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.9),{
Transparency = 1,
Position = 
char['Right Arm'].Position
}):Play()

p.CFrame = 
CFrame.lookAt(p.Position, char['Right Arm'].Position) 
end) end end)
spawn(function()
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local MainFrame2 = Instance.new("Frame")
local MainFrame3 = Instance.new("Frame")
local MainFrame4 = Instance.new("Frame")
pcall(function() game.CoreGui.BorderEffect:Destroy() end)
task.wait(.1)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = 'BorderEffect'

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 255, 0)
MainFrame.Position = UDim2.new(0,0,-.15,0)
MainFrame.Size = UDim2.new(1,0,.2,0)
game.TweenService:Create(MainFrame,TweenInfo.new(1),
{Position= UDim2.new(0,0,0,0)}):Play()
MainFrame2.Name = "MainFrame2"
MainFrame2.Parent = ScreenGui
MainFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
MainFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame2.Position = UDim2.new(-.6,0,.5,0)
MainFrame2.Rotation = 90
MainFrame2.Size = UDim2.new(1,0,.2,0)
game.TweenService:Create(MainFrame2,TweenInfo.new(2),
{Position= UDim2.new(-.5,0,.5,0)}):Play()
MainFrame2.ZIndex = -1
MainFrame4.ZIndex = -1
MainFrame3.Name = "MainFrame3"
MainFrame3.Parent = ScreenGui
MainFrame3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame3.BorderColor3 = Color3.fromRGB(255, 255, 0)
MainFrame3.Position = UDim2.new(0,0,.99,0)
MainFrame3.Size = UDim2.new(1,0,.2,0)
game.TweenService:Create(MainFrame3,TweenInfo.new(2),
{Position= UDim2.new(0,0,.9,0)}):Play()
MainFrame4.Name = "MainFrame4"
MainFrame4.Parent = ScreenGui
MainFrame4.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
MainFrame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame4.Position = UDim2.new(.6,0,.5,0)
MainFrame4.Rotation = 90
MainFrame4.Size = UDim2.new(1,0,.2,0)
game.TweenService:Create(MainFrame4,TweenInfo.new(2),
{Position= UDim2.new(.5,0,.5,0)}):Play()

task.wait(2)
game.TweenService:Create(MainFrame2,TweenInfo.new(2),
{Position= UDim2.new(-.8,0,0,0)}):Play()
game.TweenService:Create(MainFrame,TweenInfo.new(2),
{Position= UDim2.new(0,0,-.5,0)}):Play()
game.TweenService:Create(MainFrame3,TweenInfo.new(2),
{Position= UDim2.new(0,0,1.2,0)}):Play()
game.TweenService:Create(MainFrame4,TweenInfo.new(2),
{Position= UDim2.new(.8,0,0,0)}):Play()
task.wait(2)
ScreenGui:Destroy()
end)
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(2),
{FieldOfView = 75}):Play()
for i = 1,15 do pcall(function() game.Lighting.Bloom:Destroy() end) end
local Bloom = Instance.new('BloomEffect')
Bloom.Size = 15
Bloom.Parent = game.Lighting
Bloom.Intensity = 2
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(2),
{FieldOfView = 75}):Play()
game.TweenService:Create(Bloom,TweenInfo.new(2),
{Intensity = 25,Threshold = 0,Size=555}):Play()
task.wait(2)
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(.25),
{FieldOfView = 120}):Play()
game.TweenService:Create(Bloom,TweenInfo.new(1),
{Intensity = 25,Threshold = 2}):Play()
local v = Instance.new('ColorCorrectionEffect')
task.delay(1,function()
Bloom:Destroy() end)
task.spawn(function()
v.Parent = game.Lighting
v.Enabled = true
local h = Instance.new('Highlight',char)
h.FillTransparency = 0
h.FillColor = Color3.new(0,0,0)
for i = 1,5 do
h.FillColor = Color3.new(1,1,0)
v.TintColor = Color3.new(1,0,0)
v.Brightness = 25
task.wait(.01)

h.FillColor = Color3.new(1,1,1)
v.Brightness = -25
task.wait(.01) 
h.FillColor = Color3.new(0,0,0)
v.TintColor = Color3.new(1,1,0)
v.Brightness = 25
task.wait(.01)
end
v:Destroy() h:Destroy()
end)
_G.PS(9125644905,2,0,.5)
_G.PS(9166224293,5)
_G.PS(9166199024,5)
local quotes = {
'ALL OF YOUR EXISTENCE WILL BE GONE.',
'WHO DARES CHALLENGE ME?',
}
_G.twA(quotes[math.random(1,#quotes)],Color3.new(1,1,0),Color3.new(0,0,0))
task.wait(.25)
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(1),
{FieldOfView = 40}):Play()
task.delay(1,function()
game.TweenService:Create(workspace.CurrentCamera,TweenInfo.new(2),
{FieldOfView = 70}):Play()
end)
k:Stop(-1)
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 1, 0)
HealthBar.Size = UDim2.new(4, 0, 4, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "FALLEN-X"
PName.TextColor3 = Color3.new(1,1,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
local rnd = math.random(1,25)
if rnd == 1 then 
for i = 1,math.random(5,10) do 
PName.Rotation = math.random(-60,60)
task.wait(.01) end
end
PName.Position = UDim2.new(-1.0919999976, math.cos(i/35)*15, -0.800000012, 
math.cos(i/15)*15)
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
repeat task.wait() until bp:FindFirstChild('Foul Ball')
task.wait(3)
_G.SetMusic(5)
_G.twA('Times up.',Color3.new(1,1,0),Color3.new(0,0,0))
local HealthBar = Instance.new("BillboardGui")
local Frame = Instance.new("Frame")
local PName = Instance.new("TextLabel")

pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Divinity"
PName.TextColor3 = Color3.new(1,1,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 
PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)


end end)
pcall(function()
game.Players.LocalPlayer.Character.Head.MODE_NAME:Destroy()
end)
HealthBar.Name = "MODE_NAME"
HealthBar.Parent = game.Players.LocalPlayer.Character.Head
HealthBar.ExtentsOffset = Vector3.new(0, 3, 0)
HealthBar.Size = UDim2.new(4, 0, 2, 0)
HealthBar.AlwaysOnTop = true

Frame.Parent = HealthBar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)

PName.Name = "PName"
PName.Parent = Frame
PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PName.BackgroundTransparency = 1.000
PName.Position = UDim2.new(-1.0919999976, 0, -0.800000012, 0)
PName.Size = UDim2.new(3, 0, 1, 0)
PName.Font = Enum.Font.Antique
PName.Text = "Divinity"
PName.TextColor3 = Color3.new(1,1,0)
PName.TextScaled = true
PName.TextSize = 3
PName.TextStrokeColor3 = Color3.new(.2,0,0)
PName.TextStrokeTransparency = 0.000
PName.TextWrapped = true
PName.TextYAlignment = Enum.TextYAlignment.Top
spawn(function()
for i = 1,999999 do 

PName.Rotation = math.cos(i/35)*2
task.wait(.01) end end)
getgenv().Idle = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14516273501" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17464644182"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(0)
k.Looped = true
spawn(function()
for i = 1,15150 do 
k.TimePosition = .3+math.cos(i/5)/45
task.wait(.1) end end)
v.Stopped:wait() k:Stop()
end end)
function gay()
_G.PS('183763487',1,nil,1+math.random(-5,5)/55)
_G.PS('4478181452',.3,.2,2+math.random(-5,5)/35)
for i = 1,5 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,0)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(1,35,1)
p.CFrame = hrp.CFrame*CFrame.new(rndlol/2,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
task.wait(.01)
msh2.Scale = Vector3.new(3,3,3)
p.CFrame = hrp.CFrame*CFrame.new(rndlol,math.random(-3,3),-6)*CFrame.Angles(math.rad(90),0,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*13),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end
end
getgenv().Move4B = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14351441234" then
spawn(function()
for i = 1,30 do 
task.wait(.03)
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,0)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(1,.5,.5)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-5,0)
task.wait(.01)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char['Right Arm'].CFrame*CFrame.new(0,-5,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*35
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*5 
bld.Brightness = 1+i*5 

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-15),
NumberSequenceKeypoint.new(.3,5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end end)
local lol = hrp.ChildAdded:Connect(function(pp)
if pp:IsA('BodyVelocity') then 
pp.MaxForce=Vector3.new(0,0,0)
end end)
task.delay(1,function()
lol:Disconnect() end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://129651400898906"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
end end)
getgenv().Move4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14705929107" then
v:Stop()
spawn(function()
for i = 1,45 do 
task.wait(.03)
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"

local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(15,.5,.5)
p.Color=Color3.new(1,1,math.random(0,1))
p.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
task.wait(.01)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*35
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*5 
bld.Brightness = 1+i*5 

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-15),
NumberSequenceKeypoint.new(.3,5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end end)
for _,v in pairs(workspace.Live:GetChildren()) do 
local tor = v:FindFirstChild('Torso');local hum = v:FindFirstChildOfClass('Humanoid')
if tor and hum and v ~= char then 
if (tor.Position - hrp.Position).magnitude <= 16 then 
for _, track in pairs(v.Humanoid:GetPlayingAnimationTracks()) do
if track.Animation.AnimationId == 'rbxassetid://14700473573' then
track:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13632671563"
local k = v.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
task.delay(2,function()
k:Stop() end)
end end end end end
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18447913645"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
k.TimePosition = 1.5
task.wait(1.5)
k.TimePosition = 4.5
k:AdjustSpeed(1.5)
local pcf = hrp.CFrame
task.wait(1)
hrp.CFrame=pcf*CFrame.new(0,0,-55)*CFrame.Angles(0,math.rad(180),0)
workspace.CurrentCamera.CFrame = hrp.CFrame*CFrame.Angles(math.rad(-30),0,0)

end end)
getgenv().Move3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14299135500" then
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://98542310119798"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
for i = 1,30 do 
task.wait(.03)
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,0)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(13,.5,.5)
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-2,0)
task.wait(.01)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char['Right Leg'].CFrame*CFrame.new(0,-2,0)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*35
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,2 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1+i*5 
bld.Brightness = 1+i*5 

bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,-15),
NumberSequenceKeypoint.new(.3,5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.1,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.5),{
Transparency = 1
}):Play()
end)
end
end end)
getgenv().M1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14004222985" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://17888706103"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
end end)
getgenv().M3 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14001963401" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://13295936866"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://12971270638"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(0)
k.TimePosition = 1
task.wait(.9)
k:Stop()
end end)
getgenv().M4 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14136436157" then
v:Stop()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://12447247483"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
k.TimePosition = .9
end end)
local stfu = false 
getgenv().Move2 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14048285180"
or v.Animation.AnimationId == "rbxassetid://14046756619"

then
if stfu == true then return end 
stfu = true task.delay(7,function()
stfu = false end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://128022763591042"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
task.wait(.3)
v:GetMarkerReachedSignal("go"):Connect(function(paramString)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16945550029"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
local maybhit = false 
spawn(function()
k.Stopped:Wait() 
maybhit = true 
task.wait(2)
maybhit = false 
end)
for i =1,3 do 
if maybhit == true then return end
k.TimePosition = 1
gay()
task.wait(.9)
k:Stop()
end
end)
for i = 1,6 do 

v:GetMarkerReachedSignal("hit"..i):Connect(function(paramString)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16945550029"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
local maybhit = false 
spawn(function()
k.Stopped:Wait() 
maybhit = true 
task.wait(2)
maybhit = false 
end)
for i =1,3 do 
if maybhit == true then return end
k.TimePosition = 1
gay()
task.wait(.2)
k:Stop()
end
end)
end
end end)
getgenv().Move1 = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://14004235777" then
_G.PS('5829925163',1)
_G.PS('5829925163',.1,0,.5)
_G.PS('5829925163',.8,.1,.9)
_G.PS('1839901373',1.5,0,.5)
_G.PS('9126225464',6.5,0,1.5)
task.delay(.2,function()
_G.PS('5829925163',.5,.2,.8)
end)
task.delay(1,function()
_G.PS('8128413192',8.5)
_G.PS('1839901373',8.5)
_G.PS('9125644905',8.5)
end)
task.delay(1,function()
for i = 1,15 do 
spawn(function()
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false

local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,1,0)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(5,35,5)
p.CFrame = hrp.CFrame*CFrame.new(3+rndlol/3,0,-3+rndlol)
local parts = game.CoreGui.HeadsetDisconnectedDialog:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Sound') then
spawn(function()
local otpos = part.TimePosition
if part.Playing == false then return end
part:Pause()
task.wait(.1)
part:Play() 
part.TimePosition = otpos
end) end end
task.wait(.1)
msh2.Scale = Vector3.new(3,3,3)
p.CFrame = hrp.CFrame*CFrame.new(3+rndlol*2,0,-3+rndlol*2)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = .1
bld.Texture = "rbxassetid://284205403"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,0.75+math.random(1,5)/5),
NumberSequenceKeypoint.new(1,0)
})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(.1,.3),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(255, 255, 255))}

bld.VelocitySpread = 0
bld.Rotation = NumberRange.new(90)
bld.RotSpeed = NumberRange.new(0)
spawn(function()
for i = 1,10 do 
bld.Speed = NumberRange.new(math.random(-25,25))
bld:Emit(1) task.wait(.06) end end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 155
bld.Texture = "rbxassetid://6673021984"
bld.Color = ColorSequence.new(Color3.new(1,1,1))
bld.Rate = 0
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)*13),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(-15,15)/35),
NumberSequenceKeypoint.new(.1,15),
NumberSequenceKeypoint.new(.2,-15),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.1),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
bld.Speed = NumberRange.new(29)
bld.VelocitySpread = 50000
bld.ZOffset = 5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
task.delay(.2,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 2.5)
game.TweenService:Create(msh2,TweenInfo.new(1),{
Scale=Vector3.new(0,15,0)
}):Play()
game.TweenService:Create(p,TweenInfo.new(1.5),{
Transparency = 1
}):Play()
end)
end
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16945550029"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1.5)
k.TimePosition = 3.5
end end)



else info('Invalid Mode.')
end end  
function MainEnv()
repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')
spawn(function()
getgenv().ChaosFlicker = false 
task.wait(2.5)
getgenv().ChaosFlicker = true
end)
pcall(function() getgenv().boingboing:Disconnect() end)

local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack


local cdcc = lp.PlayerGui.Hotbar.Backpack.LocalScript.Cooldown
hrp.CFrame=hrp.CFrame*CFrame.new(0,15,0)
for i = 1,5 do 
pcall(function() getgenv().WallCombo:Disconnect() end)
pcall(function() getgenv().Nightchild:Disconnect() end)
pcall(function() getgenv().Blocking:Disconnect() end)
pcall(function() getgenv().Downslam:Disconnect() end)
pcall(function() getgenv().Idle:Disconnect() end)
pcall(function() getgenv().Walk:Disconnect() end)
pcall(function() getgenv().Ultimate:Disconnect() end)
pcall(function() getgenv().Move1:Disconnect() end)
pcall(function() getgenv().Move1B:Disconnect() end)
pcall(function() getgenv().Move2:Disconnect() end)
pcall(function() getgenv().Move2B:Disconnect() end)
pcall(function() getgenv().Move3:Disconnect() end)
pcall(function() getgenv().Move3B:Disconnect() end)
pcall(function() getgenv().Move3BB:Disconnect() end)
pcall(function() getgenv().Move4:Disconnect() end)
pcall(function() getgenv().Move4B:Disconnect() end)
pcall(function() getgenv().Move5:Disconnect() end)
pcall(function() getgenv().Move5B:Disconnect() end)
pcall(function() getgenv().Move6:Disconnect() end)
pcall(function() getgenv().Move6B:Disconnect() end)
pcall(function() getgenv().Move7:Disconnect() end)
pcall(function() getgenv().Move7B:Disconnect() end)


pcall(function() getgenv().M1:Disconnect() end)
pcall(function() getgenv().M2:Disconnect() end)
pcall(function() getgenv().M3:Disconnect() end)
pcall(function() getgenv().M4:Disconnect() end)


pcall(function() getgenv().UltMove1:Disconnect() end)
pcall(function() getgenv().UltMove2:Disconnect() end)
pcall(function() getgenv().UltMove2B:Disconnect() end)
pcall(function() getgenv().UltMove3:Disconnect() end)
pcall(function() getgenv().UltMove4:Disconnect() end)
end

function Five()
if getgenv().preg == false then 
getgenv().preg = true 
task.wait(1)
getgenv().preg = nil 
return end

local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://106755459092436"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
spawn(function()
k.Stopped:wait()
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://16597322398"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action2
k:AdjustSpeed(1)
hrp.moveme:Destroy()
task.delay(.7,function()
k:AdjustSpeed(.02)
end)
end)
local snd = Instance.new('Sound',char.Head)
snd.Name = 'FlyWind'
snd.SoundId = 'rbxassetid://8114441138'
snd.Volume = 0
game.TweenService:Create(snd,TweenInfo.new(9),{Volume = 3.6}):Play()
snd:Play()
snd.Looped = true

local bv = Instance.new('BodyVelocity')
bv.Parent = hrp
bv.MaxForce=Vector3.new(9e9, 9e9, 9e9)
local hs = game.CoreGui.HeadsetDisconnectedDialog
local parts = hs:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('Sound') then
local pvol = part.Volume 
game.TweenService:Create(part,TweenInfo.new(5),{Volume = 0}):Play()
spawn(function()
repeat task.wait() until getgenv().preg == true
game.TweenService:Create(part,TweenInfo.new(1),{Volume = pvol}):Play()
bv:Destroy() 
snd:Destroy()
k:Stop(1) 
end)
end end
k.Stopped:wait()
local l = game:GetService("ReplicatedStorage").Resources.SwingWind:Clone()
l.Parent = workspace
l.Transparency = 1
l.Anchored=true
l.Mesh.Scale=Vector3.new(5,15,5)
task.wait(.5) 
local speedlines = game.ReplicatedStorage.Resources.KJEffects.speedlines:Clone()
speedlines.Parent = workspace
for i,v in pairs(speedlines:GetChildren()) do
v.Enabled = true
v.Transparency = NumberSequence.new(0)
v.LockedToPart = true
v.EmissionDirection = "Back"
v.Rate = 500
end
getgenv().preg = false
local i = 0
local gayy = game:GetService("RunService").RenderStepped:Connect(function(step)
i=i+1
local gay = 99
speedlines.CFrame = workspace.CurrentCamera.CFrame*CFrame.new(0,0,-45)
l.CFrame=CFrame.new(hrp.Position) * workspace.CurrentCamera.CFrame.Rotation*CFrame.Angles(90,i,0)
char.Humanoid.CameraOffset=Vector3.new(0,15,0)+
char.Head.CFrame.LookVector*20
bv.Velocity = workspace.CurrentCamera.CFrame.LookVector*gay
hrp.CFrame = CFrame.new(hrp.Position) * workspace.CurrentCamera.CFrame.Rotation
game['Run Service'].Heartbeat:wait() 
end)
repeat task.wait() until getgenv().preg == true
gayy:Disconnect()
speedlines:Destroy()
l:Destroy()
bv:Destroy()
for  _,v in pairs(char.Humanoid:GetPlayingAnimationTracks()) do 
v:Stop()
end
end
getgenv().Cooldown5 = 5
getgenv().Cooldown6 = 2
local uis = game:GetService("UserInputService")
local basemini = lp.PlayerGui.Hotbar.Backpack.Hotbar["5"]
local base = lp.PlayerGui.Hotbar.Backpack.Hotbar["5"].Base
basemini.Visible = true
base.Reuse.Visible = false
base.ToolName.Text = "Flight"
getgenv().Move5 = uis.InputBegan:Connect(function(inputs, event)
if event == true then return end
if inputs.KeyCode == Enum.KeyCode.Five and not base:FindFirstChild("Cooldown") then
spawn(function() 		Five() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown5,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown5)
deez:Destroy()
end
end)
getgenv().Move5B = base.MouseButton1Click:Connect(function()
if not base:FindFirstChild("Cooldown") then
spawn(function() 		Five() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown5,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown5)
deez:Destroy()
end
end)
char.Archivable = true 
local fchar = nil
task.delay(3,function()
pcall(function() workspace.Live.SG_Clone:Destroy() end)


fchar = char:Clone() 
fchar.Name = 'SG_Clone'
fchar.Parent = workspace.Live
local parts = fchar:GetDescendants()
for i, part in ipairs(parts) do
if part:IsA('BasePart') then
part.CollisionGroup = "nocol"
end end
fchar.HumanoidRootPart.Anchored=true
fchar.HumanoidRootPart.CFrame=CFrame.new(0,10^10,0)
end)
pcall(function() fchar:FindFirstChildWhichIsA('Highlight'):Destroy() end)
function Six()
if getgenv().TRUEMODE == 'Mayhem' or getgenv().TRUEMODE == 'VIOLENCE' then

local parts = workspace.Map.Trash:GetChildren()
for i, part in ipairs(parts) do
if part.Name == 'Trashcan' and part:GetAttribute('Broken') ~= true then 
local pcf = hrp.CFrame
char.Humanoid.AutoRotate = false 
fchar.HumanoidRootPart.CFrame = pcf
workspace.CurrentCamera.CameraSubject = fchar 
local yesss = game:GetService("RunService").Heartbeat:Connect(function(step)
local old = hrp.CFrame
hrp.Velocity = Vector3.new(0,-3999,0)
game:GetService("RunService").RenderStepped:Wait()
hrp.Velocity = Vector3.new(0,0,0)
end) 
edi = game:GetService('RunService').RenderStepped:Connect(function(step)
fchar.Humanoid.CameraOffset = char.Humanoid.CameraOffset
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://94020267622363"
local k = fchar.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://94020267622363"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(-1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)

spawn(function()
repeat hrp.CFrame = part.Trashcan.CFrame*CFrame.new(0,0,3) task.wait() 
until part:GetAttribute('Broken') == true
char.Humanoid.AutoRotate = true
edi:Disconnect() 
fchar.HumanoidRootPart.CFrame = CFrame.new(0,10^10,0)
workspace.CurrentCamera.CameraSubject = char 
hrp.CFrame = pcf
end)
task.wait(lp:GetNetworkPing()*3)
local args = {
[1] = {
["Goal"] = "LeftClick"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
task.wait(lp:GetNetworkPing()*2.2)
local args = {
[1] = {
["Goal"] = "LeftClickRelease"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
repeat task.wait() until char:FindFirstChild('Trash Can')
local StressLevel = 0
_G.twA('.GET THEM.. AND AIM PROPERLY DAMN IT.',Color3.new(1,0,0),Color3.new(0,0,0))
_G.PS('136007472',1,nil,.3)
local parts = char:GetChildren()
for i, part in ipairs(parts) do
if part.Name == 'Trash Can' then
local hl = Instance.new('Highlight')
hl.Parent = part 
hl.FillColor=Color3.new(0,0,0)
hl.FillTransparency = 0
end end
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18462892217"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(-1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
workspace.CurrentCamera.CameraType = 'Scriptable'
local i = 0
local e = 0
local ye = game:GetService("RunService").Heartbeat:Connect(function(step)
i=i+1
local pcf = hrp.CFrame
hrp.CFrame = pcf*CFrame.new(0,999,0)*CFrame.Angles(math.rad(-90),0,0)
game:GetService("RunService").RenderStepped:Wait()

hrp.CFrame = pcf 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(5,1,5)
p.CFrame = CFrame.new(hrp.CFrame.X, 441, hrp.CFrame.Z)*CFrame.Angles(
0,
math.random(-90,90),
0
)
game:GetService("Debris"):AddItem(p, .1)
local rnd = math.random(0,1)
if rnd == 0 then 
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(15+math.random(1,15),0,15+math.random(1,15))
}):Play()
else 
msh2.Scale = Vector3.new(1,1,1)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(77,0,0)
}):Play()
end
game.TweenService:Create(p,TweenInfo.new(.1),{
Transparency = 1
}):Play()
if i == 1300 then
_G.twA('WOW.',Color3.new(1,0,0),Color3.new(0,0,0))
StressLevel = 3
task.wait(2)
local args = {
[1] = {
["Goal"] = "LeftClick"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
task.wait(lp:GetNetworkPing()*2.2)
local args = {
[1] = {
["Goal"] = "LeftClickRelease"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
end
if i == 800 then
_G.twA('I WONT LAST FOREVER, YOU KNOW?.. THROW IT BEFORE I DO MYSELF.',Color3.new(1,0,0),Color3.new(0,0,0))
StressLevel = 2
end
if i >= 800 then 
workspace.CurrentCamera.CFrame = CFrame.new(char.Torso.CFrame.X+3,
char.Torso.CFrame.Y+8.5+math.cos(i/55)*2,char.Torso.CFrame.Z)*CFrame.Angles(
	math.rad(90),math.rad(180),0
)
k.TimePosition = 5+math.sin(i*2)/12
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1+i/355,1,1+i/355)
p.CFrame = char['Left Arm'].CFrame*CFrame.new(0,-1.5,0)*CFrame.Angles(
math.random(-90,90),
math.random(-90,90),
math.random(-90,90)
)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,35+i/155,0)
}):Play()
return end
if i == 300 then
_G.twA('WHAT ARE YOU WAITING FOR?.. THROW.. THE. TRASHCAN.',Color3.new(1,0,0),Color3.new(0,0,0))
StressLevel = 1
end
if i >= 300 then 
workspace.CurrentCamera.CFrame = CFrame.new(char.Torso.CFrame.X+3,
char.Torso.CFrame.Y+8.5+math.cos(i/55)*2,char.Torso.CFrame.Z)*CFrame.Angles(
	math.rad(90),math.rad(180),0
)
k.TimePosition = 5+math.sin(i/1)/15
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1+i/355,1,1+i/355)
p.CFrame = char['Left Arm'].CFrame*CFrame.new(0,-1.5,0)*CFrame.Angles(
math.random(-90,90),
math.random(-90,90),
math.random(-90,90)
)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,35+i/155,0)
}):Play()
return end
if i >= 220 then
workspace.CurrentCamera.CFrame = CFrame.new(char.Torso.CFrame.X+3,
char.Torso.CFrame.Y+2.5+math.cos(i/55)*2,char.Torso.CFrame.Z)*CFrame.Angles(
	math.rad(90),math.rad(180),0
)
k.TimePosition = 5+math.sin(i/35)/3
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char['Left Arm'].CFrame*CFrame.new(0,-1.5,0)*CFrame.Angles(
math.random(-90,90),
math.random(-90,90),
math.random(-90,90)
)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,35,0)
}):Play()
else 
local p = Instance.new('Part')
p.Parent = getgenv().Enviroment
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.new(1,0,0)
msh2.Scale = Vector3.new(1,1,1)
p.CFrame = char['Left Arm'].CFrame*CFrame.new(0,-1.5,0)*CFrame.Angles(
math.random(-90,90),
math.random(-90,90),
math.random(-90,90)
)
game:GetService("Debris"):AddItem(p, 1.5)
game.TweenService:Create(msh2,TweenInfo.new(.1),{
Scale=Vector3.new(0,5,0)
}):Play()
workspace.CurrentCamera.FieldOfView = 70+math.sin(i/15)*7
workspace.CurrentCamera.CFrame = CFrame.new(char.Torso.CFrame.X+3,
char.Torso.CFrame.Y+15+math.sin(i/15)*3,char.Torso.CFrame.Z)*CFrame.Angles(
	math.rad(90),math.rad(180),0
)
end
end)
repeat task.wait() until not char:FindFirstChild('Trash Can') 
if StressLevel == 0 then 
_G.twA('THAT WAS FAST, GOOD JOB.',Color3.new(1,0,0),Color3.new(0,0,0))
workspace.CurrentCamera.CameraType = 'Custom'

ye:Disconnect() 
yesss:Disconnect()
return
elseif StressLevel == 1 then 
_G.twA('YOU TAKE LONG.',Color3.new(1,0,0),Color3.new(0,0,0))
elseif StressLevel == 2 then 
_G.twA('MISERABLE PERFORMANCE, DO BETTER.',Color3.new(1,0,0),Color3.new(0,0,0))
elseif StressLevel == 3 then 
_G.twA('NEVER USE ME AGAIN.',Color3.new(1,0,0),Color3.new(0,0,0))

end
task.wait(1)
workspace.CurrentCamera.CameraType = 'Custom'

ye:Disconnect() 

yesss:Disconnect()
return
end 
end
elseif getgenv().TRUEMODE == 'Purity' then
_G.twA('Take it!',Color3.new(0,0,0),Color3.new(0,1,1))
_G.PS('1625448638',2)
_G.PS('1625448638',1.8,.1,.8)
task.delay(.2,function()
_G.PS('1625448638',1.4,.2,.9)
end)
elseif getgenv().TRUEMODE == 'Corruption' then
_G.twA('How about another?',Color3.new(0,0,0),Color3.new(1,0,1))
end
local parts = workspace.Map.Trash:GetChildren()
for i, part in ipairs(parts) do
if part.Name == 'Trashcan' and part:GetAttribute('Broken') ~= true then 
local pcf = hrp.CFrame
char.Humanoid.AutoRotate = false 
fchar.HumanoidRootPart.CFrame = pcf
workspace.CurrentCamera.CameraSubject = fchar 
edi = game:GetService('RunService').RenderStepped:Connect(function(step)
fchar.Humanoid.CameraOffset = char.Humanoid.CameraOffset
end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://111364629436380"
local k = fchar.Humanoid:LoadAnimation(Anim)
k:Play(.3)
k.Priority = Enum.AnimationPriority.Action
k:AdjustSpeed(1)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://111364629436380"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play(-1)
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
spawn(function()
local v = game:GetService("ReplicatedStorage").Resources.EsperAwakening.NadoSmoke:Clone()
v.Parent = workspace
task.spawn(function() task.wait(2) v:Destroy() end)
v.SmokeCircle.Anchored=true
v.SmokeCircle.CFrame = 
pcf*CFrame.new(0,-3,-2)
v.SmokeCircle.ParticleEmitter.Rate = 55
task.wait(.9)
v.SmokeCircle.ParticleEmitter:Emit(15)
v.SmokeCircle.ParticleEmitter.Rate = 255
task.wait(.5)
v.SmokeCircle.ParticleEmitter.Rate = 0
end)
spawn(function()
for i = 1,15 do 
spawn(function()
    local v = Instance.new('Part')
v.Size = Vector3.new(2,2,2)
v.Material=Enum.Material.Concrete
v.Color = Color3.fromRGB(158, 151, 157)
v.Parent = workspace.Live
v.CFrame = pcf*CFrame.new(
    math.random(-5,5)/2,-5.9,
    -3+math.random(-5,5)/3)
*CFrame.Angles(i,i,0)
v.Anchored=true 
v.CanCollide = false
local gat = 2+math.random(3,5)/5
local gaty = -3+math.random(-5,-3)
game.TweenService:Create(v,TweenInfo.new(.4,Enum.EasingStyle.Cubic,Enum.EasingDirection.In),
{Position = v.Position+Vector3.new(0,gat,0)}):Play()
task.wait(.4)
game.TweenService:Create(v,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.In),
{Position = v.Position+Vector3.new(0,gaty,0)}):Play()
task.wait(4) v:Destroy()
end)
task.wait(.04) end end)
for i = 1,9 do
spawn(function()
task.wait(1+math.random(-15,15)/255)
local vel = math.random(-25,25)
local vel2 = math.random(-25,25)
local v = Instance.new('Part')
v.Size = Vector3.new(.5,.5,.5)
v.Material=Enum.Material.Concrete
v.Color = Color3.fromRGB(158, 151, 157)
v.Parent = workspace.Live
local pp = PhysicalProperties.new(5.3,155,1,1,1)
v.CustomPhysicalProperties = pp
for i =1,35 do 
    v.CFrame = pcf*
CFrame.new(vel*i/25,math.sin(i/10)*15,
-2+vel2*i/25)
*CFrame.Angles(90,i/5,i/5)
task.wait(.01) end
game.TweenService:Create(v,TweenInfo.new(1),{Size=Vector3.new(0,0,0)}):Play()
task.wait(1) v:Destroy()
end)
end
spawn(function()
repeat hrp.CFrame = part.Trashcan.CFrame*CFrame.new(0,0,3) task.wait() 
until part:GetAttribute('Broken') == true
char.Humanoid.AutoRotate = true
edi:Disconnect() 
fchar.HumanoidRootPart.CFrame = CFrame.new(0,10^10,0)
workspace.CurrentCamera.CameraSubject = char 
hrp.CFrame = pcf
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://111364629436380"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play(-1)
kk.Priority = Enum.AnimationPriority.Action2
kk:AdjustSpeed(2)
kk.TimePosition = k.TimePosition
task.wait(.2)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://11365563255"
local kk = char.Humanoid:LoadAnimation(Anim)
kk:Play(-1)
kk.Priority = Enum.AnimationPriority.Action3
kk:AdjustSpeed(2)
kk.TimePosition = 5.5
task.wait(.5)
kk:Stop()
end)
task.wait(lp:GetNetworkPing()*3)
local args = {
[1] = {
["Goal"] = "LeftClick"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
task.wait(lp:GetNetworkPing()*2.2)
local args = {
[1] = {
["Goal"] = "LeftClickRelease"
}
}

game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))

return
end end
end
local uis = game:GetService("UserInputService")
local basemini = lp.PlayerGui.Hotbar.Backpack.Hotbar["6"]
local base = lp.PlayerGui.Hotbar.Backpack.Hotbar["6"].Base
basemini.Visible = true
base.Reuse.Visible = false
base.ToolName.Text = "Trash cant"
getgenv().Move6 = uis.InputBegan:Connect(function(inputs, event)
if event == true then return end
if inputs.KeyCode == Enum.KeyCode.Six and not base:FindFirstChild("Cooldown") then
spawn(function() 		Six() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown6,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown6)
deez:Destroy()
end
end)
getgenv().Move6B = base.MouseButton1Click:Connect(function()
if not base:FindFirstChild("Cooldown") then
spawn(function() 		Six() end)
local deez = cdcc:Clone()
deez.Parent = base
game:GetService("TweenService"):Create(deez, 
TweenInfo.new(getgenv().Cooldown6,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,0,0)}):Play();
wait(getgenv().Cooldown6)
deez:Destroy()
end
end)

function SetEvadeVFX(col,col2,hlcol,cfr)
spawn(function()
for i = 1,25 do 
task.wait(.01)
spawn(function()

local h = Instance.new('Highlight',char)
h.FillTransparency = 0
h.FillColor = hlcol
h.OutlineTransparency = 1
game.TweenService:Create(h,TweenInfo.new(.9),{FillTransparency = 1}):Play()
task.delay(.9,function() h:Destroy() end)
local p = Instance.new('Part')
p.Parent = h
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=col
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(2,2,15)
p.CFrame = char['Right Arm'].CFrame*
CFrame.new(math.random(-5,5)*5,math.random(-5,5)*5,math.random(-5,5)*5)
*CFrame.Angles(math.random(-5,5)*3,math.random(-5,5)*3,math.random(-5,5)*3)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})

bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(.5,-5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
col), ColorSequenceKeypoint.new(1.00,
col2)}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'VelocityPerpendicular'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'GlowS'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(3,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
col), ColorSequenceKeypoint.new(1.00,
col2)}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
col), ColorSequenceKeypoint.new(1.00,
col2)}
end)
task.delay(.3,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,0,20)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
Transparency = 1,
Position = 
char['Right Arm'].Position
}):Play()

p.CFrame = 
CFrame.lookAt(p.Position, char['Right Arm'].Position) 
end) end end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18435535291"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
spawn(function()
task.wait(.3)
k:Stop(.7) end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://7094593247'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 1.5 s:Play()
task.spawn(function() task.wait(.4) 
s.Volume = .5
task.wait(.4)
s.Volume = .2
s:Destroy() end)
if cfr == 'purity' then 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://134494086123052"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Idle
k:AdjustSpeed(.3)
local bv = Instance.new('BodyVelocity')
bv.Parent = hrp task.delay(9,function() bv:Destroy()  end)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
task.delay(1,function() bv.MaxForce = Vector3.new(0, 9e9, 0) end)

for i = 1,55 do 
bv.Velocity = Vector3.new(0,25-i/2,0)
task.wait(.1) end k:Stop(1)
else 
for i = 1,35 do
char.Torso.DashSpin:Emit(1)
char.Torso.DashSpin1:Emit(1)
hrp.CFrame =  hrp.CFrame 
*cfr
task.wait(.01) end
end
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14542032218"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = .9
task.wait(.7)
k:Stop()
end
getgenv().Downslam = char.Humanoid.AnimationPlayed:Connect(function(v)
if v.Animation.AnimationId == "rbxassetid://10470104242" then
v:Stop()
local lol = game:GetService("UserInputService").JumpRequest:Connect(function() 
if db == true then return end
db = true 
task.delay(1,function() db = false end)
if getgenv().TRUEMODE == 'Divinity' then
SetEvadeVFX(Color3.new(1,1,0),Color3.new(1,1,0),Color3.new(1,1,0),CFrame.new(0,0,.8))
elseif getgenv().TRUEMODE == 'Chaos' then
spawn(function()
for i = 1,25 do 
task.wait(.01)
spawn(function()

local h = Instance.new('Highlight',char)
h.FillTransparency = 0
h.FillColor = BrickColor.random().Color
h.OutlineTransparency = 1
game.TweenService:Create(h,TweenInfo.new(.9),{FillTransparency = 1}):Play()
task.delay(.9,function() h:Destroy() end)
local p = Instance.new('Part')
p.Parent = h
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=BrickColor.random().Color
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(2,2,15)
p.CFrame = char['Right Arm'].CFrame*
CFrame.new(math.random(-5,5)*5,math.random(-5,5)*5,math.random(-5,5)*5)
*CFrame.Angles(math.random(-5,5)*3,math.random(-5,5)*3,math.random(-5,5)*3)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})

bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(.5,-5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'VelocityPerpendicular'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'GlowS'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(3,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
BrickColor.random().Color), ColorSequenceKeypoint.new(1.00,
BrickColor.random().Color)}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00,
Color3.fromRGB(252, 255, 255))}
end)
task.delay(.3,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,0,20)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
Transparency = 1,
Position = 
char['Right Arm'].Position
}):Play()

p.CFrame = 
CFrame.lookAt(p.Position, char['Right Arm'].Position) 
end) end end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18435535291"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
spawn(function()
task.wait(.3)
k:Stop(.7) end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://7094593247'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 1.5 s:Play()
task.spawn(function() task.wait(.4) 
s.Volume = .5
task.wait(.4)
s.Volume = .2
s:Destroy() end)
for i = 1,35 do
char.Torso.DashSpin:Emit(1)
char.Torso.DashSpin1:Emit(1)
hrp.CFrame =  hrp.CFrame 
*CFrame.new(0,0,.8)
task.wait(.01) end

---------------
elseif getgenv().TRUEMODE == 'Rainbow' then
spawn(function()
for i = 1,25 do 
task.wait(.01)
spawn(function()

local h = Instance.new('Highlight',char)
h.FillTransparency = 0
h.FillColor = Color3.fromHSV(getgenv().Rainbow,1,1)
h.OutlineTransparency = 1
game.TweenService:Create(h,TweenInfo.new(.9),{FillTransparency = 1}):Play()
task.delay(.9,function() h:Destroy() end)
local p = Instance.new('Part')
p.Parent = h
p.Material = Enum.Material.Neon 
p.Size=Vector3.new(1,1,1)
p.Anchored=true p.CanCollide=false
local msh2 = Instance.new("SpecialMesh",p)
msh2.MeshType = "Sphere"
p.Color=Color3.fromHSV(getgenv().Rainbow,1,1)
local rndlol = math.random(-5,5)/3
msh2.Scale = Vector3.new(2,2,15)
p.CFrame = char['Right Arm'].CFrame*
CFrame.new(math.random(-5,5)*5,math.random(-5,5)*5,math.random(-5,5)*5)
*CFrame.Angles(math.random(-5,5)*3,math.random(-5,5)*3,math.random(-5,5)*3)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1

bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'FakeStar'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(1,5)),
NumberSequenceKeypoint.new(1,0)
})

bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,5),
NumberSequenceKeypoint.new(.5,-5),
NumberSequenceKeypoint.new(.5,0),
NumberSequenceKeypoint.new(1,0)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.6-i/77),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromHSV(getgenv().Rainbow,1,1)), ColorSequenceKeypoint.new(1.00,
Color3.fromHSV(getgenv().Rainbow,1,1))}
bld.Speed = NumberRange.new(0)
bld.VelocitySpread = 50000
bld.ZOffset = -5
bld.Rotation = NumberRange.new(90)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Rate = 0 end)
local bld = Instance.new("ParticleEmitter",p)
bld.LightEmission = 1
bld.Brightness = 1
bld.Orientation = 'VelocityPerpendicular'
bld.Texture = "rbxassetid://6673021984"
bld.Rate = 155
bld.Name = 'GlowS'
bld.Lifetime = NumberRange.new(.1)
bld.Size = NumberSequence.new({
NumberSequenceKeypoint.new(0,math.random(3,5)*3),
NumberSequenceKeypoint.new(1,0)
})
bld.Squash=NumberSequence.new({
NumberSequenceKeypoint.new(0,2),
NumberSequenceKeypoint.new(1,2)})
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.9),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromHSV(getgenv().Rainbow,1,1)), ColorSequenceKeypoint.new(1.00,
Color3.fromHSV(getgenv().Rainbow,1,1))}
bld.Speed = NumberRange.new(1)
bld.VelocitySpread = 0
bld.ZOffset = 0
bld.Rotation = NumberRange.new(0)
bld:Emit(1)
bld.LockedToPart = true
task.delay(.1,function()
bld.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(.1,.8),
NumberSequenceKeypoint.new(1,1)})
bld.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromHSV(getgenv().Rainbow,1,1)), ColorSequenceKeypoint.new(1.00,
Color3.fromHSV(getgenv().Rainbow,1,1))}
end)
task.delay(.3,function()
bld.Rate = 0 end)
game:GetService("Debris"):AddItem(p, 1)
game.TweenService:Create(msh2,TweenInfo.new(.2),{
Scale=Vector3.new(0,0,20)
}):Play()
game.TweenService:Create(p,TweenInfo.new(.3),{
Transparency = 1,
Position = 
char['Right Arm'].Position
}):Play()

p.CFrame = 
CFrame.lookAt(p.Position, char['Right Arm'].Position) 
end) end end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://18435535291"
local k = char.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action4
k:AdjustSpeed(1)
spawn(function()
task.wait(.3)
k:Stop(.7) end)
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://7094593247'
s.TimePosition = 0
s.PlaybackSpeed = 1
s.Volume = 1.5 s:Play()
task.spawn(function() task.wait(.4) 
s.Volume = .5
task.wait(.4)
s.Volume = .2
s:Destroy() end)
for i = 1,35 do
char.Torso.DashSpin:Emit(1)
char.Torso.DashSpin1:Emit(1)
hrp.CFrame =  hrp.CFrame 
*CFrame.new(0,0,3.8)
task.wait(.01) end

elseif getgenv().TRUEMODE == 'Mayhem' then
SetEvadeVFX(Color3.new(1,0,0),Color3.new(1,0,0),Color3.new(0,0,0),
CFrame.new(0,0,1.2))
elseif getgenv().TRUEMODE == 'Purity' then
SetEvadeVFX(Color3.new(0,1,1),Color3.new(0,1,1),Color3.new(0,1,1),
'purity')
elseif getgenv().TRUEMODE == 'Corruption' then
SetEvadeVFX(Color3.new(.5,0,.5),Color3.new(.5,0,.5),Color3.new(.2,0,.2),
CFrame.new(0,0,2))
elseif getgenv().TRUEMODE == 'Equinox' then
SetEvadeVFX(Color3.new(0,0,0),Color3.new(0,0,0),Color3.new(1,1,1),
CFrame.new(0,0,2))
elseif getgenv().TRUEMODE == 'Big Black' then
SetEvadeVFX(Color3.new(1,1,1),Color3.new(1,1,1),Color3.new(0,0,0),
CFrame.new(0,0,2))
elseif 
getgenv().TRUEMODE == 'Crazed' or 
getgenv().TRUEMODE == 'Zyldeon' or 
getgenv().TRUEMODE == 'Quivarence' or 
getgenv().TRUEMODE == 'Efferox'  then
SetEvadeVFX(Color3.new(0,0,1),Color3.new(1,1,1),Color3.new(0,0,1),
CFrame.new(0,0,2))
elseif getgenv().TRUEMODE == 'persistence' then
SetEvadeVFX(Color3.new(0,0,1),Color3.new(1,1,1),Color3.new(0,0,1),
CFrame.new(0,0,2))
elseif getgenv().TRUEMODE == 'Rainbow' then
SetEvadeVFX('Rainbow')
elseif getgenv().TRUEMODE == 'ULTRASONIC' then
SetEvadeVFX(Color3.new(1,1,1),Color3.new(1,1,1),Color3.new(1,1,1),
CFrame.new(0,0,5))
elseif getgenv().TRUEMODE == 'Euclidean' then
SetEvadeVFX(Color3.new(0,0,1),Color3.new(1,0,0),Color3.new(0,0,1),
CFrame.new(0,0,5))
elseif getgenv().TRUEMODE == 'Destiny' or getgenv().TRUEMODE == 'Calamity' then
SetEvadeVFX(Color3.new(.5,.2,.5),Color3.new(.9,.2,.9),Color3.new(.5,.2,.5),
CFrame.new(0,0,2))

--155,55,155,255,155,255
else 
SetEvadeVFX(Color3.new(1,1,1),Color3.new(1,1,1),Color3.new(1,1,1),
CFrame.new(0,0,2))
end end)

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://14542032218"
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k.Priority = Enum.AnimationPriority.Action3
k:AdjustSpeed(1)
k.TimePosition = .9
task.wait(.7)
k:Stop()
lol:Disconnect()
end end)


function _G.RefreshUI()
pcall(function() getgenv().MenuHeartbeat:Disconnect() end)
if getgenv().ModeUI == true then 
task.delay(.2,function()
pcall(function() game.CoreGui.SGRevitalizedUI:Destroy() end)
local StarGlitcherv2 = Instance.new("ScreenGui")
local Left = Instance.new("Frame")
local Spinners = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Back = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Center = Instance.new("ImageLabel")
local OuterCircle1 = Instance.new("ImageLabel")
local OuterCircle2 = Instance.new("ImageLabel")
local Spin1 = Instance.new("ImageLabel")
local Spin2 = Instance.new("ImageLabel")
local Side_BG = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local Form_BG = Instance.new("Frame")
local UIGradient_2 = Instance.new("UIGradient")
local Form = Instance.new("TextLabel")
local Side = Instance.new("TextLabel")
local icon = Instance.new("ImageLabel")
local Inner = Instance.new("ImageLabel")
local Stroke = Instance.new("ImageLabel")
local LowerFrameBG = Instance.new("Frame")
local UIGradient_3 = Instance.new("UIGradient")
local Credits = Instance.new("TextLabel")
local icon_2 = Instance.new("ImageLabel")
local UIScale = Instance.new("UIScale")
local Right = Instance.new("Frame")
local UIScale_2 = Instance.new("UIScale")
local Inner_2 = Instance.new("ImageLabel")
local Stroke_2 = Instance.new("ImageLabel")
local Music = Instance.new("TextLabel")
local MusicBar_BG = Instance.new("Frame")
local Main = Instance.new("Frame")
local UIGradient_4 = Instance.new("UIGradient")
local UIPadding = Instance.new("UIPadding")
local Bar = Instance.new("Frame")
local Spinnyz = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Center_2 = Instance.new("ImageLabel")
local OuterCircle2_2 = Instance.new("ImageLabel")
local Spin1_2 = Instance.new("ImageLabel")
local Spin2_2 = Instance.new("ImageLabel")
local OuterCircle1_2 = Instance.new("ImageLabel")
local Time = Instance.new("TextLabel")
local Music_BG = Instance.new("Frame")
local UIGradient_5 = Instance.new("UIGradient")
if getgenv().potato_device == true then 
potdly = 1 
else 
potdly = .01

end

if getgenv()._r == 'chaos' then
spawn(function()
for i = 1,999999 do 
if getgenv().Looping_55 == true then break end
local rndcol = BrickColor.random().Color
local rndcol2 = BrickColor.random().Color
Music_BG.BackgroundColor3 = rndcol
Music_BG.BorderColor3 = rndcol
Time.TextColor3 = rndcol
Spinnyz.BackgroundColor3 = rndcol
Bar.BackgroundColor3 = rndcol
Main.BorderColor3 = rndcol
LowerFrameBG.BackgroundColor3 = rndcol
Spinners.BackgroundColor3 = rndcol
Back.BackgroundColor3 = rndcol
Side_BG.BorderColor3 = rndcol
Spin2_2.ImageColor3 = rndcol
OuterCircle2_2.ImageColor3 = rndcol
Music.TextStrokeColor3 = rndcol
Stroke_2.ImageColor3 = rndcol
icon_2.ImageColor3 = rndcol
Credits.TextStrokeColor3 = rndcol
LowerFrameBG.BorderColor3 = rndcol
Stroke.ImageColor3 = rndcol
icon.ImageColor3 = rndcol
Side.TextStrokeColor3 = rndcol
Form.TextStrokeColor3 = rndcol
Form_BG.BorderColor3 = rndcol
Spin2.ImageColor3 = rndcol
OuterCircle2.ImageColor3 = rndcol
OuterCircle1_2.ImageColor3 = rndcol

Time.TextStrokeColor3 = rndcol2
OuterCircle1.ImageColor3 = rndcol2
Spin1_2.ImageColor3 = rndcol2
Center_2.ImageColor3 = rndcol2
Main.BackgroundColor3 = rndcol2
Music.TextColor3 = rndcol2
Inner_2.ImageColor3 = rndcol2
Credits.TextColor3 = rndcol2
Inner.ImageColor3 = rndcol2
Side.TextColor3 = rndcol2
Form.TextColor3 = rndcol2
Form_BG.BackgroundColor3 = rndcol2
Side_BG.BackgroundColor3 = rndcol2
Spin1.ImageColor3 = rndcol2
Center.ImageColor3 = rndcol2
task.wait(potdly) end
end)
elseif getgenv()._r == 'crazed' then 
spawn(function()
for i = 1,999999 do 
if getgenv().Looping_55 == true then break end
local rndcol = Color3.fromRGB(0,0,math.random(0,155))
local rndcol2 = Color3.fromRGB(0,0,math.random(0,155))
Music_BG.BackgroundColor3 = rndcol
Music_BG.BorderColor3 = rndcol
Time.TextColor3 = rndcol
Spinnyz.BackgroundColor3 = rndcol
Bar.BackgroundColor3 = rndcol
Main.BorderColor3 = rndcol
LowerFrameBG.BackgroundColor3 = rndcol
Spinners.BackgroundColor3 = rndcol
Back.BackgroundColor3 = rndcol
Side_BG.BorderColor3 = rndcol
Spin2_2.ImageColor3 = rndcol
OuterCircle2_2.ImageColor3 = rndcol
Music.TextStrokeColor3 = rndcol
Stroke_2.ImageColor3 = rndcol
icon_2.ImageColor3 = rndcol
Credits.TextStrokeColor3 = rndcol
LowerFrameBG.BorderColor3 = rndcol
Stroke.ImageColor3 = rndcol
icon.ImageColor3 = rndcol
Side.TextStrokeColor3 = rndcol
Form.TextStrokeColor3 = rndcol
Form_BG.BorderColor3 = rndcol
Spin2.ImageColor3 = rndcol
OuterCircle2.ImageColor3 = rndcol
OuterCircle1_2.ImageColor3 = rndcol

Time.TextStrokeColor3 = rndcol2
OuterCircle1.ImageColor3 = rndcol2
Spin1_2.ImageColor3 = rndcol2
Center_2.ImageColor3 = rndcol2
Main.BackgroundColor3 = rndcol2
Music.TextColor3 = rndcol2
Inner_2.ImageColor3 = rndcol2
Credits.TextColor3 = rndcol2
Inner.ImageColor3 = rndcol2
Side.TextColor3 = rndcol2
Form.TextColor3 = rndcol2
Form_BG.BackgroundColor3 = rndcol2
Side_BG.BackgroundColor3 = rndcol2
Spin1.ImageColor3 = rndcol2
Center.ImageColor3 = rndcol2
task.wait(potdly) end
end)
elseif getgenv()._r == 'UltraSonic' then 
spawn(function()
for i = 1,999999 do 
if getgenv().Looping_55 == true then break end
local sex = math.random(0,255)
local rndcol = Color3.fromRGB(sex/5,sex/5,sex/5)
local rndcol2 = Color3.fromRGB(sex,sex,sex)
Music_BG.BackgroundColor3 = rndcol
Music_BG.BorderColor3 = rndcol
Time.TextColor3 = rndcol
Spinnyz.BackgroundColor3 = rndcol
Bar.BackgroundColor3 = rndcol
Main.BorderColor3 = rndcol
LowerFrameBG.BackgroundColor3 = rndcol
Spinners.BackgroundColor3 = rndcol
Back.BackgroundColor3 = rndcol
Side_BG.BorderColor3 = rndcol
Spin2_2.ImageColor3 = rndcol
OuterCircle2_2.ImageColor3 = rndcol
Music.TextStrokeColor3 = rndcol
Stroke_2.ImageColor3 = rndcol
icon_2.ImageColor3 = rndcol
Credits.TextStrokeColor3 = rndcol
LowerFrameBG.BorderColor3 = rndcol
Stroke.ImageColor3 = rndcol
icon.ImageColor3 = rndcol
Side.TextStrokeColor3 = rndcol
Form.TextStrokeColor3 = rndcol
Form_BG.BorderColor3 = rndcol
Spin2.ImageColor3 = rndcol
OuterCircle2.ImageColor3 = rndcol
OuterCircle1_2.ImageColor3 = rndcol

Time.TextStrokeColor3 = rndcol2
OuterCircle1.ImageColor3 = rndcol2
Spin1_2.ImageColor3 = rndcol2
Center_2.ImageColor3 = rndcol2
Main.BackgroundColor3 = rndcol2
Music.TextColor3 = rndcol2
Inner_2.ImageColor3 = rndcol2
Credits.TextColor3 = rndcol2
Inner.ImageColor3 = rndcol2
Side.TextColor3 = rndcol2
Form.TextColor3 = rndcol2
Form_BG.BackgroundColor3 = rndcol2
Side_BG.BackgroundColor3 = rndcol2
Spin1.ImageColor3 = rndcol2
Center.ImageColor3 = rndcol2
task.wait(potdly) end
end)
elseif getgenv()._r == 'pandemonium' then 
spawn(function()
for i = 1,999999 do 
if getgenv().Looping_55 == true then break end
local rndcol = Color3.fromRGB(math.random(0,155),0,0)
local rndcol2 = Color3.fromRGB(math.random(0,155),0,0)
Music_BG.BackgroundColor3 = rndcol
Music_BG.BorderColor3 = rndcol
Time.TextColor3 = rndcol
Spinnyz.BackgroundColor3 = rndcol
Bar.BackgroundColor3 = rndcol
Main.BorderColor3 = rndcol
LowerFrameBG.BackgroundColor3 = rndcol
Spinners.BackgroundColor3 = rndcol
Back.BackgroundColor3 = rndcol
Side_BG.BorderColor3 = rndcol
Spin2_2.ImageColor3 = rndcol
OuterCircle2_2.ImageColor3 = rndcol
Music.TextStrokeColor3 = rndcol
Stroke_2.ImageColor3 = rndcol
icon_2.ImageColor3 = rndcol
Credits.TextStrokeColor3 = rndcol
LowerFrameBG.BorderColor3 = rndcol
Stroke.ImageColor3 = rndcol
icon.ImageColor3 = rndcol
Side.TextStrokeColor3 = rndcol
Form.TextStrokeColor3 = rndcol
Form_BG.BorderColor3 = rndcol
Spin2.ImageColor3 = rndcol
OuterCircle2.ImageColor3 = rndcol
OuterCircle1_2.ImageColor3 = rndcol

Time.TextStrokeColor3 = rndcol2
OuterCircle1.ImageColor3 = rndcol2
Spin1_2.ImageColor3 = rndcol2
Center_2.ImageColor3 = rndcol2
Main.BackgroundColor3 = rndcol2
Music.TextColor3 = rndcol2
Inner_2.ImageColor3 = rndcol2
Credits.TextColor3 = rndcol2
Inner.ImageColor3 = rndcol2
Side.TextColor3 = rndcol2
Form.TextColor3 = rndcol2
Form_BG.BackgroundColor3 = rndcol2
Side_BG.BackgroundColor3 = rndcol2
Spin1.ImageColor3 = rndcol2
Center.ImageColor3 = rndcol2
task.wait(potdly) end
end)
elseif getgenv()._r == 'Rainbow' then 
spawn(function()
for i = 1,999999 do 
if getgenv().Looping_55 == true then break end
local rndcol = Color3.fromHSV(getgenv().Rainbow,1,1)
local rndcol2 = Color3.fromHSV(getgenv().Rainbow,.2,.2)
Music_BG.BackgroundColor3 = rndcol
Music_BG.BorderColor3 = rndcol
Time.TextColor3 = rndcol
Spinnyz.BackgroundColor3 = rndcol
Bar.BackgroundColor3 = rndcol
Main.BorderColor3 = rndcol
LowerFrameBG.BackgroundColor3 = rndcol
Spinners.BackgroundColor3 = rndcol
Back.BackgroundColor3 = rndcol
Side_BG.BorderColor3 = rndcol
Spin2_2.ImageColor3 = rndcol
OuterCircle2_2.ImageColor3 = rndcol
Music.TextStrokeColor3 = rndcol
Stroke_2.ImageColor3 = rndcol
icon_2.ImageColor3 = rndcol
Credits.TextStrokeColor3 = rndcol
LowerFrameBG.BorderColor3 = rndcol
Stroke.ImageColor3 = rndcol
icon.ImageColor3 = rndcol
Side.TextStrokeColor3 = rndcol
Form.TextStrokeColor3 = rndcol
Form_BG.BorderColor3 = rndcol
Spin2.ImageColor3 = rndcol
OuterCircle2.ImageColor3 = rndcol
OuterCircle1_2.ImageColor3 = rndcol

Time.TextStrokeColor3 = rndcol2
OuterCircle1.ImageColor3 = rndcol2
Spin1_2.ImageColor3 = rndcol2
Center_2.ImageColor3 = rndcol2
Main.BackgroundColor3 = rndcol2
Music.TextColor3 = rndcol2
Inner_2.ImageColor3 = rndcol2
Credits.TextColor3 = rndcol2
Inner.ImageColor3 = rndcol2
Side.TextColor3 = rndcol2
Form.TextColor3 = rndcol2
Form_BG.BackgroundColor3 = rndcol2
Side_BG.BackgroundColor3 = rndcol2
Spin1.ImageColor3 = rndcol2
Center.ImageColor3 = rndcol2
task.wait(potdly) end
end)
else 
Music_BG.BackgroundColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Music_BG.BorderColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Time.TextColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Time.TextStrokeColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Spinnyz.BackgroundColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Bar.BackgroundColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Main.BorderColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
LowerFrameBG.BackgroundColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Spinners.BackgroundColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Back.BackgroundColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Side_BG.BorderColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Spin2_2.ImageColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
OuterCircle2_2.ImageColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Music.TextStrokeColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Stroke_2.ImageColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
icon_2.ImageColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Credits.TextStrokeColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
LowerFrameBG.BorderColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Stroke.ImageColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
icon.ImageColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Side.TextStrokeColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Form.TextStrokeColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Form_BG.BorderColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
Spin2.ImageColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
OuterCircle2.ImageColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
OuterCircle1_2.ImageColor3 = Color3.fromRGB(getgenv()._r, getgenv()._g, getgenv()._b)
OuterCircle1.ImageColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Spin1_2.ImageColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Center_2.ImageColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Main.BackgroundColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Music.TextColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Inner_2.ImageColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Credits.TextColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Inner.ImageColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Side.TextColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Form.TextColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Form_BG.BackgroundColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Side_BG.BackgroundColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Spin1.ImageColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
Center.ImageColor3 = Color3.fromRGB(getgenv().r, getgenv().g, getgenv().b)
end
StarGlitcherv2.Name = "SGRevitalizedUI"
StarGlitcherv2.Parent = game.CoreGui
StarGlitcherv2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Left.Name = "Left"
Left.Parent = StarGlitcherv2
Left.AnchorPoint = Vector2.new(0, 1)
Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Left.BackgroundTransparency = 1.000
Left.Position = UDim2.new(0, 0, 1, 0)
Left.Size = UDim2.new(0, 150, 0, 150)

Spinners.Name = "Spinners"
Spinners.Parent = Left
Spinners.AnchorPoint = Vector2.new(0.5, 0.5)
Spinners.BackgroundTransparency = 0.600
Spinners.Position = UDim2.new(0.300000012, 0, 0.699999988, 0)
Spinners.Size = UDim2.new(2, 0, 2, 0)

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Spinners

Back.Name = "Back"
Back.Parent = Spinners
Back.BackgroundTransparency = 0.600
Back.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
Back.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
Back.ZIndex = 0

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = Back

Center.Name = "Center"
Center.Parent = Spinners
Center.AnchorPoint = Vector2.new(0.5, 0.5)
Center.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Center.BackgroundTransparency = 1.000
Center.Position = UDim2.new(0.5, 0, 0.5, 0)
Center.Rotation = 45.000
Center.Size = UDim2.new(1, 20, 1, 20)
Center.ZIndex = 0
Center.Image = "rbxassetid://2273224484"

OuterCircle1.Name = "OuterCircle1"
OuterCircle1.Parent = Spinners
OuterCircle1.AnchorPoint = Vector2.new(0.5, 0.5)
OuterCircle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OuterCircle1.BackgroundTransparency = 1.000
OuterCircle1.Position = UDim2.new(0.5, 0, 0.5, 0)
OuterCircle1.Rotation = 45.000
OuterCircle1.Size = UDim2.new(1, 0, 1, 0)
OuterCircle1.ZIndex = 2
OuterCircle1.Image = "rbxassetid://2312119891"


OuterCircle2.Name = "OuterCircle2"
OuterCircle2.Parent = Spinners
OuterCircle2.AnchorPoint = Vector2.new(0.5, 0.5)
OuterCircle2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OuterCircle2.BackgroundTransparency = 1.000
OuterCircle2.Position = UDim2.new(0.5, 0, 0.5, 0)
OuterCircle2.Rotation = 45.000
OuterCircle2.Size = UDim2.new(1, 60, 1, 60)
OuterCircle2.ZIndex = 4
OuterCircle2.Image = "rbxassetid://2312119891"


Spin1.Name = "Spin1"
Spin1.Parent = Spinners
Spin1.AnchorPoint = Vector2.new(0.5, 0.5)
Spin1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Spin1.BackgroundTransparency = 1.000
Spin1.Position = UDim2.new(0.5, 0, 0.5, 0)
Spin1.Rotation = 45.000
Spin1.Size = UDim2.new(1, 100, 1, 100)
Spin1.Image = "rbxassetid://2325939897"

Spin2.Name = "Spin2"
Spin2.Parent = Spinners
Spin2.AnchorPoint = Vector2.new(0.5, 0.5)
Spin2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Spin2.BackgroundTransparency = 1.000
Spin2.Position = UDim2.new(0.5, 0, 0.5, 0)
Spin2.Rotation = 45.000
Spin2.Size = UDim2.new(1, 160, 1, 160)
Spin2.Image = "rbxassetid://2325939897"

Spin2.ImageTransparency = 0.250

Side_BG.Name = "Side_BG"
Side_BG.Parent = Left
Side_BG.AnchorPoint = Vector2.new(0, 0.5)
Side_BG.BorderSizePixel = 3
Side_BG.Position = UDim2.new(0, 0, 0.649999976, 0)
Side_BG.Size = UDim2.new(0, 299, 0.200000003, 0)
Side_BG.ZIndex = 2

UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.18, 0.11), NumberSequenceKeypoint.new(0.44, 0.31), NumberSequenceKeypoint.new(0.60, 0.43), NumberSequenceKeypoint.new(0.74, 0.49), NumberSequenceKeypoint.new(0.81, 0.55), NumberSequenceKeypoint.new(0.87, 0.61), NumberSequenceKeypoint.new(0.90, 0.79), NumberSequenceKeypoint.new(0.95, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
UIGradient.Parent = Side_BG

Form_BG.Name = "Form_BG"
Form_BG.Parent = Left
Form_BG.AnchorPoint = Vector2.new(0, 0.5)
Form_BG.BorderSizePixel = 4
Form_BG.Position = UDim2.new(0, 0, 0.300000012, 0)
Form_BG.Size = UDim2.new(0, 437, 0.400000006, 0)
Form_BG.ZIndex = 2

UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.18, 0.11), NumberSequenceKeypoint.new(0.44, 0.31), NumberSequenceKeypoint.new(0.60, 0.43), NumberSequenceKeypoint.new(0.74, 0.49), NumberSequenceKeypoint.new(0.81, 0.55), NumberSequenceKeypoint.new(0.87, 0.61), NumberSequenceKeypoint.new(0.90, 0.79), NumberSequenceKeypoint.new(0.95, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
UIGradient_2.Parent = Form_BG

Form.Name = "Form"
Form.Parent = Left
Form.AnchorPoint = Vector2.new(0, 0.5)
Form.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Form.BackgroundTransparency = 1.000
Form.Position = UDim2.new(0.200000003, 0, 0.300000012, 0)
Form.Size = UDim2.new(4, 0, 0.400000006, 0)
Form.ZIndex = 4
Form.Text = 'Loading..'
Music.Text = 'Loading..'
Form.Font = Enum.Font.Antique
task.delay(.1,function()
Form.Text = getgenv().TRUEMODE
Music.Text = getgenv().MUSIC_CREDS
end)
spawn(function()
for i = 1,9999999999 do 
Left.Form.Position = 
UDim2.new(
.2+math.sin(i/55)/15
, 0, 
0.2500000012+math.cos(i/55)/55
, 0)
Right.Music.Position = 
UDim2.new(1+math.sin(i/55)/25, -120, 0.600000024+math.cos(i/55)/120, 0)
task.wait(.01) end end)
Form.TextScaled = true
Form.TextSize = 14.000
Form.TextStrokeTransparency = 0.000
Form.TextWrapped = true
Form.TextXAlignment = Enum.TextXAlignment.Left

Side.Name = "Side"
Side.Parent = Left
Side.AnchorPoint = Vector2.new(0, 0.5)
Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Side.BackgroundTransparency = 1.000
Side.Position = UDim2.new(0.200000003, 0, 0.649999976, 0)
Side.Size = UDim2.new(2, 0, 0.150000006, 0)
Side.ZIndex = 4
Side.Font = Enum.Font.Oswald
local text = "SPECTRUM"
Side.Text = text
local SpecFinished = false 
local CredFinished = false
spawn(function()
task.wait(1)
while true do

for i = 1, #text do
local newText = ""
for j = 1, #text do
if j == i then
newText = newText .. string.lower(text:sub(j, j))
else
newText = newText .. string.upper(text:sub(j, j))
end
end
if getgenv().Break == true then return end
Side.Text = newText
task.wait(.1) end
end
end)
spawn(function()

task.wait(1)
while true do

for i = 1, #menutxt do

local newText = ""
for j = 1, #menutxt do

if j == i then

newText = newText .. string.lower(menutxt:sub(j, j))
else
newText = newText .. string.upper(menutxt:sub(j, j))
end
end
if getgenv().Break == true then return end
Credits.Text = newText
task.wait(.1) end
end
end)
Side.TextScaled = true
Side.TextSize = 14.000
Side.TextStrokeTransparency = 0.000
Side.TextWrapped = true
Side.TextXAlignment = Enum.TextXAlignment.Left

icon.Name = "icon"
icon.Parent = Side
icon.AnchorPoint = Vector2.new(1, 0.5)
icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
icon.BackgroundTransparency = 1.000
icon.Position = UDim2.new(0, -2, 0.5, 0)
icon.Size = UDim2.new(0, 25, 0, 25)
icon.Image = "rbxassetid://5021034669"

Inner.Name = "Inner"
Inner.Parent = Left
Inner.AnchorPoint = Vector2.new(0, 1)
Inner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Inner.BackgroundTransparency = 1.000
Inner.Position = UDim2.new(0, 0, 1, 0)
Inner.Size = UDim2.new(0.75, 0, 0.75, 0)
Inner.ZIndex = 3
Inner.Image = "http://www.roblox.com/asset/?id=10375874722"

Stroke.Name = "Stroke"
Stroke.Parent = Left
Stroke.AnchorPoint = Vector2.new(0, 1)
Stroke.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Stroke.BackgroundTransparency = 1.000
Stroke.Position = UDim2.new(0, 0, 1, 0)
Stroke.Size = UDim2.new(1, 0, 1, 0)
Stroke.Image = "http://www.roblox.com/asset/?id=10375874722"
LowerFrameBG.Name = "LowerFrameBG"
LowerFrameBG.Parent = Left
LowerFrameBG.AnchorPoint = Vector2.new(0, 0.5)
LowerFrameBG.BorderSizePixel = 2
LowerFrameBG.Position = UDim2.new(0, 0, 0.859999835, 0)
LowerFrameBG.Size = UDim2.new(-0.83504045, 406, 0.110314824, 7)
LowerFrameBG.ZIndex = 2

UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.18, 0.11), NumberSequenceKeypoint.new(0.44, 0.31), NumberSequenceKeypoint.new(0.60, 0.43), NumberSequenceKeypoint.new(0.74, 0.49), NumberSequenceKeypoint.new(0.81, 0.55), NumberSequenceKeypoint.new(0.87, 0.61), NumberSequenceKeypoint.new(0.90, 0.79), NumberSequenceKeypoint.new(0.95, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
UIGradient_3.Parent = LowerFrameBG

Credits.Name = "Credits"
Credits.Parent = Left
Credits.AnchorPoint = Vector2.new(0, 0.5)
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.Position = UDim2.new(0.199999973, 0, 0.859999895, 0)
Credits.Size = UDim2.new(1.58113408, 0, 0.135000005, 0)
Credits.ZIndex = 4
Credits.Font = Enum.Font.Oswald
Credits.Text = menutxt
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextStrokeTransparency = 0.000
Credits.TextWrapped = true
Credits.TextXAlignment = Enum.TextXAlignment.Left

icon_2.Name = "icon"
icon_2.Parent = Credits
icon_2.AnchorPoint = Vector2.new(1, 0.5)
icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
icon_2.BackgroundTransparency = 1.000
icon_2.Position = UDim2.new(0, -2, 0.5, 0)
icon_2.Size = UDim2.new(0, 25, 0, 25)
icon_2.Image = "rbxassetid://5021034669"

UIScale.Parent = Left
UIScale.Scale = 1.284

Right.Name = "Right"
Right.Parent = StarGlitcherv2
Right.AnchorPoint = Vector2.new(0.790000021, 0.790000021)
Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Right.BackgroundTransparency = 1.000
Right.Position = UDim2.new(1, 0, 1, 0)
Right.Size = UDim2.new(0, 400, 0, 400)

UIScale_2.Parent = Right
UIScale_2.Scale = 1.271

Inner_2.Name = "Inner"
Inner_2.Parent = Right
Inner_2.AnchorPoint = Vector2.new(1, 1)
Inner_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Inner_2.BackgroundTransparency = 1.000
Inner_2.Position = UDim2.new(1, 0, 1, 0)
Inner_2.Rotation = -90.000
Inner_2.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
Inner_2.ZIndex = 3
Inner_2.Image = "http://www.roblox.com/asset/?id=10375874722"

Stroke_2.Name = "Stroke"
Stroke_2.Parent = Right
Stroke_2.AnchorPoint = Vector2.new(1, 1)
Stroke_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Stroke_2.BackgroundTransparency = 1.000
Stroke_2.Position = UDim2.new(1, 0, 1, 0)
Stroke_2.Rotation = -90.000
Stroke_2.Size = UDim2.new(0, 365, 0, 365)
Stroke_2.Image = "http://www.roblox.com/asset/?id=10375874722"

Music.Name = "Music"
Music.Parent = Right
Music.AnchorPoint = Vector2.new(1, 0.5)
Music.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Music.BackgroundTransparency = 1.000
Music.Position = UDim2.new(1, -120, 0.600000024, 0)
Music.Size = UDim2.new(1.35000002, 0, 0.100000001, 0)
Music.ZIndex = 4
Music.Font = Enum.Font.Kalam
Music.TextScaled = true
Music.TextSize = 18.000

Music.TextStrokeTransparency = 0.000
Music.TextWrapped = true
Music.TextXAlignment = Enum.TextXAlignment.Right

MusicBar_BG.Name = "MusicBar_BG"
MusicBar_BG.Parent = Right
MusicBar_BG.AnchorPoint = Vector2.new(1, 0.5)
MusicBar_BG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MusicBar_BG.BackgroundTransparency = 1.000
MusicBar_BG.Position = UDim2.new(1, -120, 0.720000029, 0)
MusicBar_BG.Size = UDim2.new(0, 420, 0.0599999987, 0)
MusicBar_BG.ZIndex = 3

Main.Name = "Main"
Main.Parent = MusicBar_BG
Main.AnchorPoint = Vector2.new(0, 0.5)
Main.BorderSizePixel = 3
Main.Position = UDim2.new(0, 0, 0.5, 0)
Main.Size = UDim2.new(1, -77, 0.419999987, 0)

UIGradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.18)}
UIGradient_4.Parent = Main

UIPadding.Parent = Main
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 3)

Bar.Name = "Bar"
Bar.Parent = Main
Bar.AnchorPoint = Vector2.new(0, 0.5)
Bar.BackgroundTransparency = 0.600
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(-0.0129433423, 0, 0.500000536, 0)
Bar.Size = UDim2.new(1.02296519, 0, 0.419999957, 0)

Spinnyz.Name = "Spinnyz"
Spinnyz.Parent = Bar
Spinnyz.AnchorPoint = Vector2.new(0, 0.5)
Spinnyz.BorderColor3 = Color3.fromRGB(0, 0, 0)
Spinnyz.Position = UDim2.new(1, -7, 0.5, 0)
Spinnyz.Size = UDim2.new(0, 16, 0, 16)

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = Spinnyz

Center_2.Name = "Center"
Center_2.Parent = Spinnyz
Center_2.AnchorPoint = Vector2.new(0.5, 0.5)
Center_2.BackgroundTransparency = 1.000
Center_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Center_2.Size = UDim2.new(1, 10, 1, 10)
Center_2.ZIndex = 0
Center_2.Image = "rbxassetid://2273224484"
OuterCircle2_2.Name = "OuterCircle2"
OuterCircle2_2.Parent = Spinnyz
OuterCircle2_2.AnchorPoint = Vector2.new(0.5, 0.5)
OuterCircle2_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OuterCircle2_2.BackgroundTransparency = 1.000
OuterCircle2_2.Position = UDim2.new(0.5, 0, 0.5, 0)
OuterCircle2_2.Size = UDim2.new(1, 10, 1, 10)
OuterCircle2_2.ZIndex = 4
OuterCircle2_2.Image = "rbxassetid://2312119891"

Spin1_2.Name = "Spin1"
Spin1_2.Parent = Spinnyz
Spin1_2.AnchorPoint = Vector2.new(0.5, 0.5)
Spin1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Spin1_2.BackgroundTransparency = 1.000
Spin1_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Spin1_2.Size = UDim2.new(1, 0, 1, 0)
Spin1_2.Image = "rbxassetid://2325939897"
Spin2_2.Name = "Spin2"
Spin2_2.Parent = Spinnyz
Spin2_2.AnchorPoint = Vector2.new(0.5, 0.5)
Spin2_2.BackgroundTransparency = 1.000
Spin2_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Spin2_2.Size = UDim2.new(1, 10, 1, 10)
Spin2_2.Image = "rbxassetid://2325939897"

OuterCircle1_2.Name = "OuterCircle1"
OuterCircle1_2.Parent = Spinnyz
OuterCircle1_2.AnchorPoint = Vector2.new(0.5, 0.5)
OuterCircle1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OuterCircle1_2.BackgroundTransparency = 1.000
OuterCircle1_2.Position = UDim2.new(0.5, 0, 0.5, 0)
OuterCircle1_2.Size = UDim2.new(1, 5, 1, 5)
OuterCircle1_2.ZIndex = 2
OuterCircle1_2.Image = "rbxassetid://2312119891"
Time.Name = "Time"
Time.Parent = MusicBar_BG
Time.AnchorPoint = Vector2.new(1, 0.5)
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.Position = UDim2.new(1, 35, 0.5, 0)
Time.Size = UDim2.new(0.159999996, 30, 1.20000005, 0)
Time.ZIndex = 4
Time.Font = Enum.Font.Oswald
Time.Text = "00:00/00:00"
Time.TextScaled = true
Time.TextSize = 14.000
Time.TextStrokeTransparency = 0.000
Time.TextWrapped = true

Music_BG.Name = "Music_BG"
Music_BG.Parent = Right
Music_BG.AnchorPoint = Vector2.new(1, 0.5)
Music_BG.BorderSizePixel = 4
Music_BG.Position = UDim2.new(1, -120, 0.600000024, 0)
Music_BG.Size = UDim2.new(0, 362, 0.100000001, 0)
Music_BG.ZIndex = 2

UIGradient_5.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.15, 1.00), NumberSequenceKeypoint.new(0.64, 0.00), NumberSequenceKeypoint.new(1.00, 0.00)}
UIGradient_5.Parent = Music_BG

local UserInputService = game:GetService("UserInputService")
UIScale_2.Scale = ScaleAmm
UIScale.Scale = ScaleAmm
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
UIScale_2.Scale = 0.4
UIScale.Scale = 0.4
end

-- Scripts:
local function HABHNIX_fake_script() -- Spinners.LocalScript 
local script = Instance.new('LocalScript', Spinners)

local idk = script.Parent

while wait() do
if getgenv().Looping_55 == true then break end
idk.OuterCircle1.Rotation = idk.OuterCircle1.Rotation - 7.111
idk.OuterCircle2.Rotation = idk.OuterCircle2.Rotation + 5.111
idk.Spin1.Rotation = idk.Spin1.Rotation + 11.111
idk.Spin2.Rotation = idk.Spin2.Rotation - 11.111	
idk.Center.Rotation = idk.Center.Rotation + 4.123
end
end
coroutine.wrap(HABHNIX_fake_script)()
local function JDAWWP_fake_script() -- Spinnyz.LocalScript 
local script = Instance.new('LocalScript', Spinnyz)

local idk = script.Parent

while wait() do
if getgenv().Looping_55 == true then break end
idk.OuterCircle1.Rotation = idk.OuterCircle1.Rotation - 7.111
idk.OuterCircle2.Rotation = idk.OuterCircle2.Rotation + 5.111
idk.Spin1.Rotation = idk.Spin1.Rotation + 11.111
idk.Spin2.Rotation = idk.Spin2.Rotation - 11.111	
idk.Center.Rotation = idk.Center.Rotation + 4.123
end
end
coroutine.wrap(JDAWWP_fake_script)()
local function UXBUIUP_fake_script()
task.wait(2)
local script = Instance.new('LocalScript', StarGlitcherv2)


local gui = script.Parent
local container = gui.Right.MusicBar_BG

getgenv().MenuHeartbeat = game:GetService("RunService").Heartbeat:Connect(function()
container.Main.Bar.Size = UDim2.new(
math.clamp(getgenv().music.TimePosition / getgenv().music.TimeLength, 0, 1),
0, 1, 0
)
container.Time.Text = string.format("%i:%02i - %i:%02i",
math.floor(getgenv().music.TimePosition / 60), getgenv().music.TimePosition % 60,
math.floor(getgenv().music.TimeLength / 60), getgenv().music.TimeLength % 60
)
end)

end
coroutine.wrap(UXBUIUP_fake_script)()
end)
end end 
function _G.SetDecal(col,extmeter)
pcall(function()
char.Torso.MODE_EFF:Destroy() end)
getgenv().Looping_55 = true 
task.wait(.1) 
getgenv().Looping_55 = false
local HealthBar = Instance.new("BillboardGui")
local SGFRAME1 = Instance.new("ImageLabel")
local SGFRAME2 = Instance.new("ImageLabel")

HealthBar.Name = "MODE_EFF"
HealthBar.Parent = char.Torso
HealthBar.ExtentsOffset = Vector3.new(0, 3.5, -2)
HealthBar.Size = UDim2.new(6, 0, 3, 0)

SGFRAME1.Name = "SGFRAME1"
SGFRAME1.Position = UDim2.new(-.5, 0, 0, 0)
SGFRAME1.ImageTransparency = .2
SGFRAME1.Parent = HealthBar
SGFRAME1.BackgroundTransparency = 1.000
SGFRAME1.Image = 'rbxassetid://2076458450'
SGFRAME1.Size = UDim2.new(2, 0, 4, 0)
SGFRAME1.ZIndex = -5

SGFRAME2.Name = "SGFRAME2"
SGFRAME2.Position = UDim2.new(-.5, 0, 0, 0)
SGFRAME2.ImageTransparency = .2
SGFRAME2.Parent = HealthBar
SGFRAME2.BackgroundTransparency = 1.000
SGFRAME2.Image = 'rbxassetid://2344830904'
SGFRAME2.Size = UDim2.new(2, 0, 4, 0)
SGFRAME2.ZIndex = -5

if col == 'chaos' then 
spawn(function()
for i = 1, math.huge do
if getgenv().Looping_55 == true then break end
local col = BrickColor.random().Color
local size = UDim2.new(2, math.random(-15,15)*9, 4, math.random(-15,15)*9)
SGFRAME1.ImageColor3 = col
SGFRAME1.Rotation = i*math.tan(i/15)
SGFRAME1.Size = size

SGFRAME2.ImageColor3 = col
SGFRAME2.Rotation = -20+i*math.tan(i/15)
SGFRAME2.Size = size


task.wait(.01)
end
end)
elseif col == 'big black' then 
spawn(function()
for i = 1, math.huge do
if getgenv().Looping_55 == true then break end
local col = math.random(0,1)
SGFRAME1.ImageColor3 = Color3.new(col,col,col)
SGFRAME1.Rotation = i*7

SGFRAME2.ImageColor3 = Color3.new(col,col,col)
SGFRAME2.Rotation = -20+i*7


task.wait(.01)
end
end)
elseif col == 'pandemonium' then 
spawn(function()
for i = 1, math.huge do
if getgenv().Looping_55 == true then break end
local col = math.random(0,155)
SGFRAME1.ImageColor3 = Color3.fromRGB(col,0,0)
SGFRAME1.Rotation = i*7

SGFRAME2.ImageColor3 = Color3.fromRGB(col,0,0)
SGFRAME2.Rotation = -20+i*7


task.wait(.01)
end
end)
elseif col == 'Rainbow' then 
spawn(function()
for i = 1, math.huge do
if getgenv().Looping_55 == true then break end
local col = math.random(0,155)
SGFRAME1.ImageColor3 = Color3.fromHSV(getgenv().Rainbow,1,1)
SGFRAME1.Rotation = i*7

SGFRAME2.ImageColor3 = Color3.fromHSV(getgenv().Rainbow,1,1)
SGFRAME2.Rotation = -20+i*7


task.wait(.01)
end
end)
elseif col == 'crazed' then 
spawn(function()
for i = 1, math.huge do
if getgenv().Looping_55 == true then break end
local col = math.random(0,155)
SGFRAME1.ImageColor3 = Color3.fromRGB(0,0,col)
SGFRAME1.Rotation = i*12

SGFRAME2.ImageColor3 = Color3.fromRGB(0,0,col)
SGFRAME2.Rotation = i*12


task.wait(.05)
end
end)
else 
SGFRAME1.ImageColor3 = col
SGFRAME2.ImageColor3 = col
spawn(function()
for i = 1, math.huge do
if getgenv().Looping_55 == true then break end
SGFRAME1.Rotation =  math.cos(i/55)*15+i*extmeter
SGFRAME2.Rotation =  math.cos(i/55)*15+i*extmeter
task.wait(.01)
end
end)
end


end
function _G.QuickSet(col1,col2,col3,col4,col5,col6)
if col1 == 'chaos' then 
getgenv()._r = col1
return end
if col1 == 'pandemonium' then 
getgenv()._r = col1
return end
if col1 == 'crazed' then 
getgenv()._r = col1
return end
if col1 == 'UltraSonic' then 
getgenv()._r = col1
return end
getgenv()._r = col1
getgenv()._g = col2
getgenv()._b = col3
getgenv().r = col4
getgenv().g = col5
getgenv().b = col6

end
--main shit
if char:GetAttribute('Character') == 'Purple' then
_G.twA('This is not happening...',Color3.new(1,0,0),Color3.new(.2,0,0))
SpawnAs('Mayhem')
_G.SetMusic(1)
info('Mayhem Selected.')
_G.SetWings('Mayhem')

elseif char:GetAttribute('Character') == 'Cyborg' then
    if getgenv().Class == 0 then 
SpawnAs('Purity')
info('Purity Selected.')
_G.SetWings('Purity')
_G.SetMusic(2)
elseif getgenv().Class == 1 then 
SpawnAs('Destiny')
info('Destiny Selected.')
_G.QuickSet(155,55,155,255,155,255)
getgenv().MUSIC_CREDS = 'Frums - Zephyrs'
getgenv().TRUEMODE = 'Destiny'
_G.SetDecal(Color3.new(.7, .5, .7),2)
_G.RefreshUI()
_G.SetWings(Color3.new(.7,.5,.7),true,Color3.new(.7,.5,.7))
_G.SetMusic(17,1)
end
elseif char:GetAttribute('Character') == 'Bald' then
if getgenv().Class == 0 then 
SpawnAs('Corruption')
info('Corruption Selected.')
_G.SetWings(Color3.new(.9,0,.9),true,Color3.new(.5,0,.5))
_G.SetMusic(3)
elseif getgenv().Class == 1 then 
SpawnAs('Euclidean')
info('Euclidean Selected.')
end
elseif char:GetAttribute('Character') == 'Hunter' then
if getgenv().Class == 0 then 
SpawnAs('Chaos')
info('Chaos Selected.')
_G.SetWings('CHAOS',true,'CHAOS')
_G.SetMusic(4,1,40)
elseif getgenv().Class == 1 then 
info('Persistence Selected.')
_G.SetWings('persistence')
_G.SetMusic(13,1)
SpawnAs('persistence')
_G.QuickSet(0,0,255,0,0,155)
_G.SetDecal(Color3.new(0,0,1),5)
getgenv().MUSIC_CREDS = 'Aethral - Lacrima Elegy'
_G.RefreshUI()
elseif getgenv().Class == 2 then 
info('Zyledon Selected.')
SpawnAs('Zyledon')
end
elseif char:GetAttribute('Character') == 'Batter' then
if getgenv().Class == 0 then 
SpawnAs('Divinity')
info('Divinity Selected.')
_G.SetWings('Divinity')
_G.SetMusic(5,1,55)
elseif getgenv().Class == 1 then 
SpawnAs('Nuclear')
elseif getgenv().Class == 2 then 
SpawnAs('VIOLENCE')
end
elseif char:GetAttribute('Character') == 'Blade' then
SpawnAs('Equinox')
info('Equinox Selected.')
_G.SetWings('Equinox')
_G.SetMusic(8,1,52)
elseif char:GetAttribute('Character') == 'Esper' then
SpawnAs('Big Black')
info('The Big Black Selected.')
_G.SetWings('BigBlack')
_G.SetMusic(9,1)
elseif char:GetAttribute('Character') == 'Ninja' then
if getgenv().Class == 0 then 
SpawnAs('Crazed')
info('Crazed Selected.')
_G.SetWings('crazed',true,'crazed')
_G.SetMusic(10,1)
_G.QuickSet('crazed')
getgenv().MUSIC_CREDS = 'wa. - Black Lotus'
_G.SetDecal('crazed')
elseif getgenv().Class == 1 then 
info('Rainbow Selected.')
_G.SetWings('Rainbow',true,'Rainbow')
_G.SetMusic(15,1)
SpawnAs('Rainbow')
_G.QuickSet(0,0,255,0,0,155)
getgenv().MUSIC_CREDS = 'siqlo - Cyber Dawn'
end end
if getgenv().TRUEMODE == 'Mayhem' then
_G.QuickSet(255,0,0,55,0,0)
getgenv().MUSIC_CREDS = 'D-MODE-D - Shriek'
_G.SetDecal(Color3.new(1,0,0),-5)
elseif getgenv().TRUEMODE == 'Corruption' then
_G.QuickSet(155,0,155,50,0,50)
getgenv().MUSIC_CREDS = 'vιrтυal dyѕтopιa - 私のドリトスを失うことはありませんか、私はあなたの赤ちゃんを失うことになります Vaporwave'
_G.SetDecal(Color3.new(.6,0,.6),7)
elseif getgenv().TRUEMODE == 'Chaos' then
_G.QuickSet('chaos')
getgenv().MUSIC_CREDS = 'Jerico - Doppelganger'
_G.SetDecal('chaos','1')
elseif getgenv().TRUEMODE == 'Divinity' then
_G.QuickSet(255,255,0,155,155,0)
getgenv().MUSIC_CREDS = 'Xi - halycon'
_G.SetDecal(Color3.new(1,1,0),5)
elseif getgenv().TRUEMODE == 'Purity' then
_G.QuickSet(0,255,255,0,155,155)
getgenv().MUSIC_CREDS = 'EMIBAYO - GOODTEK'

_G.SetDecal(Color3.new(0,1,1),5)
elseif getgenv().TRUEMODE == 'Equinox' then
_G.QuickSet(155,155,155,0,0,0)
getgenv().MUSIC_CREDS = 'lostlxc3y - tears of my loved ones'

_G.SetDecal(Color3.new(1,1,1),5)
elseif getgenv().TRUEMODE == 'Big Black' then
_G.QuickSet(155,155,155,0,0,0)
getgenv().MUSIC_CREDS = 'TheQuickBrownFox - The Big Black'

_G.SetDecal('big black')
elseif getgenv().TRUEMODE == 'Crazed' then

elseif getgenv().TRUEMODE == 'Rainbow' then
_G.QuickSet('Rainbow')
getgenv().MUSIC_CREDS = 'siqlo - Cyber Dawn'
_G.SetDecal('Rainbow')


end
task.wait(.4)
_G.RefreshUI()
spawn(function()
local lp = game.Players.LocalPlayer
local char = lp.Character
local hrp = char.HumanoidRootPart
local bp =lp.Backpack

spawn(function()
if getgenv().TRUEMODE == 'Mayhem' or getgenv().TRUEMODE == 'VIOLENCE' then
getgenv().UltCol = Color3.new(1,0,0)
elseif getgenv().TRUEMODE == 'Purity' then
getgenv().UltCol = Color3.new(0,1,1)
elseif getgenv().TRUEMODE == 'Corruption' then
getgenv().UltCol = Color3.new(.5,0,.5)
elseif getgenv().TRUEMODE == 'Equinox' then
getgenv().UltCol = Color3.new(.4,.4,.4)
elseif getgenv().TRUEMODE == 'Big Black' then
getgenv().UltCol = Color3.new(0,0,0)
elseif 
getgenv().TRUEMODE == 'Crazed' or 
getgenv().TRUEMODE == 'Zyldeon' or 
getgenv().TRUEMODE == 'Quivarence' or 
getgenv().TRUEMODE == 'persistence' or
getgenv().TRUEMODE == 'Efferox'  then

getgenv().UltCol = Color3.new(0,0,1)
elseif getgenv().TRUEMODE == 'Rainbow' then
getgenv().UltCol = 'Rainbow'
elseif getgenv().TRUEMODE == 'Chaos' then
getgenv().UltCol = 'Chaos'
elseif getgenv().TRUEMODE == 'ULTRASONIC' then
getgenv().UltCol = Color3.new(1,1,1)
elseif getgenv().TRUEMODE == 'Euclidean' then
getgenv().UltCol = Color3.new(.5,0,1)
elseif getgenv().TRUEMODE == 'Destiny' or getgenv().TRUEMODE == 'Calamity' then
getgenv().UltCol = Color3.new(.7,0,.7)
end
getgenv().Break = true
task.wait(.2)
getgenv().Break = false 
task.wait(.2)
local lp = game.Players.LocalPlayer
local m = lp.PlayerGui.ScreenGui.MagicHealth
local mh = m.Health
mh.Visible = false
local v = Instance.new("ImageLabel")
local ButtonHitbox = Instance.new("ImageButton")
local barf = Instance.new("Frame")
local v2 = Instance.new("UIGradient")
local sc = Instance.new("UIScale")
local a = m.TextLabel:Clone() 
m.TextLabel.TextTransparency = 1
m.TextLabel.TextLabel.TextTransparency = 1
local ScreenGui = mh.Parent.Parent:Clone()
pcall(function() game.CoreGui.Revit:Destroy() end)
pcall(function() game.CoreGui.NVAL:Destroy() end)
task.wait(.1)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = 'Revit'


--MainFrame
barf.Position = mh.Parent.Position +UDim2.new(-.16,0,-.23,0)
barf.Size = mh.Parent.Size+UDim2.new(.05,0,.5,0)
barf.BackgroundTransparency = 1
barf.Parent = ScreenGui

--Image+RedColor
v.Parent = barf
v.Size = UDim2.new(1, 0, 1, 0)
v.BackgroundTransparency = 1
v.Image = "rbxassetid://97651416425366"
v.ImageTransparency = 0
v.Position = UDim2.new(0,0,0,0)
v.AnchorPoint=Vector2.new(0,0)
v.Size = UDim2.new(1, 0, 1, 0)
v.ImageTransparency = .2

ButtonHitbox.Parent = barf
ButtonHitbox.Size = UDim2.new(1, 0, 1, 0)
ButtonHitbox.BackgroundTransparency = 1
ButtonHitbox.Image = "rbxassetid://97651416425366"
ButtonHitbox.ImageTransparency = 0
ButtonHitbox.Position = UDim2.new(.1,0,.37,0)
ButtonHitbox.AnchorPoint=Vector2.new(0,0)
ButtonHitbox.Size = UDim2.new(.8, 0, .1, 0)
ButtonHitbox.ImageTransparency = .99
ButtonHitbox.MouseButton1Click:Connect(function()
local vim = game:GetService("VirtualInputManager")
vim:SendKeyEvent(true,Enum.KeyCode.G,false,workspace)
end)
--Ultimate Mode Text

a.Parent = barf
a.Position = UDim2.new(.5,0,.38,0)
a.TextTransparency = 0
a.TextLabel.TextTransparency = .4

local a2 = m.TextLabel:Clone()
a2.Parent = barf
a2.Position = UDim2.new(.5,0,.427,0)

a2.TextLabel.TextTransparency = .4
a2.TextTransparency = 0

--Scale Script
sc.Parent = v
sc.Scale = 1
v2.Parent = v
local n = Instance.new('NumberValue')
n.Parent = game.CoreGui
n.Name = 'NVAL'
n.Value = game.Players.LocalPlayer:GetAttribute('Ultimate')/100
local ky = game.Players.LocalPlayer:GetAttributeChangedSignal('Ultimate'):Connect(function(pp)
    local tween = game:GetService("TweenService"):Create(n, TweenInfo.new(0.4), {Value = game.Players.LocalPlayer:GetAttribute('Ultimate')/100})
    tween:Play()
end)
--Gradient Script
a2.TextLabel.TextSize = a2.TextLabel.TextSize*.9
a2.TextSize = a2.TextSize*.9
function getpreg()
a.TextLabel.Text = m.TextLabel.Text
a.Text = m.TextLabel.Text

if math.floor(tonumber(n.Value*100))==100 then 
a2.TextLabel.Text = '[G]'
a2.Text = '[G]'
else 
a2.TextLabel.Text = tostring(math.floor(tonumber(n.Value*100))..'%')
a2.Text = tostring(math.floor(tonumber(n.Value*100))..'%')
end
end
if getgenv().UltCol == 'Rainbow' then
while true do
if getgenv().Break == true then return end
getpreg()
if getgenv().DoingUlt == true then 
local b = Instance.new('NumberValue')
b.Parent = game.CoreGui b.Name = 'UltimateTweenDeplete'
b.Value = 1

game.TweenService:Create(b,TweenInfo.new(char:GetAttribute('UltimateTime'),Enum.EasingStyle.Linear),
{Value = 0}):Play()
repeat task.wait()
a2.TextLabel.Text = tostring(math.floor(tonumber(b.Value*100))..'%')
a2.Text = tostring(math.floor(tonumber(b.Value*100))..'%')
pcall(function()
v2.Color =  ColorSequence.new{
ColorSequenceKeypoint.new(0, 
Color3.fromHSV(getgenv().Rainbow,1,1)), 
ColorSequenceKeypoint.new(b.Value-.01, 
Color3.fromHSV(getgenv().Rainbow,1,1)), 
ColorSequenceKeypoint.new(b.Value, 
Color3.fromRGB(255, 255, 255)), 
ColorSequenceKeypoint.new(1,
Color3.fromRGB(255, 255, 255))}
end)
until b.Value == 0 b:Destroy()
getgenv().DoingUlt = false
end
pcall(function()

v2.Color =  ColorSequence.new{
ColorSequenceKeypoint.new(0, 
Color3.fromHSV(getgenv().Rainbow,1,1)), 
ColorSequenceKeypoint.new(n.Value-.01, 
Color3.fromHSV(getgenv().Rainbow,1,1)), 
ColorSequenceKeypoint.new(n.Value, 
Color3.fromRGB(255, 255, 255)), 
ColorSequenceKeypoint.new(1,
Color3.fromRGB(255, 255, 255))}
end)
task.wait(.01) end 
elseif getgenv().UltCol == 'Chaos' then

while true do
if getgenv().Break == true then return end
getpreg()
----------------------------------------
if getgenv().DoingUlt == true then 
local b = Instance.new('NumberValue')
b.Parent = game.CoreGui b.Name = 'UltimateTweenDeplete'
b.Value = 1

game.TweenService:Create(b,TweenInfo.new(char:GetAttribute('UltimateTime'),Enum.EasingStyle.Linear),
{Value = 0}):Play()
repeat task.wait()
a2.TextLabel.Text = tostring(math.floor(tonumber(b.Value*100))..'%')
a2.Text = tostring(math.floor(tonumber(b.Value*100))..'%')
pcall(function()
v2.Color =  ColorSequence.new{
ColorSequenceKeypoint.new(0, 
BrickColor.random().Color), 
ColorSequenceKeypoint.new(b.Value-.01, 
BrickColor.random().Color), 
ColorSequenceKeypoint.new(b.Value, 
Color3.fromRGB(255, 255, 255)), 
ColorSequenceKeypoint.new(1,
Color3.fromRGB(255, 255, 255))}
end)
until b.Value == 0 b:Destroy()
getgenv().DoingUlt = false
end
----------
pcall(function()

v2.Color =  ColorSequence.new{
ColorSequenceKeypoint.new(0, 
BrickColor.random().Color), 
ColorSequenceKeypoint.new(n.Value-.01, 
BrickColor.random().Color), 
ColorSequenceKeypoint.new(n.Value, 
Color3.fromRGB(255, 255, 255)), 
ColorSequenceKeypoint.new(1,
Color3.fromRGB(255, 255, 255))}
end)
task.wait(.01) end 


else 


while true do
if getgenv().Break == true then return end
getpreg()


if getgenv().DoingUlt == true then 
local b = Instance.new('NumberValue')
b.Parent = game.CoreGui b.Name = 'UltimateTweenDeplete'
b.Value = 1

game.TweenService:Create(b,TweenInfo.new(char:GetAttribute('UltimateTime'),Enum.EasingStyle.Linear),
{Value = 0}):Play()
repeat task.wait()
a2.TextLabel.Text = tostring(math.floor(tonumber(b.Value*100))..'%')
a2.Text = tostring(math.floor(tonumber(b.Value*100))..'%')
pcall(function()
v2.Color =  ColorSequence.new{
ColorSequenceKeypoint.new(0, 
getgenv().UltCol), 
ColorSequenceKeypoint.new(b.Value-.01, 
getgenv().UltCol), 
ColorSequenceKeypoint.new(b.Value, 
Color3.fromRGB(255, 255, 255)), 
ColorSequenceKeypoint.new(1,
Color3.fromRGB(255, 255, 255))}
end)
until b.Value == 0 b:Destroy()
getgenv().DoingUlt = false
end



pcall(function()

v2.Color =  ColorSequence.new{
ColorSequenceKeypoint.new(0, 
getgenv().UltCol), 
ColorSequenceKeypoint.new(n.Value-.01, 
getgenv().UltCol), 
ColorSequenceKeypoint.new(n.Value, 
Color3.fromRGB(255, 255, 255)), 
ColorSequenceKeypoint.new(1,
Color3.fromRGB(255, 255, 255))}
end)
task.wait(.01) end 

end
ky:Disconnect()
end)
end)
getgenv().DoingUlt = false
end
MainEnv()
pcall(function()
getgenv().pepe:Disconnect()
end)
getgenv().pepe = game.Players.LocalPlayer.CharacterAdded:Connect(function(c)
repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')
task.wait(.2)
MainEnv()
end)

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("TextLabel")
local Credits = Instance.new("TextButton")
local License = Instance.new("TextButton")
local cb = Instance.new("TextButton")
local cb2 = Instance.new("TextButton")
local str = Instance.new('UIStroke')
local UG = Instance.new('UIGradient')
pcall(function() game.CoreGui.Creds:Destroy() end)
task.wait(.1)
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = 'Creds'

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.Visible = true
MainFrame.Size = UDim2.new(.4,0,.8,0)
MainFrame.Position = UDim2.new(.3,0,.1,0)
MainFrame.BackgroundTransparency = .7
MainFrame.RichText = true
MainFrame.TextScaled = true
MainFrame.Font=Enum.Font.Arcade
MainFrame.TextColor3=Color3.new(1,1,1)
str.Parent = MainFrame
str.Thickness = 2

UG.Parent = str
UG.Color = 
ColorSequence.new{ColorSequenceKeypoint.new(0.00,Color3.new(1,0,1)), 
ColorSequenceKeypoint.new(1, Color3.new(1,0,0))}


cb.Parent = MainFrame
cb.Font=Enum.Font.Arcade
cb.TextColor3=Color3.new(1,0,.3)
cb.BackgroundColor3=Color3.new(0,0,0)
cb.TextStrokeTransparency = 0
cb.BorderSizePixel = 1
cb.BorderColor3=Color3.new(1,0,0)
cb.Position = UDim2.new(1,0,.37,0)
cb.TextScaled = true
cb.Size = UDim2.new(.5,0,.03,0)
cb.Text = 'Copy discord to clipboard'
cb.BackgroundTransparency = .5
cb.MouseButton1Click:Connect(function()
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://762117042'
s.PlaybackSpeed = 1
s.Volume = 4 s:Play()
task.delay(1,function()
s:Destroy() end)
setclipboard('reap4985')
tw(cb,'Copied!',.05)
cb.TextColor3=Color3.new(0, 1, 0)
cb.BorderColor3=Color3.new(0, 1, 0)
task.wait(.9)
game.TweenService:Create(cb,TweenInfo.new(.5),{TextColor3=Color3.new(1, 0, 0),
BorderColor3=Color3.new(1, 0, 0)}):Play()
tw(cb,'Copy discord to clipboard',.02)
end)
cb2.MouseButton1Click:Connect(function()
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://762117042'
s.PlaybackSpeed = 1
s.Volume = 4 s:Play()
task.delay(1,function()
s:Destroy() end)
setclipboard('reap4985')
tw(cb2,'Copied!',.05)
cb2.TextColor3=Color3.new(0, 1, 0)
cb2.BorderColor3=Color3.new(0, 1, 0)
task.wait(.9)
game.TweenService:Create(cb2,TweenInfo.new(.5),{TextColor3=Color3.new(1, 0, 0),
BorderColor3=Color3.new(1, 0, 0)}):Play()
tw(cb2,'Copy discord to clipboard',.02)
end)
cb2.Parent = MainFrame
cb2.Font=Enum.Font.Arcade
cb2.TextColor3=Color3.new(1,0,.3)
cb2.BackgroundColor3=Color3.new(0,0,0)
cb2.TextStrokeTransparency = 0
cb2.BorderSizePixel = 1
cb2.BorderColor3=Color3.new(1,0,0)
cb2.Position = UDim2.new(1,0,.66,0)
cb2.TextScaled = true
cb2.Size = UDim2.new(.5,0,.03,0)
cb2.Text = 'Copy discord to clipboard'
cb2.BackgroundTransparency = .5
Credits.Parent = ScreenGui
Credits.Font=Enum.Font.Arcade
Credits.TextColor3=Color3.new(1,1,1)
Credits.Position = UDim2.new(.8,0,0,0)
Credits.TextScaled = true
Credits.Size = UDim2.new(.2,0,.05,0)
Credits.Text = ''
Credits.BackgroundTransparency = 1
MainFrame.Text = 
[[
have fun bro
top right press credits or liscense to remove this ui
fuck golden 
]]
License.Parent = ScreenGui
License.Font=Enum.Font.Arcade
License.TextColor3=Color3.new(1,1,1)
License.Position = UDim2.new(.65,0,0,0)
License.TextScaled = true
License.Size = UDim2.new(.2,0,.05,0)
License.Text = ''
License.BackgroundTransparency = 1
local db = false
Credits.MouseButton1Click:Connect(function()
if db == true then return end 
spawn(function()
db = true task.wait(1.2) db = false end)
MainFrame.Text = [[
SCRIPT NAME: <font color="#F50Df0">Star Glitcher</font>

<font color="#00ff00">~CREDITS~</font>
<font color="#F50Df0">~---------------------~</font>
<font color="#F50Df0">~---------------------~</font>
<font color="#FF005D">~techryn~</font>
Contributions: 

~Made Wings for:
<font color="#FF0000">EVERYTHING EXCEPT: </font>
Rainbow, Crazed, Corruption
~Made Music for:
<font color="#00008B">Quiverance,</font>
<font color="#00008B">Zyledon,</font>
<font color="#00008B">Efferox</font>



<font color="#F50Df0">~---------------------~</font>
<font color="#FF005D">~REAP~</font>
Contributions:
literally everything else 
<font color="#F50Df0">~---------------------~</font>
<font color="#FF005D">~Dream~</font>
Contributions:
Big Black
<font color="#F50Df0">~---------------------~</font>
<font color="#FF005D">~Birdmaid~</font>
Contributions:
The UI
(i have yet to ask for permission for)
<font color="#F50Df0">~---------------------~</font>
<font color="#F50Df0">~---------------------~</font>
]]
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://762117042'
s.PlaybackSpeed = 1
s.Volume = 4 s:Play()
task.delay(1,function()
s:Destroy() end)
if MainFrame.Visible == true then 
game.TweenService:Create(Credits,TweenInfo.new(.3),
{TextColor3=Color3.new(1,1,1)}):Play()
game.TweenService:Create(MainFrame,TweenInfo.new(.3),
{Transparency = 1}):Play()
game.TweenService:Create(str,TweenInfo.new(.3),
{Transparency = 1}):Play()
game.TweenService:Create(cb,TweenInfo.new(.3),
{Transparency = 1}):Play()
game.TweenService:Create(cb2,TweenInfo.new(.3),
{Transparency = 1}):Play()
task.wait(1)
MainFrame.Visible = false
cb.Visible = false 
cb2.Visible = false
 else 
Credits.TextColor3=Color3.new(1,0,.5)
game.TweenService:Create(MainFrame,TweenInfo.new(.3),
{TextTransparency = 0,BackgroundTransparency =.7}):Play()
game.TweenService:Create(str,TweenInfo.new(.3),
{Transparency = 0}):Play()
game.TweenService:Create(cb,TweenInfo.new(.3),
{Transparency = 0}):Play()
game.TweenService:Create(cb2,TweenInfo.new(.3),
{Transparency = 0}):Play()
MainFrame.Visible = true 
cb.Visible = true 
cb2.Visible = true
end
end)

local db = false
License.MouseButton1Click:Connect(function()
if db == true then return end 
spawn(function()
db = true task.wait(1.2) db = false end)
MainFrame.Text = [[

> > You are not allowed to:
> > Distribute the script
> > Reverse Engineer, Modify the code (Settings unincluded)

> > You are allowed to:
> > Modify the settings given from each script



**SOFTWARE LICENSE AGREEMENT**

This Software License Agreement ("Agreement") is entered into on 12/16/24 ("Effective Date")

**1. DEFINITIONS**

* "script" means the closed source and described and meant to be as "Early Access" paid scripts distributed by either the current original owner(s) of the several GitHub accounts listed here.
https://github.com/Cv-jsSBzZ-U825F-ViuMPA-xo
https://github.com/Reapvitalized,
including all updates, modifications, and enhancements of the script.
* "Licensee" means the individual or entity using the Software.

**2. GRANT OF LICENSE**

Licensor grants to Licensee a non-exclusive, non-transferable license to use the Software solely for personal, commercial, etc..
The license can be modified at any time.

**3. RESTRICTIONS**

* Licensee shall not modify, reverse engineer, or disassemble the script.
* Licensee shall not distribute, sublicense, or assign the script to any third party.
* Licensee shall not use the script for any purpose other than as specified in Section 2.

**4. OWNERSHIP**

The script and all intellectual property rights thereto are and shall remain the exclusive property of Licensor.

**5. TERM AND TERMINATION**

This Agreement shall commence on the Effective Date and shall continue until terminated by Licensor. Licensor may terminate this Agreement at any time, without notice, if Licensee breaches any term or condition of this Agreement.

**6. WARRANTY DISCLAIMER**

The script is provided "as is" without warranty of any kind, express or implied.

**7. LIMITATION OF LIABILITY**

In no event shall Licensor be liable for any damages, including but not limited to incidental, consequential, or punitive damages, arising out of the use of the script.

**8. ENTIRE AGREEMENT**

This Agreement constitutes the entire agreement between the parties and supersedes all prior or contemporaneous agreements or understandings.

By using this script, Licensee acknowledges that it has read, understands, and agrees to be bound by the terms and conditions of this Agreement.

]]
local s = Instance.new('Sound')
s.Parent = game.CoreGui
s.SoundId = 'rbxassetid://762117042'
s.PlaybackSpeed = 1
s.Volume = 4 s:Play()
task.delay(1,function()
s:Destroy() end)
if MainFrame.Visible == true then 
game.TweenService:Create(Credits,TweenInfo.new(.3),
{TextColor3=Color3.new(1,1,1)}):Play()
game.TweenService:Create(MainFrame,TweenInfo.new(.3),
{Transparency = 1}):Play()
game.TweenService:Create(str,TweenInfo.new(.3),
{Transparency = 1}):Play()
game.TweenService:Create(cb,TweenInfo.new(.3),
{Transparency = 1}):Play()
game.TweenService:Create(cb2,TweenInfo.new(.3),
{Transparency = 1}):Play()
task.wait(1)
MainFrame.Visible = false
cb.Visible = false 
cb2.Visible = false
 else 
Credits.TextColor3=Color3.new(1,0,.5)
game.TweenService:Create(MainFrame,TweenInfo.new(.3),
{TextTransparency = 0,BackgroundTransparency =.7}):Play()
game.TweenService:Create(str,TweenInfo.new(.3),
{Transparency = 0}):Play()
game.TweenService:Create(cb,TweenInfo.new(.3),
{Transparency = 0}):Play()
game.TweenService:Create(cb2,TweenInfo.new(.3),
{Transparency = 0}):Play()
MainFrame.Visible = true 
cb.Visible = true 
cb2.Visible = true
end
end)
function tw(var,s,rate)
spawn(function()
local a = ""
local s_l = #s
for i = 1, s_l+1 do
local c = string.sub(s, -1+i, -1+i)
a = a .. c
var.Text = a
if c == "." then
task.wait(.6)
elseif c == ";" then
task.wait(.3)
elseif c == "," then
task.wait(.3)
elseif c == "!" then
task.wait(.3)
end
task.wait(rate)
end
end)
end
tw(Credits,'Credits',.15)
tw(License,'License',.2)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/Personal_Assets/refs/heads/main/LCMD.lua"))()
