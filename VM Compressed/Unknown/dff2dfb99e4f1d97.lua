-- /mnt/data/fixz_hub_keysystem_obsidian.lua
-- Fixz Hub | Banana Eats Key System (Obsidian UI)
-- Discord: https://discord.gg/CDyrbSY8Gx
-- Author: Fixz

local correctKey = "Fixz2025"
local discordLink = "https://discord.gg/CDyrbSY8Gx"

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"

-- Load Obsidian UI
local Obsidian = loadstring(game:HttpGet(repo .. "Library.lua"))()

-- === WINDOW ===
local Window = Obsidian:CreateWindow({
	Title = "Fixz Hub | Key System",
	Footer = "Banana Eats",
	ToggleKeybind = Enum.KeyCode.F8,
	SetMobileButtonSide = "Left",
	DisableSearch = true,
	ShowCustomCursor = false,
	Icon = "rbxassetid://140278037137417",
	IconSize = UDim2.fromOffset(40, 40),
	Size = UDim2.fromOffset(400, 300),
	Center = true,
	AutoShow = true
})

local Tabs = {
	KeyTab = Window:AddKeyTab("Key", "key"),
}

Tabs.KeyTab:AddLabel({
	Text = "Fixz Hub | Banana Eats Key System",
	DoesWrap = true,
	Size = 20,
})

Tabs.KeyTab:AddLabel({
	Text = "Get key from our Discord server:",
	DoesWrap = true,
	Size = 17,
})

Tabs.KeyTab:AddLabel({
	Text = discordLink,
	DoesWrap = true,
	Size = 17,
})

Tabs.KeyTab:AddButton({
	Text = "Copy Discord Link",
	Func = function()
		setclipboard(discordLink)
		Obsidian:Notify("Copied Discord link to clipboard!", 8)
	end
})

-- === KEY INPUT BOX ===
Tabs.KeyTab:AddKeyBox("Fixz Hub", function(Success, ReceivedKey)
	if ReceivedKey == correctKey then
		Obsidian:Notify("✅ Correct Key! Loading Fixz Hub...", 5)
		task.wait(1)
		loadstring(game:HttpGet(mainScriptURL))()
	else
		Obsidian:Notify("❌ Wrong Key! Get it from our Discord.", 6)
	end
end)

-- === INITIAL NOTIFY ===
Obsidian:Notify("Welcome to Fixz Hub | Banana Eats\nEnter your key to unlock.", 6)
-- script
-- Fixz Hub | Banana Eats
-- Author: Fixz
-- Using Luna UI (https://github.com/ImLunaUwU/LunaUI)

local LunaUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImLunaUwU/LunaUI/main/source.lua"))()
local Players, Workspace, RunService, TeleportService = game:GetService("Players"), game:GetService("Workspace"), game:GetService("RunService"), game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- === CONFIG ===
local Settings = {
	AutoHide = false,
	AutoEscape = false,
	WalkSpeed = 16,
	JumpPower = 50,
	ESP = {Banana = false, Players = false, Exits = false, Lockers = false},
	Themes = {"Dark", "Light", "Aqua"}
}

local Highlights, timerRunning, matchStart = {}, false, 0

-- === WINDOW ===
local Window = LunaUI:Create({
	Name = "Fixz Hub | Banana Eats",
	Theme = "Dark",
	Author = "by Fixz"
})

-- === MAIN TAB ===
local MainTab = Window:Tab("Main")

MainTab:Slider("WalkSpeed", 16, 100, 16, function(v)
	Settings.WalkSpeed = v
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		LocalPlayer.Character.Humanoid.WalkSpeed = v
	end
end)

MainTab:Slider("JumpPower", 50, 200, 50, function(v)
	Settings.JumpPower = v
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		LocalPlayer.Character.Humanoid.JumpPower = v
	end
end)

MainTab:Toggle("Auto Hide in Locker", false, function(state)
	Settings.AutoHide = state
end)

MainTab:Toggle("Auto Escape when Exit Opens", false, function(state)
	Settings.AutoEscape = state
end)

-- === ESP TAB ===
local ESPTab = Window:Tab("ESP")

for name,_ in pairs(Settings.ESP) do
	ESPTab:Toggle("Show " .. name, false, function(state)
		Settings.ESP[name] = state
	end)
end

-- === UTILITIES TAB ===
local UtilTab = Window:Tab("Utilities")

UtilTab:Button("Rejoin Server", function()
	pcall(function()
		TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
	end)
end)

UtilTab:Button("Leave Game", function()
	LocalPlayer:Kick("Left via Fixz Hub")
end)

UtilTab:Button("Start Match Timer", function()
	matchStart = os.time()
	timerRunning = true
end)

UtilTab:Button("Show Time Elapsed", function()
	if not timerRunning then
		LunaUI:Notification({Title="Fixz Hub",Content="Timer not started yet!",Duration=4})
	else
		local diff = os.time() - matchStart
		LunaUI:Notification({Title="Time Elapsed",Content=tostring(diff).."s",Duration=5})
	end
end)

UtilTab:Button("Puzzle Tracker (highlight puzzles)", function()
	for _,obj in pairs(Workspace:GetDescendants()) do
		if obj.Name:lower():find("puzzle") and obj:IsA("BasePart") then
			local h = Instance.new("Highlight")
			h.FillColor = Color3.fromRGB(0, 170, 255)
			h.Adornee = obj
			h.Parent = obj
			task.delay(15, function() if h then h:Destroy() end end)
		end
	end
	LunaUI:Notification({Title="Fixz Hub",Content="Highlighted puzzles for 15s",Duration=5})
end)

-- === THEME TAB ===
local ThemeTab = Window:Tab("Themes")
ThemeTab:Dropdown("Select Theme", Settings.Themes, "Dark", function(choice)
	LunaUI:SetTheme(choice)
	LunaUI:Notification({Title="Theme Changed",Content="Now using "..choice.." theme",Duration=4})
end)

-- === ANTI-AFK ===
LocalPlayer.Idled:Connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	task.wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- === HELPERS ===
local function highlight(obj,color)
	if Highlights[obj] then return end
	local h = Instance.new("Highlight")
	h.FillColor = color
	h.OutlineTransparency = 1
	h.Adornee = obj
	h.Parent = obj
	Highlights[obj] = h
end

local function clearHighlights()
	for obj,h in pairs(Highlights) do if h then h:Destroy() end end
	Highlights = {}
end

-- === ESP LOOP ===
RunService.Heartbeat:Connect(function()
	clearHighlights()
	for _,obj in pairs(Workspace:GetDescendants()) do
		if Settings.ESP.Banana and obj.Name:lower():find("banana") then
			highlight(obj, Color3.new(1,0.8,0))
		elseif Settings.ESP.Players and obj:IsA("Model") and Players:FindFirstChild(obj.Name) then
			highlight(obj, Color3.new(0,1,0))
		elseif Settings.ESP.Exits and obj.Name:lower():find("exit") then
			highlight(obj, Color3.new(0,0.7,1))
		elseif Settings.ESP.Lockers and obj.Name:lower():find("locker") then
			highlight(obj, Color3.new(0.7,0.4,1))
		end
	end
end)

-- === AUTO HIDE + ESCAPE LOOP ===
task.spawn(function()
	while task.wait(1) do
		if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then continue end
		local root = LocalPlayer.Character.HumanoidRootPart

		-- Auto Hide
		if Settings.AutoHide then
			local banana, nearestLocker, minDist = nil, nil, math.huge
			for _,obj in pairs(Workspace:GetDescendants()) do
				if obj.Name:lower():find("banana") and obj:IsA("Model") then
					local part = obj:FindFirstChildWhichIsA("BasePart")
					if part and (part.Position - root.Position).Magnitude < 50 then banana = part end
				end
				if obj.Name:lower():find("locker") and obj:IsA("BasePart") then
					local d = (obj.Position - root.Position).Magnitude
					if d < minDist then nearestLocker, minDist = obj, d end
				end
			end
			if banana and nearestLocker then
				root.CFrame = nearestLocker.CFrame + Vector3.new(0,2,0)
			end
		end

		-- Auto Escape
		if Settings.AutoEscape then
			for _,obj in pairs(Workspace:GetDescendants()) do
				if obj.Name:lower():find("exit") and obj:IsA("BasePart") then
					root.CFrame = obj.CFrame + Vector3.new(0,3,0)
					break
				end
			end
		end
	end
end)

-- === INIT ===
LunaUI:Notification({
	Title = "Fixz Hub | Banana Eats",
	Content = "Loaded successfully!",
	Duration = 6
})