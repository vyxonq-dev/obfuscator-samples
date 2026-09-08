local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local rs = game:GetService("ReplicatedStorage")
local delayTime = 2
local running = false

local w = Rayfield:CreateWindow({
	Name = "Pro's Hub",
	LoadingTitle = "Pro's Hub",
	LoadingSubtitle = "by Pro",
	KeySystem = false,
})

local t = w:CreateTab("Main")

t:CreateInput({
	Name = "Poop Delay (seconds)",
	PlaceholderText = "2 seconds",
	RemoveTextAfterFocusLost = false,
	Callback = function(v)
		local n = tonumber(v)
		if n and n >= 0 then
			delayTime = n
		end
	end
})

t:CreateToggle({
	Name = "Auto Poop",
	CurrentValue = false,
	Flag = "AutoPoop",
	Callback = function(v)
		running = v
		if running then
			task.spawn(function()
				while running do
					local s = rs:FindFirstChild("StartPoopMinigameServer")
					local p = rs:FindFirstChild("PoopSuccessEvent")
					if s and p then
						s:FireServer()
						p:FireServer()
					end
					task.wait(delayTime)
				end
			end)
		end
	end
})
