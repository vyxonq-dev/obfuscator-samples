local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


Rayfield:Notify({
   Title = "Notification",
   Content = "Welcome To SP00KY Hub",
   Duration = 6.5,
   Image = 4483362458,
})



local Window = Rayfield:CreateWindow({
   Name = "SP00KY Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "By k00pder",
   ShowText = "SP00KY Hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes


   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)


   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface


   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },


   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },


   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local Tab = Window:CreateTab("Player", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "R6 Animation (For R15)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Icalock/Server/refs/heads/main/R6 anims.lua", true))()
   end,
})


local Button = Tab:CreateButton({
   Name = "Sit",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-simple-sit-script-24165"))()
   end,
})


local Button = Tab:CreateButton({
   Name = "Anti-Fling",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anti-Collision-Anti-Fling-48978"))()
   end,
})


local Button = Tab:CreateButton({
   Name = "Spin",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-simple-spinbot-45312"))()
   end,
})


local Button = Tab:CreateButton({
   Name = "Walk On Wall",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxOld2010/Kevoid/refs/heads/main/Walk On Wall"))()
   end,
})


local Tab = Window:CreateTab("Gui", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "Spin Gui",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Simple-spin-script-by-CHATGPT-29531"))()
  end,
})


local Button = Tab:CreateButton({
   Name = "Tool Giver(cilent)",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tool-giver-29724"))()
   end,
})


local Button = Tab:CreateButton({
   Name = "Tool Giver (Workspace)",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tool-Giver-Workspace-Ui-27282"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Grow A Garden",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-Xerox-Auto-Collect-And-More-39879"))()
   end,
})


local Button = Tab:CreateButton({
   Name = "c00lclan",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-C00lkid-47403"))()
   end,
})


local Button = Tab:CreateButton({
   Name = "Dex Explorer",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dex-Explorer-No-Key-29915"))()
   end,
})


local Button = Tab:CreateButton({
   Name = "Lalol Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "God Mode",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxOld2010/Kevoid/refs/heads/main/God%20Mode"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "R6 Emote",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Icalock/Server/refs/heads/main/R6%20anims.lua", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Brookhaven",
   Callback = function()
   --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-R4D-script-no-key-17562"))()
   end,
})

local Tab = Window:CreateTab("Executor", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "RoScripts",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxOld2010/RobloxOld2010/refs/heads/main/RoScripts%20Executor"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Dominant",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dominant-executor-29479"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Delta",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Old-Delta-Executor-Ui-30987"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Rc7 (Password : KrystalTeam)",
   Callback = function()
   -- Gui to Lua
-- Version: 3.2

-- Instances:

local rc7 = Instance.new("ScreenGui")
local mini = Instance.new("ImageButton")
local passpage = Instance.new("ImageLabel")
local submit = Instance.new("TextButton")
local user = Instance.new("TextBox")
local pass = Instance.new("TextBox")
local close = Instance.new("TextButton")
local minimize = Instance.new("TextButton")
local mainpage = Instance.new("ImageLabel")
local input = Instance.new("TextBox")
local output = Instance.new("TextBox")
local exe = Instance.new("TextButton")
local clear = Instance.new("TextButton")
local open = Instance.new("TextButton")
local roxploit = Instance.new("TextButton")
local dex = Instance.new("TextButton")
local close_2 = Instance.new("TextButton")
local minimize_2 = Instance.new("TextButton")

--Properties:

rc7.Name = "rc7"
rc7.Parent = game.CoreGui
rc7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

mini.Name = "mini"
mini.Parent = rc7
mini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mini.BackgroundTransparency = 1.000
mini.BorderColor3 = Color3.fromRGB(0, 0, 0)
mini.BorderSizePixel = 0
mini.Position = UDim2.new(0, 0, 0.894399107, 0)
mini.Size = UDim2.new(0, 58, 0, 60)
mini.Visible = false
mini.Image = "http://www.roblox.com/asset/?id=14416021390"
mini.MouseButton1Down:connect(function()
	mainpage.Visible = true
mini.Visible = false
end)

passpage.Name = "passpage"
passpage.Parent = rc7
passpage.Active = true
passpage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
passpage.BorderColor3 = Color3.fromRGB(0, 0, 0)
passpage.BorderSizePixel = 0
passpage.Position = UDim2.new(0.171028033, 0, 0.178529739, 0)
passpage.Size = UDim2.new(0, 349, 0, 363)
passpage.Image = "rbxassetid://13695440070"

submit.Name = "submit"
submit.Parent = passpage
submit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
submit.BackgroundTransparency = 1.000
submit.BorderColor3 = Color3.fromRGB(0, 0, 0)
submit.BorderSizePixel = 0
submit.Position = UDim2.new(0.343839556, 0, 0.561983466, 0)
submit.Size = UDim2.new(0, 101, 0, 20)
submit.Font = Enum.Font.SourceSans
submit.Text = ""
submit.TextColor3 = Color3.fromRGB(0, 0, 0)
submit.TextSize = 14.000
submit.MouseButton1Down:connect(function()
	if pass.Text == "KrystalTeam" then
		passpage.Visible = false
		mainpage.Visible = true
	else
		pass.Text = "Wrong Password!"
		wait(2)
		pass.Text = ""
	end
end)

user.Name = "user"
user.Parent = passpage
user.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
user.BackgroundTransparency = 1.000
user.BorderColor3 = Color3.fromRGB(0, 0, 0)
user.BorderSizePixel = 0
user.Position = UDim2.new(0.260744989, 0, 0.393939406, 0)
user.Size = UDim2.new(0, 160, 0, 21)
user.Font = Enum.Font.SourceSans
user.Text = ""
user.TextColor3 = Color3.fromRGB(20, 212, 255)
user.TextSize = 14.000
user.TextWrapped = true

pass.Name = "pass"
pass.Parent = passpage
pass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pass.BackgroundTransparency = 1.000
pass.BorderColor3 = Color3.fromRGB(0, 0, 0)
pass.BorderSizePixel = 0
pass.Position = UDim2.new(0.261000007, 0, 0.479999989, 0)
pass.Size = UDim2.new(0, 160, 0, 21)
pass.Font = Enum.Font.SourceSans
pass.Text = ""
pass.TextColor3 = Color3.fromRGB(20, 212, 255)
pass.TextSize = 14.000
pass.TextWrapped = true

close.Name = "close"
close.Parent = passpage
close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundTransparency = 1.000
close.BorderColor3 = Color3.fromRGB(0, 0, 0)
close.BorderSizePixel = 0
close.Position = UDim2.new(0.88252151, 0, 0, 0)
close.Size = UDim2.new(0, 41, 0, 24)
close.Font = Enum.Font.SourceSans
close.Text = ""
close.TextColor3 = Color3.fromRGB(0, 0, 0)
close.TextSize = 14.000
close.MouseButton1Down:connect(function()
	passpage.Visible = false
end)

minimize.Name = "minimize"
minimize.Parent = passpage
minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
minimize.BackgroundTransparency = 1.000
minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
minimize.BorderSizePixel = 0
minimize.Position = UDim2.new(0.598853886, 0, 0, 0)
minimize.Size = UDim2.new(0, 41, 0, 24)
minimize.Font = Enum.Font.SourceSans
minimize.Text = ""
minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
minimize.TextSize = 14.000

mainpage.Name = "mainpage"
mainpage.Parent = rc7
mainpage.Active = true
mainpage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainpage.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainpage.BorderSizePixel = 0
mainpage.Position = UDim2.new(0.171028033, 0, 0.178529739, 0)
mainpage.Size = UDim2.new(0, 349, 0, 363)
mainpage.Visible = false
mainpage.Image = "http://www.roblox.com/asset/?id=12263991723"

input.Name = "input"
input.Parent = mainpage
input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
input.BorderColor3 = Color3.fromRGB(0, 0, 0)
input.BorderSizePixel = 0
input.Position = UDim2.new(0.0343839526, 0, 0.0991735533, 0)
input.Size = UDim2.new(0, 296, 0, 239)
input.Font = Enum.Font.Arial
input.MultiLine = true
input.Text = ""
input.TextColor3 = Color3.fromRGB(0, 0, 0)
input.TextSize = 14.000
input.TextWrapped = true
input.TextXAlignment = Enum.TextXAlignment.Left
input.TextYAlignment = Enum.TextYAlignment.Top

output.Name = "output"
output.Parent = mainpage
output.Active = false
output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
output.BorderColor3 = Color3.fromRGB(0, 0, 0)
output.BorderSizePixel = 0
output.Position = UDim2.new(0.0343839526, 0, 0.845730007, 0)
output.Size = UDim2.new(0, 296, 0, 52)
output.Font = Enum.Font.Arial
output.Text = ""
output.TextColor3 = Color3.fromRGB(0, 0, 0)
output.TextSize = 14.000
output.TextWrapped = true
output.TextXAlignment = Enum.TextXAlignment.Left
output.TextYAlignment = Enum.TextYAlignment.Top

exe.Name = "exe"
exe.Parent = mainpage
exe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
exe.BackgroundTransparency = 1.000
exe.BorderColor3 = Color3.fromRGB(0, 0, 0)
exe.BorderSizePixel = 0
exe.Position = UDim2.new(0.315186232, 0, 0.774104655, 0)
exe.Size = UDim2.new(0, 99, 0, 20)
exe.Font = Enum.Font.ArialBold
exe.Text = "Execute"
exe.TextColor3 = Color3.fromRGB(20, 212, 255)
exe.TextSize = 14.000
exe.MouseButton1Down:connect(function()
	loadstring(input.Text)()
	output.Text = "Script successfully executed!"
	wait(2)
	output.Text = " "
	if input.Text == " " then
output.Text = "Script is blank, paste a script!"
wait(2)
	output.Text = " "
end
end)

clear.Name = "clear"
clear.Parent = mainpage
clear.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
clear.BackgroundTransparency = 1.000
clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
clear.BorderSizePixel = 0
clear.Position = UDim2.new(0.598853886, 0, 0.774104655, 0)
clear.Size = UDim2.new(0, 99, 0, 20)
clear.Font = Enum.Font.ArialBold
clear.Text = "Clear"
clear.TextColor3 = Color3.fromRGB(20, 212, 255)
clear.TextSize = 14.000
clear.MouseButton1Down:connect(function()
	input.Text = " "
end)

open.Name = "open"
open.Parent = mainpage
open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
open.BackgroundTransparency = 1.000
open.BorderColor3 = Color3.fromRGB(0, 0, 0)
open.BorderSizePixel = 0
open.Position = UDim2.new(0.0343839526, 0, 0.774104655, 0)
open.Size = UDim2.new(0, 99, 0, 20)
open.Font = Enum.Font.ArialBold
open.Text = "Open"
open.TextColor3 = Color3.fromRGB(20, 212, 255)
open.TextSize = 14.000
open.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/ScriptHub"))()
end)

roxploit.Name = "roxploit"
roxploit.Parent = mainpage
roxploit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
roxploit.BackgroundTransparency = 1.000
roxploit.BorderColor3 = Color3.fromRGB(0, 0, 0)
roxploit.BorderSizePixel = 0
roxploit.Position = UDim2.new(0.904999971, 0, 0.799000025, 0)
roxploit.Size = UDim2.new(0, 29, 0, 29)
roxploit.Font = Enum.Font.SourceSans
roxploit.Text = ""
roxploit.TextColor3 = Color3.fromRGB(0, 0, 0)
roxploit.TextSize = 14.000
roxploit.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-RoXploit-by-KrystalTeam-9328"))()
end)

dex.Name = "dex"
dex.Parent = mainpage
dex.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dex.BackgroundTransparency = 1.000
dex.BorderColor3 = Color3.fromRGB(0, 0, 0)
dex.BorderSizePixel = 0
dex.Position = UDim2.new(0.904999971, 0, 0.910000026, 0)
dex.Size = UDim2.new(0, 29, 0, 29)
dex.Font = Enum.Font.SourceSans
dex.Text = ""
dex.TextColor3 = Color3.fromRGB(0, 0, 0)
dex.TextSize = 14.000
dex.MouseButton1Down:connect(function()
	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end)

close_2.Name = "close"
close_2.Parent = mainpage
close_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close_2.BackgroundTransparency = 1.000
close_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
close_2.BorderSizePixel = 0
close_2.Position = UDim2.new(0.88252151, 0, 0, 0)
close_2.Size = UDim2.new(0, 41, 0, 24)
close_2.Font = Enum.Font.SourceSans
close_2.Text = ""
close_2.TextColor3 = Color3.fromRGB(0, 0, 0)
close_2.TextSize = 14.000
close_2.MouseButton1Down:connect(function()
	mainpage.Visible = false
end)

minimize_2.Name = "minimize"
minimize_2.Parent = mainpage
minimize_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
minimize_2.BackgroundTransparency = 1.000
minimize_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
minimize_2.BorderSizePixel = 0
minimize_2.Position = UDim2.new(0.598853886, 0, 0, 0)
minimize_2.Size = UDim2.new(0, 41, 0, 24)
minimize_2.Font = Enum.Font.SourceSans
minimize_2.Text = ""
minimize_2.TextColor3 = Color3.fromRGB(0, 0, 0)
minimize_2.TextSize = 14.000
minimize_2.MouseButton1Down:connect(function()
	mainpage.Visible = false
	mini.Visible = true
end)

-- Scripts:

local function HXRD_fake_script() -- passpage.Dragify 
	local script = Instance.new('LocalScript', passpage)

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
coroutine.wrap(HXRD_fake_script)()
local function EERUFD_fake_script() -- mainpage.Dragify 
	local script = Instance.new('LocalScript', mainpage)

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
coroutine.wrap(EERUFD_fake_script)()
   end,
})

local Tab = Window:CreateTab("Gears", 4483362458) -- Title, Image


local Button = Tab:CreateButton({
   Name = "Force Field",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Forcefield-30169"))()
   end,
})


local Button = Tab:CreateButton({
   Name = "Teleport Tool",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TpTool-Teleport-Tool-47255"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Gravity Coil",
   Callback = function()
   _G.gravitycoil = game:GetObjects('rbxassetid://150366274')[1]
_G.gravitycoil.Parent = game.Players.LocalPlayer.Backpack
_G.gravitycoil.Equipped:Connect(function()
game.workspace.Gravity = 50
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
local Sound = Instance.new("Sound") 
local Id = "16619553"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 2
end)
_G.gravitycoil.Unequipped:Connect(function()
game.workspace.Gravity = 196.2
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)
   end,
})


local Button = Tab:CreateButton({
   Name = "Speed Coil",
   Callback = function()
   _G.speedcoil = game:GetObjects('rbxassetid://99119158')[1]
_G.speedcoil.Parent = game.Players.LocalPlayer.Backpack
_G.speedcoil.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
local Sound = Instance.new("Sound") 
local Id = "99173388"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.speedcoil.Unequipped:Connect(function()
game.Player .LocalPlayer.Character.Human
