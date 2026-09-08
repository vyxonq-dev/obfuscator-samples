repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.GameId ~= 0
function missing(T, F, Fb)
	if type(F) == T then return F end
	return Fb
end
cloneref = missing("function", cloneref, function(...) return ... end)
Services = setmetatable({}, {
	__index = function(Slf, N)
		local Ok, Cch = pcall(function()
			return cloneref(game:GetService(N))
		end)
		if Ok then
			rawset(Slf, N, Cch)
			return Cch
		else
			error("Invalid Service: " .. tostring(N))
		end
	end
})

local CoreGui = Services.CoreGui
local TextService = Services.TextService
local Players = Services.Players
local TweenService = Services.TweenService
local UserInputService = Services.UserInputService
local RunService = Services.RunService
local Plr = Players.LocalPlayer
local Lst = {
	{gid = {"1831550657", "10337069275", "10399524075", "3512256796", "10323871857", "10454554751", "6324644175", "10531477636", "10219827882", "10647180866"}, id = "1b1251046fd4407c1d8f7e90cb337aeb", keyless = false}, -- cos, ice tycoon, golem, minor, zenith, unbox, mp, auto, piggy
	{gid = {"7359962123"}, id = "f3cdf28dc70b1249611f4d9e92b15c4e", keyless = false}, -- aac
	{gid = {"10759415852", "8978470369", "9870850309", "10258087043", "7613921865","3913007563", "10754208508", "1962399895", "10516888336", "10417987249", "9866884975", "10428418645"}, id = "245e817ec11f0591898dbef698f5a598", keyless = false}, -- gambling, castle, bubble, r, ae, tbb, balllslslsl, td, neb, syb, trench
	{gid = {"9219838330", "10334731049", "6749892429", "7990186056", "7300616172", "10393620082", "9927195474", "10402792340", "7585140258", "7738524573", "7970033072"}, id = "d310529bba1c9560607c620cc8664b89", keyless = false}, -- pml, spm, eve, tower, purge, asmr, fish, dumpling, runaways, rtd
	{gid = {"9980077437", "5691634893", "10002454638", "10384841418", "10231871497", "10253235584", "10272975313", "10548618687", "10099615394", "6628327758", "10439568447", "10548784271"}, id = "d8e39dd7c8bfa5015a2c48dc361d656f", keyless = false}, -- rng, overdrive, vut, squishy, drill, base, dino, ut, dd, ca, lumber
	{gid = {"10111742174", "9584946743", "10053091404", "10368005384", "9826885587", "10399562127", "10475794799", "10405010493", "10539411000", "10200740632", "10529067596", "9906378607"}, id = "74b4e982b9b980d106fc43e8ca53f248", keyless = false}, -- 🧱, ii, pf, sandwich, evo, blocklll, dig, wash, cleanleaf, sr, golf, hole
	{gid = {"7037673488", "10040426659", "8161187430", "10255492538", "10356701370","8191321227", "10347437155", "10376944238", "10517428659", "10510017078", "10690360998", "10645450718"}, id = "3781eb1fc444bef291a013c0e69f7c2a", keyless = false}, -- skeleton, ti, qua,li, stealbase, overture, bad, byb, map, ctf
	{gid = {"9965411707", "8500639466", "9734147105", "8079278639", "9979308605", "7934320560","10399136326", "10196162679", "10499633281", "10589963489", "9971332199", "10503838245"}, id = "79c4f538aba5d702cd1b7795737a36d1", keyless = false}, -- ni, cu, ma, s, u, animeg, 5n, aaa, ant, tank, pa
}
local Gid = tostring(game.GameId)
local GameCfg
local Exec = (identifyexecutor and identifyexecutor() or "Unknown"):lower()
for _, Entry in ipairs(Lst) do
	for _, Id in ipairs(Entry.gid) do
		if Id == Gid then
			GameCfg = Entry
			break
		end
	end
	if GameCfg then break end
end
if not GameCfg then
	Plr:Kick("This game is not supported.")
	return
end
local ScriptId = GameCfg.id
local IsKeyLess = GameCfg.keyless
if CoreGui:FindFirstChild("iLoveyuri") then
    CoreGui.iLoveyuri:Destroy()
end
local Cfg = {
    KeyFile = "yuri/savedkey.txt",
    Title = "Yuri",
    AAC = "https://ads.luarmor.net/get_key?for=AAC-mGGYZfajqulV",
    LinkvertiseURL = "https://ads.luarmor.net/get_key?for=Yuri-ODPllbErcWEJ",
    WorkinkURL = "https://ads.luarmor.net/get_key?for=Lesbian-pCiCBJScuyDv",
    DiscordURL = "https://discord.gg/6pCsSbVd3E",
}
local LuarmorApi = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
local Yuri = loadstring(game:HttpGet("https://raw.githubusercontent.com/iLove-yuri/debug/refs/heads/main/homutop.lua"))()
LuarmorApi.script_id = ScriptId
if IsKeyLess then
    pcall(function()
        LuarmorApi.load_script()
    end)
    return
end

if isfile(Cfg.KeyFile) then
    local SvdKey = readfile(Cfg.KeyFile):gsub("%s", "")
    local Ok, Rslt = pcall(function()
        return LuarmorApi.check_key(SvdKey)
    end)
    if Ok and Rslt.code == "KEY_VALID" then
        script_key = SvdKey
        pcall(function()
            LuarmorApi.load_script()
        end)
        return
    elseif Ok and Rslt.code == "KEY_HWID_LOCKED" then
        delfile(Cfg.KeyFile)
        Plr:Kick("Key is locked to a different HWID. Reset your HWID and re-run.")
        return
    else
        delfile(Cfg.KeyFile)
        Plr:Kick("Saved key is invalid or expired. Re-run the script to get a new one.")
        return
    end
end
local function ValidateKey(Key, Ntfy, Sg)
	local ClnKey = Key:gsub("%s", "")
	if #ClnKey ~= 32 then
		Ntfy("Invalid key format (must be 32 characters)", Color3.fromRGB(255, 60, 60))
		return false
	end
	Ntfy("Validating key...", Color3.fromRGB(220, 220, 220))
	local Ok, Rslt = pcall(function()
		return LuarmorApi.check_key(ClnKey)
	end)
	if not Ok then
		Ntfy("Network error. Check your connection.", Color3.fromRGB(255, 60, 60))
		return false
	end
	if Rslt.code == "KEY_VALID" then
		if not isfolder("yuri") then
			makefolder("yuri")
		end
		writefile(Cfg.KeyFile, ClnKey)
		script_key = ClnKey
		Sg:Destroy()
		pcall(function()
			LuarmorApi.load_script()
		end)
		return true
	else
		Ntfy("Invalid or expired key", Color3.fromRGB(255, 60, 60))
		return false
	end
end
Yuri.new({
    TweenService = TweenService,
    UserInputService = UserInputService,
    CoreGui = CoreGui,
    TextService = TextService,
    RunService = RunService,
    config = Cfg,
    scriptKey = script_key,
    onCheckKey = ValidateKey,
})
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
Plr.OnTeleport:Connect(function(State)
	if _G.autoExec and queueteleport then
		queueteleport([[
			loadstring(game:HttpGet('https://raw.githubusercontent.com/iLove-yuri/leeeeesbian/refs/heads/main/homumado.lua'))()
		]])
	end
end)
