-- Havoc UI Key System Template
-- Documentation: https://mrhavoc-jnkie.github.io/MrHavoc-KeySystem/
getgenv().SCRIPT_KEY = "KEYLESS"
local Junkie_Configs = {
	UseJunkie = true,
	Junkie_Webhook = "",
	Service = "Arsenic Hub Free",
	Identifier = "1069166",
	Provider = "Arsenic Hub Free",
	Providers = {
		{
			Name = "",
			Icon = "rbxassetid://135475048973669",
			Url = "",
			Show = true,
			IsJunkie = true,
			Pinned = true,
		},
		{
			Name = "",
			Icon = "rbxassetid://122637139040192",
			Url = "",
			Show = true,
			Pinned = false,
		},
		{
			Name = "",
			Icon = "rbxassetid://81598390322167",
			Url = "",
			Show = true,
			Pinned = false,
		},
		{
			Name = "",
			Icon = "rbxassetid://137084367454843",
			Url = "",
			Show = true,
			Pinned = false,
		},
		{
			Name = "",
			Icon = "rbxassetid://97780154564910",
			Url = "",
			Show = false,
			Pinned = false,
		},
		{
			Name = "",
			Icon = "rbxassetid://71747327764154",
			Url = "",
			Show = true,
			Pinned = false,
		},
		{
			Name = "",
			Icon = "rbxassetid://0",
			Url = "",
			Show = false,
			Pinned = false,
		},
		{
			Name = "",
			Icon = "rbxassetid://89541242615678",
			Url = "",
			Show = false,
			Pinned = false,
		},
		{
			Name = "",
			Icon = "rbxassetid://84998267162454",
			Url = "",
			Show = true,
			Pinned = false,
		},
		{
			Name = "",
			Icon = "rbxassetid://88684203985262",
			Url = "",
			Show = false,
			Pinned = false,
		},
		{
			Name = "",
			Icon = "rbxassetid://107106330956313",
			Url = "",
			Show = false,
			Pinned = false,
		},
	},
	MaxKeyAttempts = 5,
	Premium = false,
	GameSupport = {
		[0] = {
			Name = "",
			Free = "",
			Premium = ""
		},
		[0] = {
			Name = "",
			Free = "",
			Premium = ""
		},
		[0] = {
			Name = "",
			Free = "",
			Premium = ""
		},
		Universal = {
			Name = "",
			Free = "",
			Premium = ""
		},
	},
}
local UI_Configs = {
	Name = "",
	Version = "",
	Color = Color3.fromRGB(138, 43, 226),
	Text_Color = "",
	GradientAnimated = true,
	GradientAnimationSpeed = 4,
	Icon = "",
	BadgeText = "",
	CustomFont = "",
	ShowOutline = true,
	KeySystemLabel = "",
	KeySystemPlaceholder = "",
	ShowMemberCount = true,
	SnowEnabled = true,
	SnowDensity = 1.0,
	SnowColor = Color3.fromRGB(220, 235, 255),
	SnowSize = {Min = 3, Max = 7},
	GlassOpacity = 0.18,
	SlideInEnabled = true,
	BlurEnabled = true,
	BlurSize = 30,
	OverlayOpacity = 0.65,
	CloseOnSuccess = true,
	SuccessMessage = "",
	KeyFile = "",
	Discord = "",
	Socials = {
		{ Name = "Discord", Icon = "rbxassetid://124569550333033", Link = "", Show = true, Pinned = true },
		{ Name = "Twitter", Icon = "rbxassetid://109973626472548", Link = "", Show = true, Pinned = false },
		{ Name = "YouTube", Icon = "rbxassetid://127161245916650", Link = "", Show = true, Pinned = false },
		{ Name = "TikTok", Icon = "rbxassetid://104709330704441", Link = "", Show = false, Pinned = false },
		{ Name = "Instagram", Icon = "rbxassetid://125560586243942", Link = "", Show = false, Pinned = false },
		{ Name = "Telegram", Icon = "rbxassetid://103666565087375", Link = "", Show = false, Pinned = false },
		{ Name = "Reddit", Icon = "rbxassetid://116113713008550", Link = "", Show = false, Pinned = false },
		{ Name = "GitHub", Icon = "rbxassetid://82005505285811", Link = "", Show = true, Pinned = false },
		{ Name = "Guilded", Icon = "rbxassetid://90800592251672", Link = "", Show = false, Pinned = false },
		{ Name = "Patreon", Icon = "rbxassetid://111058338249202", Link = "", Show = false, Pinned = false },
		{ Name = "Ko-fi", Icon = "rbxassetid://117795089880308", Link = "", Show = false, Pinned = false },
		{ Name = "Twitch", Icon = "rbxassetid://88799126886971", Link = "", Show = false, Pinned = false },
		{ Name = "V3rm", Icon = "rbxassetid://135908787183979", Link = "", Show = false, Pinned = false },
		{ Name = "Website", Icon = "rbxassetid://70402301072503", Link = "", Show = true, Pinned = false },
	},
	AppLinks = {
		{ Name = "", Icon = "rbxassetid://124569550333033", Link = "", Show = true, Pinned = true },
	},
	Instructions = {
		{ Title = "", Body = "" },
		{ Title = "", Body = "" },
		{ Title = "", Body = "" },
	},
	Changelog = {
		Show = true,
		Title = "",
		Versions = {
			{
				Version = "",
				Date = "",
				Tag = "",
				Notes = {
					"",
				},
			},
			{
				Version = "",
				Date = "",
				Tag = "",
				Notes = {
					"",
				},
			},
			{
				Version = "",
				Date = "",
				Tag = "",
				Notes = {
					"",
				},
			},
		},
	},
}
local Config = {
	Name = UI_Configs.Name,
	Version = UI_Configs.Version,
	Color = UI_Configs.Color,
	Text_Color = UI_Configs.Text_Color,
	GradientAnimated = UI_Configs.GradientAnimated,
	GradientAnimationSpeed = UI_Configs.GradientAnimationSpeed,
	Icon = UI_Configs.Icon,
	BadgeText = UI_Configs.BadgeText,
	CustomFont = UI_Configs.CustomFont,
	ShowOutline = UI_Configs.ShowOutline,
	KeySystemLabel = UI_Configs.KeySystemLabel,
	KeySystemPlaceholder = UI_Configs.KeySystemPlaceholder,
	ShowMemberCount = UI_Configs.ShowMemberCount,
	SnowEnabled = UI_Configs.SnowEnabled,
	SnowDensity = UI_Configs.SnowDensity,
	SnowColor = UI_Configs.SnowColor,
	SnowSize = UI_Configs.SnowSize,
	GlassOpacity = UI_Configs.GlassOpacity,
	SlideInEnabled = UI_Configs.SlideInEnabled,
	BlurEnabled = UI_Configs.BlurEnabled,
	BlurSize = UI_Configs.BlurSize,
	OverlayOpacity = UI_Configs.OverlayOpacity,
	CloseOnSuccess = UI_Configs.CloseOnSuccess,
	SuccessMessage = UI_Configs.SuccessMessage,
	KeyFile = UI_Configs.KeyFile,
	Discord = UI_Configs.Discord,
	Socials = UI_Configs.Socials,
	AppLinks = UI_Configs.AppLinks,
	Instructions = UI_Configs.Instructions,
	Changelog = UI_Configs.Changelog,
	UseJunkie = Junkie_Configs.UseJunkie,
	Junkie_Webhook = Junkie_Configs.Junkie_Webhook,
	Junkie = {
		Service = Junkie_Configs.Service,
		Identifier = Junkie_Configs.Identifier,
		Provider = Junkie_Configs.Provider,
	},
	Providers = Junkie_Configs.Providers,
	MaxKeyAttempts = Junkie_Configs.MaxKeyAttempts,
	Premium = Junkie_Configs.Premium,
	GameSupport = Junkie_Configs.GameSupport,
}
local Hub = loadstring(game:HttpGet("https://cdn.jnkie.com/havoc.lua"))()
local function hasFileSystemSupport()
	local hw = pcall(function() return type(writefile) == "function" end)
	local hr = pcall(function() return type(readfile) == "function" end)
	local hi = pcall(function() return type(isfile) == "function" end)
	return hw and hr and hi
end
local fileSystemSupported = hasFileSystemSupport()
local KeyFile = UI_Configs.KeyFile or ""
local function saveVerifiedKey(key)
	if not fileSystemSupported then return false end
	return pcall(function()
		writefile(KeyFile, key)
	end)
end
local function loadVerifiedKey()
	if not fileSystemSupported then return nil end
	local ok, content = pcall(function()
		return readfile(KeyFile)
	end)
	if not ok or not content or content == "" then return nil end
	return content
end
local function TryAutoLogin()
	if not Junkie_Configs.UseJunkie then return false end
    local lib = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
	lib.service = Junkie_Configs.Service
	lib.identifier = Junkie_Configs.Identifier
	lib.provider = Junkie_Configs.Provider
	local savedKey = loadVerifiedKey()
	local keyToCheck = savedKey or getgenv().SCRIPT_KEY
	if not keyToCheck or keyToCheck == "" then return false end
	local result = lib.check_key(keyToCheck)
	if result and result.valid then
		if result.message == "KEYLESS" then
			getgenv().SCRIPT_KEY = "KEYLESS"
            getgenv().LOAD = true
		else
			if not savedKey then saveVerifiedKey(keyToCheck) end
			getgenv().SCRIPT_KEY = keyToCheck
            getgenv().LOAD = true
		end
		return true
	end
	return false
end
local autoLoginResult = TryAutoLogin()
if not autoLoginResult then
	pcall(function()
		local hub = Hub.new(Config)
		hub:Init()
	end)
end
while not getgenv().LOAD do
	task.wait(0.1)
end

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/ddaa43ef619522cdaa50bb0e1d4e067483364f659d4344fc63eee6689a614f33?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end