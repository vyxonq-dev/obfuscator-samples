--[[
        Arceney.win Official Loader
    Author: 4lpaca
    Website: https://arceney.win
]]

local ExternalReplace = {
	['a2b4136acfe7328bf71a79e09208f9c5'] = "4af3140e536e9af460d157d2f5edba9a", -- replace blox fruit
};

local GameClientData = {
	[994732206] = "a2b4136acfe7328bf71a79e09208f9c5", -- "Blox Frutis"
	[7671049560] = "8762b53221422e176971bae378599918", -- "The Forge"
	[6035872082] = "193a44402c272c03566192865fd844ef", -- "Rivals"
	[5750914919] = "33aed7d464e90ab9943d58f21cd24d00", -- "Fisch"
	[4777817887] = "490997958adf82e81ac160016a0ef119", -- "Blade Ball"
	[115797356] = "fa807cf60ed10c3e0e43f0acd8e7b6d5", -- "Counter Blox"
	[9363735110] = "5272dda0f4c8a44af59cf11f83ce8a5c", -- "Tsunami Brainrot"
};

clonefunction = clonefunction or function(f) return f; end;
identifyexecutor = identifyexecutor or getexecutorname or function()
	return "Seliware", 0.1;
end;
getgenv = getgenv or getfenv;
cloneref = cloneref or function(i) return i end;
getconstant = getconstant or debug.getconstant;
getconstants = getconstants or debug.getconstants;
getupvalue = getupvalue or debug.getupvalue;
getupvalues = getupvalues or debug.getupvalues;
setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set);
request = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request);
sethiddenproperty = sethiddenproperty or set_hidden_property or set_hidden_prop;
gethiddenproperty = gethiddenproperty or get_hidden_property or get_hidden_prop;
gethui = gethui or get_hidden_gui;
getcustomasset = getcustomasset or getsynasset or function(f) return "" end;
_G = _G or getgenv();
isfolder = isfolder or function() end;
makefolder = makefolder or function() end;
delfolder = delfolder or function() end;
listfiles = listfiles or function() end;
writefile = writefile or function() end;
readfile = readfile or function() end;
appendfile = appendfile or function() end;
isfile = isfile or function() end;

local fix_websocket = function()
    local newcli = {};
        
    for i,v in next , WebSocket do
        newcli[i] = v;
    end;

    getgenv().WebSocket = newcli;
end;

local fix_drawing = function()
    local newcli = {};
        
    for i,v in next , Drawing do
        newcli[i] = v;
    end;

    getgenv().Drawing = newcli;
end;

if Drawing then
	if setreadonly then
		local status = pcall(setreadonly,Drawing,false);

        if not status then
            fix_drawing();
        end;
    else
        fix_drawing();
	end;

	pcall(function()
		Drawing.clear = Drawing.clear or Drawing.Clear or cleardrawcache or cleardawcache or clear_draw_cache;
	end)
end;

if WebSocket then
	if setreadonly then
        local status = pcall(setreadonly , WebSocket , false);
		
        if not status then
            fix_websocket();
        end;
    else
        fix_websocket();
	end;

	pcall(function()
		WebSocket.Connect = (WebSocket and WebSocket.connect) or (WebSocket and WebSocket.Connect) or (WebSocket and WebSocket.New);
	end);
end;

if not isfolder("Arceney.cc") then -- main directory
	makefolder("Arceney.cc");
end;

if not isfolder("Arceney-bin") then -- config directory
	makefolder("Arceney-bin");
end;

if not isfolder("Arceney-Cache") then -- image cache directory
	makefolder("Arceney-Cache");
end;

if not isfolder("Arceney-Cache-v2") then -- source cache diectory
	makefolder("Arceney-Cache-v2");
end;

local Loader = {};
local LocalPlayer = cloneref(game:GetService('Players')).LocalPlayer;
local LicenseKeyPath,OldLicensePath = "Arceney.env" , "Arceney.license";
local LuarmorAPI,NeverLoseUI;
local LagIdx = 'arceney_use_legacy';

xpcall(function()
	LuarmorAPI = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))();
end,function()
	LuarmorAPI = {};
end);

Loader.CoreGui = (gethui and gethui()) or game:FindFirstChild('CoreGui') or LocalPlayer.PlayerGui;

if not GameClientData[game.GameId] then
	if not game:GetService('RunService'):IsStudio() then
		return LocalPlayer:Kick("Arceney\nUnsupported Game");
	end;
end;

LuarmorAPI.script_id = GameClientData[game.GameId];

local UseLegacy = isfile(LagIdx) or false;

Loader.GetKey_var = function()
    return script_key or getgenv().script_key or _G.script_key or getfenv().script_key;
end;

Loader.ForceLoad = function(key)
    key = key or Loader.GetKey_var() or "idk";

    local Id = GameClientData[game.GameId];

    if UseLegacy and ExternalReplace[Id] then
        writefile(LagIdx,'true');
        Id = ExternalReplace[Id];
    else
        if isfile(LagIdx) then
            delfile(LagIdx);
        end;
    end;

    local LoaderCode = string.format("https://api.luarmor.net/files/v3/loaders/%s.lua",Id);
    
    getgenv().script_key = key;
	getfenv().script_key = key;
	script_key = key;

    loadstring(game:HttpGet(LoaderCode))();
end;

Loader.Is_Key_Valid = function(data)
	if not data or not string.byte(data) then
		return false , 'KEY_INVALID';
	end;

    LuarmorAPI.script_id = GameClientData[game.GameId];

	local err, status = pcall(LuarmorAPI.check_key ,data);

    if not err then -- Instant load
        pcall(writefile ,LicenseKeyPath , data);

        getgenv().script_key = data;
        getfenv().script_key = data;
        script_key = data;

		return data , status.code;
    end;

	if status.code == "KEY_VALID" then
        pcall(writefile ,LicenseKeyPath , data);

        getgenv().script_key = data;
        getfenv().script_key = data;
        script_key = data;

		return data , status.code;
	end;

	return false , status.code;
end;

script_key = script_key or (isfile(LicenseKeyPath) and readfile(LicenseKeyPath)) or (isfile(OldLicensePath) and readfile(OldLicensePath));

if script_key and Loader.Is_Key_Valid(tostring(script_key)) and not UseLegacy then
	return Loader.ForceLoad(script_key);
else
    xpcall(function()
        NeverLoseUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/NeverLose/refs/heads/main/loader.luau"))();
    end,function()
        NeverLoseUI = nil;
    end);

	if not NeverLoseUI then
        return Loader.ForceLoad(Loader.GetKey_var());
    end;

    local oldkey = Loader.GetKey_var() or "";
    local code_s = {
        KEY_EXPRIED = "Key expired",
        KEY_BANNED = "User is banned",
        KEY_HWID_LOCKED = "Invalid HWID",
        KEY_INCORRECT = "Incorrect Key",
        KEY_INVALID = "Invalid Key",
    };

    local LoaderInterface = NeverLoseUI.new({
        Name = "Arceney",
        Content = "Available Products",
        Default = (Loader.Is_Key_Valid(oldkey) and oldkey) or "",
        Versions = {
            {
                Name = "Latest Scripts",
                Content = "Up to date scripts.",
                Idx = "Default",
            },
            {
                Name = "Legacy Scripts",
                Content = "Outdated scripts.",
                Idx = "Legacy",
            },
        },
        DefaultVersion = (UseLegacy and "Legacy") or "Default",
        OnGetKey = function()
            setclipboard("https://arceney.win/#plans");
        end,
        OnRedeem = function(key)
            local status , reason = Loader.Is_Key_Valid(key);

            if status then
                return true;
            end;
            
            return false , code_s[reason] or nil;
        end,
    });

    local Reply = LoaderInterface:Await();

    UseLegacy = (Reply == "Legacy");

    task.delay(1.25,function()
        LoaderInterface:Unload();
    end);

    return Loader.ForceLoad(Loader.GetKey_var());
end;
