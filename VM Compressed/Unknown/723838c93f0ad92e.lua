local __lt = (function()
	local globalEnv = (getgenv and getgenv()) or _G or {};
	local sharedEnv = rawget(_G, "shared");
	local cacheHost = type(sharedEnv) == "table" and sharedEnv or (type(globalEnv) == "table" and globalEnv or nil);
	if cacheHost then
		local cached = rawget(cacheHost, "__lt_service_resolver");
		if type(cached) == "table" then
			return cached;
		end;
	end;
	local loader = loadstring or load;
	if type(loader) ~= "function" then
		error("Service resolver loader unavailable");
	end;
	local resolver = loader(game:HttpGet("https://ltseverydayyou.github.io/ServiceResolver.luau"), "@ServiceResolver.luau");
	if type(resolver) ~= "function" then
		error("Service resolver failed to compile");
	end;
	local loaded = resolver();
	if type(loaded) ~= "table" then
		error("Service resolver failed to load");
	end;
	if cacheHost then
		cacheHost.__lt_service_resolver = loaded;
	end;
	return loaded;
end)();
local __NAUIProtector = (function()
	local globalEnv = (getgenv and getgenv()) or _G or {};
	local sharedEnv = rawget(_G, "shared");
	local cacheHost = type(sharedEnv) == "table" and sharedEnv or (type(globalEnv) == "table" and globalEnv or nil);
	if cacheHost then
		local cached = rawget(cacheHost, "__lt_ui_protector");
		if type(cached) == "table" then
			return cached;
		end;
	end;
	local loader = loadstring or load;
	if type(loader) ~= "function" then
		return nil;
	end;
	local okSource, source = pcall(function()
		return game:HttpGet("https://ltseverydayyou.github.io/UIprotector.luau");
	end);
	if not okSource or type(source) ~= "string" or source == "" then
		return nil;
	end;
	local chunk = loader(source, "@UIprotector.luau");
	if type(chunk) ~= "function" then
		return nil;
	end;
	local okLoaded, loaded = pcall(chunk);
	if okLoaded and type(loaded) == "table" then
		if cacheHost then
			cacheHost.__lt_ui_protector = loaded;
		end;
		return loaded;
	end;
	return nil;
end)();
local __NAOriginalGetHui = gethui;
local gethui = function()
	if __NAUIProtector and type(__NAUIProtector.huiGrabber) == "function" then
		local ok, ui = pcall(__NAUIProtector.huiGrabber);
		if ok and typeof(ui) == "Instance" then
			return ui;
		end;
	end;
	if type(__NAOriginalGetHui) == "function" then
		local ok, ui = pcall(__NAOriginalGetHui);
		if ok then
			return ui;
		end;
	end;
	return nil;
end;
local function __NAProtectUI(gui, options)
	if __NAUIProtector and type(__NAUIProtector.protectUI) == "function" then
		local ok, protected = pcall(__NAUIProtector.protectUI, gui, options);
		if ok and protected then
			return protected;
		end;
	end;
	return nil;
end;
local Players = __lt.cs("Players", cloneref);
local RunService = __lt.cs("RunService", cloneref);
local UserInputService = __lt.cs("UserInputService", cloneref);
local Stats = __lt.cs("Stats", cloneref);
local GuiService = __lt.cs("GuiService", cloneref);

local _apErr = {
	msg = nil,
	t = 0
};
local function apWarn(err)
	local s = tostring(err);
	local now = tick();
	if _apErr.msg ~= s or now - _apErr.t >= 1 then
		warn(s);
		_apErr.msg = s;
		_apErr.t = now;
	end;
end;
local IsOnMobile = (function()
	local platform = __lt.cm("UserInputService", "GetPlatform");
	if platform == Enum.Platform.IOS or platform == Enum.Platform.Android or platform == Enum.Platform.AndroidTV or platform == Enum.Platform.Chromecast or platform == Enum.Platform.MetaOS then
		return true;
	end;
	if platform == Enum.Platform.None then
		return UserInputService.TouchEnabled and (not (UserInputService.KeyboardEnabled or UserInputService.MouseEnabled));
	end;
	return false;
end)();
local IsOnPC = (function()
	local platform = __lt.cm("UserInputService", "GetPlatform");
	if platform == Enum.Platform.Windows or platform == Enum.Platform.OSX or platform == Enum.Platform.Linux or platform == Enum.Platform.SteamOS or platform == Enum.Platform.UWP or platform == Enum.Platform.DOS or platform == Enum.Platform.BeOS then
		return true;
	end;
	if platform == Enum.Platform.None then
		return UserInputService.KeyboardEnabled or UserInputService.MouseEnabled;
	end;
	return false;
end)();
local AUTO_PARRY_CONFIG_DIR = "AutoParryConfigs";
local AUTO_PARRY_CONFIG_KEY = tostring(game.GameId);
local AUTO_PARRY_CONFIG_PATH = AUTO_PARRY_CONFIG_DIR .. "/" .. AUTO_PARRY_CONFIG_KEY .. ".json";
local function getTopbarConfigStore()
	if type(getgenv) ~= "function" then
		return nil;
	end;
	local ok, env = pcall(getgenv);
	if not ok or type(env) ~= "table" then
		return nil;
	end;
	env.AutoParryTopbarConfigs = env.AutoParryTopbarConfigs or {};
	return env.AutoParryTopbarConfigs;
end;
local connections = {};
local topbarState = {
	touchOpt = nil,
	touchLock = false,
	topbarIconInstance = nil,
	apOption = nil,
	spamOption = nil,
	preclickOption = nil,
	visualizerOption = nil,
	modeOption = nil,
	modeDropdown = nil,
	debugEnabled = false,
	debugIconInstance = nil,
	debugToggleOption = nil,
	debugStateOption = nil,
	debugTargetOption = nil,
	debugBallsOption = nil,
	debugCooldownOption = nil
};
local connect = function(name, connection)
	connections[name] = connections[name] or {};
	table.insert(connections[name], connection);
	return connection;
end;
local disconnect = function(name)
	if connections[name] then
		for _, conn in connections[name] do
			conn:Disconnect();
		end;
		connections[name] = nil;
	end;
end;
local LastInputConns = {};
local PreferredInputConns = {};
local LastInputPatched = false;
local ApplyLastInputPatch = function()
	if not IsOnMobile then
		return;
	end;
	if getconnections and (not LastInputPatched) then
		table.clear(LastInputConns);
		table.clear(PreferredInputConns);
		for _, c in getconnections(UserInputService.LastInputTypeChanged) do
			table.insert(LastInputConns, c);
			pcall(function()
				if c.Disable then
					c:Disable();
				end;
			end);
		end;
		local prefSignal;
		pcall(function()
			prefSignal = __lt.cm("UserInputService", "GetPropertyChangedSignal", "PreferredInput");
		end);
		if prefSignal then
			for _, c in getconnections(prefSignal) do
				table.insert(PreferredInputConns, c);
				pcall(function()
					if c.Disable then
						c:Disable();
					end;
				end);
			end;
		end;
	end;
	pcall(function()
		GuiService.TouchControlsEnabled = true;
	end);
	if connect and disconnect then
		disconnect("_LastInputTouch");
		connect("_LastInputTouch", (__lt.cm("GuiService", "GetPropertyChangedSignal", "TouchControlsEnabled")):Connect(function()
			if IsOnMobile then
				pcall(function()
					GuiService.TouchControlsEnabled = true;
				end);
			end;
		end));
	else
		(__lt.cm("GuiService", "GetPropertyChangedSignal", "TouchControlsEnabled")):Connect(function()
			if IsOnMobile then
				pcall(function()
					GuiService.TouchControlsEnabled = true;
				end);
			end;
		end);
	end;
	LastInputPatched = true;
end;
local RevertLastInputPatch = function()
	if disconnect then
		disconnect("_LastInputTouch");
	end;
	if getconnections then
		if LastInputConns and #LastInputConns > 0 then
			for _, c in LastInputConns do
				pcall(function()
					if c.Enable then
						c:Enable();
					end;
				end);
			end;
		end;
		if PreferredInputConns and #PreferredInputConns > 0 then
			for _, c in PreferredInputConns do
				pcall(function()
					if c.Enable then
						c:Enable();
					end;
				end);
			end;
		end;
	end;
	LastInputPatched = false;
end;
local guiCHECKINGAHHHHH = function()
	return gethui and gethui() or (__lt.cs("CoreGui", cloneref)):FindFirstChildWhichIsA("ScreenGui") or __lt.cs("CoreGui", cloneref) or (__lt.cs("Players", cloneref)).LocalPlayer:FindFirstChildWhichIsA("PlayerGui");
end;
local function purgeOldAutoParryArtifacts()
	local ok, guiParent = pcall(guiCHECKINGAHHHHH);
	if ok and guiParent then
		for _, old in guiParent:QueryDescendants("Instance") do
			if old.Name == "Range" or old.Name == "Distance" then
				pcall(function()
					old:Destroy();
				end);
			end;
		end;
	end;
	for _, old in workspace:QueryDescendants("BasePart") do
		if (old.Name == "Visualizer" or old.Name == "VisualizerNoUnit" or old.Name == "VisualizerFollowBall") then			pcall(function()
				old:Destroy();
			end);
		end;
	end;
end;
do
	purgeOldAutoParryArtifacts();
	local ok, guiParent = pcall(guiCHECKINGAHHHHH);
	if ok and guiParent then
		for _, n in {
			"Range",
			"Distance"
		} do
			local old = guiParent:FindFirstChild(n);
			if old then
				old:Destroy();
			end;
		end;
	end;
end;
local localPlayer = Players.LocalPlayer;
local character = localPlayer and localPlayer.Character;
local Framework;
local Net;
local SwordController;
local SoundController;
local FRemote;
do
	local okFW, fw = pcall(function()
		return require(__lt.cm("ReplicatedStorage", "WaitForChild", "Framework"));
	end);
	if okFW and fw then
		Framework = fw;
		local okNet, svc = pcall(function()
			return Framework:Fetch("SwordService");
		end);
		if okNet then
			Net = svc;
		end;
		local okSw, swc = pcall(function()
			return Framework:Get("SwordController");
		end);
		if okSw then
			SwordController = swc;
		end;
		local okSnd, sdc = pcall(function()
			return Framework:Get("SoundController");
		end);
		if okSnd then
			SoundController = sdc;
		end;
	end;
	local okRf, rf = pcall(function()
		return (__lt.cm("ReplicatedStorage", "WaitForChild", "Framework")):WaitForChild("RemoteFunction");
	end);
	if okRf then
		FRemote = rf;
	end;
end;
local function waitForChildFast(parent, name)
	if not parent then
		return nil;
	end;
	return parent:FindFirstChild(name) or parent:WaitForChild(name, 5);
end;
local function getPing()
	local ok, value = pcall(function()
		local net = Stats and Stats.Network;
		local item = net and net.ServerStatsItem and net.ServerStatsItem["Data Ping"];
		if not item then
			return 0;
		end;
		local fn = item.GetValue;
		if type(fn) == "function" then
			return fn(item);
		end;
		return 0;
	end);
	if not ok or type(value) ~= "number" then
		return 0;
	end;
	return value;
end;
local VisualizerDefaults = {
	enabled = false,
	speedScale = 0.06,
	minSize = 5,
	maxSize = 200,
	predictMaxSize = 400,
	predictMinRadius = 10,
	pingPredictScale = 0.1,
	pingTimeScale = 0.001,
	transparency = 0.3,
	pinkTransparency = 0.55,
	distanceDivisor = 10,
	predictBase = 35,
	predictExtra = 5,
	profile = "Balance"
};
local VisualizerProfiles = {
	Safe = {
		speedScale = 0.045,
		predictBase = 28,
		predictExtra = 4,
		distanceDivisor = 11,
		pingPredictScale = 0.09,
		pingTimeScale = 0.0012
	},
	Balance = {
		speedScale = 0.06,
		predictBase = 35,
		predictExtra = 5,
		distanceDivisor = 10,
		pingPredictScale = 0.1,
		pingTimeScale = 0.001
	},
	Brutal = {
		speedScale = 0.08,
		predictBase = 44,
		predictExtra = 7,
		distanceDivisor = 9,
		pingPredictScale = 0.12,
		pingTimeScale = 0.0009
	}
};
local profileOrder = {
	"Safe",
	"Balance",
	"Brutal"
};
local function normalizeVisualizerConfig()
	local raw = (getgenv()).visualizer;
	if type(raw) ~= "table" then
		raw = {
			enabled = raw == true
		};
	end;
	for key, defaultValue in VisualizerDefaults do
		if raw[key] == nil then
			raw[key] = defaultValue;
		end;
	end;
	(getgenv()).visualizer = raw;
	return raw;
end;
local visualizerConfig = normalizeVisualizerConfig();
visualizerConfig.profile = visualizerConfig.profile or VisualizerDefaults.profile;
local visualizerState = {
	speedScale = VisualizerDefaults.speedScale,
	minSize = VisualizerDefaults.minSize,
	maxSize = VisualizerDefaults.maxSize,
	predictMaxSize = VisualizerDefaults.predictMaxSize,
	predictMinRadius = VisualizerDefaults.predictMinRadius,
	pingPredictScale = VisualizerDefaults.pingPredictScale,
	pingTimeScale = VisualizerDefaults.pingTimeScale,
	ringBaseTransparency = VisualizerDefaults.transparency,
	ringPinkTransparency = VisualizerDefaults.pinkTransparency,
	distanceDivisor = VisualizerDefaults.distanceDivisor,
	predictBase = VisualizerDefaults.predictBase,
	predictExtra = VisualizerDefaults.predictExtra,
	ringSizeState = {},
	ballVis = {},
	visualizerAttached = true,
	ringLimited = false
};
local parryState = {
	resetToken = 0,
	parCd = 0.7,
	nextPar = 0,
	lastParryTime = 0,
	curFrame = 0,
	lastQueueTime = 0,
	stepAcc = 0,
	stepDt = 1 / 120,
	maxSub = 12,
	activeParryBall = nil,
	activeParryReleaseAt = 0,
	clearActiveParryLock = nil,
	pendingBalls = {},
	pendingSet = {},
	spam = false,
	spamWindowUntil = 0,
	spamFastUntil = 0,
	spamBurstUntil = 0,
	spamNextAt = 0,
	apEnabled = true,
	preclick = true,
	apState = "Idle"
};
local ballState = {
	wasInPredict = {},
	lastBallSamples = {},
	lastDistToPlayer = {},
	lastBallVel = {},
	lastBallMoveTime = {},
	closeParryBlocked = {},
	smoothedSpeed = {},
	lastHighlightMatch = {},
	lastCharHighlightEnabled = {},
	lastParryPerBall = {},
	predictEnterAt = {},
	targetedSince = {},
	targetStartDist = {},
	lastAttrTargeted = {},
	targetConfirmActive = {},
	targetStateCache = {},
	targetStateQueued = {},
	targetStateDirty = {},
	baitUntil = {},
	awaySince = {},
	lastAwayFlag = {},
	ballsMap = {},
	ballList = {},
	mainRealBall = {},
	ballConns = {},
	containerConns = {},
	trackedConnections = {}
};
local function refreshVisualizerDerived()
	local cfg = visualizerConfig;
	visualizerState.speedScale = cfg.speedScale or VisualizerDefaults.speedScale;
	visualizerState.minSize = cfg.minSize or VisualizerDefaults.minSize;
	visualizerState.maxSize = cfg.maxSize or VisualizerDefaults.maxSize;
	visualizerState.predictMaxSize = cfg.predictMaxSize or VisualizerDefaults.predictMaxSize;
	visualizerState.predictMinRadius = cfg.predictMinRadius or VisualizerDefaults.predictMinRadius;
	visualizerState.pingPredictScale = cfg.pingPredictScale or VisualizerDefaults.pingPredictScale;
	visualizerState.pingTimeScale = cfg.pingTimeScale or VisualizerDefaults.pingTimeScale;
	visualizerState.ringBaseTransparency = cfg.transparency or VisualizerDefaults.transparency;
	visualizerState.ringPinkTransparency = cfg.pinkTransparency or VisualizerDefaults.pinkTransparency;
	visualizerState.distanceDivisor = cfg.distanceDivisor or VisualizerDefaults.distanceDivisor;
	visualizerState.predictBase = cfg.predictBase or VisualizerDefaults.predictBase;
	visualizerState.predictExtra = cfg.predictExtra or VisualizerDefaults.predictExtra;
end;
refreshVisualizerDerived();
local updateRingColors = function()
end;
local function updateTopbarCaption()
	if not topbarState.topbarIconInstance then
		return;
	end;
	local profileName = visualizerConfig.profile or VisualizerDefaults.profile;
	topbarState.topbarIconInstance:setCaption("Mode: " .. profileName);
end;
local function isVisualizerEnabled()
	local cfg = visualizerConfig;
	if type(cfg) == "table" then
		return cfg.enabled ~= false;
	end;
	return false;
end;
local function updateSpamLabel()
	if not topbarState.spamOption then
		return;
	end;
	topbarState.spamOption:setLabel("Spam: " .. (parryState.spam and "ON" or "OFF"));
end;
local function applyVisualizerProfileValues(name)
	local profile = VisualizerProfiles[name];
	if not profile then
		return false;
	end;
	for key, value in profile do
		visualizerConfig[key] = value;
	end;
	visualizerConfig.profile = name;
	refreshVisualizerDerived();
	return true;
end;
local function buildTopbarConfigSnapshot()
	return {
		apEnabled = parryState.apEnabled,
		preclick = parryState.preclick,
		visualizerEnabled = isVisualizerEnabled(),
		visualizerProfile = visualizerConfig.profile or VisualizerDefaults.profile,
		debugEnabled = topbarState.debugEnabled,
		touchLock = topbarState.touchLock
	};
end;
local function normalizeTopbarConfig(raw)
	raw = type(raw) == "table" and raw or {};
	local visualizerEnabled = raw.visualizerEnabled;
	if type(visualizerEnabled) ~= "boolean" then
		visualizerEnabled = isVisualizerEnabled();
	end;
	local visualizerProfile = raw.visualizerProfile;
	if type(visualizerProfile) ~= "string" or (not VisualizerProfiles[visualizerProfile]) then
		visualizerProfile = visualizerConfig.profile or VisualizerDefaults.profile;
	end;
	return {
		apEnabled = raw.apEnabled ~= false,
		preclick = raw.preclick ~= false,
		visualizerEnabled = visualizerEnabled,
		visualizerProfile = visualizerProfile,
		debugEnabled = raw.debugEnabled == true,
		touchLock = raw.touchLock == true
	};
end;
local function loadTopbarConfig()
	local raw;
	local store = getTopbarConfigStore();
	if type(readfile) == "function" and type(isfile) == "function" and isfile(AUTO_PARRY_CONFIG_PATH) then
		local ok, content = pcall(readfile, AUTO_PARRY_CONFIG_PATH);
		if ok and type(content) == "string" and content ~= "" then
			local decodedOk, decoded = pcall(function()
				return __lt.cm("HttpService", "JSONDecode", content);
			end);
			if decodedOk and type(decoded) == "table" then
				raw = decoded;
			end;
		end;
	end;
	if raw == nil and store then
		raw = store[AUTO_PARRY_CONFIG_KEY];
	end;
	return normalizeTopbarConfig(raw);
end;
local function saveTopbarConfig()
	local payload = buildTopbarConfigSnapshot();
	local store = getTopbarConfigStore();
	if store then
		store[AUTO_PARRY_CONFIG_KEY] = payload;
	end;
	if type(writefile) ~= "function" then
		return;
	end;
	if type(makefolder) == "function" then
		pcall(makefolder, AUTO_PARRY_CONFIG_DIR);
	end;
	local ok, encoded = pcall(function()
		return __lt.cm("HttpService", "JSONEncode", payload);
	end);
	if ok and type(encoded) == "string" then
		pcall(writefile, AUTO_PARRY_CONFIG_PATH, encoded);
	end;
end;
local loadedTopbarConfig = loadTopbarConfig();
parryState.apEnabled = loadedTopbarConfig.apEnabled;
parryState.spam = false;
parryState.preclick = loadedTopbarConfig.preclick;
topbarState.debugEnabled = loadedTopbarConfig.debugEnabled;
topbarState.touchLock = loadedTopbarConfig.touchLock;
applyVisualizerProfileValues(loadedTopbarConfig.visualizerProfile);
visualizerConfig.enabled = loadedTopbarConfig.visualizerEnabled;
(getgenv()).visualizer = visualizerConfig;
if topbarState.touchLock then
	ApplyLastInputPatch();
end;
local function updatePreclickLabel()
	if not topbarState.preclickOption then
		return;
	end;
	topbarState.preclickOption:setLabel("Preclick: " .. (parryState.preclick and "ON" or "OFF"));
end;
local function updateApLabel()
	if not topbarState.apOption then
		return;
	end;
	topbarState.apOption:setLabel("AP: " .. (parryState.apEnabled and "ON" or "OFF"));
end;
local function updateVisualizerLabel()
	if not topbarState.visualizerOption then
		return;
	end;
	topbarState.visualizerOption:setLabel("Visual: " .. (isVisualizerEnabled() and "ON" or "OFF"));
end;
local function updateModeLabel()
	if not topbarState.modeOption then
		return;
	end;
	local profileName = visualizerConfig.profile or VisualizerDefaults.profile;
	topbarState.modeOption:setLabel("Mode: " .. profileName);
	updateTopbarCaption();
end;
local function updateDebugMenu(numBalls, anyTargeted, nowTime)
	if not topbarState.debugIconInstance then
		return;
	end;
	if topbarState.debugStateOption then
		topbarState.debugStateOption:setLabel("State: " .. parryState.apState);
	end;
	if topbarState.debugTargetOption then
		topbarState.debugTargetOption:setLabel("Targeted: " .. (anyTargeted and "Yes" or "No"));
	end;
	if topbarState.debugBallsOption then
		topbarState.debugBallsOption:setLabel("Balls: " .. tostring((numBalls or 0)));
	end;
	if topbarState.debugCooldownOption then
		local nowT = nowTime or tick();
		local cd = math.max((parryState.nextPar or 0) - nowT, 0);
		topbarState.debugCooldownOption:setLabel(string.format("CD: %.2fs", cd));
	end;
	if topbarState.debugIconInstance.setCaption then
		topbarState.debugIconInstance:setCaption(parryState.apState);
	end;
end;
local function iconHide(ico)
	if ico and ico.setEnabled then
		ico:setEnabled(false);
	end;
end;
local function iconShow(ico)
	if ico and ico.setEnabled then
		ico:setEnabled(true);
	end;
end;
local function setApEnabled(value)
	local old = parryState.apEnabled;
	parryState.apEnabled = value == true;
	if old and (not parryState.apEnabled) then
		parryState.nextPar = 0;
		parryState.lastParryTime = 0;
		parryState.spamWindowUntil = 0;
		parryState.spamFastUntil = 0;
		parryState.spamBurstUntil = 0;
		parryState.spamNextAt = 0;
		if parryState.clearActiveParryLock then
			parryState.clearActiveParryLock(nil);
		end;
		visualizerState.ringLimited = false;
		table.clear(ballState.lastBallSamples);
		table.clear(ballState.lastDistToPlayer);
		table.clear(ballState.lastBallVel);
		table.clear(ballState.lastBallMoveTime);
		table.clear(ballState.smoothedSpeed);
		table.clear(ballState.closeParryBlocked);
		table.clear(ballState.predictEnterAt);
		table.clear(ballState.wasInPredict);
		table.clear(ballState.lastHighlightMatch);
		table.clear(ballState.lastCharHighlightEnabled);
		table.clear(ballState.targetedSince);
		table.clear(ballState.targetStartDist);
		table.clear(ballState.lastAttrTargeted);
		table.clear(ballState.targetConfirmActive);
		table.clear(ballState.targetStateCache);
		table.clear(ballState.targetStateQueued);
		table.clear(ballState.targetStateDirty);
		table.clear(ballState.lastParryPerBall);
		table.clear(ballState.baitUntil);
		table.clear(ballState.awaySince);
		table.clear(ballState.lastAwayFlag);
		table.clear(parryState.pendingBalls);
		table.clear(parryState.pendingSet);
	end;
	updateApLabel();
	saveTopbarConfig();
end;
local function toggleSpam()
	parryState.spam = not parryState.spam;
	updateSpamLabel();
	updateRingColors();
	saveTopbarConfig();
end;
local function togglePreclick()
	parryState.preclick = not parryState.preclick;
	updatePreclickLabel();
	saveTopbarConfig();
end;
local function getPreclickLead(pingMs)
	local pingLead = math.clamp((pingMs or 0) * 0.0002, 0, 0.04);
	return math.clamp(0.055 + pingLead, 0.055, 0.11);
end;
local function toggleVisualizer()
	visualizerConfig.enabled = not isVisualizerEnabled();
	(getgenv()).visualizer = visualizerConfig;
	updateVisualizerLabel();
	saveTopbarConfig();
end;
local function applyProfile(name)
	if not applyVisualizerProfileValues(name) then
		return;
	end;
	(getgenv()).visualizer = visualizerConfig;
	updateModeLabel();
	saveTopbarConfig();
end;
local function findProfileIndex(name)
	for idx, profileName in profileOrder do
		if profileName == name then
			return idx;
		end;
	end;
	return nil;
end;
local function cycleProfile()
	local current = visualizerConfig.profile or VisualizerDefaults.profile;
	local idx = findProfileIndex(current) or 1;
	local nextIdx = idx % (#profileOrder) + 1;
	applyProfile(profileOrder[nextIdx]);
end;
local function setupDebugIcon(IconModule)
	local existing = IconModule.getIcon and IconModule.getIcon("APDebug");
	if existing then
		iconHide(existing);
	end;
	local icon = IconModule.new();
	icon:disableOverlay(true);
	((icon:setName("APDebug")):setImage("rbxassetid://11348555035")):align("Right");
	topbarState.debugIconInstance = icon;
	local menu = icon:addMenu();
	topbarState.debugStateOption = (menu:new()):setLabel("State: " .. parryState.apState);
	topbarState.debugTargetOption = (menu:new()):setLabel("Targeted: No");
	topbarState.debugBallsOption = (menu:new()):setLabel("Balls: 0");
	topbarState.debugCooldownOption = (menu:new()):setLabel("CD: 0.00s");
	if icon.setCaption then
		icon:setCaption(parryState.apState);
	end;
end;
local function setDebugEnabled(value, IconModule)
	topbarState.debugEnabled = value == true;
	if topbarState.debugEnabled then
		if topbarState.debugIconInstance then
			iconShow(topbarState.debugIconInstance);
		elseif IconModule then
			setupDebugIcon(IconModule);
		end;
		updateDebugMenu(0, false, tick());
	else
		iconHide(topbarState.debugIconInstance);
	end;
	if topbarState.debugToggleOption then
		topbarState.debugToggleOption:setLabel("Debug: " .. (topbarState.debugEnabled and "ON" or "OFF"));
	end;
	saveTopbarConfig();
end;
local function setTouchLockEnabled(value)
	topbarState.touchLock = value == true;
	if topbarState.touchLock then
		ApplyLastInputPatch();
	else
		RevertLastInputPatch();
	end;
	if topbarState.touchOpt then
		topbarState.touchOpt:setLabel("TouchLock: " .. (topbarState.touchLock and "ON" or "OFF"));
	end;
	saveTopbarConfig();
end;
local function setupTopbarIcon()
	local ok, IconModule = pcall(function()
		return (loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/Icon.luau")))();
	end);
	if not ok or (not IconModule) then
		return;
	end;
	local existing = IconModule.getIcon and IconModule.getIcon("AutoParry");
	if existing then
		iconHide(existing);
	end;
	local icon = IconModule.new();
	(((icon:setName("AutoParry")):setLabel("Auto Parry")):setImage("rbxassetid://11322093465")):align("Center");
	topbarState.topbarIconInstance = icon;
	local dropdown = icon:addMenu();
	topbarState.visualizerOption = (dropdown:new()):setLabel("Visual: OFF");
	topbarState.visualizerOption:oneClick(function()
		toggleVisualizer();
	end);
	topbarState.apOption = (dropdown:new()):setLabel("AP: ON");
	topbarState.apOption:oneClick(function()
		setApEnabled(not parryState.apEnabled);
	end);
	topbarState.modeOption = (dropdown:new()):setLabel("Mode: " .. (visualizerConfig.profile or VisualizerDefaults.profile));
	topbarState.modeOption:oneClick(function()
		cycleProfile();
	end);
	topbarState.modeDropdown = topbarState.modeOption:addMenu();
	topbarState.spamOption = (dropdown:new()):setLabel("Spam: OFF");
	topbarState.spamOption:oneClick(function()
		toggleSpam();
	end);
	topbarState.preclickOption = (dropdown:new()):setLabel("Preclick: ON");
	topbarState.preclickOption:oneClick(function()
		togglePreclick();
	end);
	topbarState.debugToggleOption = (dropdown:new()):setLabel("Debug: OFF");
	topbarState.debugToggleOption:oneClick(function()
		setDebugEnabled(not topbarState.debugEnabled, IconModule);
	end);
	if IsOnMobile then
		topbarState.touchOpt = (dropdown:new()):setLabel("TouchLock: " .. (topbarState.touchLock and "ON" or "OFF"));
		topbarState.touchOpt:oneClick(function()
			setTouchLockEnabled(not topbarState.touchLock);
		end);
	end;
	local function addModeEntry(name)
		local entry = (topbarState.modeDropdown:new()):setLabel(name);
		entry:oneClick(function()
			applyProfile(name);
		end);
	end;
	for _, name in profileOrder do
		addModeEntry(name);
	end;
	updateApLabel();
	updateSpamLabel();
	updatePreclickLabel();
	updateVisualizerLabel();
	updateModeLabel();
	updateDebugMenu(0, false, tick());
	if topbarState.debugEnabled then
		setDebugEnabled(true, IconModule);
	end;
end;
setupTopbarIcon();
local function ensureIdentity()
	pcall(function()
		local level = 8;
		if setidentity then
			setidentity(level);
		elseif setthreadidentity then
			setthreadidentity(level);
		elseif syn and syn.set_thread_identity then
			syn.set_thread_identity(level);
		elseif set_thread_identity then
			set_thread_identity(level);
		end;
	end);
end;
if getgenv().AutoParryCleanup then
	getgenv().AutoParryCleanup();
end;
if topbarState.touchLock then
	ApplyLastInputPatch();
end;
local function colorsClose(a, b, tol)
	if not (a and b) then
		return false;
	end;
	tol = tol or 0.05;
	return math.abs(a.R - b.R) <= tol and math.abs(a.G - b.G) <= tol and math.abs(a.B - b.B) <= tol;
end;
local function round(num, places)
	local mult = 10 ^ (places or 0);
	return math.floor((num * mult + 0.5)) / mult;
end;
local function newRing(name, color)
	ensureIdentity();
	local part = Instance.new("Part");
	part.Name = name;
	part.Anchored = true;
	part.Size = Vector3.new(10, 0.4, 10);
	part.Color = color;
	part.CanCollide = false;
	part.CastShadow = false;
	part.CanQuery = false;
	part.Transparency = visualizerState.ringBaseTransparency;
	local mesh = Instance.new("SpecialMesh");
	mesh.MeshType = Enum.MeshType.FileMesh;
	mesh.MeshId = "rbxassetid://471124075";
	mesh.Scale = Vector3.new(0.067, 0.1, 0.067);
	mesh.Parent = part;
	part.Parent = workspace;
	return part;
end;
local ringPlayer = newRing("Visualizer", Color3.new(1, 0, 0));
local ringPlayerNoUnit = ringPlayer:Clone();
ringPlayerNoUnit.Name = "VisualizerNoUnit";
ringPlayerNoUnit.Color = Color3.new(1, 0, 1);
ringPlayerNoUnit.Transparency = 0.55;
ringPlayerNoUnit.Parent = workspace;
local function rescaleRing(part, diameter, overrideMax, dt)
	local target = math.clamp(diameter or 10, visualizerState.minSize, overrideMax or visualizerState.maxSize);
	local current = visualizerState.ringSizeState[part] or part and part.Size.X or target;
	local alpha = dt and math.clamp(dt / 0.05, 0.08, 0.6) or 0.35;
	local size = current + (target - current) * alpha;
	visualizerState.ringSizeState[part] = size;
	part.Size = Vector3.new(size, 0.4, size);
	local mesh = part:FindFirstChildOfClass("SpecialMesh");
	if mesh then
		local factor = size / 10;
		mesh.Scale = Vector3.new(0.067 * factor, 0.1, 0.067 * factor);
		mesh.Offset = Vector3.new(0, -(0.2 * factor - 0.2), 0);
	end;
	return target;
end;
local function newBillboard(name, size, studsOffset, includeMulti)
	ensureIdentity();
	local gui = Instance.new("BillboardGui");
	gui.Name = name;
	gui.Parent = guiCHECKINGAHHHHH();
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	gui.LightInfluence = 1;
	gui.Size = size;
	gui.StudsOffset = studsOffset or Vector3.new(0, 5, 0);
	gui.Enabled = true;
	gui.AlwaysOnTop = true;
	local text = Instance.new("TextLabel");
	text.Name = "Text";
	text.Parent = gui;
	text.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	text.BackgroundTransparency = 1;
	text.BorderColor3 = Color3.fromRGB(0, 0, 0);
	text.BorderSizePixel = 0;
	text.Size = UDim2.new(1, 0, 0.55, 0);
	text.Position = UDim2.new(0, 0, 0.45, 0);
	text.Font = Enum.Font.FredokaOne;
	text.Text = "100";
	text.TextColor3 = Color3.fromRGB(255, 255, 255);
	text.TextScaled = true;
	text.TextSize = 14;
	text.TextStrokeTransparency = 0;
	text.TextWrapped = true;
	local textMulti;
	if includeMulti then
		textMulti = text:Clone();
		textMulti.Name = "TextMulti";
		textMulti.TextTransparency = 0.5;
		textMulti.TextStrokeTransparency = 0.5;
		textMulti.Size = UDim2.new(1, 0, 0.45, 0);
		textMulti.Position = UDim2.new(0, 0, 0, 0);
		textMulti.Text = "1x";
		textMulti.Parent = gui;
	end;
	return gui, text, textMulti;
end;
local rangeGui, rangeText, rangeMulti = newBillboard("Range", UDim2.new(3, 0, 3, 0), Vector3.new(0, 5, 0), true);
local function detachContainer(c)
	local conns = ballState.ballConns[c];
	if conns then
		if typeof(conns) == "RBXScriptConnection" then
			pcall(function()
				conns:Disconnect();
			end);
		elseif type(conns) == "table" then
			for _, conn in conns do
				pcall(function()
					conn:Disconnect();
				end);
			end;
		end;
		ballState.ballConns[c] = nil;
	end;
end;
local function addBall(b)
	if ballState.ballsMap[b] or (not (b and b:IsA("BasePart") and b.Parent)) then
		return;
	end;
	ballState.ballsMap[b] = true;
end;
local function removeBall(b)
	if not ballState.ballsMap[b] then
		return;
	end;
	ballState.ballsMap[b] = nil;
	ballState.mainRealBall[b] = nil;
	ballState.targetStateCache[b] = nil;
	ballState.targetStateQueued[b] = nil;
	ballState.targetStateDirty[b] = nil;
	ballState.targetConfirmActive[b] = nil;
end;
local function cleanupBallVisual(ball)
	local v = visualizerState.ballVis[ball];
	if not v then
		return;
	end;
	visualizerState.ballVis[ball] = nil;
	if v.gui then
		v.gui:Destroy();
	end;
	if v.ring then
		visualizerState.ringSizeState[v.ring] = nil;
		v.ring:Destroy();
	end;
end;
local function attachContainer(c)
	if not (c and c.Parent) or ballState.ballConns[c] then
		return;
	end;
	if c:IsA("BasePart") then
		addBall(c);
	end;
	for _, d in c:QueryDescendants("BasePart") do
		addBall(d);
	end;
	local added = c.DescendantAdded:Connect(function(d)
		if d:IsA("BasePart") then
			addBall(d);
		end;
	end);
	local removing = c.DescendantRemoving:Connect(function(d)
		if d:IsA("BasePart") then
			removeBall(d);
		end;
	end);
	local ancestry = c.AncestryChanged:Connect(function(inst, parent)
		if inst == c and parent == nil then
			if c:IsA("BasePart") then
				removeBall(c);
			end;
			detachContainer(c);
		end;
	end);
	ballState.ballConns[c] = {
		added,
		removing,
		ancestry
	};
end;
local function trackNamedContainer(parent, name)
	if not (typeof(parent) == "Instance" and type(name) == "string") then
		return;
	end;
	for _, inst in parent:QueryDescendants("Instance") do
		if inst.Name == name then
			attachContainer(inst);
		end;
	end;
	local direct = parent:FindFirstChild(name);
	if direct then
		attachContainer(direct);
	end;
	if ballState.containerConns[parent] then
		return;
	end;
	local addedConn = parent.DescendantAdded:Connect(function(ch)
		if ch.Name == name then
			attachContainer(ch);
		end;
	end);
	local ancestryConn = parent.AncestryChanged:Connect(function(inst, parentObj)
		if inst == parent and parentObj == nil then
			local conns = ballState.containerConns[inst];
			if conns then
				if typeof(conns) == "RBXScriptConnection" then
					pcall(function()
						conns:Disconnect();
					end);
				elseif type(conns) == "table" then
					for _, cn in conns do
						pcall(function()
							cn:Disconnect();
						end);
					end;
				end;
				ballState.containerConns[inst] = nil;
			end;
		end;
	end);
	ballState.containerConns[parent] = {
		addedConn,
		ancestryConn
	};
end;
local function setupBallTracking()
	local p = visualizerConfig and visualizerConfig.path;
	local paths;
	if p == nil then
		paths = {
			{
				parent = workspace,
				name = "Balls"
			}
		};
	elseif typeof(p) == "table" then
		if p[1] == nil and (p.parent or p.container or p.name) then
			paths = {
				p
			};
		else
			paths = p;
		end;
	else
		paths = {
			p
		};
	end;
	for _, src in paths do
		local t = typeof(src);
		if t == "Instance" then
			attachContainer(src);
		elseif t == "table" then
			local par = src.parent;
			local name = src.name;
			local container = src.container;
			if typeof(container) == "Instance" then
				attachContainer(container);
			elseif typeof(par) == "Instance" and type(name) == "string" then
				trackNamedContainer(par, name);
			end;
		end;
	end;
end;
local function isVisualizerPart(p)
	if not p or (not p:IsA("BasePart")) then
		return false;
	end;
	local tr = p.Transparency or 0;
	local ltm = 0;
	pcall(function()
		ltm = p.LocalTransparencyModifier or 0;
	end);
	return tr < 0.95 and ltm < 0.95;
end;
local function getTrackedBallVelocity(part)
	if not (part and part:IsA("BasePart")) then
		return Vector3.zero;
	end;
	return part.AssemblyLinearVelocity or part.Velocity or Vector3.zero;
end;
local function isSameBallCluster(a, b)
	if a == b then
		return true;
	end;
	if not (a and b and a.Parent and b.Parent and a:IsA("BasePart") and b:IsA("BasePart")) then
		return false;
	end;
	local maxSize = math.max(a.Size.Magnitude, b.Size.Magnitude);
	local posThreshold = math.max(1.75, math.min(maxSize * 0.25, 3));
	if (a.Position - b.Position).Magnitude > posThreshold then
		return false;
	end;
	local velA = getTrackedBallVelocity(a);
	local velB = getTrackedBallVelocity(b);
	local maxSpeed = math.max(velA.Magnitude, velB.Magnitude);
	if maxSpeed < 4 then
		return true;
	end;
	local velThreshold = math.max(6, maxSpeed * 0.22);
	return (velA - velB).Magnitude <= velThreshold;
end;
local function splitBallClusters(list)
	local groups = {};
	for i = 1, #list do
		local part = list[i];
		local placed = false;
		for g = 1, #groups do
			local group = groups[g];
			if isSameBallCluster(part, group.anchor) then
				group.parts[(#group.parts) + 1] = part;
				if ballState.mainRealBall[part] then
					group.anchor = part;
				end;
				placed = true;
				break;
			end;
		end;
		if not placed then
			groups[(#groups) + 1] = {
				anchor = part,
				parts = {
					part
				}
			};
		end;
	end;
	return groups;
end;
local function appendPrimaryBall(list)
	local count = #list;
	if count == 0 then
		return;
	end;
	if count == 1 then
		ballState.ballList[(#ballState.ballList) + 1] = list[1];
		return;
	end;
	local invis = {};
	local vis = {};
	local anyMain;
	for i = 1, count do
		local part = list[i];
		if isVisualizerPart(part) then
			vis[(#vis) + 1] = part;
		else
			invis[(#invis) + 1] = part;
		end;
		if ballState.mainRealBall[part] then
			anyMain = part;
		end;
	end;
	local winner;
	if #invis > 0 then
		winner = anyMain or invis[1];
	elseif anyMain then
		winner = anyMain;
	elseif #vis > 0 then
		winner = vis[1];
	else
		winner = list[1];
	end;
	if winner then
		ballState.mainRealBall[winner] = true;
		for i = 1, count do
			local part = list[i];
			if part ~= winner then
				ballState.mainRealBall[part] = nil;
				ballState.ballsMap[part] = nil;
				cleanupBallVisual(part);
			end;
		end;
		ballState.ballList[(#ballState.ballList) + 1] = winner;
	end;
end;
local function getBalls()
	table.clear(ballState.ballList);
	local byName = {};
	for b in ballState.ballsMap do
		if b and b.Parent then
			local name = b.Name;
			local list = byName[name];
			if not list then
				list = {};
				byName[name] = list;
			end;
			list[(#list) + 1] = b;
		else
			ballState.ballsMap[b] = nil;
			ballState.mainRealBall[b] = nil;
			cleanupBallVisual(b);
		end;
	end;
	for _, list in byName do
		if #list == 1 then
			appendPrimaryBall(list);
		else
			local groups = splitBallClusters(list);
			for i = 1, #groups do
				appendPrimaryBall(groups[i].parts);
			end;
		end;
	end;
	return ballState.ballList;
end;
setupBallTracking();
local function getBallVisual(ball)
	if not ball then
		return nil;
	end;
	local v = visualizerState.ballVis[ball];
	if v and (not v.ring or (not v.ring.Parent) or (not v.gui) or (not v.gui.Parent)) then
		v = nil;
	end;
	if not v then
		local gui = select(1, newBillboard("Distance", UDim2.new(2, 0, 2, 0), Vector3.new(0, 5, 0), false));
		local txt = gui:FindFirstChild("Text");
		gui.Adornee = ball;
		local ring = ringPlayer:Clone();
		ring.Name = "VisualizerFollowBall";
		ring.Transparency = visualizerState.ringBaseTransparency;
		ring.Parent = workspace;
		v = {
			ring = ring,
			gui = gui,
			text = txt
		};
		visualizerState.ballVis[ball] = v;
	end;
	return v;
end;
local function cleanupAllBallVisuals()
	for b in visualizerState.ballVis do
		cleanupBallVisual(b);
	end;
end;
local function applyVisualizerVisible(show)
	rangeGui.Enabled = show;
	ringPlayer.Transparency = show and visualizerState.ringBaseTransparency or 1;
	ringPlayerNoUnit.Transparency = show and visualizerState.ringPinkTransparency or 1;
	for _, v in visualizerState.ballVis do
		if v.gui then
			v.gui.Enabled = show;
		end;
		if v.ring then
			v.ring.Transparency = show and visualizerState.ringBaseTransparency or 1;
		end;
	end;
end;
local function trackConnection(conn)
	ballState.trackedConnections[(#ballState.trackedConnections) + 1] = conn;
	return conn;
end;
local function cleanup()
	for _, c in ballState.trackedConnections do
		pcall(function()
			c:Disconnect();
		end);
	end;
	ballState.trackedConnections = {};
	for _, conns in ballState.ballConns do
		for _, conn in conns do
			pcall(function()
				conn:Disconnect();
			end);
		end;
	end;
	ballState.ballConns = {};
	for _, conn in ballState.containerConns do
		if typeof(conn) == "RBXScriptConnection" then
			pcall(function()
				conn:Disconnect();
			end);
		elseif type(conn) == "table" then
			for _, cn in conn do
				pcall(function()
					cn:Disconnect();
				end);
			end;
		end;
	end;
	ballState.containerConns = {};
	ballState.ballsMap = {};
	ballState.ballList = {};
	ballState.mainRealBall = {};
	visualizerState.visualizerAttached = false;
	visualizerState.ringLimited = false;
	visualizerState.ringSizeState = {};
	pcall(function()
		rangeGui.Adornee = nil;
		rangeGui:Destroy();
	end);
	pcall(function()
		cleanupAllBallVisuals();
		visualizerState.ballVis = {};
		ringPlayer:Destroy();
		ringPlayerNoUnit:Destroy();
	end);
	pcall(function()
		iconHide(topbarState.topbarIconInstance);
		topbarState.topbarIconInstance = nil;
		topbarState.apOption = nil;
		topbarState.spamOption = nil;
		topbarState.preclickOption = nil;
		topbarState.visualizerOption = nil;
		topbarState.modeOption = nil;
		topbarState.modeDropdown = nil;
		topbarState.touchOpt = nil;
	end);
	pcall(function()
		iconHide(topbarState.debugIconInstance);
		topbarState.debugIconInstance = nil;
		topbarState.debugStateOption = nil;
		topbarState.debugTargetOption = nil;
		topbarState.debugBallsOption = nil;
		topbarState.debugCooldownOption = nil;
	end);
	topbarState.touchLock = false;
	RevertLastInputPatch();
	purgeOldAutoParryArtifacts();
	table.clear(connections);
	table.clear(parryState.pendingBalls);
	table.clear(parryState.pendingSet);
	(getgenv()).AutoParryCleanup = nil;
end;
(getgenv()).AutoParryCleanup = cleanup;
local function attachVisualizer(hasBall)
	if hasBall then
		if not visualizerState.visualizerAttached then
			local guiParent = guiCHECKINGAHHHHH();
			rangeGui.Parent = guiParent;
			for _, v in visualizerState.ballVis do
				if v.gui then
					v.gui.Parent = guiParent;
				end;
				if v.ring then
					v.ring.Parent = workspace;
				end;
			end;
			ringPlayer.Parent = workspace;
			ringPlayerNoUnit.Parent = workspace;
			visualizerState.visualizerAttached = true;
		end;
	elseif visualizerState.visualizerAttached then
		rangeGui.Parent = nil;
		rangeGui.Adornee = nil;
		for _, v in visualizerState.ballVis do
			if v.gui then
				v.gui.Parent = nil;
				v.gui.Adornee = nil;
			end;
			if v.ring then
				v.ring.Parent = nil;
			end;
		end;
		ringPlayer.Parent = nil;
		ringPlayerNoUnit.Parent = nil;
		visualizerState.visualizerAttached = false;
	end;
end;
local function resolveRemote()
	local cfg = visualizerConfig;
	local r = cfg and cfg.remote;
	if not r then
		return nil, nil;
	end;
	local function resolveOne(x)
		if typeof(x) == "Instance" then
			if x.Parent then
				return x, nil;
			end;
		elseif type(x) == "table" then
			local inst = x.inst or x[1];
			local args = x.args or x[2];
			if typeof(inst) == "Instance" and inst.Parent then
				return inst, args;
			end;
			local par = x.parent;
			local name = x.name;
			if not inst and typeof(par) == "Instance" and type(name) == "string" and par.Parent then
				local f = par:FindFirstChild(name, true);
				if f and f.Parent then
					return f, args;
				end;
			end;
		end;
		return nil, nil;
	end;
	if typeof(r) == "Instance" or type(r) == "table" and (r.inst or r.parent or r[1]) then
		return resolveOne(r);
	elseif type(r) == "table" then
		for _, v in r do
			local inst, args = resolveOne(v);
			if inst then
				return inst, args;
			end;
		end;
	end;
	return nil, nil;
end;
local function fireRemote(rem, args)
	if not (rem and typeof(rem) == "Instance" and rem.Parent) then
		return false;
	end;
	local a = args;
	if a == nil then
		a = {};
	end;
	if typeof(a) ~= "table" then
		a = {
			a
		};
	end;
	local t = rem.ClassName;
	local ok = false;
	if t == "RemoteEvent" then
		local s = pcall(function()
			rem:FireServer(unpack(a));
		end);
		if s then
			ok = true;
		end;
	elseif t == "RemoteFunction" then
		local s = pcall(function()
			rem:InvokeServer(unpack(a));
		end);
		if s then
			ok = true;
		end;
	elseif t == "BindableEvent" then
		local s = pcall(function()
			rem:Fire(unpack(a));
		end);
		if s then
			ok = true;
		end;
	elseif t == "BindableFunction" then
		local s = pcall(function()
			rem:Invoke(unpack(a));
		end);
		if s then
			ok = true;
		end;
	end;
	return ok;
end;
local function resolveBtn()
	local cfg = visualizerConfig;
	local b = cfg and cfg.btn;
	if not b then
		return nil;
	end;
	local function resolveOne(x)
		if typeof(x) == "Instance" then
			if x:IsA("GuiButton") and x.Parent then
				return x;
			end;
		elseif type(x) == "table" then
			local par = x.parent;
			local name = x.name;
			if typeof(par) == "Instance" and type(name) == "string" and par.Parent then
				local f = par:FindFirstChild(name, true);
				if f and f:IsA("GuiButton") and f.Parent then
					return f;
				end;
			end;
		end;
		return nil;
	end;
	if typeof(b) == "Instance" or type(b) == "table" and (b.parent or b.name) then
		return resolveOne(b);
	elseif type(b) == "table" then
		for _, v in b do
			local r = resolveOne(v);
			if r then
				return r;
			end;
		end;
	end;
	return nil;
end;
local function pressBtn(btn)
	if typeof(firesignal) ~= "function" then
		return false;
	end;
	if not (btn and btn:IsA("GuiButton") and btn.Parent) then
		return false;
	end;
	local function getSig(name)
		local ok, sig = pcall(function()
			return btn[name];
		end);
		if not ok or typeof(sig) ~= "RBXScriptSignal" then
			return nil;
		end;
		return sig;
	end;
	local function fireSig(sig)
		if typeof(sig) ~= "RBXScriptSignal" then
			return false;
		end;
		local hit = false;
		local con = sig:Connect(function()
			hit = true;
		end);
		local ok = pcall(function()
			firesignal(sig);
		end);
		task.wait();
		if con then
			con:Disconnect();
		end;
		return ok and hit;
	end;
	local sig = getSig("Activated");
	if sig and fireSig(sig) then
		return true;
	end;
	sig = getSig("MouseButton1Click");
	if sig and fireSig(sig) then
		return true;
	end;
	return false;
end;
local function QuickParry()
	local cam = workspace.CurrentCamera;
	local y = cam and cam.CFrame.LookVector.Y or 0;
	if Net and Net.Block then
		pcall(function()
			Net.Block:Invoke(y);
		end);
		return;
	end;
	if FRemote then
		pcall(function()
			FRemote:InvokeServer("SwordService", "Block", {
				y
			});
		end);
	end;
end;
local function DoParry()
	local rem, rargs = resolveRemote();
	if rem and fireRemote(rem, rargs) then
		return true;
	end;
	local btn = resolveBtn();
	if btn and pressBtn(btn) then
		return true;
	end;
	local cam = workspace.CurrentCamera;
	local y = cam and cam.CFrame.LookVector.Y or 0;
	local success = false;
	if Net and Net.Block then
		local ok, res = pcall(function()
			return Net.Block:Invoke(y);
		end);
		if ok and res ~= nil then
			success = true;
		end;
	end;
	if not success and FRemote then
		pcall(function()
			FRemote:InvokeServer("SwordService", "Block", {
				y
			});
		end);
		success = true;
	end;
	if success then
		local hold = SwordController and SwordController.GetSwordAnim and SwordController.GetSwordAnim("Hold");
		if hold then
			hold:Play();
		end;
		if SoundController and SoundController.PlaySound then
			SoundController.PlaySound("Block");
		end;
		if SwordController and SwordController.ShowShield then
			SwordController.ShowShield();
		end;
	end;
	return success;
end;
local function queueParry(isSpam, hasTarget)
	if not parryState.apEnabled and (not isSpam) then
		return;
	end;
	if not isSpam and (not hasTarget) then
		return;
	end;
	local now = tick();
	if not isSpam and now - parryState.lastQueueTime < 0.003 then
		return;
	end;
	parryState.lastQueueTime = now;
	local ok, err = pcall(DoParry);
	if not ok then
		apWarn(err);
	end;
end;
local function getHighlightColor(inst)
	if not inst then
		return nil, nil;
	end;
	local best;
	local bestColor;
	local bestTrans = math.huge;
	for _, child in inst:GetChildren() do
		if child:IsA("Highlight") then
			local ft = child.FillTransparency or 1;
			if child.Enabled ~= false and ft < bestTrans then
				best = child;
				bestColor = child.FillColor;
				bestTrans = ft;
			end;
		end;
	end;
	if not best then
		best = inst:FindFirstChildOfClass("Highlight") or inst:FindFirstChild("Highlight");
		if best and best.Enabled ~= false then
			bestColor = best.FillColor;
		else
			best = nil;
			bestColor = nil;
		end;
	end;
	return best, bestColor;
end;
local function isBallTargetingYou(ball, char)
	local charHighlight, charColor = getHighlightColor(char);
	local ballHighlight, hlBallColor = getHighlightColor(ball);
	local ballColorPrimary;
	if ball and ball:IsA("BasePart") then
		ballColorPrimary = ball.Color;
	end;
	local targetedColor = false;
	local usedBallColor;
	if ballColorPrimary and charHighlight and charColor then
		if colorsClose(ballColorPrimary, charColor, 0.05) then
			targetedColor = true;
			usedBallColor = ballColorPrimary;
		end;
	end;
	if not targetedColor and ballHighlight and hlBallColor and charHighlight and charColor and ballHighlight.Enabled ~= false and charHighlight.Enabled ~= false and (ballHighlight.FillTransparency or 0) < 0.9 and (charHighlight.FillTransparency or 0) < 0.9 and colorsClose(hlBallColor, charColor, 0.05) then
		targetedColor = true;
		usedBallColor = hlBallColor;
	end;
	local targeted = targetedColor;
	return targeted, ballHighlight, charHighlight, usedBallColor, charColor;
end;
local function getBallTargetAttr(ball)
	if not ball then
		return nil;
	end;
	local attrs = ball:GetAttributes();
	for k, v in attrs do
		if typeof(k) == "string" and k:lower() == "target" then
			return v;
		end;
	end;
	return nil;
end;

local function normalizeTargetString(v)
	if typeof(v) ~= "string" then
		return "", "";
	end;
	local raw = v:lower():gsub("^%s+", ""):gsub("%s+$", "");
	raw = raw:gsub("^target%s*[:=%-]?%s*", "");
	raw = raw:gsub("^player%s*[:=%-]?%s*", "");
	raw = raw:gsub("^@", "");
	local compact = raw:gsub("[^%w]", "");
	return raw, compact;
end;

local function isBallTargetingYouAttr(ball, char)
	local v = getBallTargetAttr(ball);
	if not v then
		return false;
	end;
	if typeof(v) == "Instance" then
		if char and v == char then
			return true;
		end;
		if v:IsA("Player") and localPlayer and v == localPlayer then
			return true;
		end;
	elseif typeof(v) == "string" then
		local plr = __lt.cm("Players", "GetPlayerFromCharacter", char) or localPlayer;
		if not plr then
			return false;
		end;
		local raw, compact = normalizeTargetString(v);
		local n1 = plr.Name and plr.Name:lower() or "";
		local n2 = plr.DisplayName and plr.DisplayName:lower() or "";
		local n3 = char and char.Name and char.Name:lower() or "";
		local c1 = n1 ~= "" and n1:gsub("[^%w]", "") or "";
		local c2 = n2 ~= "" and n2:gsub("[^%w]", "") or "";
		local c3 = n3 ~= "" and n3:gsub("[^%w]", "") or "";
		local uid = plr.UserId and tostring(plr.UserId) or "";
		if raw == n1 or raw == n2 or raw == n3 or raw == uid then
			return true;
		end;
		if compact ~= "" and (compact == c1 or compact == c2 or compact == c3 or compact == uid) then
			return true;
		end;
	end;
	return false;
end;
local function getCachedBallTargetState(ball, char)
	local cached = ballState.targetStateCache[ball];
	if cached and cached.char == char then
		return cached;
	end;
	return nil;
end;
local queueBallTargetStateCheck;
local function refreshBallTargetState(ball, char, frameId)
	if not (ball and ball.Parent and char and char.Parent) then
		ballState.targetStateCache[ball] = nil;
		return nil;
	end;
	local okTarget, targeted, ballHighlight, charHighlight, ballColor, charColor = pcall(isBallTargetingYou, ball, char);
	local okAttr, attrNow = pcall(isBallTargetingYouAttr, ball, char);
	if not (ball and ball.Parent and char and char.Parent) then
		ballState.targetStateCache[ball] = nil;
		return nil;
	end;
	local state = {
		char = char,
		targeted = okTarget and targeted == true or false,
		attrNow = okAttr and attrNow == true or false,
		ballHighlight = okTarget and ballHighlight or nil,
		charHighlight = okTarget and charHighlight or nil,
		ballColor = okTarget and ballColor or nil,
		charColor = okTarget and charColor or nil,
		frameId = frameId,
		t = tick()
	};
	ballState.targetStateCache[ball] = state;
	return state;
end;
local function getBallTargetState(ball, char, frameId, forceSync)
	if forceSync then
		return refreshBallTargetState(ball, char, frameId);
	end;
	queueBallTargetStateCheck(ball, char, frameId);
	return getCachedBallTargetState(ball, char);
end;
queueBallTargetStateCheck = function(ball, char, frameId)
	if not (ball and ball.Parent and char and char.Parent) then
		ballState.targetStateCache[ball] = nil;
		ballState.targetStateDirty[ball] = nil;
		ballState.targetStateQueued[ball] = nil;
		return;
	end;
	ballState.targetStateDirty[ball] = {
		char = char,
		frameId = frameId
	};
	if ballState.targetStateQueued[ball] then
		return;
	end;
	ballState.targetStateQueued[ball] = true;
	task.defer(function()
		while true do
			local request = ballState.targetStateDirty[ball];
			if not request then
				ballState.targetStateQueued[ball] = nil;
				return;
			end;
			ballState.targetStateDirty[ball] = nil;
			local reqChar = request.char;
			refreshBallTargetState(ball, reqChar, request.frameId);
		end;
	end);
end;
updateRingColors = function()
	if visualizerState.ringLimited then
		ringPlayer.Color = Color3.new(0, 1, 0);
	elseif parryState.spam then
		ringPlayer.Color = Color3.new(1, 0.7, 0);
	else
		ringPlayer.Color = Color3.new(1, 0, 0);
	end;
end;
trackConnection(UserInputService.InputBegan:Connect(function(input, gpe)
	if input.KeyCode == Enum.KeyCode.X and (not gpe) then
		toggleSpam();
	end;
end));
updateRingColors();
local function updateGuiTargets(hrp, hasBall)
	if hasBall and hrp then
		rangeGui.Adornee = hrp;
	else
		rangeGui.Adornee = nil;
	end;
end;
parryState.clearActiveParryLock = function(ball)
	if ball == nil or parryState.activeParryBall == ball then
		parryState.activeParryBall = nil;
		parryState.activeParryReleaseAt = 0;
	end;
end;
local function setActiveParryLock(ball, now, hitTime)
	parryState.activeParryBall = ball;
	local holdFor = math.clamp((hitTime or 0.2) + 0.12, 0.18, 0.9);
	parryState.activeParryReleaseAt = (now or tick()) + holdFor;
end;
local function clearPendingBall(ball)
	if ball == nil then
		return;
	end;
	parryState.pendingSet[ball] = nil;
	for i = #parryState.pendingBalls, 1, -1 do
		if parryState.pendingBalls[i].ball == ball then
			table.remove(parryState.pendingBalls, i);
		end;
	end;
end;

local function clearPendingBalls()
	table.clear(parryState.pendingBalls);
	table.clear(parryState.pendingSet);
end;

local function queuePendingBall(ball, hitTime, rawDist, zoneRadius, immediate)
	if not (ball and ball.Parent) then
		return;
	end;
	local now = tick();
	local item = parryState.pendingSet[ball];
	if item then
		item.hitTime = math.min(item.hitTime or math.huge, hitTime or math.huge);
		item.rawDist = math.min(item.rawDist or math.huge, rawDist or math.huge);
		item.zoneRadius = math.max(item.zoneRadius or 0, zoneRadius or 0);
		item.immediate = item.immediate or immediate == true;
		item.t = now;
		return;
	end;
	item = {
		ball = ball,
		hitTime = hitTime or math.huge,
		rawDist = rawDist or math.huge,
		zoneRadius = zoneRadius or 0,
		immediate = immediate == true,
		t = now
	};
	parryState.pendingSet[ball] = item;
	parryState.pendingBalls[(#parryState.pendingBalls) + 1] = item;
end;

local function getBallSeparation(a, b)
	if not (a and b and a.Parent and b.Parent) then
		return math.huge;
	end;
	local ok, dist = pcall(function()
		return (a.Position - b.Position).Magnitude;
	end);
	if ok and type(dist) == "number" then
		return dist;
	end;
	return math.huge;
end;

local function flushPendingParries(char, hrp, forceImmediate)
	if not (char and hrp) then
		return false;
	end;
	local list = parryState.pendingBalls;
	local shots = 0;
	local maxShots = 2;
	while shots < maxShots do
		local now = tick();
		local bestIndex;
		local bestItem;
		local bestHit = math.huge;
		local bestDist = math.huge;
		for i = #list, 1, -1 do
			local item = list[i];
			local ball = item and item.ball;
			if not (ball and ball.Parent) then
				if ball ~= nil then
					parryState.pendingSet[ball] = nil;
				end;
				table.remove(list, i);
			else
				if ball == parryState.activeParryBall or ballState.closeParryBlocked[ball] then
					parryState.pendingSet[ball] = nil;
					table.remove(list, i);
				else
					local targetState = getBallTargetState(ball, char, parryState.curFrame, true);
					local targetKnown = targetState ~= nil;
					local targeted = targetKnown and (targetState.targeted or targetState.attrNow) or false;
					local okD, rawDist = pcall(function()
						return (ball.Position - hrp.Position).Magnitude;
					end);
					if not okD or type(rawDist) ~= "number" then
						parryState.pendingSet[ball] = nil;
						table.remove(list, i);
					else
						local queuedZone = math.max(item.zoneRadius or 0, 12);
						local insideQueuedZone = rawDist <= queuedZone * 1.02;
						local forcedQueued = forceImmediate and insideQueuedZone;
						if (not targeted) and (not forcedQueued) then
							if targetKnown and now - (item.t or 0) > 0.2 then
								parryState.pendingSet[ball] = nil;
								table.remove(list, i);
							end;
						else
							local speed = math.max(ballState.smoothedSpeed[ball] or 0, getTrackedBallVelocity(ball).Magnitude);
							local hitTime = math.min(item.hitTime or math.huge, speed > 0 and (rawDist / math.max(speed, 1)) or math.huge);
							local danger = forcedQueued or insideQueuedZone or item.immediate or hitTime <= 0.35 or rawDist <= math.max(12, 18 + speed * 0.04);
							if danger and (hitTime < bestHit or (math.abs(hitTime - bestHit) <= 0.02 and rawDist < bestDist)) then
								if forcedQueued then
									hitTime = -2;
								elseif insideQueuedZone or item.immediate then
									hitTime = -1;
								end;
								bestIndex = i;
								bestItem = item;
								bestHit = hitTime;
								bestDist = rawDist;
							end;
						end;
					end;
				end;
			end;
		end;
		if not bestIndex or not bestItem then
			break;
		end;
		local ball = bestItem.ball;
		table.remove(list, bestIndex);
		if ball ~= nil then
			parryState.pendingSet[ball] = nil;
		end;
		local nowFire = tick();
		local lastBallFire = ballState.lastParryPerBall[ball] or (-math.huge);
		if forceImmediate or nowFire - lastBallFire > 0.035 then
			if parryState.activeParryBall and parryState.activeParryBall ~= ball then
				ballState.closeParryBlocked[parryState.activeParryBall] = nil;
				parryState.clearActiveParryLock(parryState.activeParryBall);
			end;
			parryState.lastQueueTime = nowFire;
			parryState.nextPar = nowFire + parryState.parCd;
			parryState.lastParryTime = nowFire;
			ballState.lastParryPerBall[ball] = nowFire;
			ballState.closeParryBlocked[ball] = true;
			setActiveParryLock(ball, nowFire, bestItem.hitTime);
			local okP, errP = pcall(DoParry);
			if not okP then
				apWarn(errP);
			end;
			shots += 1;
		end;
	end;
	return shots > 0;
end;

local function safeFlush(char, hrp, forceImmediate)
	local ok, result = pcall(flushPendingParries, char, hrp, forceImmediate);
	if not ok then
		apWarn(result);
		return false;
	end;
	return result == true;
end;

local function tryPromoteImmediateBall(balls, char, hrp, excludeBall, pingValue)
	if not (balls and char and hrp) then
		return false;
	end;
	local vs = visualizerState;
	local bestBall;
	local bestHit = math.huge;
	local bestDist = math.huge;
	for _, ball in balls do
		if ball and ball.Parent and ball ~= excludeBall and ball ~= parryState.activeParryBall then
			local targetState = getBallTargetState(ball, char, parryState.curFrame, true);
			local currentTargetConfirmed = targetState and (targetState.targeted or targetState.attrNow) or false;
			if currentTargetConfirmed then
				local okD, rawDist = pcall(function()
					return (ball.Position - hrp.Position).Magnitude;
				end);
				if okD and type(rawDist) == "number" then
					local speed = math.max(ballState.smoothedSpeed[ball] or 0, getTrackedBallVelocity(ball).Magnitude);
					local multiplier = 0.12;
					if speed < 60 then
						multiplier = 0.06;
					elseif speed > 120 then
						multiplier = 0.2;
					elseif speed > 80 then
						multiplier = 0.16;
					end;
					local effectiveSpeed = math.max(speed - 5, 0);
					local speedBoost = 0.05;
					if speed > 160 then
						speedBoost = 0.12;
					elseif speed > 120 then
						speedBoost = 0.09;
					elseif speed > 80 then
						speedBoost = 0.07;
					end;
					local baseFactor = math.clamp(vs.predictBase / 50, 0.25, 2);
					local predictRadiusNoPing = vs.predictMinRadius + vs.predictExtra * baseFactor + effectiveSpeed * (multiplier + speedBoost) * baseFactor;
					local predictRadius = predictRadiusNoPing + (pingValue or 0) * vs.pingPredictScale;
					local preEntryMargin = math.clamp(predictRadius * 0.12 + (pingValue or 0) * 0.018, 3, 14);
					local parryPredictRadius = predictRadius + preEntryMargin;
					if rawDist <= parryPredictRadius * 1.02 then
						local hitTime = speed > 0 and (rawDist / math.max(speed, 1)) or math.huge;
						if hitTime < bestHit or (math.abs(hitTime - bestHit) <= 0.02 and rawDist < bestDist) then
							bestBall = ball;
							bestHit = hitTime;
							bestDist = rawDist;
						end;
					end;
				end;
			end;
		end;
	end;
	if not bestBall then
		return false;
	end;
	local nowFire = tick();
	parryState.lastQueueTime = nowFire;
	parryState.nextPar = nowFire + parryState.parCd;
	parryState.lastParryTime = nowFire;
	ballState.lastParryPerBall[bestBall] = nowFire;
	ballState.closeParryBlocked[bestBall] = true;
	setActiveParryLock(bestBall, nowFire, bestHit);
	clearPendingBall(bestBall);
	local okP, errP = pcall(DoParry);
	if not okP then
		apWarn(errP);
	end;
	return okP == true;
end;

local function AutoParryStep(dt)
	local ps = parryState;
	local vs = visualizerState;
	local bs = ballState;
	ps.curFrame = ps.curFrame + 1;
	character = localPlayer.Character or character;
	local hrp = waitForChildFast(character, "HumanoidRootPart");
	local balls = getBalls();
	local hasBalls = #balls > 0;
	attachVisualizer(hasBalls);
	local showViz = isVisualizerEnabled() and hasBalls;
	local nowFrame = tick();
	local pingFrame = getPing();
	if not (hrp and hrp.Position) then
		return;
	end;
	if ps.activeParryBall and ps.activeParryBall.Parent then
		local old = ps.activeParryBall;
		local activeState = getBallTargetState(old, character, ps.curFrame, true);
		local activeTargeted = activeState and (activeState.targeted or activeState.attrNow);
		if activeState and (not activeTargeted) then
			bs.closeParryBlocked[old] = nil;
			bs.targetedSince[old] = nil;
			bs.targetStartDist[old] = nil;
			clearPendingBall(old);
			ps.nextPar = 0;
			ps.clearActiveParryLock(old);
			if not tryPromoteImmediateBall(balls, character, hrp, old, pingFrame) then
				safeFlush(character, hrp, true);
			end;
		end;
	end;
	local spamWindowUntil = hasBalls and (nowFrame + 0.06) or 0;
	local spamFastUntil = 0;
	local spamBurstUntil = 0;
	updateGuiTargets(hrp, hasBalls);
	local anyTargeted = false;
	if hasBalls then
		local seen = {};
		local pendingImmediate = false;
		local focusPos = nil;
		local focusDist = math.huge;
		local focusPosTargeted = nil;
		local focusDistTargeted = math.huge;
		local focusIsTargeted = false;
		local primBaseSize, primPredictNoPing, primPredictRadius;
		for _, ball in balls do
			if ball and ball.Position then
				seen[ball] = true;
				local vis = getBallVisual(ball);
				local ringBall = vis and vis.ring;
				local dGui = vis and vis.gui;
				local dText = vis and vis.text;
				local rawDist = (ball.Position - hrp.Position).Magnitude;
				local dist = rawDist / vs.distanceDivisor;
				local now = nowFrame;
				if ringBall then
					ringBall.CFrame = CFrame.new(ball.Position);
				end;
				local velocity = ball.AssemblyLinearVelocity or ball.Velocity or Vector3.zero;
				local lastVel = bs.lastBallVel[ball] or Vector3.zero;
				local sample = bs.lastBallSamples[ball];
				local sampleDt = sample and now - sample.t or 0;
				local posDelta = sample and ball.Position - sample.pos or Vector3.zero;
				if not sample or sampleDt > 0.4 then
					sample = {
						pos = ball.Position,
						t = now
					};
					sampleDt = 0;
					posDelta = Vector3.zero;
				end;
				local prevRawDist = bs.lastDistToPlayer[ball];
				local closingSpeed = 0;
				if prevRawDist then
					local distDt = math.max(sampleDt > 0 and sampleDt or (dt or ps.stepDt), 0.001);
					closingSpeed = (prevRawDist - rawDist) / distDt;
				end;
				bs.lastDistToPlayer[ball] = rawDist;
				local manualVel = sampleDt > 0 and posDelta / math.max(sampleDt, 0.001) or velocity;
				local instantVel = velocity;
				if instantVel.Magnitude < 0.001 or instantVel.Magnitude < manualVel.Magnitude * 0.5 then
					instantVel = manualVel;
				end;
				local chosenVel = instantVel;
				local directionVelocity = instantVel;
				local lastMoveTime = bs.lastBallMoveTime[ball] or 0;
				if chosenVel.Magnitude >= 4 then
					bs.lastBallMoveTime[ball] = now;
				elseif lastVel.Magnitude > 8 and now - lastMoveTime < 0.2 then
					chosenVel = lastVel:Lerp(chosenVel, 0.15);
				end;
				local smoothingAlpha = sampleDt > 0 and math.clamp(sampleDt / 0.04, 0.35, 0.9) or 0.45;
				bs.lastBallSamples[ball] = {
					pos = ball.Position,
					t = now
				};
				velocity = lastVel:Lerp(chosenVel, smoothingAlpha);
				local speed = velocity.Magnitude;
				local prevSpeed = bs.smoothedSpeed[ball] or speed;
				local speedLerp = math.clamp((dt or 0.016) / 0.03, 0.35, 0.95);
				speed = prevSpeed + (speed - prevSpeed) * speedLerp;
				bs.smoothedSpeed[ball] = speed;
				bs.lastBallVel[ball] = velocity;
				local baseSize = 10 + speed * vs.speedScale * 2;
				local multiplier = 0.12;
				if speed < 60 then
					multiplier = 0.06;
				elseif speed > 120 then
					multiplier = 0.2;
				elseif speed > 80 then
					multiplier = 0.16;
				end;
				local effectiveSpeed = math.max(speed - 5, 0);
				local speedBoost = 0.05;
				if speed > 160 then
					speedBoost = 0.12;
				elseif speed > 120 then
					speedBoost = 0.09;
				elseif speed > 80 then
					speedBoost = 0.07;
				end;
				local ping = pingFrame;
				local baseFactor = math.clamp(vs.predictBase / 50, 0.25, 2);
				local predictRadiusNoPing = vs.predictMinRadius + vs.predictExtra * baseFactor + effectiveSpeed * (multiplier + speedBoost) * baseFactor;
				local predictRadius = predictRadiusNoPing + ping * vs.pingPredictScale;
				local preEntryMargin = math.clamp(predictRadius * 0.12 + ping * 0.018, 3, 14);
				local parryPredictRadius = predictRadius + preEntryMargin;
				if ringBall then
					rescaleRing(ringBall, baseSize, nil, dt);
				end;
				if not focusIsTargeted and rawDist < focusDist then
					focusDist = rawDist;
					focusPos = ball.Position;
					primBaseSize = baseSize;
					primPredictNoPing = predictRadiusNoPing;
					primPredictRadius = predictRadius;
				end;
				local inPredict = rawDist <= predictRadius;
				local nearPredict = rawDist <= predictRadius + preEntryMargin;
				local inParryPredict = rawDist <= parryPredictRadius;
				local displayedPredict = predictRadius;
				rangeText.Text = tostring(round(displayedPredict, 1));
				if rangeMulti then
					rangeMulti.Text = string.format("%.1fx", round(displayedPredict / 100, 1));
				end;
				if dText then
					dText.Text = tostring(round(dist, 1));
				end;
				local prevInPredict = bs.wasInPredict[ball] or false;
				if nearPredict then
					bs.predictEnterAt[ball] = bs.predictEnterAt[ball] or now;
					ps.resetToken = ps.resetToken + 1;
				elseif prevInPredict then
					bs.predictEnterAt[ball] = nil;
				else
					bs.predictEnterAt[ball] = nil;
				end;
				bs.wasInPredict[ball] = nearPredict;
				local settleTime = math.clamp(0.003 + ping * 0.0002, 0.002, 0.014);
				local settledInPredict = nearPredict and bs.predictEnterAt[ball] and now - bs.predictEnterAt[ball] >= settleTime;
				local forceTargetRefresh = rawDist <= math.max(20, parryPredictRadius * 1.2) or ps.activeParryBall == ball or ps.pendingSet[ball] ~= nil;
				local targetState = getBallTargetState(ball, character, ps.curFrame, forceTargetRefresh);
				local targetKnown = targetState ~= nil;
				local targeted = targetKnown and targetState.targeted or false;
				local ballHighlight = targetKnown and targetState.ballHighlight or nil;
				local charHighlight = targetKnown and targetState.charHighlight or nil;
				local ballColor = targetKnown and targetState.ballColor or nil;
				local charColor = targetKnown and targetState.charColor or nil;
				local attrNow = targetKnown and targetState.attrNow or false;
				local charHighlightEnabled = targetKnown and charHighlight and charHighlight.Enabled ~= false or false;
				local currentTargetConfirmed = targeted or attrNow;
				local targetJustAcquired = false;
				local attrJustAcquired = false;
				local combinedTargetJustAcquired = false;
				local prevTargetConfirmed = bs.targetConfirmActive[ball] == true;
				if currentTargetConfirmed and (not prevTargetConfirmed) then
					combinedTargetJustAcquired = true;
					bs.lastParryPerBall[ball] = -math.huge;
					bs.closeParryBlocked[ball] = nil;
					if now < ps.nextPar then
						ps.nextPar = now;
					end;
					bs.targetedSince[ball] = now;
					bs.targetStartDist[ball] = rawDist;
				elseif (not currentTargetConfirmed) and prevTargetConfirmed then
					bs.closeParryBlocked[ball] = nil;
				end;
				bs.targetConfirmActive[ball] = currentTargetConfirmed;
				if targetKnown and currentTargetConfirmed then
					anyTargeted = true;
					if rawDist < focusDistTargeted then
						focusDistTargeted = rawDist;
						focusPosTargeted = ball.Position;
						focusIsTargeted = true;
						primBaseSize = baseSize;
						primPredictNoPing = predictRadiusNoPing;
						primPredictRadius = predictRadius;
					end;
				end;
				if targetKnown then
					local lastChar = bs.lastCharHighlightEnabled[ball] or false;
					if charHighlightEnabled and (not lastChar) then
						bs.lastParryPerBall[ball] = -math.huge;
					end;
					local lastMatch = bs.lastHighlightMatch[ball] or false;
					local highlightsMatchNow = targeted;
					if highlightsMatchNow and (not lastMatch) then
						targetJustAcquired = true;
						bs.lastParryPerBall[ball] = -math.huge;
						bs.closeParryBlocked[ball] = nil;
						if now < ps.nextPar then
							ps.nextPar = now;
						end;
						bs.targetedSince[ball] = now;
						bs.targetStartDist[ball] = rawDist;
					elseif not highlightsMatchNow and lastMatch then
						bs.lastParryPerBall[ball] = -math.huge;
						bs.targetedSince[ball] = nil;
						if not attrNow then
							bs.closeParryBlocked[ball] = nil;
							ps.nextPar = 0;
							bs.targetStartDist[ball] = nil;
						end;
					end;
					bs.lastHighlightMatch[ball] = highlightsMatchNow;
					bs.lastCharHighlightEnabled[ball] = charHighlightEnabled;
					local prevAttrState = bs.lastAttrTargeted[ball];
					if attrNow and (not prevAttrState) then
						attrJustAcquired = true;
						bs.lastParryPerBall[ball] = -math.huge;
						bs.closeParryBlocked[ball] = nil;
						if now < ps.nextPar then
							ps.nextPar = now;
						end;
					end;
					if attrNow and (bs.targetStartDist[ball] == nil) then
						bs.targetStartDist[ball] = rawDist;
					elseif not attrNow and prevAttrState and (not targeted) then
						bs.lastParryPerBall[ball] = -math.huge;
						ps.nextPar = 0;
						bs.targetStartDist[ball] = nil;
					end;
					bs.lastAttrTargeted[ball] = attrNow;
				end;
				local highlightsMatch = bs.lastHighlightMatch[ball] == true;
				local hasTargetLock = targeted and bs.targetedSince[ball] ~= nil;
				local approaching = false;
				local isBait = false;
				local lobBlocked = false;
				local dotNow = 0;
				local towardSpeed = 0;
				local movingAway = false;
				local directionSpeed = directionVelocity.Magnitude;
				local flatDirection = Vector3.new(directionVelocity.X, 0, directionVelocity.Z);
				local flatSpeed = flatDirection.Magnitude;
				local upwardSpeed = math.max(directionVelocity.Y, 0);
				local heightDelta = ball.Position.Y - hrp.Position.Y;
				local strongRisingLob = upwardSpeed > math.max(16, flatSpeed * 0.85) and heightDelta > math.max(6, predictRadius * 0.18);
				if strongRisingLob and rawDist > math.max(12, parryPredictRadius * 0.72) then
					lobBlocked = true;
				end;
				if directionSpeed >= 1 then
					local toYou = hrp.Position - ball.Position;
					local mag = toYou.Magnitude;
					if mag > 0.001 then
						local dirToYou = toYou / mag;
						local velDir = directionSpeed > 0.001 and directionVelocity.Unit or dirToYou;
						dotNow = dirToYou:Dot(velDir);
						towardSpeed = directionVelocity:Dot(dirToYou);
						local toward = towardSpeed > math.max(1.2, directionSpeed * 0.05);
						local away = towardSpeed < (-math.max(1.5, directionSpeed * 0.08));
						local wasAway = bs.lastAwayFlag[ball];
						if away then
							if not wasAway then
								bs.awaySince[ball] = now;
							end;
							bs.lastAwayFlag[ball] = true;
						else
							if wasAway then
								local startAway = bs.awaySince[ball];
								if toward and startAway and now - startAway >= 0.06 then
									bs.baitUntil[ball] = now + 0.14;
								end;
							end;
							bs.lastAwayFlag[ball] = false;
						end;
						local baitActive = bs.baitUntil[ball] and now < bs.baitUntil[ball] and rawDist > parryPredictRadius * 0.6;
						local breakBait = towardSpeed > math.max(9, directionSpeed * 0.16) or closingSpeed > math.max(10, directionSpeed * 0.22);
						isBait = baitActive and (not breakBait);
						approaching = toward and (not isBait);
						movingAway = towardSpeed < (-math.max(2, directionSpeed * 0.08));
					end;
				else
					bs.lastAwayFlag[ball] = false;
					bs.awaySince[ball] = nil;
				end;
				local forceToward = false;
				if directionSpeed >= 8 then
					local fastRadialToward = towardSpeed > math.max(9, directionSpeed * 0.18);
					local fastClosing = closingSpeed > math.max(14, directionSpeed * 0.24);
					local closeAndClosing = rawDist <= math.max(22, parryPredictRadius * 0.9) and closingSpeed > 8;
					forceToward = fastRadialToward or fastClosing or closeAndClosing;
				end;
				if forceToward then
					approaching = true;
					movingAway = false;
				end;
				if lobBlocked then
					approaching = false;
					forceToward = false;
				end;
				if ps.activeParryBall == ball then
					clearPendingBall(ball);
					if targetKnown and (not targeted) and (not attrNow) then
						bs.closeParryBlocked[ball] = nil;
						ps.nextPar = 0;
						ps.clearActiveParryLock(ball);
						safeFlush(character, hrp);
					elseif now >= ps.activeParryReleaseAt or (movingAway and rawDist > math.max(10, parryPredictRadius * 0.55)) then
						ps.clearActiveParryLock(ball);
						safeFlush(character, hrp);
					end;
				end;
				local ignoreMovingAwayForClash = bs.targetStartDist[ball] ~= nil and bs.targetStartDist[ball] <= 50;
				local movingAwayBlocked = movingAway and (not ignoreMovingAwayForClash) and (not forceToward);
				local timingSpeed = math.max(speed, directionSpeed * 0.9);
				local toRingTime = approaching and timingSpeed > 1 and math.max((rawDist - parryPredictRadius), 0) / timingSpeed or math.huge;
				local closeHit = targeted and rawDist <= math.max(10, parryPredictRadius * 0.45);
				local nearHitTime = timingSpeed > 1 and rawDist / timingSpeed or math.huge;
				local preclickLead = ps.preclick and getPreclickLead(ping) or 0;
				local preclickTooLate = ps.preclick and nearHitTime <= math.max(preclickLead * 0.65, 0.018);
				local hitTime = nearHitTime;
				if ps.preclick and (targeted or attrNow) then
					hitTime = math.max(nearHitTime - preclickLead, 0);
				end;
				local veryFastHit = (not ps.preclick) and targeted and hitTime <= 0.18 + ping * vs.pingTimeScale;
				local closeHitSafe = closeHit and (hitTime <= 0.3 or speed >= 25);
				local targetSnap = targeted and inParryPredict and settledInPredict and (hitTime <= 0.6 or rawDist <= math.max(10, parryPredictRadius * 0.6));
				local innerEmergency = (not ps.preclick) and targeted and rawDist <= math.max(8, predictRadius * 0.4);
				local fastApproach = targeted and approaching and (hitTime <= 0.22 or rawDist <= parryPredictRadius * 0.95);
				local retargetInsideZone = rawDist <= math.max(14, parryPredictRadius * 0.98);
				local retargetTimeOk = hitTime <= 0.6 or rawDist <= math.max(10, parryPredictRadius * 0.75);
				local instantRetarget = (targetJustAcquired or attrJustAcquired or combinedTargetJustAcquired) and currentTargetConfirmed and retargetInsideZone and retargetTimeOk;
				local retargetOverrideMovingAway = instantRetarget and rawDist <= math.max(14, parryPredictRadius * 0.9);
				local handoffZone = rawDist <= math.max(12, parryPredictRadius * 0.95);
				local isOtherBall = ps.activeParryBall ~= nil and ps.activeParryBall ~= ball;
				spamWindowUntil = math.max(spamWindowUntil, now + 0.08);
				if nearPredict or hitTime <= 0.5 or rawDist <= math.max(24, parryPredictRadius * 1.35) then
					spamWindowUntil = math.max(spamWindowUntil, now + 0.16);
				end;
				if inParryPredict then
					spamWindowUntil = math.max(spamWindowUntil, now + 0.22);
				end;
				if rawDist <= math.max(10, parryPredictRadius * 0.75) or instantRetarget or innerEmergency then
					spamFastUntil = math.max(spamFastUntil, now + 0.2);
				elseif nearPredict and hitTime <= 0.25 then
					spamFastUntil = math.max(spamFastUntil, now + 0.14);
				elseif rawDist <= math.max(18, parryPredictRadius) and hitTime <= 0.45 then
					spamFastUntil = math.max(spamFastUntil, now + 0.1);
				end;
				if rawDist <= math.max(12, parryPredictRadius * 0.85) or instantRetarget or innerEmergency or veryFastHit then
					spamBurstUntil = math.max(spamBurstUntil, now + 0.16);
				elseif currentTargetConfirmed and inParryPredict and hitTime <= 0.24 then
					spamBurstUntil = math.max(spamBurstUntil, now + 0.12);
				end;
				local overlapHandoff = false;
				local overlapDist = math.huge;
				if isOtherBall then
					overlapDist = getBallSeparation(ps.activeParryBall, ball);
					-- Treat nearly-stacked balls as an immediate handoff threat.
					overlapHandoff = overlapDist <= math.max(14, parryPredictRadius * 0.6);
				end;
				local parryTriggered = false;
				if targetKnown and isOtherBall and currentTargetConfirmed and handoffZone and (not bs.closeParryBlocked[ball]) then
					local immediateQueuedHandoff = rawDist <= parryPredictRadius or overlapHandoff or overlapDist <= math.max(18, parryPredictRadius * 0.8);
					queuePendingBall(ball, hitTime, rawDist, parryPredictRadius, immediateQueuedHandoff);
					local urgentHandoff = immediateQueuedHandoff or hitTime <= 0.18;
					if urgentHandoff then
						pendingImmediate = true;
						spamBurstUntil = math.max(spamBurstUntil, now + 0.18);
						ps.activeParryReleaseAt = math.min(ps.activeParryReleaseAt, now);
						if ps.activeParryBall and ps.activeParryBall ~= ball then
							bs.closeParryBlocked[ps.activeParryBall] = nil;
							ps.clearActiveParryLock(ps.activeParryBall);
						end;
						if safeFlush(character, hrp, true) then
							parryTriggered = true;
						end;
					else
						ps.activeParryReleaseAt = math.min(ps.activeParryReleaseAt, now + 0.035);
					end;
				elseif ps.pendingSet[ball] and (((targetKnown and (not targeted) and (not attrNow) and ps.activeParryBall == nil)) or (not ball.Parent) or rawDist > math.max(22, parryPredictRadius * 1.35)) then
					clearPendingBall(ball);
				end;
				if (ps.activeParryBall == nil or ps.activeParryBall == ball or now >= ps.activeParryReleaseAt) and instantRetarget and (not bs.closeParryBlocked[ball]) and ((not movingAwayBlocked) or retargetOverrideMovingAway) then
					local nowRetarget = now;
					local lastBallFire = bs.lastParryPerBall[ball] or (-math.huge);
					if nowRetarget >= ps.nextPar and nowRetarget - lastBallFire > 0.05 then
						ps.nextPar = nowRetarget + ps.parCd;
						bs.lastParryPerBall[ball] = nowRetarget;
						bs.closeParryBlocked[ball] = true;
						ps.lastParryTime = nowRetarget;
						parryTriggered = true;
						setActiveParryLock(ball, nowRetarget, hitTime);
						clearPendingBall(ball);
						queueParry(false, true);
					end;
				end;
				if (ps.activeParryBall == nil or ps.activeParryBall == ball or now >= ps.activeParryReleaseAt) and innerEmergency and hasTargetLock and (not bs.closeParryBlocked[ball]) and (not movingAwayBlocked) then
					local nowInner = now;
					local lastBallFire = bs.lastParryPerBall[ball] or (-math.huge);
					if nowInner >= ps.nextPar and nowInner - lastBallFire > 0.05 then
						ps.nextPar = nowInner + ps.parCd;
						bs.lastParryPerBall[ball] = nowInner;
						bs.closeParryBlocked[ball] = true;
						ps.lastParryTime = nowInner;
						parryTriggered = true;
						setActiveParryLock(ball, nowInner, hitTime);
						clearPendingBall(ball);
						queueParry(false, true);
					end;
				end;
				local outsideRing = rawDist >= math.max(predictRadius - math.max(preEntryMargin * 1.1, 2.5), predictRadius * 0.85);
				local ringEdgeSafe = innerEmergency or rawDist >= parryPredictRadius * 0.6 or hitTime <= 0.2 or veryFastHit;
				local ringTimeSoon = toRingTime <= 0.55 + ping * 0.003;
				local function attemptParry()
					if parryTriggered then
						return;
					end;
					if not currentTargetConfirmed then
						return;
					end;
					if lobBlocked and (not inParryPredict) and (not instantRetarget) and (not innerEmergency) then
						return;
					end;
					if ps.activeParryBall ~= nil and ps.activeParryBall ~= ball and now < ps.activeParryReleaseAt then
						return;
					end;
					if isBait and (not innerEmergency) then
						return;
					end;
					if movingAwayBlocked then
						return;
					end;
					if preclickTooLate then
						return;
					end;
					if bs.closeParryBlocked[ball] and (rawDist > parryPredictRadius * 1.15 or now - (bs.lastParryPerBall[ball] or 0) > 1.2) then
						bs.closeParryBlocked[ball] = nil;
					end;
					local inCloseBlock = bs.closeParryBlocked[ball] and rawDist <= parryPredictRadius * 1.15;
					local slowClose = targeted and hasTargetLock and rawDist <= math.max(16, parryPredictRadius * 0.65) and speed >= 1.5 and hitTime <= 1.3;
					local slowVeryClose = targeted and rawDist <= math.max(10, parryPredictRadius * 0.5) and speed > 0 and speed <= 6 and hitTime <= 1.6;
					local slowMid = targeted and hasTargetLock and approaching and speed >= 7 and speed <= 26 and hitTime <= 1.15 and rawDist <= math.max(20, parryPredictRadius * 0.92);
					local slowMid2 = targeted and hasTargetLock and speed >= 7 and speed <= 26 and hitTime <= 0.95 and rawDist <= math.max(18, parryPredictRadius * 0.88);
					local canPredict = approaching and nearPredict and settledInPredict and highlightsMatch and hasTargetLock and (outsideRing or fastApproach) and (speed >= 12 or hitTime <= 0.25 or ringTimeSoon or fastApproach) or closeHitSafe and hasTargetLock or veryFastHit and hasTargetLock or targetSnap and hasTargetLock or innerEmergency and hasTargetLock or slowClose or slowVeryClose or slowMid or slowMid2;
					if not canPredict and targeted and hasTargetLock and (not innerEmergency) then
						if rawDist <= math.max(18, parryPredictRadius * 0.75) and hitTime <= 1.8 and speed >= 0.75 then
							canPredict = true;
						end;
					end;
					canPredict = canPredict and (not inCloseBlock);
					canPredict = canPredict and inParryPredict;
					canPredict = canPredict and ((not lobBlocked) or instantRetarget or innerEmergency);
					if canPredict then
						local nowTry = now;
						local lastBallFire = bs.lastParryPerBall[ball] or (-math.huge);
						local minBallCooldown = highlightsMatch and 0.7 or 0.35;
						if nowTry >= ps.nextPar and nowTry - lastBallFire > minBallCooldown then
							ps.nextPar = nowTry + ps.parCd;
							bs.lastParryPerBall[ball] = nowTry;
							if rawDist <= parryPredictRadius * 0.8 then
								bs.closeParryBlocked[ball] = true;
							end;
							ps.lastParryTime = nowTry;
							parryTriggered = true;
							setActiveParryLock(ball, nowTry, hitTime);
							clearPendingBall(ball);
							queueParry(false, true);
							return;
						end;
					end;
					if parryTriggered then
						return;
					end;
					if parryTriggered then
						return;
					end;
					local stillTargeted = currentTargetConfirmed;
					if not stillTargeted then
						return;
					end;
					local insideZone = rawDist <= math.max(12, parryPredictRadius * 0.95);
					local movingToward = approaching or rawDist <= math.max(6, parryPredictRadius * 0.4);
					local slowBand = speed >= 2 and speed <= 35;
					local timeWindow = hitTime <= 2.5;
					if insideZone and movingToward and slowBand and timeWindow and (not inCloseBlock) then
						local nowInner = now;
						local lastBallFire = bs.lastParryPerBall[ball] or (-math.huge);
						if nowInner >= ps.nextPar and nowInner - lastBallFire > 0.5 then
							ps.nextPar = nowInner + ps.parCd;
							bs.lastParryPerBall[ball] = nowInner;
							bs.closeParryBlocked[ball] = true;
							ps.lastParryTime = nowInner;
							parryTriggered = true;
							setActiveParryLock(ball, nowInner, hitTime);
							clearPendingBall(ball);
							queueParry(false, true);
						end;
					end;
				end;
				attemptParry();
				local function attemptAttrParry()
					if parryTriggered then
						return;
					end;
					if lobBlocked and (not inParryPredict) then
						return;
					end;
					if ps.activeParryBall ~= nil and ps.activeParryBall ~= ball and now < ps.activeParryReleaseAt then
						return;
					end;
					if targeted then
						return;
					end;
					if bs.closeParryBlocked[ball] then
						return;
					end;
					if isBait and (not innerEmergency) then
						return;
					end;
					if movingAwayBlocked then
						return;
					end;
					if preclickTooLate then
						return;
					end;
					if not targetKnown then
						return;
					end;
					local nowAttr = now;
					local attrTargeted = attrNow;
					if not attrTargeted then
						return;
					end;
					local attrNear = rawDist <= math.max(10, parryPredictRadius * 0.9);
					local attrFast = speed > 20 or hitTime <= 0.35;
					if not (attrNear and attrFast) then
						return;
					end;
					local lastBallFire = bs.lastParryPerBall[ball] or (-math.huge);
					if nowAttr >= ps.nextPar and nowAttr - lastBallFire > 0.7 then
						ps.nextPar = nowAttr + ps.parCd;
						bs.lastParryPerBall[ball] = nowAttr;
						ps.lastParryTime = nowAttr;
						parryTriggered = true;
						setActiveParryLock(ball, nowAttr, hitTime);
						clearPendingBall(ball);
						queueParry(false, true);
					end;
				end;
				attemptAttrParry();
			end;
		end;
		if #ps.pendingBalls > 0 and (pendingImmediate or ps.activeParryBall == nil or nowFrame >= ps.activeParryReleaseAt) then
			spamWindowUntil = math.max(spamWindowUntil, nowFrame + 0.18);
			if pendingImmediate then
				spamFastUntil = math.max(spamFastUntil, nowFrame + 0.18);
				spamBurstUntil = math.max(spamBurstUntil, nowFrame + 0.16);
			end;
			safeFlush(character, hrp);
		end;
		if ps.activeParryBall and (not seen[ps.activeParryBall]) then
			local old = ps.activeParryBall;
			bs.closeParryBlocked[old] = nil;
			bs.targetedSince[old] = nil;
			bs.targetStartDist[old] = nil;
			clearPendingBall(old);
			ps.nextPar = 0;
			ps.clearActiveParryLock(old);
			safeFlush(character, hrp);
		end;
		local focus = focusPosTargeted or focusPos;
		if focus then
			local lookAtBall = CFrame.lookAt(hrp.Position, focus);
			ringPlayer.CFrame = lookAtBall;
			ringPlayerNoUnit.CFrame = lookAtBall;
		else
			ringPlayer.CFrame = CFrame.new(hrp.Position);
			ringPlayerNoUnit.CFrame = ringPlayer.CFrame;
		end;
		if primBaseSize and primPredictNoPing and primPredictRadius then
			local appliedPlayerPredict = rescaleRing(ringPlayer, primPredictNoPing * 2, vs.maxSize, dt);
			vs.ringLimited = appliedPlayerPredict >= vs.maxSize - 0.1;
			rescaleRing(ringPlayerNoUnit, primPredictRadius * 2, vs.predictMaxSize, dt);
			ringPlayerNoUnit.Transparency = vs.ringPinkTransparency;
		else
			rescaleRing(ringPlayer, 10, vs.maxSize, dt);
			rescaleRing(ringPlayerNoUnit, 10, vs.predictMaxSize, dt);
			vs.ringLimited = false;
		end;
		for b in vs.ballVis do
			if not seen[b] or (not b.Parent) then
				cleanupBallVisual(b);
				bs.lastBallSamples[b] = nil;
				bs.lastDistToPlayer[b] = nil;
				bs.lastBallVel[b] = nil;
				bs.lastBallMoveTime[b] = nil;
				bs.smoothedSpeed[b] = nil;
				bs.closeParryBlocked[b] = nil;
				bs.predictEnterAt[b] = nil;
				bs.wasInPredict[b] = nil;
				bs.lastHighlightMatch[b] = nil;
				bs.lastCharHighlightEnabled[b] = nil;
				bs.targetedSince[b] = nil;
				bs.targetStartDist[b] = nil;
				bs.lastAttrTargeted[b] = nil;
				bs.targetConfirmActive[b] = nil;
				bs.targetStateCache[b] = nil;
				bs.targetStateQueued[b] = nil;
				bs.targetStateDirty[b] = nil;
				bs.lastParryPerBall[b] = nil;
				bs.baitUntil[b] = nil;
				bs.awaySince[b] = nil;
				bs.lastAwayFlag[b] = nil;
			end;
		end;
		ps.spamWindowUntil = math.max(ps.spamWindowUntil or 0, spamWindowUntil);
		ps.spamFastUntil = math.max(ps.spamFastUntil or 0, spamFastUntil);
		ps.spamBurstUntil = math.max(ps.spamBurstUntil or 0, spamBurstUntil);
	else
		ringPlayer.CFrame = CFrame.new(hrp.Position);
		ringPlayerNoUnit.CFrame = ringPlayer.CFrame;
		cleanupAllBallVisuals();
		vs.ringSizeState = {};
		bs.lastBallSamples = {};
		bs.lastDistToPlayer = {};
		bs.lastBallVel = {};
		bs.lastBallMoveTime = {};
		bs.smoothedSpeed = {};
		bs.closeParryBlocked = {};
		bs.predictEnterAt = {};
		bs.wasInPredict = {};
		bs.lastHighlightMatch = {};
		bs.lastCharHighlightEnabled = {};
		bs.targetedSince = {};
		bs.targetStartDist = {};
		bs.lastAttrTargeted = {};
		bs.targetConfirmActive = {};
		bs.targetStateCache = {};
		bs.targetStateQueued = {};
		bs.targetStateDirty = {};
		bs.lastParryPerBall = {};
		bs.baitUntil = {};
		bs.awaySince = {};
		bs.lastAwayFlag = {};
		ps.nextPar = 0;
		ps.spamWindowUntil = 0;
		ps.spamFastUntil = 0;
		ps.spamBurstUntil = 0;
		ps.spamNextAt = 0;
		ps.clearActiveParryLock(nil);
		clearPendingBalls();
		vs.ringLimited = false;
		ps.resetToken = 0;
		rangeText.Text = "0";
		if rangeMulti then
			rangeMulti.Text = "0x";
		end;
	end;
	local nowStateTime = tick();
	local inCooldown = nowStateTime < ps.nextPar;
	local state;
	if not ps.apEnabled then
		state = "Disabled";
	elseif ps.lastParryTime > 0 and nowStateTime - ps.lastParryTime <= 0.25 then
		state = "Parried";
	elseif not hasBalls then
		if inCooldown then
			state = "Recovering";
		else
			state = "Idle";
		end;
	elseif inCooldown then
		if anyTargeted then
			state = "Cooldown";
		else
			state = "Recovering";
		end;
	elseif anyTargeted then
		state = "Targeted";
	else
		state = "Active";
	end;
	ps.apState = state;
	updateDebugMenu(#balls, anyTargeted, nowStateTime);
	updateRingColors();
	applyVisualizerVisible(showViz);
end;
local StepSignal = RunService.PostSimulation or RunService.Heartbeat;
trackConnection(StepSignal:Connect(function(dt)
	local ok, err = xpcall(function()
		dt = math.clamp(dt or 0, 0, 0.25);
		local step = parryState.stepDt;
		local catch = math.max(parryState.maxSub, 12);
		if dt >= step * catch then
			parryState.stepAcc = 0;
			AutoParryStep(dt);
		else
			parryState.stepAcc = math.min(parryState.stepAcc + dt, step * catch);
			local ran = 0;
			while parryState.stepAcc >= step and ran < catch do
				AutoParryStep(step);
				parryState.stepAcc -= step;
				ran += 1;
			end;
			if ran == 0 then
				AutoParryStep(dt);
			elseif parryState.stepAcc > step * 0.5 then
				AutoParryStep(parryState.stepAcc);
				parryState.stepAcc = 0;
			end;
		end;
	end, debug.traceback);
	if not ok then
		apWarn(err);
	end;
end));
trackConnection(StepSignal:Connect(function()
	if parryState.spam and parryState.apEnabled then
		local now = tick();
		local windowUntil = parryState.spamWindowUntil or 0;
		local fastUntil = parryState.spamFastUntil or 0;
		local burstUntil = parryState.spamBurstUntil or 0;
		if now > windowUntil then
			return;
		end;
		local burstSpam = now <= burstUntil;
		local fastSpam = burstSpam or now <= fastUntil;
		local interval = burstSpam and 0.004 or (fastSpam and 0.007 or 0.013);
		if now < (parryState.spamNextAt or 0) then
			return;
		end;
		parryState.spamNextAt = now + interval;
		local shots = burstSpam and 4 or (fastSpam and 3 or 2);
		for _ = 1, shots do
			task.defer(QuickParry);
		end;
	end;
end));
