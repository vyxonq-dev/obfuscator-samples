local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = 'Steal a planet',
	Icon = 0,
	LoadingTitle = 'steal a planet script',
	LoadingSubtitle = 'by Juno',
	ShowText = 'sure',
	Theme = 'Default',
	ToggleUIKeybind = 'K',

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,

	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = 'Big Hub',
	},

	Discord = {
		Enabled = false,
		Invite = 'noinvitelink',
		RememberJoins = true,
	},

	KeySystem = false,
	KeySettings = {
		Title = 'Untitled',
		Subtitle = 'Key System',
		Note = 'No method of obtaining the key is provided',
		FileName = 'Key',
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = { 'Hello' },
	},
})

--// Main Tab
local MainTab = Window:CreateTab('Main', 4483362458)

-- Position Save Variables
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local savedCFrame = nil

-- Save Position Function
local function savePosition()
	if
		LocalPlayer.Character
		and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
	then
		savedCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
		Rayfield:Notify({
			Title = 'Position Saved',
			Content = 'Your position has been saved successfully!',
			Duration = 4,
		})
	else
		Rayfield:Notify({
			Title = 'Error',
			Content = 'Could not save position (HumanoidRootPart missing).',
			Duration = 4,
		})
	end
end

-- Load Position Function
local function loadPosition()
	if
		savedCFrame
		and LocalPlayer.Character
		and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
	then
		LocalPlayer.Character.HumanoidRootPart.CFrame = savedCFrame
		Rayfield:Notify({
			Title = 'Teleported',
			Content = 'You have been returned to your saved position!',
			Duration = 4,
		})
	else
		Rayfield:Notify({
			Title = 'Error',
			Content = 'No saved position found.',
			Duration = 4,
		})
	end
end

-- Save Position Button & Label
MainTab:CreateButton({
	Name = 'Save Position',
	Callback = function()
		savePosition()
	end,
})
MainTab:CreateLabel('Save position in your base')

-- Load Position Button & Label
MainTab:CreateButton({
	Name = 'Load Position',
	Callback = function()
		loadPosition()
	end,
})
MainTab:CreateLabel('Teleport back to base after saving position')

-- Noclip Variables
local RunService = game:GetService('RunService')
local NoclipEnabled = false

-- Noclip Loop
RunService.Stepped:Connect(function()
	if NoclipEnabled then
		local Character = LocalPlayer.Character
		if Character then
			for _, part in pairs(Character:GetDescendants()) do
				if part:IsA('BasePart') then
					part.CanCollide = false
				end
			end
		end
	end
end)

-- Noclip Toggle
MainTab:CreateToggle({
	Name = 'Noclip',
	CurrentValue = false,
	Flag = 'NoclipToggle',
	Callback = function(Value)
		NoclipEnabled = Value
		if Value then
			Rayfield:Notify({
				Title = 'Noclip Enabled',
				Content = 'You can now pass through walls!',
				Duration = 3,
			})
		else
			Rayfield:Notify({
				Title = 'Noclip Disabled',
				Content = 'You will now collide with objects again.',
				Duration = 3,
			})
		end
	end,
})

-- Label under Noclip
MainTab:CreateLabel('Bypass locked door')

--// Info Tab
local InfoTab = Window:CreateTab('Info', 4483362458)
InfoTab:CreateLabel('Rayfield Example Hub')
InfoTab:CreateLabel('Made by: Sirius')
InfoTab:CreateLabel('Use Main tab to save/load positions and toggle noclip')
