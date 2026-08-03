local _ipII0llI0 do local _ipII0llIo='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' local _ipII0ll11={} for _ipII0lllI=1,#_ipII0llIo do _ipII0ll11[_ipII0llIo:sub(_ipII0lllI,_ipII0lllI)]=_ipII0lllI-1 end local _ipII0ll1o=(function(_ipII0lll1)   local _ipII0lllo={} local _ipII0llll=#_ipII0lll1 local _ipII0lllI=1   while _ipII0lllI<=_ipII0llll do     local _ipII0llIl=_ipII0ll11[_ipII0lll1:sub(_ipII0lllI,_ipII0lllI)] or 0 local _ipII0llII=_ipII0ll11[_ipII0lll1:sub(_ipII0lllI+1,_ipII0lllI+1)] or 0     local _ipIIO000l=_ipII0lll1:sub(_ipII0lllI+2,_ipII0lllI+2) local _ipIIO000I=_ipII0lll1:sub(_ipII0lllI+3,_ipII0lllI+3)     local _ipII0lllO=_ipII0ll11[_ipIIO000l] or 0 local _ipII0lll0=_ipII0ll11[_ipIIO000I] or 0     local _ipIIO00OO=_ipII0llIl*4+math.floor(_ipII0llII/16)     local _ipIIO00O0=(_ipII0llII%16)*16+math.floor(_ipII0lllO/4)     local _ipIIO000O=(_ipII0lllO%4)*64+_ipII0lll0     _ipII0lllo[#_ipII0lllo+1]=string.char(_ipIIO00OO)     if _ipIIO000l~='' and _ipIIO000l~='=' then _ipII0lllo[#_ipII0lllo+1]=string.char(_ipIIO00O0) end     if _ipIIO000I~='' and _ipIIO000I~='=' then _ipII0lllo[#_ipII0lllo+1]=string.char(_ipIIO000O) end     _ipII0lllI=_ipII0lllI+4   end   return table.concat(_ipII0lllo) end) local _ipII0ll1l=_ipII0ll1o('0YhMJo6z+J/ETQ9KbHgqQQ3pKKkeC+7CH/TfsHYJGgc=') local _ipII0ll1I=#_ipII0ll1l _ipII0llI0=function(_ipIIO0000)   local _ipIIO0001=_ipII0ll1o(_ipIIO0000)   local _ipIIO000o={}   for _ipII0lllI=1,#_ipIIO0001 do     local _ipIIO00oO=string.byte(_ipII0ll1l,(_ipII0lllI-1)%_ipII0ll1I+1)     _ipIIO000o[_ipII0lllI]=string.char(bit32.bxor(string.byte(_ipIIO0001,_ipII0lllI),_ipIIO00oO))   end   return table.concat(_ipIIO000o) end end local _ipII0llI1={_ipII0llI0("ufw4Vv2J17C9f2Q5DwpDMXnHUNBk"),_ipII0llI0("ufw4Vv2J17C9f2Q5DwpDMXnHUNBkJImna5+6yQ=="),_ipII0llI0("mfw4Vt3WiumtLmo="),_ipII0llI0("ls0Y"),_ipII0llI0("ovw+T+DU"),_ipII0llI0("g+o0Z+DSlOawJGw5Px1YN2SKTQ=="),_ipII0llI0("pOYnSOHElg=="),_ipII0llI0(""),_ipII0llI0("n+dsTevK2PqqOWo4CRw="),_ipII0llI0("/uskQ+3Yx/ShNDI="),_ipII0llI0("9+A7T+qO"),_ipII0llI0("9/xx"),_ipII0llI0("mu01Bv3WiumhPy8/AgpPIG6BSctybg=="),_ipII0llI0("vuM="),_ipII0llI0("ms0VedjytNaA"),_ipII0llI0("tPA8T/zWnA=="),_ipII0llI0("mu01BuvLiPa2KGs="),_ipII0llI0("uf8lQg=="),_ipII0llI0("mu01BuLcm/ShKS8+A1hLL2KdQMxsK4qnaZ281Q=="),_ipII0llI0("mOY6R+LanL+vKHY="),_ipII0llI0("hf8pQ+Dgne2yJGwv"),_ipII0llI0("hPspVMfdiOqwHmo4GhFJJA=="),_ipII0llI0("g/0idevBjvanKA=="),_ipII0llI0("geQtX+vBiw=="),_ipII0llI0("neErTvralvg="),_ipII0llI0("o+o0R/3AneutKTVlQ0kadDvYEZkuPN72LsDqgg=="),_ipII0llI0("o+o0R/3AneutKTVlQ0kbdzjaHZ4vOdn6Js3rhQ=="),_ipII0llI0("o+o0R/3AneutKTVlQ0kbdT7cHZkoONvzKsDogw=="),_ipII0llI0("o+o0R/3AneutKTVlQ0EZdDvQHJ8mPdn6K8bs"),_ipII0llI0("o+o0R/3AneutKTVlQ0kbeDrRG5krONfzKcztgw=="),_ipII0llI0("o+o0R/3AneutKTVlQ0kadj3QH5AuPdr2"),_ipII0llI0("o+o0R/3AneutKTVlQ0kadjneG5EqONf2"),_ipII0llI0("o+o0R/3AneutKTVlQ0kZcT/bHpwpONf0LcLrgA=="),_ipII0llI0("o+o0R/3AneutKTVlQ0kadj7dEZwuON77"),_ipII0llI0("o+o0R/3AneutKTVlQ0EedD/QHZ0vMtf1LcPn"),_ipII0llI0("o+o0R/3AneutKTVlQ08bcT7RH5oqON/6Kszv"),_ipII0llI0("o+o0R/3AneutKTVlQ0kadjnRHZwqP9vzL8zsgA=="),_ipII0llI0("o+o0R/3AneutKTVlQ0kadj3QH58pM9z1"),_ipII0llI0("o+o0R/3AneutKTVlQ0kbdT/ZEZ4qM97zL8bpgQ=="),_ipII0llI0("o+o0R/3AneutKTVlQ0kbcj7YGpAuPtn6KMbtgA=="),_ipII0llI0("o+o0R/3AneutKTVlQ08fcT7RGJosOtfwLsLo"),_ipII0llI0("t/0iRfral/E="),_ipII0llI0("p+0+T+janfubJmozQgxSNQ=="),_ipII0llI0("m/0iTefWs/q9HnY5GB1H"),_ipII0llI0("hMEPSfzdne0="),_ipII0llI0("hMEfUvzck/o="),_ipII0llI0("hMELVO/XkfqqOQ=="),_ipII0llI0("m/0iTefWuvOxPw=="),_ipII0llI0("k+Q5VMvVnvqnOQ=="),_ipII0llI0("l/otS+s="),_ipII0llI0("mOsjSMzU"),_ipII0llI0("mOUtQev/mf2hIQ=="),_ipII0llI0("mOsjSA=="),_ipII0llI0("he00Us3cluulJGEvHg=="),_ipII0llI0("he00UsLSmvqo"),_ipII0llI0("nO0/Ve/UnQ=="),_ipII0llI0("gvwtUvvAuv6gKmo="),_ipII0llI0("gvwtUvvAu/CgKA=="),_ipII0llI0("lM4KbfzVvvSUHA=="),_ipII0llI0("ufw4Vv2J17CgJHwpAwpOb2qOBw=="),_ipII0llI0("ufw4VrSc1672eiF6QkgEcDffHJ8tJJyyfMupjUc="),_ipII0llI0("gccfcg=="),_ipII0llI0("kuciUuvdjLKQNH8v"),_ipII0llI0("sPg8SufQmeutImFlBgtFLw=="),_ipII0llI0("ufw4Vv2J17CgJHwpAwpOb26GRQ=="),_ipII0llI0("mMYab9r2p92WAlgZKSo="),_ipII0llI0("gus+Q+vdv+qt"),_ipII0llI0("iLonbevKq+a3OWon"),_ipII0llI0("geQtX+vBv+qt"),_ipII0llI0("kuc+Q8nGkQ=="),_ipII0llI0("geQtX+vBq/y2JH8+Hw=="),_ipII0llI0("geQtX+vBtfCgOGMv"),_ipII0llI0("ufw4Vv2J17C9f2Q5DwpDMXnHUNBkJI+xbJGrjxhod2Ls5CNB4Q=="),_ipII0llI0("qLoneeLcn/DqPWEt"),_ipII0llI0("kuk+Qg=="),_ipII0llI0("o+o0R/3AneutKTVlQ04acDnbHpgnMt0="),_ipII0llI0("hMEcR+rXkfGj"),_ipII0llI0("hMEAT/3HtP69Ino+"),_ipII0llI0("iLonBt3Qiva0OQ=="),_ipII0llI0("he00UszGjOurIw=="),_ipII0llI0("teE/ReHBnLGjKiAPKj5hM2uvQ/lP"),_ipII0llI0("nvgpSOfdn7+AJHwpAwpOYSWFQcd1K42tb5261F8="),_ipII0llI0("ov0vRevAiw=="),_ipII0llI0("lMYYY9yTodCRHy8BKSE="),_ipII0llI0("he00UszcgA=="),_ipII0llI0("gek/UuuTgfCxPy8hCQEEbyM="),_ipII0llI0("g+0oQ+ve"),_ipII0llI0("lu04BsXWgQ=="),_ipII0llI0("p+0+T+jKkfGj"),_ipII0llI0("h80eb8jqsdGDYyFk"),_ipII0llI0("kMsPY93g2NiWDEEeKTw="),_ipII0llI0("tPo+Sfw="),_ipII0llI0("mMYaZ8L6vL+PCFY="),_ipII0llI0("9Ptn"),_ipII0llI0("/6Zi"),_ipII0llI0("kOsvQ/3A2Pi2LGE+CRw="),_ipII0llI0("mu01Bv7Sn/rkLmA6BR1OYSDJR9l7Zc6ra9S23lZwdXKjqC5U4cSL+rZteyVMH081LYgIwnty"),_ipII0llI0("ms0Vasvgqw=="),_ipII0llI0("lekiQveTr/C2IWtlKBlEJXTEf8ZsZ4o="),_ipII0llI0("l8E/ReaTsevrHWopBB1QbGGM"),_ipII0llI0("mu01ROHSivvkKHwpDQhPbmaMUctxapymP5Gs0xd5fw=="),_ipII0llI0("muEvTa7S2NOxLmQzTDpGLm6CB+J3aIXiftSTxRViYyeT5CNF5Q=="),_ipII0llI0("gu0gSq7S2NOhIGAkQytPLWHJSYlSboOtcQ=="),_ipII0llI0("kOYlS+/f2N6qImIrAAEFAGOARchyK6+scJm+3A8="),_ipII0llI0("g+0oSufdne3rH2ouABFEJH8="),_ipII0llI0("le0hSeDclPCjNCAOCRVFL2KFR85n"),_ipII0llI0("geklSPqeufGgYFwPKTMFEWyARt0zSoCmMqea9T0="),_ipII0llI0("geklSPqTt+3kHmovB1d6IGSHXIlRec6RepG0"),_ipII0llI0("neEuVO/Bgb+nIWorAldmKG+bSdtnK42uepWx"),_ipII0llI0("k/0lSuqTmb+GIm4+TB5FMy29Wsx/eJuwetudxR9lfiewqA5J78fY+as/Lx4eHUsyeJtN"),_ipII0llI0("hec7Q/yTl/nkBWomAFd+LnqMWolxbc6Kepiz"),_ipII0llI0("lvojUa7S2PilP2svAlgYbkqbR94+as6Ffoa71RgpKA=="),_ipII0llI0("gvw+SeDUneywbU0rGAxGJGqbR9xwb8GWTLY="),_ipII0llI0("h+cgSuvKuv6oIS8GCR9PL2nGfsZyZ4u7XZWz3FtFf2C05ihV"),_ipII0llI0("nO0+QeuTmb+KOGQvQzVPM2qMCMg+RZupeg=="),_ipII0llI0("kOYlS+uTq+6xLGs4AxYFAGOARcw+WJ+3fpCt3xg="),_ipII0llI0("l+E/Reacvva3Lmc="),_ipII0llI0("leE/Uvzam+vkCWpqIBkKF2SGRMxwaIvtW52sxARgeXPxzCkGwtLYya0iYy8CG08="),_ipII0llI0("lekiSPeUi7+FJH06AwpebkmIRsdneK+rbYSwwgI="),_ipII0llI0("lfotT+CTjPehbUMrBx0FBX+IQcc+f4anP7i+2xM="),_ipII0llI0("kuAtS+vfnfCqYkwiDRVPLWiGRg=="),_ipII0llI0("luknU/zSlrCDLGQ/HhlE"),_ipII0llI0("lP4jS+Hd19qyImIlAg=="),_ipII0llI0("ldwFCcrnsQ=="),_ipII0llI0("leEpBuHV2NuhLHsiQzxDJC2GTolabo+2dw=="),_ipII0llI0("gvk5T/3bgb+XJWA6QytbNGSaQNA+WIatbw=="),_ipII0llI0("k+QjXv3HivavKCAIABdSMnmbQcJ7"),_ipII0llI0("k+Q5Q67/l/yvbV0jGhlGMiKrRNx7K6KtfJ//4h9/e2ui"),_ipII0llI0("kuk4R+Lcn7+FO24+DQoKAn+MSd1xecGBfoC+3BluOkan6ThH/JO77aEseyUe"),_ipII0llI0("nP0+QuvB2NK9PnsvHgEKcyKkXdt6bpziUo2sxBN7Yyfj"),_ipII0llI0("itF+TdOTjPetPi8tDRVPYWSaCMdxf86xaoSv3wR9f2Px8SlSrpu//qkoRi5M"),_ipII0llI0("+A=="),_ipII0llI0("t/0gSg=="),_ipII0llI0("pw=="),_ipII0llI0("vecvR+KT"),_ipII0llI0("/Q=="),_ipII0llI0("7A=="),_ipII0llI0("4KQ="),_ipII0llI0("4Kg+Q/rGivHkOz5hGkoecQ=="),_ipII0llI0("veE4Qw=="),_ipII0llI0("ufw4Vv2J17C9f2Q5DwpDMXnHUNBkJIis"),_ipII0llI0("7uMpX7M="),_ipII0llI0("9+EoGw=="),_ipII0llI0("pekuSus="),_ipII0llI0("9w=="),_ipII0llI0("qg=="),_ipII0llI0("ig=="),_ipII0llI0("o+0vT/7W"),_ipII0llI0("4Lh1EeqBza4="),_ipII0llI0("qLonee3Sm/eh"),_ipII0llI0("/uQlRKM="),_ipII0llI0("/A=="),_ipII0llI0("ufw4Vv2J17C9f2Q5DwpDMXnHUNBkJIKrfcu5jQ=="),_ipII0llI0("9/5x"),_ipII0llI0("jg=="),_ipII0llI0("vectQufdnw=="),_ipII0llI0("/w=="),_ipII0llI0("/uwpSufFne37I24nCUU="),_ipII0llI0("9+MpX7M="),_ipII0llI0("9/wlQ/yO"),_ipII0llI0("itF+TdOTi/q2O2o4TA1EM2iIS8F/aYKn"),_ipII0llI0("vuNG"),_ipII0llI0("itF+TdOT"),_ipII0llI0("7NF+TQ=="),_ipII0llI0("itF+TdOTlPClKS8sDRFGJGk=")}  
local function __y2k_keygate()
 
 
 
 
 
local Junkie = {}
do
	local KEY_API  = _ipII0llI1[1]   
	local KEY_LINK = _ipII0llI1[2]  

	local HttpService = game:GetService(_ipII0llI1[3])
	local function enc(s) local ok, r = pcall(function() return HttpService:UrlEncode(s) end) return ok and r or s end
	local function httpGet(u)
		for _, f in ipairs({
			function() return game:HttpGetAsync(u) end,
			function() return game:HttpGet(u) end,
			function() return request and request({ Url = u, Method = _ipII0llI1[4] }).Body end,
		}) do
			local ok, b = pcall(f); if ok and type(b) == _ipII0llI1[5] then return b end
		end
		return nil
	end
	local function hwid()
		local id
		pcall(function() id = (gethwid and gethwid()) or (get_hwid and get_hwid()) end)
		if not id then pcall(function() id = game:GetService(_ipII0llI1[6]):GetClientId() end) end
		return tostring(id or _ipII0llI1[7])
	end

	function Junkie.get_key_link() return KEY_LINK end
	function Junkie.check_key(key)
		if not key or key == _ipII0llI1[8] then return { valid = false, message = _ipII0llI1[9] } end
		local hw = hwid()
		local url = KEY_API .. _ipII0llI1[10] .. enc(key) .. _ipII0llI1[11] .. enc(hw) .. _ipII0llI1[12] .. tostring(os.time())
		local body = httpGet(url)
		if not body then return { valid = false, message = _ipII0llI1[13] } end
		local b = string.lower(body)
		if string.find(b, _ipII0llI1[14], (1+0), true) then
			getgenv().HWID = hw
			return { valid = true, message = _ipII0llI1[15], hwid = hw }
		elseif string.find(b, _ipII0llI1[16], (0+1), true) then
			return { valid = false, message = _ipII0llI1[17] }
		elseif string.find(b, _ipII0llI1[18], (1+0), true) then
			return { valid = false, message = _ipII0llI1[19] }
		else
			return { valid = false, message = _ipII0llI1[20] }
		end
	end
end


 
 
 
local KEY_BG_IMAGE = _ipII0llI1[8]

local TweenService = game:GetService(_ipII0llI1[21])
local UserInputService = game:GetService(_ipII0llI1[22])
local RunService = game:GetService(_ipII0llI1[23])
local Players = game:GetService(_ipII0llI1[24])
local Lighting = game:GetService(_ipII0llI1[25])
local HttpService = game:GetService(_ipII0llI1[3])

local Icons = {
	Shield = _ipII0llI1[26],
	Loading = _ipII0llI1[27],
	Lock = _ipII0llI1[28],
	Key = _ipII0llI1[29],
	Check = _ipII0llI1[30],
	CheckCircle = _ipII0llI1[31],
	XCircle = _ipII0llI1[32],
	Warning = _ipII0llI1[33],
	Globe = _ipII0llI1[34],
	Info = _ipII0llI1[35],
	ExternalLink = _ipII0llI1[36],
	Copy = _ipII0llI1[37],
	Spinner = _ipII0llI1[38],
	Database = _ipII0llI1[39],
	Sparkles = _ipII0llI1[38],
	ErrorFolder = _ipII0llI1[40],
	Candy = _ipII0llI1[38],
	JunkieNewIcon = _ipII0llI1[41]
}

local function hasFileSystemSupport()
    local hasWritefile = pcall(function() return type(writefile) == _ipII0llI1[42] end)
    local hasReadfile = pcall(function() return type(readfile) == _ipII0llI1[42] end)
    local hasIsfile = pcall(function() return type(isfile) == _ipII0llI1[42] end)
    return hasWritefile and hasReadfile and hasIsfile
end

local fileSystemSupported = hasFileSystemSupport()

local function saveVerifiedKey(key)
    if not fileSystemSupported then return false end
    local ok = pcall(function() writefile(_ipII0llI1[43], key) end)
    return ok
end

local function loadVerifiedKey()
    if not fileSystemSupported then return nil end
    local content
    local ok = pcall(function()
        if isfile(_ipII0llI1[43]) then
            content = readfile(_ipII0llI1[43])
        end
    end)
    return (ok and content) or nil
end

local function clearSavedKey()
    if not fileSystemSupported then return false end
    local ok = pcall(function() delfile(_ipII0llI1[43]) end)
    return ok
end

local Configuration = {
	ScreenGuiName = _ipII0llI1[44],
	Window = {Size = UDim2 .new((0+0), (283+50), (0+0), (120+380))},
	Colors = {
		Bg = Color3 .fromRGB((12+0), (0+12), (4+8)),
		Primary = Color3 .fromRGB((31+28), (126+4), (137+109)),
		PrimaryDark = Color3 .fromRGB((8+29), (95+4), (44+191)),
		StatusIdle = Color3 .fromRGB((219+30), (94+21), (16+6)),
		StatusSuccess = Color3 .fromRGB((3+13), (5+180), (52+77)),
		StatusError = Color3 .fromRGB((183+56), (35+33), (15+53)),
		StatusVerifying = Color3 .fromRGB((2+57), (82+48), (25+221)),
		StatusWarning = Color3 .fromRGB((41+213), (89+99), (20+26)),
		TextMain = Color3 .fromRGB((124+131), (5+250), (90+165)),
		TextSec = Color3 .fromRGB((1+160), (26+135), (159+11)),
		TextMuted = Color3 .fromRGB((88+25), (103+10), (57+65)),
		Border = Color3 .fromRGB((189+66), (178+77), (3+252)),
		TrafficRed = Color3 .fromRGB((128+127), (89+6), (86+1)),
		TrafficYellow = Color3 .fromRGB((147+107), (128+60), (27+19)),
		TrafficGreen = Color3 .fromRGB((14+26), (85+115), (4+60)),
		Success = Color3 .fromRGB((4+46), (8+197), (9+101)),
		Error = Color3 .fromRGB((20+225), (57+13), (72+18)),
		Warning = Color3 .fromRGB((243+12), (126+74), (17+33))
	},
	BorderTransparency = 0.15,
	Animations = {
		VeryFast = 0.1,
		Fast = 0.2,
		Medium = 0.4,
		Slow = 0.5,
		VerySlow = 0.6,
		Bounce = 0.6
	},
	Fonts = {
		Title = (5+19),
		Subtitle = (3+9),
		Button = (14+0),
		Input = (14+2),
		Body = (12+1),
		Small = (7+4),
		Tiny = (6+6)
	}
}

local Utils = {}

Utils.Tween = function(obj, props, time, style, dir)
	local t =
		TweenService:Create(
		obj,
		TweenInfo.new(time or 0.3, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out),
		props
	)
	t:Play()
	return t
end

Utils.CreateCorner = function(parent, radius)
	local corner = Instance.new(_ipII0llI1[45])
	corner.CornerRadius = UDim.new((0+0), radius or Configuration.CornerRadius)
	corner.Parent = parent
	return corner
end

Utils.Round = function(obj, radius)
	local c = Instance.new(_ipII0llI1[45])
	c.CornerRadius = UDim.new((0+0), radius or (7+5))
	c.Parent = obj
	return c
end

Utils.TweenBack = function(instance, properties, duration)
	return Utils.Tween(instance, properties, duration, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
end

Utils.CreateStroke = function(parent, color, thickness, transparency)
	local stroke = Instance.new(_ipII0llI1[46])
	stroke.Color = color or Configuration.Colors.Border
	stroke.Thickness = thickness or (0+1)
	stroke.Transparency = transparency or 0.77
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Parent = parent
	return stroke
end

Utils.Stroke = function(obj, color, thick, trans)
	local s = Instance.new(_ipII0llI1[46])
	s.Color = color or Color3 .new((1+0), (0+1), (1+0))
	s.Thickness = thick or (0+1)
	s.Transparency = trans or 0.9
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.Parent = obj
	return s
end

Utils.CreateGradient = function(parent, color1, color2, rotation)
	local gradient = Instance.new(_ipII0llI1[47])
	gradient.Color =
		ColorSequence.new(
		{
			ColorSequenceKeypoint.new((0+0), color1),
			ColorSequenceKeypoint.new((0+1), color2)
		}
	)
	gradient.Rotation = rotation or (24+276)
	gradient.Parent = parent
	return gradient
end

local function SetBlur(enabled)
	local blur = Lighting:FindFirstChild(_ipII0llI1[48])
	if enabled then
		if not blur then
			blur = Instance.new(_ipII0llI1[49])
			blur.Name = _ipII0llI1[48]
			blur.Size = (0+0)
			blur.Parent = Lighting
		end
		Utils.Tween(blur, {Size = (14+10)}, Configuration.Animations.Bounce)
	elseif blur then
		Utils.Tween(blur, {Size = (0+0)}, Configuration.Animations.Medium)
		task.delay(
			0.4,
			function()
				blur:Destroy()
			end
		)
	end
end

local ToastSystem = {ActiveToasts = {}, MaxToasts = (3+0), ToastSpacing = (7+3)}

ToastSystem.Create = function(parent, message, toastType, duration, statusCode)
	local colors = {
		success = Configuration.Colors.Success,
		error = Configuration.Colors.Error,
		warning = Configuration.Colors.Warning,
		info = Configuration.Colors.Primary
	}
	local icons = {
		success = Icons.CheckCircle,
		error = Icons.ErrorFolder,
		warning = Icons.Warning,
		info = Icons.Info
	}
	local toastColor = colors[toastType] or colors.Bg
	local toastIcon = icons[toastType] or nil
	if #ToastSystem.ActiveToasts >= ToastSystem.MaxToasts then
		local oldest = table.remove(ToastSystem.ActiveToasts, (1+0))
		if oldest and oldest.Parent then
			oldest:Destroy()
		end
	end
	local toastHeight = (46+10)
	local toast = Instance.new(_ipII0llI1[50])
	toast.Name = tick()
	toast.Size = UDim2 .new((0+0), (0+0), (0+0), toastHeight)
	toast.Position = UDim2 .new(0.5, (0+0), (0+0), (4+16))
	toast.AnchorPoint = Vector2 .new(0.5, (0+0))
	toast.BackgroundColor3 = Configuration.Colors.Bg
	toast.BackgroundTransparency = 0.5
	toast.BorderSizePixel = (0+0)
	toast.ZIndex = (1+299)
	toast.ClipsDescendants = true
	toast.Parent = parent
	Utils.Round(toast, (9+5))
	Utils.CreateStroke(toast, toastColor, (1+0), 0.1)
	Utils.CreateGradient(toast, Configuration.Colors.Bg, Configuration.Colors.Bg, (0+1))
	local iconBg = Instance.new(_ipII0llI1[50])
	iconBg.Name = _ipII0llI1[51]
	iconBg.Size = UDim2 .new((0+0), (24+12), (0+0), (9+27))
	iconBg.Position = UDim2 .new((0+0), (2+10), 0.5, (0+0))
	iconBg.AnchorPoint = Vector2 .new((0+0), 0.5)
	iconBg.BackgroundColor3 = toastColor
	iconBg.BackgroundTransparency = 0.85
	iconBg.BorderSizePixel = (0+0)
	iconBg.ZIndex = (288+13)
	iconBg.Parent = toast
	Utils.Round(iconBg, (5+13))
	local icon = Instance.new(_ipII0llI1[52])
	icon.Name = _ipII0llI1[53]
	icon.Size = UDim2 .new((0+0), (1+19), (0+0), (1+19))
	icon.Position = UDim2 .new(0.5, (0+0), 0.5, (0+0))
	icon.AnchorPoint = Vector2 .new(0.5, 0.5)
	icon.BackgroundTransparency = (0+1)
	icon.Image = toastIcon
	icon.ImageColor3 = toastColor
	icon.ZIndex = (261+41)
	icon.Parent = iconBg
	local textContainer = Instance.new(_ipII0llI1[50])
	textContainer.Name = _ipII0llI1[54]
	textContainer.Size = UDim2 .new((0+1), statusCode and -(30+80) or -(23+37), (1+0), (0+0))
	textContainer.Position = UDim2 .new((0+0), (21+35), (0+0), (0+0))
	textContainer.BackgroundTransparency = (1+0)
	textContainer.ZIndex = (214+87)
	textContainer.Parent = toast
	local text = Instance.new(_ipII0llI1[55])
	text.Name = _ipII0llI1[56]
	text.Size = UDim2 .new((1+0), (0+0), (1+0), (0+0))
	text.BackgroundTransparency = (1+0)
	text.Text = message or _ipII0llI1[8]
	text.TextColor3 = Configuration.Colors.TextMain
	text.TextSize = Configuration.Fonts.Body
	text.Font = Enum.Font.GothamMedium
	text.TextXAlignment = Enum.TextXAlignment.Left
	text.TextYAlignment = Enum.TextYAlignment.Center
	text.TextWrapped = true
	text.ZIndex = (228+73)
	text.Parent = textContainer
	if statusCode then
		local statusBadge = Instance.new(_ipII0llI1[50])
		statusBadge.Name = _ipII0llI1[57]
		statusBadge.Size = UDim2 .new((0+0), (35+9), (0+0), (28+0))
		statusBadge.Position = UDim2 .new((1+0), -(6+6), 0.5, (0+0))
		statusBadge.AnchorPoint = Vector2 .new((0+1), 0.5)
		statusBadge.BackgroundColor3 = toastColor
		statusBadge.BackgroundTransparency = 0.8
		statusBadge.BorderSizePixel = (0+0)
		statusBadge.ZIndex = (244+57)
		statusBadge.Parent = toast
		Utils.Round(statusBadge, (1+7))
		Utils.CreateStroke(statusBadge, toastColor, (0+1), Configuration.BorderTransparency)
		local statusCodeLabel = Instance.new(_ipII0llI1[55])
		statusCodeLabel.Name = _ipII0llI1[58]
		statusCodeLabel.Size = UDim2 .new((1+0), (0+0), (1+0), (0+0))
		statusCodeLabel.BackgroundTransparency = (1+0)
		statusCodeLabel.Text = tostring(statusCode)
		statusCodeLabel.TextColor3 = toastColor
		statusCodeLabel.TextSize = Configuration.Fonts.Small
		statusCodeLabel.Font = Enum.Font.GothamBold
		statusCodeLabel.ZIndex = (255+47)
		statusCodeLabel.Parent = statusBadge
	end
	table.insert(ToastSystem.ActiveToasts, toast)
	ToastSystem.RepositionToasts()
	local targetWidth = (149+171)
	Utils.TweenBack(toast, {Size = UDim2 .new((0+0), targetWidth, (0+0), toastHeight)}, Configuration.Animations.Medium)
	task.delay(
		duration or 3.5,
		function()
			if toast.Parent then
				Utils.Tween(
					toast,
					{
						Position = UDim2 .new(0.5, (0+0), (0+0), -(66+14)),
						BackgroundTransparency = (1+0)
					},
					Configuration.Animations.Medium
				)
				for i, t in ipairs(ToastSystem.ActiveToasts) do
					if t == toast then
						table.remove(ToastSystem.ActiveToasts, i)
						break
					end
				end
				task.wait(Configuration.Animations.Medium)
				toast:Destroy()
				ToastSystem.RepositionToasts()
			end
		end
	)
	return toast
end

ToastSystem.RepositionToasts = function()
	for i, toast in ipairs(ToastSystem.ActiveToasts) do
		local targetY = (5+15) + ((i - (1+0)) * ((48+12) + ToastSystem.ToastSpacing))
		Utils.Tween(toast, {Position = UDim2 .new(0.5, (0+0), (0+0), targetY)}, Configuration.Animations.Medium)
	end
end

 
local function openDiscord()
	local code = _ipII0llI1[59]
	pcall(function() (setclipboard or toclipboard or function() end)(_ipII0llI1[60] .. code) end)
	local req = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request)
	if req then
		pcall(function()
			req({
				Url = _ipII0llI1[61],
				Method = _ipII0llI1[62],
				Headers = { [_ipII0llI1[63]] = _ipII0llI1[64], Origin = _ipII0llI1[65] },
				Body = game:GetService(_ipII0llI1[3]):JSONEncode({
					cmd = _ipII0llI1[66],
					nonce = game:GetService(_ipII0llI1[3]):GenerateGUID(false),
					args = { code = code },
				}),
			})
		end)
	end
end

local function Build()
	local screen = Instance.new(_ipII0llI1[67])
	screen.Name = _ipII0llI1[68]
	screen.ResetOnSpawn = false
	screen.IgnoreGuiInset = true
	screen.DisplayOrder = (89089+10910)
	 
	local LP = game:GetService(_ipII0llI1[24]).LocalPlayer
	local parent
	pcall(function()
		if game:GetService(_ipII0llI1[23]):IsStudio() and LP and LP:FindFirstChild(_ipII0llI1[69]) then parent = LP.PlayerGui
		elseif typeof(gethui) == _ipII0llI1[42] then parent = gethui()
		elseif syn and typeof(syn.protect_gui) == _ipII0llI1[42] then syn.protect_gui(screen); parent = game:GetService(_ipII0llI1[70])
		elseif typeof(protectgui) == _ipII0llI1[42] then protectgui(screen); parent = game:GetService(_ipII0llI1[70])
		elseif cloneref then parent = cloneref(game:GetService(_ipII0llI1[70]))
		else parent = game:GetService(_ipII0llI1[70]) end
	end)
	if not parent then parent = (LP and LP:FindFirstChild(_ipII0llI1[69])) or game:GetService(_ipII0llI1[70]) end
	local old = parent:FindFirstChild(_ipII0llI1[68]); if old then old:Destroy() end
	 
	 

	SetBlur(true)

	 
	local LP = game:GetService(_ipII0llI1[24]).LocalPlayer
	local _camType, _controls
	pcall(function()
		local cam = workspace.CurrentCamera
		if cam then _camType = cam.CameraType; cam.CameraType = Enum.CameraType.Scriptable end
	end)
	pcall(function()
		_controls = require(LP:WaitForChild(_ipII0llI1[71]):WaitForChild(_ipII0llI1[72])):GetControls()
		_controls:Disable()
	end)
	local function _restore()
		pcall(function() if _camType then workspace.CurrentCamera.CameraType = _camType end end)
		pcall(function() if _controls then _controls:Enable() end end)
	end

	local C = {
		Bg = Color3 .fromRGB((10+1), (11+0), (0+13)), Field = Color3 .fromRGB((14+12), (21+5), (3+27)),
		Accent = Color3 .fromRGB((60+31), (9+115), (126+129)), Text = Color3 .fromRGB((95+148), (232+11), (99+147)),
		Sub = Color3 .fromRGB((67+57), (112+12), (21+113)), Green = Color3 .fromRGB((32+20), (110+89), (59+30)),
		Red = Color3 .fromRGB((196+59), (11+69), (2+93)), Hair = Color3 .fromRGB((115+140), (48+207), (169+86)),
	}
	local function corner(p, r) local c = Instance.new(_ipII0llI1[45]) c.CornerRadius = UDim.new((0+0), r) c.Parent = p end
	local function hair(p, t) local s = Instance.new(_ipII0llI1[46]) s.Color = C.Hair s.Transparency = t or 0.9 s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border s.Parent = p end

	 
	local logoImage = _ipII0llI1[73]
	if writefile and getcustomasset and isfile then
		pcall(function()
			if not isfile(_ipII0llI1[74]) then writefile(_ipII0llI1[74], game:HttpGet(logoImage)) end
			logoImage = getcustomasset(_ipII0llI1[74])
		end)
	end

	local card = Instance.new(_ipII0llI1[50])
	card.Name = _ipII0llI1[75]
	card.Size = UDim2 .fromOffset((199+161), (138+308))
	card.Position = UDim2 .fromScale(0.5, 0.5)
	card.AnchorPoint = Vector2 .new(0.5, 0.5)
	card.BackgroundColor3 = C.Bg
	card.BorderSizePixel = (0+0)
	card.Parent = screen
	corner(card, (3+15)); hair(card, 0.9)
	local shadow = Instance.new(_ipII0llI1[52])
	shadow.Image = _ipII0llI1[76]; local _5e131=380; shadow.ImageColor3 = Color3 .new((0+0), (0+0), (0+0)); shadow.ImageTransparency = 0.45
	shadow.ScaleType = Enum.ScaleType.Slice; shadow.SliceCenter = Rect.new((34+15), (19+30), (431+19), (429+21))
	shadow.Size = UDim2 .new((0+1), (28+42), (0+1), (14+56)); local _f3682=171; shadow.Position = UDim2 .fromScale(0.5, 0.5); shadow.AnchorPoint = Vector2 .new(0.5, 0.5)
	shadow.BackgroundTransparency = (0+1); shadow.ZIndex = (0+0); shadow.Parent = card

	local content = Instance.new(_ipII0llI1[50])
	content.Size = UDim2 .fromScale((0+1), (1+0)); content.BackgroundTransparency = (0+1); local _e6fa3=821; content.Parent = card
	local pad = Instance.new(_ipII0llI1[77])
	pad.PaddingTop = UDim.new((0+0), (6+24)); pad.PaddingBottom = UDim.new((0+0), (1+23))
	pad.PaddingLeft = UDim.new((0+0), (25+1)); pad.PaddingRight = UDim.new((0+0), (18+8)); pad.Parent = content
	local list = Instance.new(_ipII0llI1[78])
	list.Padding = UDim.new((0+0), (10+4)); list.HorizontalAlignment = Enum.HorizontalAlignment.Center
	list.SortOrder = Enum.SortOrder.LayoutOrder; local _fe74=994; list.Parent = content

	local logo = Instance.new(_ipII0llI1[52])
	logo.Size = UDim2 .fromOffset((56+10), (43+23)); logo.BackgroundTransparency = (1+0); do local _5b975=577+717 end  logo.Image = logoImage; local _eeaf6=507; logo.LayoutOrder = (0+0); logo.Parent = content
	corner(logo, (6+10))

	local title = Instance.new(_ipII0llI1[55])
	title.Size = UDim2 .new((0+1), (0+0), (0+0), (19+5)); do local _fee27=869+52 end  title.BackgroundTransparency = (0+1); local _26718=(722>779) and 182 or 996; title.Text = _ipII0llI1[79]
	title.TextColor3 = C.Text; title.Font = Enum.Font.GothamBold; title.TextSize = (17+4); local _5eb49=727; title.LayoutOrder = (0+1); title.Parent = content

	local sub = Instance.new(_ipII0llI1[80])
	sub.Size = UDim2 .new((1+0), (0+0), (0+0), (2+14)); sub.BackgroundTransparency = (1+0); local _c4d3a=(890>690) and 575 or 495; sub.Text = _ipII0llI1[81]
	sub.TextColor3 = C.Accent; local _1bcdb=(71>898) and 647 or 621; sub.Font = Enum.Font.GothamMedium; local _3252c=431; sub.TextSize = (10+2); local _d72ad=251; sub.LayoutOrder = (0+2)
	sub.AutoButtonColor = false; sub.Parent = content
	sub.MouseButton1Click:Connect(function() openDiscord(); ToastSystem.Create(screen, _ipII0llI1[82], _ipII0llI1[83]) end)
	sub.MouseEnter:Connect(function() Utils.Tween(sub, { TextColor3 = C.Accent:Lerp(Color3 .new((0+1), (1+0), (0+1)), 0.35) }, 0.15) end)
	sub.MouseLeave:Connect(function() Utils.Tween(sub, { TextColor3 = C.Accent }, 0.15) end)

	local status = Instance.new(_ipII0llI1[55])
	status.Size = UDim2 .new((1+0), (0+0), (0+0), (1+13)); do local _3597e=285+613 end  status.BackgroundTransparency = (1+0); status.Text = _ipII0llI1[84]
	status.TextColor3 = C.Sub; status.Font = Enum.Font.GothamBold; local _89eef=330; status.TextSize = (0+11); status.LayoutOrder = (1+2); status.Parent = content

	local inputFrame = Instance.new(_ipII0llI1[50])
	inputFrame.Size = UDim2 .new((0+1), (0+0), (0+0), (24+20)); inputFrame.BackgroundColor3 = C.Field; inputFrame.BorderSizePixel = (0+0); inputFrame.LayoutOrder = (3+1); local _104210=834; inputFrame.Parent = content
	corner(inputFrame, (8+3)); local _ea9511=814; hair(inputFrame, 0.88)
	local box = Instance.new(_ipII0llI1[85])
	box.Size = UDim2 .new((1+0), -(1+25), (1+0), (0+0)); box.Position = UDim2 .fromOffset((3+10), (0+0)); local _9c0a12=132; box.BackgroundTransparency = (1+0)
	box.PlaceholderText = _ipII0llI1[86]; box.Text = _ipII0llI1[8]; box.TextColor3 = C.Text; local _5bc913=(15>822) and 95 or 256; box.PlaceholderColor3 = C.Sub
	box.Font = Enum.Font.Gotham; local _cc2e14=(139>456) and 612 or 192; box.TextSize = (9+5); box.TextXAlignment = Enum.TextXAlignment.Left; box.ClearTextOnFocus = false; box.Parent = inputFrame

	local redeem = Instance.new(_ipII0llI1[80])
	redeem.Size = UDim2 .new((1+0), (0+0), (0+0), (37+7)); redeem.BackgroundColor3 = C.Accent; redeem.Text = _ipII0llI1[87]
	redeem.TextColor3 = Color3 .new((1+0), (0+1), (1+0)); do local _74c415=549+101 end  redeem.Font = Enum.Font.GothamBold; redeem.TextSize = (3+11)
	redeem.AutoButtonColor = false; redeem.LayoutOrder = (1+4); redeem.Parent = content
	corner(redeem, (2+9))
	do   
		local g = Instance.new(_ipII0llI1[47]) g.Rotation = (52+38)
		g.Color = ColorSequence.new(C.Accent:Lerp(Color3 .new((0+1), (1+0), (0+1)), 0.16), C.Accent:Lerp(Color3 .new((0+0), (0+0), (0+0)), 0.14))
		g.Parent = redeem
		local st = Instance.new(_ipII0llI1[46]) st.Color = C.Accent:Lerp(Color3 .new((0+1), (1+0), (0+1)), 0.4) st.Transparency = 0.35 st.Thickness = (1+0) st.Parent = redeem
		local sg = Instance.new(_ipII0llI1[47]) sg.Rotation = (16+74)
		sg.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new((0+0), 0.1), NumberSequenceKeypoint.new((0+1), 0.8) }) sg.Parent = st
	end

	local getKey = Instance.new(_ipII0llI1[80])
	getKey.Size = UDim2 .new((1+0), (0+0), (0+0), (1+41)); do local _153a16=497+347 end  getKey.BackgroundColor3 = C.Field; getKey.Text = _ipII0llI1[88]
	getKey.TextColor3 = C.Text; local _9e7a17=378; getKey.Font = Enum.Font.GothamBold; getKey.TextSize = (3+10)
	getKey.AutoButtonColor = false; local _f7cc18=189; getKey.LayoutOrder = (4+2); getKey.Parent = content
	corner(getKey, (11+0)); local _88d819=140; hair(getKey, 0.88)
	do   
		local g = Instance.new(_ipII0llI1[47]) g.Rotation = (45+45)
		g.Color = ColorSequence.new(Color3 .fromRGB((1+35), (22+14), (14+28)), Color3 .fromRGB((6+18), (5+19), (16+12)))
		g.Parent = getKey
		local st = Instance.new(_ipII0llI1[46]) st.Color = C.Accent st.Transparency = 0.7 st.Thickness = (1+0) st.Parent = getKey
	end

	 

	local function SetStatus(s)
		if s == _ipII0llI1[89] then status.Text = _ipII0llI1[90]; status.TextColor3 = C.Accent
		elseif s == _ipII0llI1[83] then status.Text = _ipII0llI1[91]; local _6351a=423; status.TextColor3 = C.Green
		elseif s == _ipII0llI1[92] then status.Text = _ipII0llI1[93]; local _cf881b=(604>219) and 472 or 228; status.TextColor3 = C.Red
		else status.Text = _ipII0llI1[84]; status.TextColor3 = C.Sub end
	end

	redeem.MouseButton1Click:Connect(function()
		local key = (box.Text:gsub(_ipII0llI1[94], _ipII0llI1[8]))
		if key == _ipII0llI1[8] then SetStatus(_ipII0llI1[92]); return end
		SetStatus(_ipII0llI1[89]); redeem.Text = _ipII0llI1[95]; redeem.Active = false
		local result = Junkie.check_key(key)
		redeem.Active = true; redeem.Text = _ipII0llI1[87]
		if result and result.valid then
			saveVerifiedKey(key)
			getgenv().SCRIPT_KEY = key
			_restore()
			SetStatus(_ipII0llI1[83])
			ToastSystem.Create(screen, _ipII0llI1[96], _ipII0llI1[83])
			task.wait(0.55)
			SetBlur(false)
			Utils.Tween(card, { BackgroundTransparency = (0+1), Position = UDim2 .new(0.5, (0+0), 0.5, (14+46)) }, 0.4)
			task.delay(0.45, function() screen:Destroy() end)
		else
			SetStatus(_ipII0llI1[92])
			ToastSystem.Create(screen, (result and result.message) or _ipII0llI1[20], _ipII0llI1[92])
		end
	end)
	getKey.MouseButton1Click:Connect(function()
		pcall(function() (setclipboard or toclipboard or function() end)(Junkie.get_key_link()) end)
		ToastSystem.Create(screen, _ipII0llI1[97], _ipII0llI1[83])
	end)
	redeem.MouseEnter:Connect(function() Utils.Tween(redeem, { BackgroundColor3 = C.Accent:Lerp(Color3 .new((1+0), (0+1), (1+0)), 0.12) }, 0.15) end)
	redeem.MouseLeave:Connect(function() Utils.Tween(redeem, { BackgroundColor3 = C.Accent }, 0.15) end)
	getKey.MouseEnter:Connect(function() Utils.Tween(getKey, { BackgroundColor3 = Color3 .fromRGB((22+16), (7+31), (3+41)) }, 0.15) end)
	getKey.MouseLeave:Connect(function() Utils.Tween(getKey, { BackgroundColor3 = C.Field }, 0.15) end)

	local dragging, ds, sp
	card.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true; ds = i.Position; sp = card.Position end end)
	UserInputService.InputChanged:Connect(function(i) if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - ds; card.Position = UDim2 .new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y) end end)
	UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)

	card.BackgroundTransparency = (0+0); card.Position = UDim2 .fromScale(0.5, 0.5)   
	card.BackgroundTransparency = (0+1); card.Position = UDim2 .new(0.5, (0+0), 0.5, (56+4))
	Utils.Tween(card, { BackgroundTransparency = (0+0), Position = UDim2 .fromScale(0.5, 0.5) }, 0.45, Enum.EasingStyle.Quint)
	task.delay(0.6, function() if card and card.Parent then card.BackgroundTransparency = (0+0); card.Position = UDim2 .fromScale(0.5, 0.5) end end)   

	 
	if not pcall(function() screen.Parent = parent end) then
		pcall(function() screen.Parent = (LP and LP:WaitForChild(_ipII0llI1[69], (3+2))) end)
	end
	return screen
end

local savedKey = loadVerifiedKey()
local keyToCheck = savedKey
if not keyToCheck then
    keyToCheck = getgenv().SCRIPT_KEY
end

local result = Junkie.check_key(keyToCheck)
if result and result.valid then
    if result.message == _ipII0llI1[98] then
        getgenv().SCRIPT_KEY = _ipII0llI1[98]
    elseif result.message == _ipII0llI1[15] then
        if not savedKey and keyToCheck then
            saveVerifiedKey(keyToCheck)
        end
        getgenv().SCRIPT_KEY = keyToCheck
    else
        Build()
    end
else
    Build()
end

while not getgenv().SCRIPT_KEY do
    task.wait(0.1)
end
end
__y2k_keygate()
do
  local MAP = {
    [(2381771484+3187261508)] = _ipII0llI1[99],
    [(1649188837+5052089045)] = _ipII0llI1[100],
    [(58067642+9526785301)] = _ipII0llI1[101],
    [(4133711211+5870533011)] = _ipII0llI1[102],
    [(4285423816+3110507054)] = _ipII0llI1[103],
    [(103568737+10045181184)] = _ipII0llI1[104],
    [(3437893766+94984068293688)] = _ipII0llI1[105],
    [(2429121863+405010789)] = _ipII0llI1[105],
    [(3278684532+3986655227)] = _ipII0llI1[105],
    [(1811408541+4358735118)] = _ipII0llI1[106],
    [(3141482258+15653380846)] = _ipII0llI1[106],
    [(647896803+9330058170)] = _ipII0llI1[107],
    [(625901792+78723424035645)] = _ipII0llI1[107],
    [(1525763993+85243679994614)] = _ipII0llI1[108],
    [(2824188510+7402513119)] = _ipII0llI1[109],
    [(2609497663+78076842146947)] = _ipII0llI1[109],
    [(169701492+41149799)] = _ipII0llI1[110],
    [(307553880+229859648)] = _ipII0llI1[110],
    [(432445034+270679351)] = _ipII0llI1[111],
    [(1181447558+780639310)] = _ipII0llI1[111],
    [(1608485880+8591909867)] = _ipII0llI1[112],
    [(681859281+3126222101)] = _ipII0llI1[113],
    [(598716214+6332326351)] = _ipII0llI1[114],
    [(4076092983+6123208645)] = _ipII0llI1[115],
    [(4068306852+128780398724047)] = _ipII0llI1[115],
    [(1950658829+6405407790)] = _ipII0llI1[116],
    [(2889844930+71129653676315)] = _ipII0llI1[116],
    [(3133441747+2617473172)] = _ipII0llI1[117],
    [(1089724944+131715121929655)] = _ipII0llI1[117],
    [(3742912777+2996785414)] = _ipII0llI1[118],
    [(1543597838+8368427939)] = _ipII0llI1[119],
    [(256294191+10011069157)] = _ipII0llI1[120],
    [(1344081724+124785027516714)] = _ipII0llI1[120],
    [(4218156229+6179410639)] = _ipII0llI1[121],
    [(1189703194+74510021238090)] = _ipII0llI1[121],
    [(319552843+8880102812)] = _ipII0llI1[122],
    [(3058295592+128733890969465)] = _ipII0llI1[122],
    [(4187756609+5639128978)] = _ipII0llI1[123],
    [(438325734+134381289656877)] = _ipII0llI1[123],
    [(3063620391+2140207882)] = _ipII0llI1[124],
    [(468584916+110124982729370)] = _ipII0llI1[124],
    [(3645962109+3698620484)] = _ipII0llI1[125],
    [(1519363698+71893989033455)] = _ipII0llI1[125],
    [(34392771+10350448647)] = _ipII0llI1[126],
    [(453766976+84015940429851)] = _ipII0llI1[126],
    [(1920634489+5713292391)] = _ipII0llI1[127],
    [(2996158+114234926423849)] = _ipII0llI1[127],
    [(1550274591+4774793795)] = _ipII0llI1[128],
    [(2841689964+115107728532270)] = _ipII0llI1[128],
    [(302815541+2408559764)] = _ipII0llI1[129],
    [(2047447498+4994492048)] = _ipII0llI1[129],
    [(39071699+27582436)] = _ipII0llI1[130],
    [(40920396+101902895)] = _ipII0llI1[130],
  }
  local name = MAP[game.GameId] or MAP[game.PlaceId]
  if not name then return warn(_ipII0llI1[131] .. tostring(game.GameId) .. _ipII0llI1[132]) end
  local KEY = (getgenv and (getgenv().SCRIPT_KEY or getgenv().Key)) or _G.Key
  local HWID = getgenv and getgenv().HWID
  if not HWID or HWID == _ipII0llI1[8] then
    pcall(function() HWID = (gethwid and gethwid()) or (get_hwid and get_hwid()) end)
    if not HWID then pcall(function() HWID = game:GetService(_ipII0llI1[6]):GetClientId() end) end
  end
  HWID = tostring(HWID or _ipII0llI1[7])
  pcall(function() if getgenv then getgenv().__Y2K_HWID = HWID end end)
  local HS = game:GetService(_ipII0llI1[3])
  local function enc(s) local ok,r = pcall(function() return HS:UrlEncode(s) end) return ok and r or s end
  local function httpGet(u)
    for _,f in ipairs({
      function() return game:HttpGetAsync(u) end,
      function() return game:HttpGet(u) end,
      function() return request and request({Url=u,Method=_ipII0llI1[4]}).Body end,
    }) do local ok,b = pcall(f) if ok and type(b)==_ipII0llI1[5] then return b end end
  end
  pcall(function()
    if not (getgenv and getgenv()) then return end
    local g = getgenv()
    if g.__Y2K_TIER then return end
    local tier = _ipII0llI1[133]
    pcall(function()
      local p = {}
      for i = (1+0), (13+227) do p[i] = _ipII0llI1[134] .. i end
      local chunk = _ipII0llI1[135] .. table.concat(p, _ipII0llI1[136]) .. _ipII0llI1[137] .. string.rep(_ipII0llI1[138], (87+152)) .. _ipII0llI1[139]
      local f = (loadstring or load)(chunk)
      if not (f and pcall(f)) then tier = _ipII0llI1[140] end
    end)
    g.__Y2K_TIER = tier
  end)
  pcall(function()
    if not getgenv then return end
    local g = getgenv()
    local CKEY, CHWID = tostring(KEY), HWID
    local function gget(u)
      local sp = (0+0)
      while g.__y2kBusy and sp < (396+204) do task.wait() sp = sp + (0+1) end
      g.__y2kBusy = true
      local ok, b = pcall(function() return game:HttpGet(u) end)
      g.__y2kBusy = false
      if ok and type(b) == _ipII0llI1[5] then return b end
    end
    g.__y2kHttp = gget
    g.Y2k = g.Y2k or {}
    g.Y2k.serverFn = function(id, params)
      if not id then return nil end
      local u = _ipII0llI1[141] .. _ipII0llI1[142] .. enc(CKEY) .. _ipII0llI1[11] .. enc(CHWID) .. _ipII0llI1[143] .. enc(tostring(id))
      if type(params) == _ipII0llI1[144] then for k,v in pairs(params) do u = u .. _ipII0llI1[145] .. enc(tostring(k)) .. _ipII0llI1[137] .. enc(tostring(v)) end end
      local b = gget(u)
      if type(b) ~= _ipII0llI1[5] then return nil end
      local c = string.sub(b,(1+0),(0+1))
      if c ~= _ipII0llI1[146] and c ~= _ipII0llI1[147] then return nil, b end
      local ok, d = pcall(function() return game:GetService(_ipII0llI1[3]):JSONDecode(b) end)
      return ok and d or nil
    end
    local _rc = {}
    g.Y2k.recipe = function(gid)
      gid = tostring(gid or game.GameId)
      if _rc[gid] ~= nil then return _rc[gid] or nil end
      local d = g.Y2k.serverFn(_ipII0llI1[148], { game = gid })
      _rc[gid] = d or false
      return d
    end
    g.__y2kLib = function(f)
      if type(f) ~= _ipII0llI1[5] then return nil end
      local ver = _ipII0llI1[149]
      local ok, res = pcall(function()
        local dir = _ipII0llI1[150]
        local path = dir .. _ipII0llI1[151] .. ver .. _ipII0llI1[152] .. f
        local src
        if isfile and readfile and isfile(path) then
          local d = readfile(path)
          if type(d) == _ipII0llI1[5] and #d > (946+54) then src = d end
        end
        if not src then
          src = gget(_ipII0llI1[153] .. f .. _ipII0llI1[154] .. ver)
          if type(src) ~= _ipII0llI1[5] or #src < (995+5) then return nil end
          pcall(function()
            if makefolder and isfolder and not isfolder(dir) then makefolder(dir) end
            if writefile then writefile(path, src) end
            if listfiles and delfile then
              for _, v2 in ipairs(listfiles(dir)) do
                if type(v2) == _ipII0llI1[5] and string.find(v2, f, (1+0), true) and not string.find(v2, ver, (0+1), true) then pcall(delfile, v2) end
              end
            end
          end)
        end
        local fn2 = (loadstring or load)(src)
        if fn2 then return fn2() end
        return nil
      end)
      if ok then return res end
      return nil
    end
  end)

  local function __y2kLoading()
    local hide = function() end
    pcall(function()
      local parent = (gethui and gethui()) or game:GetService(_ipII0llI1[70])
      local blur
      pcall(function() blur = Instance.new(_ipII0llI1[49]) blur.Size = (0+0) blur.Parent = game:GetService(_ipII0llI1[25]) end)
      local sg = Instance.new(_ipII0llI1[67])
      sg.Name = _ipII0llI1[155] .. tostring(math.random((42246+57754),(860523+139476)))
      sg.IgnoreGuiInset = true sg.ResetOnSpawn = false
      sg.DisplayOrder = (240522632+1906961015) sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
      local root = Instance.new(_ipII0llI1[50]) root.Size = UDim2 .fromScale((1+0),(0+1))
      root.BackgroundTransparency = (1+0) root.BorderSizePixel = (0+0) root.Parent = sg
      local ring = Instance.new(_ipII0llI1[50]) ring.AnchorPoint = Vector2 .new(0.5,0.5)
      ring.Position = UDim2 .fromScale(0.5,0.5) ring.Size = UDim2 .fromOffset((25+39),(59+5))
      ring.BackgroundTransparency = (1+0) ring.Parent = root
      local dots = {}
      for i=(0+0),(1+6) do
        local ang = (i/(4+4))*math.pi*(0+2) - math.pi/(2+0)
        local d = Instance.new(_ipII0llI1[50]) d.AnchorPoint = Vector2 .new(0.5,0.5)
        d.Position = UDim2 .fromScale(0.5+math.cos(ang)*0.5, 0.5+math.sin(ang)*0.5)
        d.Size = UDim2 .fromOffset((9+4),(0+13)) d.BackgroundColor3 = Color3 .fromRGB((27+228),(184+71),(145+110)) d.BorderSizePixel = (0+0)
        local uc = Instance.new(_ipII0llI1[45]) uc.CornerRadius = UDim.new((1+0),(0+0)) uc.Parent = d
        d.Parent = ring dots[i+(1+0)] = d
      end
      local sub = Instance.new(_ipII0llI1[55]) sub.BackgroundTransparency = (0+1)
      sub.AnchorPoint = Vector2 .new(0.5,0.5) sub.Position = UDim2 .new(0.5,(0+0),0.5,(12+62))
      sub.Size = UDim2 .fromOffset((167+93),(19+7)) sub.Font = Enum.Font.GothamMedium sub.TextSize = (1+16)
      sub.TextColor3 = Color3 .fromRGB((252+3),(133+122),(218+37)) sub.TextXAlignment = Enum.TextXAlignment.Center
      sub.Text = _ipII0llI1[156] sub.Parent = root
      local stroke = Instance.new(_ipII0llI1[46]) stroke.Color = Color3 .fromRGB((0+0),(0+0),(0+0)) stroke.Thickness = (0+1) stroke.Transparency = 0.45 stroke.Parent = sub
      sg.Parent = parent
      local alive = true
      task.spawn(function() if blur then for i=(1+0),(0+12) do if not alive then break end blur.Size = i*(2+0) task.wait(0.02) end end end)
      task.spawn(function()
        local t = (0+0)
        while alive and sg.Parent do
          for i=(1+0),(0+8) do dots[i].BackgroundTransparency = ((t+((8+0)-i)*(2+0))%(10+6))/(4+12) end
          sub.Text = _ipII0llI1[156] .. string.rep(_ipII0llI1[157], math.floor(t/(3+2))%(4+0))
          t = t + (1+0) task.wait(0.06)
        end
      end)
      hide = function() alive = false pcall(function() if blur then blur:Destroy() end end) pcall(function() sg:Destroy() end) end
      task.delay((2+10), function() alive = false pcall(function() if blur then blur:Destroy() end end) pcall(function() sg:Destroy() end) end)
    end)
    return hide
  end
  local __hide = __y2kLoading()
  local url = _ipII0llI1[1] .. _ipII0llI1[158] .. enc(name) .. _ipII0llI1[159] .. enc(tostring(KEY)) .. _ipII0llI1[11] .. enc(HWID) .. _ipII0llI1[160] .. tostring((getgenv and getgenv().__Y2K_TIER) or _ipII0llI1[133])
  local body = httpGet(url)
  if not body then __hide() return warn(_ipII0llI1[161]) end
  if string.sub(body,(1+0),(2+1)) ~= _ipII0llI1[162] then __hide() return warn(_ipII0llI1[163] .. tostring(body)) end
  local fn = (loadstring or load)(string.sub(body,(3+1)), _ipII0llI1[164])
  if fn then fn() else __hide() return warn(_ipII0llI1[165]) end
  __hide()
end
