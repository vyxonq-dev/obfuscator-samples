local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()

local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "zkxks"
Junkie.identifier = "1103030"
Junkie.provider = "Zkxr"

local PremiumLink = "https://zkx.mysellauth.com"
local FreeLink = "https://zkxhub.vercel.app"
local DiscordLink = "https://discord.gg/bxu2WMjNjN"

local function hasFileSystemSupport()
	local hasWritefile = pcall(function() return type(writefile) == "function" end)
	local hasReadfile = pcall(function() return type(readfile) == "function" end)
	local hasIsfile = pcall(function() return type(isfile) == "function" end)
	return hasWritefile and hasReadfile and hasIsfile
end

local fileSystemSupported = hasFileSystemSupport()

local function saveVerifiedKey(key)
	if not fileSystemSupported then return false end
	local ok = pcall(function()
		writefile("verified_key.txt", key)
	end)
	return ok
end

local function loadVerifiedKey()
	if not fileSystemSupported then return nil end
	local ok, content = pcall(function()
		return readfile("verified_key.txt")
	end)
	if not ok or not content then return nil end
	return content
end

local function clearSavedKey()
	if not fileSystemSupported then return false end
	local ok = pcall(function() delfile("verified_key.txt") end)
	return ok
end

local function CheckKey(key)
	if not key then
		return {valid = false, message = "No key provided."}
	end
	local ok, result = pcall(function()
		return Junkie.check_key(key)
	end)
	if not ok or not result then
		return {valid = false, message = "Could not reach Junkie."}
	end
	return result
end

local function Build()
	local Window = Library:CreateWindow({
		Title = "Zkx Hub",
		Footer = ".gg/bxu2WMjNjN",
		Center = true,
		AutoShow = true,
		Resizable = false,
		Size = UDim2.fromOffset(420, 320)
	})

	local KeyTab = Window:AddKeyTab("Key System", "key")

	KeyTab:AddLabel({
		Text = "Key System",
		DoesWrap = true,
		Size = 20
	})

	KeyTab:AddLabel({
		Text = "Enter your key below to access the hub.",
		DoesWrap = true,
		Size = 14
	})

	KeyTab:AddLabel({
		Text = "Want unlimited access with no waiting? Purchase a Premium Lifetime Key.",
		DoesWrap = true,
		Size = 14
	})

	KeyTab:AddButton({
		Text = "Copy Premium Lifetime Key Link",
		Func = function()
			setclipboard(PremiumLink)
			Library:Notify("Premium key link copied to clipboard.", 4)
		end
	})

	KeyTab:AddButton({
		Text = "Copy Discord Server Link",
		Func = function()
			setclipboard(DiscordLink)
			Library:Notify("Discord invite copied to clipboard.", 4)
		end
	})

	KeyTab:AddButton({
		Text = "Get a Free Key",
		Func = function()
			setclipboard(FreeLink)
			Library:Notify("Key page link copied to clipboard.", 4)
		end
	})

	KeyTab:AddKeyBox(function(ReceivedKey)
		local key = ReceivedKey:upper()
		local result = CheckKey(key)

		if result.valid then
			saveVerifiedKey(key)
			getgenv().SCRIPT_KEY = key
			Library:Notify("Access granted.", 4)
			task.wait(0.5)
			Library:Unload()
		else
			Library:Notify(result.message or "Invalid key.", 4)
		end
	end)
end

local savedKey = loadVerifiedKey()
local keyToCheck = savedKey or getgenv().SCRIPT_KEY

local preliminaryResult = keyToCheck and CheckKey(keyToCheck) or nil

if preliminaryResult and preliminaryResult.valid then
	if preliminaryResult.message == "KEYLESS" then
		getgenv().SCRIPT_KEY = "KEYLESS"
	else
		if not savedKey then
			saveVerifiedKey(keyToCheck)
		end
		getgenv().SCRIPT_KEY = keyToCheck
	end
else
	if savedKey then
		clearSavedKey()
	end
	Build()
end

while not getgenv().SCRIPT_KEY do
	task.wait(0.1)
end

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/3988aa9aa33242afafc777ea35b6a4a2bb02dd4671604fd05dc8580993524b71?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end