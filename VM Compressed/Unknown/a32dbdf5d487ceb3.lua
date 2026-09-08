loadstring(game:HttpGet("https://raw.githubusercontent.com/decryp1/Herkle-Hub/refs/heads/main/game%20redirect"))()

--[[
local repo = "https://raw.githubusercontent.com/decryp1/Obsidian/main/"
local lib = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local win = lib:CreateWindow({
	Title = 'Herkle Hub',
	Footer = "[Herkle Hub Key System](dsc.gg/herkle)",
	CornerRadius = 10,
	Icon = 92738315967681,
	Center = true,
	AutoShow = true,
	Resizable = true,
	Showfixcursor = false,
	Size = UDim2.fromOffset(495, 222)
})
local tabs = {
	main = win:AddTab('main', 'user'),
	['UI settings'] = win:AddTab('UI settings', 'settings')
}
local key = ""
local luarmor = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
luarmor.script_id = "d3c537afeae2d2813e509760f1c10fa1"
local BLANKBOX = tabs.main:AddLeftGroupbox('Key System')
BLANKBOX:AddInput('KeyInput', {
	Default = '',
	Placeholder = 'Enter key',
	Numeric = false,
	Finished = false,
	Text = 'Key',
	Callback = function(Value)
		key = Value
	end
})
BLANKBOX:AddButton('Check Key', function()
	if key and key ~= "" then
		local result = luarmor.check_key(key)
		if result and result.code == "KEY_VALID" then
			script_key = key
			lib:Unload()
			loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d3c537afeae2d2813e509760f1c10fa1.lua"))()
		else
			lib:Notify(result.message or "Invalid key or failed to verify.", 5)
		end
	else
		lib:Notify("Please enter a key.", 5)
	end
end)

local asdasd = tabs.main:AddRightGroupbox('Key Options')
asdasd:AddButton({Text = "Copy Linkvertise", Func = function()
	setclipboard("https://ads.luarmor.net/get_key?for=Herkle_Hub_Linkvertise-FbdchXNZPdvU")
end})
asdasd:AddButton({Text = "Copy LootLabs", Func = function()
	setclipboard("https://ads.luarmor.net/get_key?for=Herkle_Hub_LootLabs-dwlDbnOWiygS")
end})
asdasd:AddLabel("discord: dsc.gg/herkle")

local menu = tabs['UI settings']:AddLeftGroupbox('Menu')
menu:AddButton('Unload', function() lib:Unload() end)
menu:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {Default = 'End', NoUI = true, Text = 'Menu keybind'})
lib.ToggleKeybind = lib.Options.MenuKeybind
ThemeManager:SetLibrary(lib)
SaveManager:SetLibrary(lib)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({'MenuKeybind'})
ThemeManager:SetFolder('hhubkeysystem')
SaveManager:SetFolder('hhubkeysysten')
SaveManager:BuildConfigSection(tabs['UI settings'])
ThemeManager:ApplyToTab(tabs['UI settings'])
SaveManager:LoadAutoloadConfig()
]]
