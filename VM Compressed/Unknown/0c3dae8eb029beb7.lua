repeat
	task.wait()
until game:IsLoaded()

local Hub = "Luckyware"
local Hub_Script_ID = "20efe85b3452d1fa0feb38ce30bbad53"
local Discord_Invite = "hKSpy8495M"
local UI_Theme = "Dark"

local Linkvertise_Enabled = true
local Linkvertise_Link = "https://ads.luarmor.net/get_key?for=Luckyware-rIRHwoqvHliI"

local Lootlabs_Enabled = true
local Lootlabs_Link = "https://ads.luarmor.net/get_key?for=Luckyware-XPVqjPRiCpqH"

local PlaceIDs = {
	["118693886221846"] = "9b5ab79f8007e89b695dac53c55f0904",
	["8304191830"] = "0bd8fd6455fc4e4e8453091023892b7c",
	["18687417158"] = "58b52abb25606af68adcd5c0ce248c92",
	["94845773826960"] = "69559f04bcb1949ddbea9b5e419520cd",
	["121864768012064"] = "20efe85b3452d1fa0feb38ce30bbad53",
	["126509999114328"] = "caa4a9861d7535dd998d280724aeafd4",
	["91090822274062"]= "6f3c20fbf96cbc69b8c9f8fcf4c54e18"
}

makefolder(Hub)
local key_path = Hub .. "/Key.txt"
script_key = script_key or isfile(key_path) and readfile(key_path) or nil
local UI = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local API = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()
local Cloneref = cloneref or function(instance)
	return instance
end
local Players = Cloneref(game:GetService("Players"))
local HttpService = Cloneref(game:GetService("HttpService"))
local AssetService = Cloneref(game:GetService("AssetService"))
local Request = http_request or request or syn.request or http
local GamePlacesPages = AssetService:GetGamePlacesAsync()
local Pages = GamePlacesPages:GetCurrentPage()

while true do
	for _, place in ipairs(Pages) do
		if PlaceIDs[tostring(place.PlaceId)] then
			API.script_id = PlaceIDs[tostring(place.PlaceId)]
			break
		else
			API.script_id = Hub_Script_ID
		end
	end
	if GamePlacesPages.IsFinished then
		break
	end
	GamePlacesPages:AdvanceToNextPageAsync()
	Pages = GamePlacesPages:GetCurrentPage()
end

local function notify(title, content, duration)
	UI:Notify({ Title = title, Content = content, Duration = duration or 8 })
end

local function checkKey(input_key)
	local status = API.check_key(input_key or script_key)
	if status.code == "KEY_VALID" then
		script_key = input_key or script_key
		writefile(key_path, script_key)
		UI:Destroy()
		API.load_script()
	elseif status.code:find("KEY_") then
		local messages = {
			KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
			KEY_INCORRECT = "Key is incorrect",
			KEY_INVALID = "Key is invalid",
		}
		notify("Key Check Failed", messages[status.code] or "Unknown error")
	else
		Players.LocalPlayer:Kick("Key check failed: " .. status.message .. " Code: " .. status.code)
	end
end

if script_key then
	checkKey()
end

local Window = UI:CreateWindow({
	Title = Hub,
	SubTitle = "Loader",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 320),
	Acrylic = false,
	Theme = UI_Theme,
	MinimizeKey = Enum.KeyCode.End,
})

local Tabs = { Main = Window:AddTab({ Title = "Key", Icon = "" }) }

local Input = Tabs.Main:AddInput("Key", {
	Title = "Enter Key:",
	Default = script_key or "",
	Placeholder = "Example: agKhRikQP..",
	Numeric = false,
	Finished = false,
})

if Linkvertise_Enabled then
	Tabs.Main:AddButton({
		Title = "Get Key (Linkvertise)",
		Callback = function()
			setclipboard(Linkvertise_Link)
			notify("Copied To Clipboard", "Ad Reward Link has been copied to your clipboard", 16)
		end,
	})
end

if Lootlabs_Enabled then
	Tabs.Main:AddButton({
		Title = "Get Key (Lootlabs)",
		Callback = function()
			setclipboard(Lootlabs_Link)
			notify("Copied To Clipboard", "Ad Reward Link has been copied to your clipboard", 16)
		end,
	})
end

Tabs.Main:AddButton({
	Title = "Check Key",
	Callback = function()
		checkKey(Input.Value)
	end,
})

Tabs.Main:AddButton({
	Title = "Permanent Key",
	Callback = function()
		setclipboard("https://discord.gg/" .. Discord_Invite)
		notify("Copied To Clipboard", "discord.gg/" .. Discord_Invite, 16)
		Request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json", ["origin"] = "https://discord.com" },
			Body = HttpService:JSONEncode({ args = { code = Discord_Invite }, cmd = "INVITE_BROWSER", nonce = "." }),
		})
	end,
})

Tabs.Main:AddButton({
	Title = "Join Discord",
	Callback = function()
		setclipboard("https://discord.gg/" .. Discord_Invite)
		notify("Copied To Clipboard", "discord.gg/" .. Discord_Invite, 16)
		Request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json", ["osrigin"] = "https://discord.com" },
			Body = HttpService:JSONEncode({ args = { code = Discord_Invite }, cmd = "INVITE_BROWSER", nonce = "." }),
		})
	end,
})

Window:SelectTab(1)
notify(Hub, "Loader Has Loaded Successfully")
