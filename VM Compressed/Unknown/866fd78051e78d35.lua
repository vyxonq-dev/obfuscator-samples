repeat
	task.wait()
until game:IsLoaded()

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "New Update Coming Soon Join For More Info:";
	Text = "Discord Link: https://discord.gg/4nSEd2Pu8f (copied to clipboard)";
	Duration = 45;
})

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Important For Xeno/Solara Users:";
	Text = "Join the discord for instructions to fix if the script isnt loading\nIts a common bug thats easy to fix";
	Duration = 45;
})


setclipboard("https://discord.gg/4nSEd2Pu8f")

local HUB_SCRIPT_ID = "72f5693f13d3d2008d69785db59bcb12"
local HUB_DISCORD_CODE = "4nSEd2Pu8f"
local workink_KEY_LINK = "https://ads.luarmor.net/get_key?for=BoatBuilderHub_Key_System-FxZfyDCbapNR"
local linkvertise_KEY_LINK = "https://ads.luarmor.net/get_key?for=BoatBuilderHub_Linkvertise-RMgzLzWbeeYz"
local lootlabs_KEY_LINK = "https://ads.luarmor.net/get_key?for=BoatBuilderHub_LootLink-qaiYSvdzNiSf"

local MAIN_FOLDER = "BBuilderHub"
local KEY_FILE = MAIN_FOLDER .. "/Key.txt"
local DISCORD_JOIN = MAIN_FOLDER .. "/JoinedDiscord.discord"
local OLD_KEY_FILE = MAIN_FOLDER .. "/Settings.config"

local PlaceIDs = {
	["537413528"] = "72f5693f13d3d2008d69785db59bcb12",
	["76558904092080"] = "0bef79fe69ee3fe8607ff9f07f2d8def",
	["129009554587176"] = "0bef79fe69ee3fe8607ff9f07f2d8def",
}

local Names = {
	["537413528"] = "BoatBuilderHub",
	["76558904092080"] = "ReForge",
	["129009554587176"] = "ReForge",
}

local HUB_NAME = Names[tostring(game.PlaceId)] or "BuilderHub"

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/catblox1346/StensUIReMake/refs/heads/main/UIStuff/ReGui-Backup"))()
local luarmor = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

local cloneref = cloneref or function(x)
	return x
end
local Players = cloneref(game:GetService("Players"))
local HttpService = cloneref(game:GetService("HttpService"))
local Request = http_request or request or syn and syn.request or http

local function norm(s)
	if not s then
		return nil
	end
	local t = tostring(s):gsub("%s+", "")
	if t == "" then
		return nil
	end
	return t
end

local function ensureFolder()
	if not isfolder(MAIN_FOLDER) then
		makefolder(MAIN_FOLDER)
	end
end

local function readKey()
	if not isfile(KEY_FILE) then
		return nil
	end
	local ok, v = pcall(readfile, KEY_FILE)
	return ok and norm(v) or nil
end

local function writeKey(k)
	k = norm(k)
	if not k then
		return
	end
	ensureFolder()
	if isfile(OLD_KEY_FILE) then
		pcall(delfile, OLD_KEY_FILE)
	end
	pcall(writefile, KEY_FILE, k)
end

local function migrateOld()
	if isfile(OLD_KEY_FILE) then
		local ok, v = pcall(readfile, OLD_KEY_FILE)
		if ok then
			_G.script_key = norm(v) or _G.script_key
		end
		pcall(delfile, OLD_KEY_FILE)
	end
end

local function clearKey()
	if isfile(KEY_FILE) then
		pcall(delfile, KEY_FILE)
	end
	_G.script_key = nil
	rawset(getfenv and getfenv() or _G, "script_key", nil)
end

local function set_global_key(v)
	v = norm(v)
	if not v then
		return
	end
	_G.script_key = v
	rawset(getfenv and getfenv() or _G, "script_key", v)
end

local supported = PlaceIDs[tostring(game.PlaceId)]
if not supported then
	Players.LocalPlayer:Kick("Game not supported for this script.")
	return
end

luarmor.script_id = supported or HUB_SCRIPT_ID

ensureFolder()
migrateOld()

if _G.script_key then
	set_global_key(_G.script_key)
else
	local rk = readKey()
	if rk then
		set_global_key(rk)
	end
end

local function validate(k)
	k = norm(k)
	if not k then
		return false, { code = "KEY_INVALID", message = "missing" }
	end
	set_global_key(k)
	local ok, status = pcall(function()
		return luarmor.check_key(k)
	end)
	if not ok then
		return false, { code = "CHECK_FAILED", message = tostring(status) }
	end
	if status and status.code == "KEY_VALID" then
		writeKey(k)
		return true, status
	end
	return false, status
end

local function instcheck()
	local k = norm(rawget(getfenv() or _G, "script_key")) or readKey()
	if not k then
		return false
	end
	local ok, status = validate(k)
	if ok then
		luarmor.load_script()
		return true
	end
	if status and status.code and status.code:find("KEY_") then
		clearKey()
	end
	return false
end

if instcheck() then
	return
end

local win = ReGui:Window({
	Title = HUB_NAME .. " | Key System",
	NoClose = true,
	NoResize = true,
	Size = UDim2.new(0, 480, 0, 320),
}):Center()

win:Label({
	Text = "🔒 Script Locked",
	TextScaled = false,
	TextSize = 20,
	Size = UDim2.new(1, 0, 0, 32),
})

win:Separator()

win:Label({
	Text = "Enter your key to continue",
	TextWrapped = true,
	Size = UDim2.new(1, 0, 0, 20),
})

local statusLabel = win:Label({
	Text = "",
	TextWrapped = true,
	TextColor3 = Color3.fromRGB(255, 40, 40),
	Size = UDim2.new(1, 0, 0, 22),
})

local function setStatus(t, good)
	statusLabel.Text = t
	statusLabel.TextColor3 = good and Color3.fromRGB(40, 255, 40) or Color3.fromRGB(255, 40, 40)
end

local keyText = _G.script_key or ""

local rowKey = win:Row({ Expanded = false })

rowKey:InputText({
	Label = "",
	Placeholder = "Paste key here",
	Default = keyText,
	Callback = function(_, v)
		keyText = v
	end,
})

rowKey:Button({
	Text = "Submit",
	BackgroundColor3 = Color3.fromRGB(70, 200, 120),
	Size = UDim2.new(0, 100, 0, 20),
	Callback = function()
		local ok, status = validate(keyText)
		if ok then
			setStatus("Key valid, loading...", true)
			task.delay(0.15, function()
				pcall(function()
					win:Close()
				end)
			end)
			luarmor.load_script()
			return
		end
		if status and status.code and status.code:find("KEY_") then
			clearKey()
			local msg = {
				KEY_HWID_LOCKED = "Key locked to another HWID",
				KEY_INCORRECT = "Incorrect key",
				KEY_INVALID = "Invalid key",
			}
			setStatus(msg[status.code] or "Key check failed", false)
		else
			setStatus("Service error. Try again.", false)
		end
	end,
})

win:Separator()

local rowTop = win:Row({ Expanded = false })

rowTop:Button({
	Text = "Get Key (work.ink)",
	BackgroundColor3 = Color3.fromRGB(46, 204, 113),
	Size = UDim2.new(0.32, 0, 0, 20),
	Callback = function()
		setclipboard(workink_KEY_LINK)
		setStatus("Key link copied", true)
	end,
})

rowTop:Button({
	Text = "Get Key (Linkvertise)",
	BackgroundColor3 = Color3.fromRGB(255, 164, 27),
	Size = UDim2.new(0.32, 0, 0, 20),
	Callback = function()
		setclipboard(linkvertise_KEY_LINK)
		setStatus("Key link copied", true)
	end,
})--]]

--[[rowTop:Button({
	Text = "Get Key (LootLabs)",
	BackgroundColor3 = Color3.fromRGB(255, 193, 7),
	Size = UDim2.new(0.32, 0, 0, 20),
	Callback = function()
		setclipboard(lootlabs_KEY_LINK)
		setStatus("Key link copied", true)
	end,
})--]]

win:Separator()

local rowBottom = win:Row({ Expanded = true })

rowBottom:Button({
	Text = "Join Discord",
	BackgroundColor3 = Color3.fromRGB(255, 80, 80),
	Callback = function()
		setclipboard("https://discord.gg/" .. HUB_DISCORD_CODE)
		setStatus("discord.gg/" .. HUB_DISCORD_CODE .. " copied", true)
		if Request then
			pcall(function()
				Request({
					Url = "http://127.0.0.1:6463/rpc?v=1",
					Method = "POST",
					Headers = { ["Content-Type"] = "application/json", ["origin"] = "https://discord.com" },
					Body = HttpService:JSONEncode({
						args = { code = HUB_DISCORD_CODE },
						cmd = "INVITE_BROWSER",
						nonce = ".",
					}),
				})
			end)
		end
	end,
})

rowBottom:Button({
	Text = "Help",
	BackgroundColor3 = Color3.fromRGB(30, 200, 200),
	Callback = function()
		local p = win:PopupModal({ Title = "Help", AutoSize = "Y", Visible = true })
		p:Label({
			Text = "1. Click a key link.\n2. Complete steps and copy your key.\n3. Paste and Submit.",
			TextWrapped = true,
		})
		p:Separator()
		p:Button({
			Text = "Close",
			Callback = function()
				p:ClosePopup()
			end,
		})
	end,
})

if not isfile(DISCORD_JOIN) then
	if Request then
		pcall(function()
			Request({
				Url = "http://127.0.0.1:6463/rpc?v=1",
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json", ["origin"] = "https://discord.com" },
				Body = HttpService:JSONEncode({
					args = { code = HUB_DISCORD_CODE },
					cmd = "INVITE_BROWSER",
					nonce = ".",
				}),
			})
		end)
	end

	pcall(writefile, DISCORD_JOIN, "Joined at " .. os.date("%Y-%m-%d %H:%M:%S"))
end
