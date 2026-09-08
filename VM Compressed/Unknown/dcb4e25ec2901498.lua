local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local gui = Instance.new("ScreenGui")
gui.Name = "LibraryHubLoader"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if gethui then
	gui.Parent = gethui()
elseif syn and syn.protect_gui then
	syn.protect_gui(gui)
	gui.Parent = CoreGui
else
	gui.Parent = CoreGui
end

-- MAIN
local main = Instance.new("Frame", gui)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 420, 0, 260)
main.BackgroundColor3 = Color3.fromRGB(18,18,20)
main.BorderSizePixel = 0
main.BackgroundTransparency = 1

Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(120,140,255)
stroke.Thickness = 1.2
stroke.Transparency = 1

-- TITLE
local title = Instance.new("TextLabel", main)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0.1,0)
title.Text = "LIBRARY HUB"
title.Font = Enum.Font.GothamBlack
title.TextSize = 30
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextTransparency = 1

-- SUBTITLE
local subtitle = Instance.new("TextLabel", main)
subtitle.BackgroundTransparency = 1
subtitle.Size = UDim2.new(1,0,0,20)
subtitle.Position = UDim2.new(0,0,0.27,0)
subtitle.Text = "Universal Script Loader"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.TextColor3 = Color3.fromRGB(170,170,170)
subtitle.TextTransparency = 1

-- BUTTON CREATOR
local function createButton(text, posY)
	local btn = Instance.new("TextButton", main)
	btn.AnchorPoint = Vector2.new(0.5,0)
	btn.Position = UDim2.new(0.5,0,posY,0)
	btn.Size = UDim2.new(0,330,0,48)
	btn.BackgroundColor3 = Color3.fromRGB(28,28,32)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.AutoButtonColor = false
	btn.BackgroundTransparency = 1
	btn.TextTransparency = 1

	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

	local s = Instance.new("UIStroke", btn)
	s.Color = Color3.fromRGB(80,80,80)
	s.Transparency = 1

	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(38,38,44)
		}):Play()
		TweenService:Create(s, TweenInfo.new(0.25), {
			Color = Color3.fromRGB(130,150,255)
		}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.25), {
			BackgroundColor3 = Color3.fromRGB(28,28,32)
		}):Play()
		TweenService:Create(s, TweenInfo.new(0.25), {
			Color = Color3.fromRGB(80,80,80)
		}):Play()
	end)

	return btn, s
end

local adoptBtn, adoptStroke = createButton("LOAD ADOPT ME SCRIPT", 0.48)
local mm2Btn, mm2Stroke     = createButton("LOAD MURDER MYSTERY 2", 0.68)

-- INTRO ANIMATION
TweenService:Create(main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	BackgroundTransparency = 0
}):Play()

TweenService:Create(stroke, TweenInfo.new(0.45), {Transparency = 0}):Play()
TweenService:Create(title, TweenInfo.new(0.45), {TextTransparency = 0}):Play()
TweenService:Create(subtitle, TweenInfo.new(0.45), {TextTransparency = 0}):Play()
TweenService:Create(adoptBtn, TweenInfo.new(0.45), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(adoptStroke, TweenInfo.new(0.45), {Transparency = 0}):Play()
TweenService:Create(mm2Btn, TweenInfo.new(0.45), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(mm2Stroke, TweenInfo.new(0.45), {Transparency = 0}):Play()

-- CLOSE
local function closeUI()
	local info = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	for _,v in pairs(main:GetDescendants()) do
		if v:IsA("TextLabel") or v:IsA("TextButton") then
			TweenService:Create(v, info, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
		elseif v:IsA("UIStroke") then
			TweenService:Create(v, info, {Transparency = 1}):Play()
		end
	end
	task.delay(0.45, function()
		gui:Destroy()
	end)
end

-- BUTTON LOGIC
adoptBtn.MouseButton1Click:Connect(function()
	adoptBtn.Text = "LOADING ADOPT ME..."
	adoptBtn.TextColor3 = Color3.fromRGB(120,255,120)
	closeUI()
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LibraryHubS-X/RR/refs/heads/main/adoptme.lua"))()
	end)
end)

mm2Btn.MouseButton1Click:Connect(function()
	mm2Btn.Text = "LOADING MURDER MYSTERY 2..."
	mm2Btn.TextColor3 = Color3.fromRGB(120,255,120)
	closeUI()
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LibraryHubS-X/RR/refs/heads/main/mm2.lua"))()
	end)
end)
