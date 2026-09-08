local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local gameName = "Hub"
pcall(function()
	local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	if info and info.Name then
		gameName = info.Name
	end
end)

local Window = Library:CreateWindow({
	Title = gameName,
	Footer = "Key System",
	NotifySide = "Right",
	ShowCustomCursor = true,
	Size = UDim2.fromOffset(700, 500),
})

local Tabs = {
	Key = Window:AddKeyTab("Key System"),
}

Tabs.Key:AddLabel({
	Text = "Get Key",
	DoesWrap = false,
	Size = 18,
})

Tabs.Key:AddKeyBox(function(ReceivedKey)
	local Success = ReceivedKey == "YOUR_KEY_HERE"

	if Success then
		Library:Notify({ Title = gameName, Description = "Key accepted.", Time = 3 })
	else
		Library:Notify({ Title = gameName, Description = "Invalid key.", Time = 3 })
	end
end)

Tabs.Key:AddButton({
	Text = "Get Key (Copy Discord)",
	Func = function()
		local link = "https://discord.gg/C4cTeqkpug"
		if setclipboard then
			setclipboard(link)
			Library:Notify({ Title = gameName, Description = "Discord copied to clipboard.", Time = 3 })
		else
			Library:Notify({ Title = gameName, Description = link, Time = 5 })
		end
	end,
	DoubleClick = false,
})
