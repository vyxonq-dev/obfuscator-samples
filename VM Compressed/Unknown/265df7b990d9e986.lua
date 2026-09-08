local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "⭐️Compilation Script⭐️", HidePremium = false, IntroText = "⭐️Compilation Script⭐️", SaveConfig = true, ConfigFolder = "RobloxScript"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddLabel("Welcome")
Tab:AddLabel("Made by Tkiet")
Tab:AddLabel("universal script here")
Tab:AddButton({
	Name = "Fly Script",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
	end    
})

Tab:AddButton({
	Name = "Infinite yield",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end    
})

Tab:AddButton({
	Name = "anti afk",
	Callback = function()
local Rice = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Credits = Instance.new("TextLabel")
local Activate = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local OpenClose = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

Rice.Name = "Rice"
Rice.Parent = game.CoreGui
Rice.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Rice
Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.321207851, 0, 0.409807354, 0)
Main.Size = UDim2.new(0, 295, 0, 116)
Main.Visible = false
Main.Active = true
Main.Draggable =  true

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 295, 0, 16)
Title.Font = Enum.Font.GothamBold
Title.Text = "Rice Anti-Afk"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 12.000
Title.TextWrapped = true

Credits.Name = "Credits"
Credits.Parent = Main
Credits.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0, 0, 0.861901641, 0)
Credits.Size = UDim2.new(0, 295, 0, 16)
Credits.Font = Enum.Font.GothamBold
Credits.Text = "Made by Tkiet"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 12.000
Credits.TextWrapped = true

Activate.Name = "Activate"
Activate.Parent = Main
Activate.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Activate.BorderColor3 = Color3.fromRGB(27, 42, 53)
Activate.BorderSizePixel = 0
Activate.Position = UDim2.new(0.0330629945, 0, 0.243326917, 0)
Activate.Size = UDim2.new(0, 274, 0, 59)
Activate.Font = Enum.Font.GothamBold
Activate.Text = "Activate"
Activate.TextColor3 = Color3.fromRGB(0, 255, 127)
Activate.TextSize = 43.000
Activate.TextStrokeColor3 = Color3.fromRGB(102, 255, 115)
Activate.MouseButton1Down:connect(function()
	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
end)


UICorner.Parent = Activate

OpenClose.Name = "Open/Close"
OpenClose.Parent = Rice
OpenClose.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
OpenClose.Position = UDim2.new(0.353924811, 0, 0.921739101, 0)
OpenClose.Size = UDim2.new(0, 247, 0, 35)
OpenClose.Font = Enum.Font.GothamBold
OpenClose.Text = "✅Open/Close❌"
OpenClose.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenClose.TextSize = 14.000

UICorner_2.Parent = OpenClose

local function NERMBF_fake_script() -- OpenClose.LocalScript 
	local script = Instance.new('LocalScript', OpenClose)

	local frame = script.Parent.Parent.Main
	
	script.Parent.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)
end
coroutine.wrap(NERMBF_fake_script)()
	end    
})

Tab:AddButton({
	Name = "Aimbot (Airhub)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
	end    
})

local Tab = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("Game Script")
Tab:AddButton({
	Name = "W azureV2 (Blox Fruit",
	Callback = function()
getgenv().Team = "Pirates"
getgenv().FixCrash = false -- Turn it On For Hopping Server, Improve Performance But Silent Aim On Mob And Player
getgenv().FixCrash2 = false -- Turn it On For Hopping Server, Improve Performance But Will Remove Speed Changer
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
		end
}) 

Tab:AddButton({
	Name = "sol's rng",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Looser3itx/Hmmmmmmmmmmmmmmmmmmmmmmmmmmmm/main/loader.lua"))()
	end    
})

Tab:AddButton({
	Name = "Blade ball (X7)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Code4Zaaa/X7Project/main/Game/AutoParryOnly"))()
	end    
})

Tab:AddButton({
	Name = "Pet Simulator 99 (Key System!)",
	Callback = function()
loadstring(game:HttpGet('https://zaphub.xyz/Exec'))()
	end    
})

Tab:AddLabel("more soon!")
Tab:AddLabel("Sorry I can't update because I'm busy with school")
