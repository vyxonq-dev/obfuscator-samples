-- =================================================================================================
--  UILIB | Made by UILIB and DOZE
-- =================================================================================================

-- Library
local UILIB = loadstring(
	game:HttpGet(
		'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/testing/Library/Source.lua'
	)
)()

-- Shortcuts
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local VIM = game:GetService('VirtualInputManager')

-- Helpers
local function fireRemote(path, args)
	local node = ReplicatedStorage:WaitForChild('Framework', 9e9)
	for _, step in ipairs(path) do
		node = node:WaitForChild(step, 9e9)
	end
	node:FireServer(unpack(args))
end

local function pressKey(keyCode, duration)
	VIM:SendKeyEvent(true, keyCode, false, game)
	task.wait(duration or 0.1)
	VIM:SendKeyEvent(false, keyCode, false, game)
end

local function teleportTo(pos)
	LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end

-- Main Window
local Window = UILIB:CreateWindow({
	Title = 'Build A Cart',
	Version = 'LibWare v6.2',
})

-- Tabs
local MoneyTab = Window:CreateTab('Money')
local ShopTab = Window:CreateTab('Shop')
local CartTab = Window:CreateTab('Cart')
local RebirthTab = Window:CreateTab('Rebirth')
local CreditsTab = Window:CreateTab('Credits')
local MiscTab = Window:CreateTab('Misc')

----------------------------------------------------
-- Money Tab
----------------------------------------------------
MoneyTab:AddParagraph('Gives about 100il+ (depends on how many carts).')

MoneyTab:AddButton({
	Name = 'Launch',
	Callback = function()
		-- Launch
		fireRemote(
			{ 'Features', 'RailSystem', 'LaunchUtil', 'RemoteEvent' },
			{ 'Launch' }
		)

		-- Hold W for 1s
		task.wait(0.1)
		pressKey(Enum.KeyCode.W, 1)

		-- Teleport sequence
		task.wait(1)
		teleportTo(Vector3.new(-21474831380, 50000, 1000000))

		-- Return
		task.wait(4)
		fireRemote(
			{ 'Features', 'RailSystem', 'LaunchUtil', 'RemoteEvent' },
			{ 'Return' }
		)
	end,
})

----------------------------------------------------
-- Money Tab - Auto Farm
----------------------------------------------------
local AutoFarm = false
MoneyTab:AddToggle({
	Name = 'Auto Farm',
	Callback = function(state)
		AutoFarm = state
		if AutoFarm then
			task.spawn(function()
				while AutoFarm do
					-- Launch
					fireRemote(
						{
							'Features',
							'RailSystem',
							'LaunchUtil',
							'RemoteEvent',
						},
						{ 'Launch' }
					)

					-- Hold W for 1s
					task.wait(0.1)
					pressKey(Enum.KeyCode.W, 1)

					-- Teleport sequence
					task.wait(1)
					teleportTo(Vector3.new(-21474831380, 50000, 1000000))

					-- Return
					task.wait(4)
					fireRemote(
						{
							'Features',
							'RailSystem',
							'LaunchUtil',
							'RemoteEvent',
						},
						{ 'Return' }
					)

					-- Small delay before repeating (tweakable)
					task.wait(1)
				end
			end)
		end
		UILIB:Notify({
			Title = 'Auto Farm',
			Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
		})
	end,
})

----------------------------------------------------
-- Shop Tab
----------------------------------------------------
ShopTab:AddLabel('Cost Cash')

local shopItems = {
	'Small Fuel',
	'Engine',
	'Big Fuel',
	'V8 Engine',
	'Giant Fuel',
	'V12 Engine',
	'Tesla Battery',
	'Tesla Engine',
	'Turret',
}

for _, item in ipairs(shopItems) do
	ShopTab:AddButton({
		Name = item,
		Callback = function()
			fireRemote(
				{ 'Features', 'RailSystem', 'GearUtil', 'RemoteEvent' },
				{ 'BuyGear', item }
			)
		end,
	})
end

----------------------------------------------------
-- Cart Tab
----------------------------------------------------
local AutoUpgradeCart = false
CartTab:AddToggle({
	Name = 'Auto Upgrade Cart',
	Callback = function(state)
		AutoUpgradeCart = state
		if AutoUpgradeCart then
			task.spawn(function()
				while AutoUpgradeCart do
					fireRemote(
						{ 'Features', 'RailSystem', 'CartUtil', 'RemoteEvent' },
						{ 'BuyCart' }
					)
					task.wait(1)
				end
			end)
		end
		UILIB:Notify({
			Title = 'Auto Upgrade Cart',
			Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
		})
	end,
})

----------------------------------------------------
-- Rebirth Tab
----------------------------------------------------
local AutoRebirth = false
RebirthTab:AddToggle({
	Name = 'Auto Rebirth',
	Callback = function(state)
		AutoRebirth = state
		if AutoRebirth then
			task.spawn(function()
				while AutoRebirth do
					fireRemote({
						'Features',
						'RebirthSystem',
						'RebirthUtil',
						'RemoteEvent',
					}, { 'Rebirth' })
					task.wait(1)
				end
			end)
		end
		UILIB:Notify({
			Title = 'Auto Rebirth',
			Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
		})
	end,
})

----------------------------------------------------
-- Credits Tab
----------------------------------------------------
CreditsTab:AddLabel('Scripters')
CreditsTab:AddParagraph('The scripts in this UI are made by UILIB/Doze')

CreditsTab:AddLabel('UI')
CreditsTab:AddParagraph('This UI was made by UILIB')

----------------------------------------------------
-- Misc Tab
----------------------------------------------------
MiscTab:AddLabel('UI Settings')
MiscTab:AddKeybind({
	Name = 'Toggle UI',
	Key = Enum.KeyCode.LeftControl,
	Callback = function()
		UILIB:Toggle()
	end,
})

MiscTab:AddLabel('Discord')

-- Executor detection
local requestFunc = syn and syn.request
	or http_request
	or fluxus and fluxus.request
	or Krnl and Krnl.request
	or zenith and zenith.request

if not requestFunc then
	warn('No supported executor detected! This script may not work.')
end

-- Discord invite
local INVITE_CODE = 'QYRBbM4gHp'
MiscTab:AddButton({
	Name = 'Join Discord',
	Callback = function()
		if not requestFunc then
			return warn('No supported executor found!')
		end
		requestFunc({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				['Origin'] = 'https://discord.com',
			},
			Body = game:GetService('HttpService'):JSONEncode({
				cmd = 'INVITE_BROWSER',
				args = { code = INVITE_CODE },
				nonce = game:GetService('HttpService'):GenerateGUID(false),
			}),
		})
	end,
})

----------------------------------------------------
-- Notifications & Extra Scripts
----------------------------------------------------
task.wait(1)
UILIB:Notify({
	Title = 'UILIB Loaded',
	Text = 'Version 6.2 is ready.',
	Duration = 5,
})

loadstring(
	game:HttpGet(
		'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Misc/Developer%20Detection%20System.lua'
	)
)()
loadstring(
	game:HttpGet(
		'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Misc/DevTag.lua'
	)
)()
