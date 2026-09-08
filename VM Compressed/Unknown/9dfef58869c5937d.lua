-- R3gui Final Script (No Gray Box, Clean Transitions, Working Minimized Toggle + 3rd Column)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Destroy existing GUI
if PlayerGui:FindFirstChild("R3gui") then
	PlayerGui.R3gui:Destroy()
end

local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "R3gui"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

-- Splash Screen
local splash = Instance.new("Frame", gui)
splash.BackgroundColor3 = Color3.new(0, 0, 0)
splash.Size = UDim2.new(1, 0, 1, 0)

local splashLogo = Instance.new("TextLabel", splash)
splashLogo.Size = UDim2.new(0, 160, 0, 60)
splashLogo.Position = UDim2.new(0.5, -80, 0.5, -30)
splashLogo.BackgroundTransparency = 1
splashLogo.Text = "R"
splashLogo.Font = Enum.Font.GothamBold
splashLogo.TextSize = 36
splashLogo.TextColor3 = Color3.new(1, 1, 1)
splashLogo.TextXAlignment = Enum.TextXAlignment.Left

local splashRed3 = Instance.new("TextLabel", splash)
splashRed3.Size = UDim2.new(0, 160, 0, 60)
splashRed3.Position = UDim2.new(0.5, -60, 0.5, -30)
splashRed3.BackgroundTransparency = 1
splashRed3.Text = "3"
splashRed3.Font = Enum.Font.GothamBold
splashRed3.TextSize = 36
splashRed3.TextColor3 = Color3.fromRGB(255, 0, 0)
splashRed3.TextXAlignment = Enum.TextXAlignment.Left

task.wait(1.5)
TweenService:Create(splash, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(splashLogo, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(splashRed3, TweenInfo.new(1), {TextTransparency = 1}):Play()
task.wait(1.1)
splash:Destroy()

-- Main Frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 640, 0, 300)
main.Position = UDim2.new(0.5, -320, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Active = true
main.Draggable = true
main.BackgroundTransparency = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- Sidebar
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 140, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
sidebar.BackgroundTransparency = 0
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel", sidebar)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "<font color='rgb(255,255,255)'>R</font><font color='rgb(255,0,0)'>3gui</font>"
title.RichText = true
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)

-- Close Button
local closeBtn = Instance.new("TextButton", sidebar)
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Position = UDim2.new(1, -25, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16

-- Greeting
local greeting = Instance.new("TextLabel", sidebar)
greeting.Size = UDim2.new(1, -10, 0, 20)
greeting.Position = UDim2.new(0, 5, 0, 50)
greeting.Text = "Greetings, " .. LocalPlayer.Name
greeting.Font = Enum.Font.Gotham
greeting.TextSize = 14
greeting.TextColor3 = Color3.new(1, 1, 1)
greeting.BackgroundTransparency = 1

-- Avatar Frame
local avatarFrame = Instance.new("Frame", sidebar)
avatarFrame.Size = UDim2.new(0, 60, 0, 60)
avatarFrame.Position = UDim2.new(0.5, -30, 1, -70)
avatarFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", avatarFrame).CornerRadius = UDim.new(1, 0)

local thumb = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60)
local avatar = Instance.new("ImageLabel", avatarFrame)
avatar.Size = UDim2.new(1, 0, 1, 0)
avatar.Image = thumb
avatar.BackgroundTransparency = 1

-- Panel + Grid
local panel = Instance.new("Frame", main)
panel.Size = UDim2.new(0, 480, 0, 240)
panel.Position = UDim2.new(0, 150, 0, 30)
panel.BackgroundTransparency = 1

local layout = Instance.new("UIGridLayout", panel)
layout.CellSize = UDim2.new(0, 140, 0, 45)
layout.CellPadding = UDim2.new(0, 10, 0, 10)
layout.FillDirectionMaxCells = 3

-- Buttons
local buttonList = {
	["Fly"] = "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt",
	["Touch Fling"] = "https://pastebin.com/raw/LgZwZ7ZB",
	["Yarhm"] = "https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua",
	["Invisible"] = "https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Invisible%20Gui",
	["Vortex (NDS)"] = "https://raw.githubusercontent.com/GoofyBlox/GoofyZ/refs/heads/main/Best/Vortex.lua",
	["Solara Hub"] = "https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/Solara%20Hub.lua",
	["Noclip"] = "noclip",
	["Reclip"] = "reclip",
	["NDS Hub"] = "https://raw.githubusercontent.com/KaterHub-Inc/NaturalDisasterSurvival/refs/heads/main/main.lua",
	["Absense"] = "https://raw.githubusercontent.com/vnausea/absence-mini/refs/heads/main/absencemini.lua",
	["Bloxburg"] = "https://luxhub.cc/script.lua",
	["Inf Health"] = "https://pastebin.com/SEsnu32m",
	["Annabypasser"] = "https://raw.githubusercontent.com/AnnaRoblox/AnnaBypasser/refs/heads/main/AnnaBypasser.lua",
	["Ring Parts"] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/Lukashub-coder/super-ring/refs/heads/main/Super%20ring!!'))()",
        ["SystemBroken"] = "https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script",
}

local dot
local Noclip, Clip = nil, true

local function noclip()
	Clip = false
	Noclip = RunService.Stepped:Connect(function()
		if not Clip and LocalPlayer.Character then
			for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
	end)
end

local function reclip()
	Clip = true
	if Noclip then Noclip:Disconnect() end
	if LocalPlayer.Character then
		for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
	end
end

for name, link in pairs(buttonList) do
	local btn = Instance.new("TextButton", panel)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(40, 35, 35)
	btn.AutoButtonColor = true
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

	if name == "Noclip" then
		dot = Instance.new("Frame", btn)
		dot.Size = UDim2.new(0, 8, 0, 8)
		dot.Position = UDim2.new(0, 6, 0, 6)
		dot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		dot.BorderSizePixel = 0
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
	end

	btn.MouseButton1Click:Connect(function()
		if link == "noclip" then
			noclip()
			dot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		elseif link == "reclip" then
			reclip()
			dot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		elseif link == "eclipse" then
			getgenv().mainKey = "nil"
			loadstring(game:HttpGet("https://api.eclipsehub.xyz/auth?key=" .. tostring(mainKey)))()
		else
			loadstring(game:HttpGet(link))()
		end
	end)
end

-- Minimized Icon
local minimized = Instance.new("TextButton", gui)
minimized.Size = UDim2.new(0, 60, 0, 40)
minimized.Position = UDim2.new(0, 10, 1, -60)
minimized.BackgroundColor3 = Color3.new(0, 0, 0)
minimized.Text = "<font color='rgb(255,255,255)'>R</font><font color='rgb(255,0,0)'>3</font>"
minimized.RichText = true
minimized.Font = Enum.Font.GothamBold
minimized.TextSize = 20
minimized.TextColor3 = Color3.new(1, 1, 1)
minimized.Visible = false
minimized.Draggable = true
Instance.new("UICorner", minimized).CornerRadius = UDim.new(0, 8)

-- Minimize Main
closeBtn.MouseButton1Click:Connect(function()
	main.Visible = false
	minimized.Visible = true
end)

-- Restore GUI
minimized.MouseButton1Click:Connect(function()
	main.Visible = true
	minimized.Visible = false
end)
