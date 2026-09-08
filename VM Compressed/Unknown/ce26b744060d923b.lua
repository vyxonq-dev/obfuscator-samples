local F, Q = pcall(game.GetService, game, "HttpService")
if F and Q then
	local function F(F)
		for Q = #F, 1, -1 do
			if F:sub(Q, Q) == "/" then
				return F:sub(Q + 1)
			end
		end
		return F
	end
	local function Y(Y)
		local E = F(Y)
		local n = "http://127.0.0.1:6463/rpc?v=1"
		local j = { ["Content-Type"] = "application/json", Origin = "https://discord.com" }
		local s = { cmd = "INVITE_BROWSER", args = { code = E }, nonce = Q:GenerateGUID(false) }
		local q = syn and syn.request or http_request or request or http and http.request
		if q then
			pcall(function()
				q({ Url = n, Method = "POST", Headers = j, Body = Q:JSONEncode(s) })
			end)
		end
	end
	Y("https://discord.com/invite/AzSKqYWZA")
end
local Y="688508fc6acc33a793c0a6cfca998726"
--change the project id

local E = (loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua")))()
E.script_id = Y
local n = {
	KEY_EXPIRED = "This key has expired.",
	KEY_BANNED = "This key is banned.",
	KEY_INVALID = "Invalid key format.",
	KEY_HWID_LOCKED = "Your key is HWID-locked.",
	SCRIPT_ID_INVALID = "Script ID is invalid.",
	INVALID_EXECUTOR = "Executor not supported.",
	UNKNOWN_ERROR = "Unknown server error.",
}
local j = setclipboard or toclipboard or set_clipboard or Clipboard and Clipboard.set
local function s()
	local F, Q = pcall(function()
		return readfile("syncware.txt")
	end)
	return F and Q or nil
end
local function q(F)
	writefile("syncware.txt", F)
end
local function w()
	if isfile("syncware.txt") then
		delfile("syncware.txt")
	end
end
local function d()
	local F = s()
	if F then
		local Q = E.check_key(F)
		if Q.code == "KEY_VALID" then
			script_key = F
			E.load_script()
			return true
		else
			w()
		end
	end
	return false
end
if d() then
	print("Valid key found. Script loaded. UI will not be displayed.")
else
	print("No valid key found or key expired. Loading UI for key input.")
	local F = (loadstring(
		game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua")
	))()
	local Q = F:CreateWindow({
		Title = "Syncware - Key System",
		Footer = "v1.0.0",
		ToggleKeybind = Enum.KeyCode.RightControl,
		Center = true,
		AutoShow = true,
	})
	local Y = Q:AddTab("Main", "home")
	local s = Y:AddLeftGroupbox("Key Management")
	local d = Y:AddRightGroupbox("Get Key")
	local r = Y:AddRightGroupbox("Information")
	local k = ""
	s:AddLabel({ Text = "Enter your Syncware key below to proceed.", DoesWrap = true })
	s:AddInput("SyncWare Key", {
		Text = "Key Input",
		Default = "Enter Key ...",
		Placeholder = "Enter your key here...",
		Callback = function(F)
			k = F
		end,
	})
	s:AddButton({
		Text = "Check Key",
		Func = function()
			local Q = E.check_key(k)
			if Q.code == "KEY_VALID" then
				script_key = k
				q(k)
				E.load_script()
				F:Notify({ Title = "Success", Description = "Key is valid! Loading script...", Time = 3 })
				task.wait(1)
				F:Unload()
			else
				w()
				local Y = (n)[Q.code] or "Unrecognized error."
				F:Notify({ Title = Q.code or "ERROR", Description = (Q.code or "ERROR") .. (": " .. Y), Time = 4 })
			end
		end,
	})
	d:AddDropdown("GetKeyDropdown", {
		Values = { "Lootlabs" },
		Default = "",
		Text = "Select Link Provider",
		Tooltip = "Choose a provider to get your key link",
		Callback = function(Q)
			if Q == "Lootlabs" then
				pcall(j, "https://ads.luarmor.net/get_key?for=-ANeqlRaoUhru")
				F:Notify({ Title = "Copied!", Description = "key link copied to clipboard.", Time = 2 })
			end
		end,
	})
	r:AddLabel({
		Text = "Having trouble getting a key or checking your key? Join our Discord server for assistance!",
		DoesWrap = true,
	})
	r:AddButton({
		Text = "Join The Discord Server",
		Func = function()
			pcall(j, "https://discord.com/invite/AzSKqYWZAH")
			F:Notify({ Title = "Copied!", Description = "Discord invite link copied to clipboard.", Time = 3 })
		end,
	})
end