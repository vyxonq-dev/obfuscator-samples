local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Blind Shot esp",
	LoadingTitle = "by n1c",
	LoadingSubtitle = "Rayfield UI",
	Theme = "Default",
	ToggleUIKeybind = "K",
	ConfigurationSaving = {
		Enabled = true,
		FileName = "whyyoulookingatthescript?"
	}
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local ENABLED = false
local ORIGINAL = {}

local function cache(c)
	ORIGINAL[c] = ORIGINAL[c] or {}
	for _, o in ipairs(c:GetDescendants()) do
		if o:IsA("BasePart") or o:IsA("Decal") or o:IsA("Texture") then
			if ORIGINAL[c][o] == nil then
				ORIGINAL[c][o] = o.Transparency
			end
		end
	end
end

local function forceVisible(c)
	cache(c)
	for _, o in ipairs(c:GetDescendants()) do
		if o:IsA("BasePart") then
			o.LocalTransparencyModifier = 0
			o.Transparency = 0.4
		elseif o:IsA("Decal") or o:IsA("Texture") then
			o.Transparency = 0
		end
	end
end

local function restore(c)
	if not ORIGINAL[c] then return end
	for o, t in pairs(ORIGINAL[c]) do
		if o and o.Parent then
			o.Transparency = t
		end
	end
	ORIGINAL[c] = nil
end

local Tab = Window:CreateTab("Main", 4483362458)
Tab:CreateToggle({
	Name = "Reveal Invisible Players",
	CurrentValue = false,
	Callback = function(v)
		ENABLED = v
		if not ENABLED then
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LocalPlayer and p.Character then
					restore(p.Character)
				end
			end
		end
	end
})

local function hookPlayer(p)
	p.CharacterAdded:Connect(function(c)
		task.wait(0.2)
		if ENABLED then
			forceVisible(c)
		end
	end)
end

for _, p in ipairs(Players:GetPlayers()) do
	if p ~= LocalPlayer then
		hookPlayer(p)
	end
end

Players.PlayerAdded:Connect(function(p)
	if p ~= LocalPlayer then
		hookPlayer(p)
	end
end)

RunService.RenderStepped:Connect(function()
	if not ENABLED then return end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and p.Character and p.Character:FindFirstChildOfClass("Humanoid") and p.Character.Humanoid.Health > 0 then
			forceVisible(p.Character)
		end
	end
end)
