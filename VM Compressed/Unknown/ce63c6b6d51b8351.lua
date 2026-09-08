--[[
	NovaZHub | Complete Script
	Using Linoria/Obsidian UI
--]]

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

-- Create Window
local Window = Library:CreateWindow({
	Title = "NovaZHub",
	Footer = "version: 1.0",
	Icon = 95816097006870,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

-- Create Tabs
local Tabs = {
	Main = Window:AddTab("Main", "user"),
	LuckyBlocks = Window:AddTab("LuckyBlocks"),
	Player = Window:AddTab("Player"),
	Admin = Window:AddTab("Admin"),
	Fun = Window:AddTab("Fun"),
	UISettings = Window:AddTab("UI Settings", "settings"),
	KeySystem = Window:AddKeyTab("Key System")
}

-- ================= Main Tab =================
local MainGroup = Tabs.Main:AddLeftGroupbox("NovaZHub Info")
MainGroup:AddLabel("Make by Cancelled :)")
MainGroup:AddLabel("NovaZHub")
MainGroup:AddLabel("Discord: https://discord.gg/VJgZBwgu9f")

-- ================= LuckyBlocks Tab =================
local LBGroup = Tabs.LuckyBlocks:AddLeftGroupbox("LuckyBlocks")
LBGroup:AddButton({Text = "Luckyblock", Func = function()
	game:GetService("ReplicatedStorage").SpawnLuckyBlock:FireServer()
end})
LBGroup:AddButton({Text = "Superblock", Func = function()
	game:GetService("ReplicatedStorage").SpawnSuperBlock:FireServer()
end})
LBGroup:AddButton({Text = "Diamondblock", Func = function()
	game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
end})
LBGroup:AddButton({Text = "Rainbowblock", Func = function()
	game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
end})
LBGroup:AddButton({Text = "Galaxyblock", Func = function()
	game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
end})

-- ================= Player Tab =================
local PlayerGroup = Tabs.Player:AddLeftGroupbox("Player Settings")
PlayerGroup:AddSlider("WalkSpeedSlider", {
	Text = "WalkSpeed",
	Default = 16,
	Min = 16,
	Max = 500,
	Rounding = 1,
	Callback = function(Value)
		local plr = game.Players.LocalPlayer
		if plr.Character and plr.Character:FindFirstChild("Humanoid") then
			plr.Character.Humanoid.WalkSpeed = Value
		end
	end,
})
PlayerGroup:AddSlider("JumpPowerSlider", {
	Text = "JumpPower",
	Default = 50,
	Min = 50,
	Max = 500,
	Rounding = 1,
	Callback = function(Value)
		local plr = game.Players.LocalPlayer
		if plr.Character and plr.Character:FindFirstChild("Humanoid") then
			plr.Character.Humanoid.JumpPower = Value
		end
	end,
})

-- ================= Admin Tab =================
local AdminGroup = Tabs.Admin:AddLeftGroupbox("Admin Scripts")
AdminGroup:AddButton({Text = "Yield (old)", Func = function()
	loadstring(game:HttpGet('https://pastebin.com/raw/tzTXmYf2', true))()
end})

-- ================= Fun Tab =================
local FunGroup = Tabs.Fun:AddLeftGroupbox("Fun Scripts")
FunGroup:AddButton({Text = "Chat Hax", Func = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ant-7802/--/main/straightmilk.lua'))()
end})

-- ================= UI Settings =================
local UIGroup = Tabs.UISettings:AddLeftGroupbox("Themes & Colors")
UIGroup:AddLabel("Theme Manager"):AddColorPicker("ThemeColor", {
	Default = Color3.fromRGB(0,255,140),
	Title = "Primary Color",
	Callback = function(Color)
		print("Theme color changed!", Color)
	end
})

-- ================= Keybinds =================
local KeyGroup = Tabs.KeySystem:AddLeftGroupbox("Keybinds")
KeyGroup:AddLabel("Auto Lockpick Safes"):AddKeyPicker("LockpickKey", {
	Default = "MB2",
	Mode = "Toggle",
	Callback = function(Value)
		print("Lockpick key toggled:", Value)
	end,
	ChangedCallback = function(New)
		print("Keybind changed:", New)
	end
})

-- ================= Extras =================
-- Example Toggle
PlayerGroup:AddToggle("InfiniteJumpToggle", {
	Text = "Infinite Jump",
	Default = false,
	Callback = function(Value)
		if Value then
			_G.InfiniteJumpEnabled = true
			game:GetService("UserInputService").JumpRequest:Connect(function()
				if _G.InfiniteJumpEnabled then
					local plr = game.Players.LocalPlayer
					if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
						plr.Character.HumanoidRootPart.Velocity = Vector3.new(0,50,0)
					end
				end
			end)
		else
			_G.InfiniteJumpEnabled = false
		end
	end,
})

-- Notify example
Library:Notify("NovaZHub loaded!", 5)
