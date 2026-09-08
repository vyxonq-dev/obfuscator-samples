-- Elevate Classic - MOBILE 10% SMALLER + Script Hub
-- Krnl Mobile Optimized (2025)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- === EXECUTOR CORE ===
local Executor = {}
function Executor.new()
	local self = {}
	self.env = {
		print = print, warn = warn,
		type = type, tostring = tostring, tonumber = tonumber,
		pairs = pairs, ipairs = ipairs,

		game = game, workspace = workspace,
		Players = Players, LocalPlayer = player,
		UserInputService = game:GetService("UserInputService"),
		ReplicatedStorage = game:GetService("ReplicatedStorage"),

		table = table, math = math, string = string,
		Vector3 = Vector3, CFrame = CFrame, UDim2 = UDim2, Color3 = Color3,

		task = task, spawn = task.spawn, wait = task.wait, delay = task.delay,
	}

	setmetatable(self.env, {
		__index = function(_, k) error("Blocked: " .. k, 2) end,
		__newindex = function(_, k) error("No modify: " .. k, 2) end,
	})

	function self:Run(code)
		if not code or code:gsub("%s+", "") == "" then
			warn("[Elevate] Empty")
			return
		end
		local func, err = loadstring(code)
		if not func then
			warn("[Elevate] Compile: " .. err)
			return
		end
		setfenv(func, self.env)
		pcall(func)
		print("[Elevate Classic] Done.")
	end

	return self
end

-- === SCRIPT HUB (20+ Scripts) ===
local Scripts = {
	-- SERVER
	["Fly"] = [[
		local lp = game.Players.LocalPlayer
		local char = lp.Character or lp.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")
		local speed = 50
		local flying = true
		local bv = Instance.new("BodyVelocity")
		bv.MaxForce = Vector3.new(1e5,1e5,1e5)
		bv.Velocity = Vector3.new()
		bv.Parent = hrp
		while flying do
			local cam = workspace.CurrentCamera
			local move = Vector3.new()
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= cam.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= cam.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += cam.CFrame.RightVector end
			bv.Velocity = move.Unit * speed
			task.wait()
		end
		bv:Destroy()
		print("Fly ON")
	]],
	["Speed"] = [[game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100]],
	["God"] = [[game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge; game.Players.LocalPlayer.Character.Humanoid.Health = math.huge]],
	["Noclip"] = [[for _,v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end]],
	["ESP"] = [[for _,p in ipairs(game.Players:GetPlayers()) do if p ~= player and p.Character then local h = Instance.new("Highlight", p.Character); h.FillColor = Color3.fromRGB(255,0,0) end end]],
	["IY"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()]],
	["Kill All"] = [[for _,p in ipairs(game.Players:GetPlayers()) do if p ~= player and p.Character then p.Character.Humanoid.Health = 0 end end]],
	["Anti-AFK"] = [[game.Players.LocalPlayer.Idled:Connect(function() game:GetService("VirtualUser"):CaptureController() end)]],
	["FOV"] = [[workspace.CurrentCamera.FieldOfView = 120]],
	["Zero G"] = [[workspace.Gravity = 0]],

	-- CLIENT
	["Click TP"] = [[local m = player:GetMouse(); m.Button1Down:Connect(function() player.Character.HumanoidRootPart.CFrame = CFrame.new(m.Hit.p + Vector3.new(0,5,0)) end)]],
	["Rainbow"] = [[while task.wait(0.1) do for _,v in ipairs(player.Character:GetDescendants()) do if v:IsA("BasePart") then v.Color = Color3.fromHSV(tick()%5/5,1,1) end end end]],
	["Xray"] = [[for _,v in ipairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.Transparency = 0.7 end end]],
	["Free Cam"] = [[local cam = workspace.CurrentCamera; cam.CameraType = Enum.CameraType.Scriptable; game:GetService("RunService").RenderStepped:Connect(function() local move = Vector3.new() if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end cam.CFrame += move * 50 * task.wait() end) ]],
	["Chat Spam"] = [[while task.wait(1) do game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Elevate Classic!", "All") end]],
	["Headless"] = [[player.Character.Head.Transparency = 1]],
	["Big Head"] = [[player.Character.Head.Size = Vector3.new(10,10,10)]],
	["Neon"] = [[for _,v in ipairs(player.Character:GetDescendants()) do if v:IsA("BasePart") then v.Material = Enum.Material.Neon; v.Color = Color3.fromRGB(0,255,255) end end]],
	["Auto Click"] = [[while task.wait(0.01) do mouse1click() end]],
	["Gravity"] = [[workspace.Gravity = 50]]
}

-- === MOBILE-OPTIMIZED GUI (10% SMALLER) ===
local screen = Instance.new("ScreenGui")
screen.Name = "ElevateClassic"
screen.ResetOnSpawn = false
screen.Parent = playerGui

-- 10% smaller than original
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 504, 0, 342)  -- Was 560x380 → now 504x342
main.Position = UDim2.new(0.5, -252, 0.5, -171)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
main.BorderSizePixel = 2
main.BorderColor3 = Color3.fromRGB(255, 255, 255)
main.Draggable = true
main.Active = true
main.Parent = screen

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 27)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
titleBar.BorderSizePixel = 1
titleBar.BorderColor3 = Color3.fromRGB(255, 255, 255)
titleBar.Parent = main

local title = Instance.new("TextLabel")
title.Text = "Elevate Classic"
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 15
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -65, 1, 0)
title.Position = UDim2.new(0, 8, 0, 0)
title.Parent = titleBar

local close = Instance.new("TextButton")
close.Text = "X"
close.Font = Enum.Font.SourceSansBold
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
close.BorderSizePixel = 1
close.BorderColor3 = Color3.fromRGB(255, 255, 255)
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -27, 0, 1)
close.Parent = titleBar
close.MouseButton1Click:Connect(function() screen:Destroy() end)

-- Tabs
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, -18, 0, 27)
tabFrame.Position = UDim2.new(0, 9, 0, 32)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = main

local editorTab = Instance.new("TextButton")
editorTab.Text = "Editor"
editorTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
editorTab.TextColor3 = Color3.new(1,1,1)
editorTab.BorderSizePixel = 1
editorTab.BorderColor3 = Color3.fromRGB(255,255,255)
editorTab.Size = UDim2.new(0, 90, 1, 0)
editorTab.Parent = tabFrame

local scriptsTab = Instance.new("TextButton")
scriptsTab.Text = "Scripts"
scriptsTab.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
scriptsTab.TextColor3 = Color3.new(1,1,1)
scriptsTab.BorderSizePixel = 1
scriptsTab.BorderColor3 = Color3.fromRGB(255,255,255)
scriptsTab.Size = UDim2.new(0, 90, 1, 0)
scriptsTab.Position = UDim2.new(0, 100, 0, 0)
scriptsTab.Parent = tabFrame

-- Editor Panel
local editorPanel = Instance.new("Frame")
editorPanel.Size = UDim2.new(1, -18, 1, -100)
editorPanel.Position = UDim2.new(0, 9, 0, 63)
editorPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
editorPanel.BorderSizePixel = 1
editorPanel.BorderColor3 = Color3.fromRGB(255,255,255)
editorPanel.Visible = true
editorPanel.Parent = main

local codeBox = Instance.new("TextBox")
codeBox.PlaceholderText = "-- Script here..."
codeBox.MultiLine = true
codeBox.Text = ""
codeBox.Font = Enum.Font.Code
codeBox.TextColor3 = Color3.fromRGB(200, 255, 200)
codeBox.BackgroundTransparency = 1
codeBox.TextXAlignment = Enum.TextXAlignment.Left
codeBox.TextYAlignment = Enum.TextYAlignment.Top
codeBox.Size = UDim2.new(1, -8, 1, -8)
codeBox.Position = UDim2.new(0, 4, 0, 4)
codeBox.Parent = editorPanel

-- Script Hub Panel
local scriptPanel = Instance.new("ScrollingFrame")
scriptPanel.Size = UDim2.new(1, -18, 1, -100)
scriptPanel.Position = UDim2.new(0, 9, 0, 63)
scriptPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
scriptPanel.BorderSizePixel = 1
scriptPanel.BorderColor3 = Color3.fromRGB(255,255,255)
scriptPanel.Visible = false
scriptPanel.ScrollBarThickness = 6
scriptPanel.CanvasSize = UDim2.new(0, 0, 0, 0)
scriptPanel.Parent = main

local scriptList = Instance.new("UIListLayout")
scriptList.Padding = UDim.new(0, 3)
scriptList.Parent = scriptPanel

-- Add Scripts
local y = 0
for name, code in pairs(Scripts) do
	local btn = Instance.new("TextButton")
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BorderSizePixel = 1
	btn.BorderColor3 = Color3.fromRGB(255,255,255)
	btn.Size = UDim2.new(1, -8, 0, 27)
	btn.Position = UDim2.new(0, 4, 0, y)
	btn.Parent = scriptPanel
	y += 30

	btn.MouseButton1Click:Connect(function()
		codeBox.Text = code
		editorTab.BackgroundColor3 = Color3.fromRGB(50,50,60)
		scriptsTab.BackgroundColor3 = Color3.fromRGB(40,40,50)
		editorPanel.Visible = true
		scriptPanel.Visible = false
	end)
end
scriptPanel.CanvasSize = UDim2.new(0, 0, 0, y)

-- === BUTTONS (MOBILE-FRIENDLY) ===
local clearBtn = Instance.new("TextButton")
clearBtn.Text = "Clear"
clearBtn.BackgroundColor3 = Color3.fromRGB(139, 0, 0)  -- DARK RED
clearBtn.TextColor3 = Color3.new(1,1,1)
clearBtn.BorderSizePixel = 1
clearBtn.BorderColor3 = Color3.fromRGB(255,255,255)
clearBtn.Size = UDim2.new(0, 81, 0, 32)  -- Smaller for mobile
clearBtn.Position = UDim2.new(1, -180, 1, -41)
clearBtn.Parent = main

local execBtn = Instance.new("TextButton")
execBtn.Text = "Execute"
execBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)   -- DARK GREEN
execBtn.TextColor3 = Color3.new(1,1,1)
execBtn.BorderSizePixel = 1
execBtn.BorderColor3 = Color3.fromRGB(255,255,255)
execBtn.Size = UDim2.new(0, 90, 0, 32)
execBtn.Position = UDim2.new(1, -90, 1, -41)
execBtn.Parent = main

-- === TAB LOGIC ===
editorTab.MouseButton1Click:Connect(function()
	editorTab.BackgroundColor3 = Color3.fromRGB(50,50,60)
	scriptsTab.BackgroundColor3 = Color3.fromRGB(40,40,50)
	editorPanel.Visible = true
	scriptPanel.Visible = false
end)

scriptsTab.MouseButton1Click:Connect(function()
	scriptsTab.BackgroundColor3 = Color3.fromRGB(50,50,60)
	editorTab.BackgroundColor3 = Color3.fromRGB(40,40,50)
	scriptPanel.Visible = true
	editorPanel.Visible = false
end)

-- === EXECUTE ===
local exec = Executor.new()
execBtn.MouseButton1Click:Connect(function() exec:Run(codeBox.Text) end)
clearBtn.MouseButton1Click:Connect(function() codeBox.Text = "" end)

print("[Elevate Classic] Mobile version loaded (10% smaller)")