if not game:IsLoaded()then game.Loaded:Wait()end;do ("JNKIE Game Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local S,P,G={"b3c6c1e80d9eb02848064d1010f3a973df1aa22f41c9812a20208645178a4115"},{[13997264379]=1},{};local i=P[game.PlaceId]or G[game.GameId];if not i then local h="Unsupported game [LDR-NOMAP]";warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end);return end;-- ============================================================
-- SynaptaHub Loader (Sakura UI + Jnkie Auto‑Routing)
-- ============================================================

local Sakura = loadstring(game:HttpGet("https://cdn.jnkie.com/SakuraUI.lua"))()

-- ================= SAKURA CONFIG =================
Sakura.Appearance = {
	Title = "SynaptaHub",
	Subtitle = "Enter your key to load",
	Tagline = "by SynaptaHub",
	Icon = "rbxassetid://116255434488074", -- your icon asset
	IconSize = UDim2.fromOffset(30, 30),
}

-- Your actual links
Sakura.Links.Discord = "https://discord.gg/rdbj7QCgzP"
Sakura.Links.GetKey = "https://jnkie.com/get-key/synaptahub"

-- Unique storage file for this service
Sakura.Storage.FileName = "SynaptaHubKey_Jnkie"

-- Force key system (no keyless)
Sakura.Options.Keyless = false
Sakura.Options.KeylessUI = true -- irrelevant when Keyless=false, kept for clarity

Sakura.Shop = {
	Enabled = false,
}

-- ================= SUCCESS CALLBACK =================
-- This runs only after a valid key is entered.
-- Jnkie will automatically load the correct game script
-- immediately after this callback returns.
Sakura.Callbacks.OnSuccess = function()
	getgenv().SynaptaHub_Active = true

	-- Load Rayfield
	local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()
	if not Rayfield then
		getgenv().SynaptaHub_Active = false
		warn("Rayfield failed to load")
		return
	end

	-- Create the main window (key system is handled by Sakura)
	local Window = Rayfield:CreateWindow({
		name = "SynaptaHub",
		subtitle = "by biggiecheese132 (discord)",
		theme = "amethyst", -- optional, built-in or custom
		showName = "SynaptaHub", -- pill label when hidden
		icon = "rbxassetid://98819316845453", -- test
		configuration = {
			autoSave = false, -- set true if you want persistent flags
			autoLoad = false,
			fileName = "SynaptaHub_Config",
		},
	})

	-- Inject dependencies into the global environment.
	-- The auto‑loaded game script will access them as globals.
	getgenv().Rayfield = Rayfield
	getgenv().SynaptaWindow = Window
	getgenv().SECRET_TOKEN = 8392183

	-- No manual script loading here.
	-- Jnkie automatically loads the script assigned to this game ID.
end

-- ================= FAIL / CLOSE CALLBACKS =================
Sakura.Callbacks.OnFail = function(message)
	getgenv().SynaptaHub_Active = false
	warn("SynaptaHub key failed: " .. tostring(message))
end

Sakura.Callbacks.OnClose = function()
	getgenv().SynaptaHub_Active = false
end

-- ================= LAUNCH JUNKIE =================
Sakura:LaunchJunkie({
	Service = "SynaptaHub",
	Identifier = "1151225",
	Provider = "SynaptaHubKey",
})

------------------------------
do local k=getgenv().SCRIPT_KEY or SCRIPT_KEY or"";if type(k)~="string"then k=""end;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table"and type(syn.request)=="function"and syn.request)or(type(request)=="function"and request)or(type(http_request)=="function"and http_request)or(type(http)=="table"and type(http.request)=="function"and http.request);if type(r)~="function"then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/"..S[i].."?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table"and type(x.Body)=="string"and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED"or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if not a or type(x)~="table"or x.StatusCode~=200 or type(x.Body)~="string"or string.sub(x.Body,1,22)~="https://cdn.jnkie.com/"then warn(m);return end;a,x=q({Url=x.Body,Method="GET"});if not a or type(x)~="table"or x.StatusCode~=200 or type(x.Body)~="string"or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function"then warn(m);return end;f()end end